IMPORT com
IMPORT util
IMPORT FGL order_validate
IMPORT FGL db_order

SCHEMA custdemo

PRIVATE DEFINE webContext DICTIONARY ATTRIBUTE (WSContext) OF STRING

PRIVATE TYPE t_orders RECORD LIKE orders.*
PRIVATE TYPE t_items RECORD LIKE items.*

PRIVATE TYPE TItem RECORD
	stock RECORD LIKE stock.*,
	quantity LIKE items.quantity,
	price LIKE items.price,
	item_total DECIMAL(10,2)
END RECORD

PRIVATE TYPE TOrder RECORD
	order_num LIKE orders.order_num,
	order_date LIKE orders.order_date,
	customer RECORD LIKE customer.*,
	factory RECORD LIKE factory.*,
	shipping LIKE orders.ship_instr,
	promo LIKE orders.promo,
	items DYNAMIC ARRAY OF TItem
END RECORD

PRIVATE TYPE TInputOrder RECORD
	order_num LIKE orders.order_num,
	order_date LIKE orders.order_date,
	store_num LIKE orders.store_num,
	fac_code LIKE orders.fac_code,
	shipping LIKE orders.ship_instr,
	promo LIKE orders.promo,
	items DYNAMIC ARRAY OF t_items
END RECORD

DEFINE cursorsDeclared BOOLEAN = FALSE
PRIVATE FUNCTION declareCursors() RETURNS ()
	DEFINE sqlCmd STRING

	WHENEVER ANY ERROR RAISE

	IF NOT cursorsDeclared THEN

		LET sqlCmd =
			"SELECT orders.*, items.*, customer.*, factory.*, stock.* ",
			"  FROM orders ",
			"  INNER JOIN items ON items.order_num = orders.order_num ",
			"  INNER JOIN customer ON customer.store_num = orders.store_num ",
			"  INNER JOIN factory ON factory.fac_code = orders.fac_code ",
			"  INNER JOIN stock ON stock.stock_num = items.stock_num ",
			" ORDER BY orders.order_num"
		DECLARE cursAllOrders CURSOR FROM sqlCmd

		LET sqlCmd =
			"SELECT orders.*, items.*, customer.*, factory.*, stock.* ",
			"  FROM orders ",
			"  INNER JOIN items ON items.order_num = orders.order_num ",
			"  INNER JOIN customer ON customer.store_num = orders.store_num ",
			"  INNER JOIN factory ON factory.fac_code = orders.fac_code ",
			"  INNER JOIN stock ON stock.stock_num = items.stock_num ",
			"  WHERE orders.order_num = ? ",
			" ORDER BY orders.order_num"
		DECLARE cursSingleOrder CURSOR FROM sqlCmd

		LET cursorsDeclared = TRUE
	END IF

END FUNCTION #declareCursors

PRIVATE FUNCTION (self TOrder) mapOrder(
	orderRec RECORD LIKE orders.*,
	customerRec RECORD LIKE customer.*,
	factoryRec RECORD LIKE factory.*
)

	LET self.order_num = orderRec.order_num
	LET self.customer = customerRec
	LET self.factory = factoryRec
	LET self.order_date = orderRec.order_date
	LET self.shipping = orderRec.ship_instr
	LET self.promo = orderRec.promo

END FUNCTION #mapOrder

PRIVATE FUNCTION (self TItem) mapItem(
	itemRec RECORD LIKE items.*,
	stockRec RECORD LIKE stock.*
)

	LET self.stock = stockRec
	LET self.quantity = itemRec.quantity
	LET self.price = itemRec.price
	LET self.item_total = self.quantity * self.price

END FUNCTION #mapItem

PUBLIC FUNCTION ping()
	ATTRIBUTES (WSGet, WSPath="/ping", WSDescription="Ping method to return Request Context")
	RETURNS util.JSONObject

	VAR jsonContext = util.JSONObject.create()

	VAR keys = webContext.getKeys()
	VAR idx = 0
	FOR idx = 1 TO keys.getLength()
		VAR keyName = keys[idx]
		VAR keyValue = webContext[keyName]
		CALL jsonContext.put(keyName, keyValue)
	END FOR

	CALL jsonContext.put("dbtype", upshift(fgl_db_driver_type()))

	RETURN jsonContext

END FUNCTION #ping

PUBLIC FUNCTION getOrders()
	ATTRIBUTES (WSGet, WSPath="/orders", WSDescription="Get all orders")
	RETURNS DYNAMIC ARRAY OF TOrder
	DEFINE orders DYNAMIC ARRAY OF TOrder
	DEFINE orderRec RECORD LIKE orders.*
	DEFINE itemRec RECORD LIKE items.*
	DEFINE customerRec RECORD LIKE customer.*
	DEFINE factoryRec RECORD LIKE factory.*
	DEFINE stockRec RECORD LIKE stock.*
	DEFINE orderIdx INTEGER = 0
	DEFINE itemIdx INTEGER = 0
	DEFINE lastOrderNo LIKE orders.order_num = 0

	TRY
		CALL declareCursors()

		FOREACH cursAllOrders
			INTO orderRec.*,
				  itemRec.*,
				  customerRec.*,
				  factoryRec.*,
				  stockRec.*

			IF orderRec.order_num == lastOrderNo THEN
				LET itemIdx += 1
			ELSE
				LET orderIdx += 1
				LET itemIdx = 1

				#Map order header values
				CALL orders[orderIdx].mapOrder(orderRec, customerRec, factoryRec)
			END IF
			CALL orders[orderIdx].items[itemIdx].mapItem(itemRec, stockRec)

			LET lastOrderNo = orderRec.order_num

		END FOREACH

		IF orders.getLength() == 0 THEN
			CALL com.WebServiceEngine.SetRestError(404, "No order records found")
		END IF

	CATCH
		CALL com.WebServiceEngine.SetRestError(500, "Internal error when fetching order records")
	END TRY

	RETURN orders

END FUNCTION #getOrders

PUBLIC FUNCTION getOrder(orderNumber INTEGER ATTRIBUTES (WSParam))
	ATTRIBUTES (WSGet, WSPath="/orders/{orderNumber}", WSDescription="Get a single order")
	RETURNS TOrder
	DEFINE singleOrder TOrder
	DEFINE orderRec RECORD LIKE orders.*
	DEFINE itemRec RECORD LIKE items.*
	DEFINE customerRec RECORD LIKE customer.*
	DEFINE factoryRec RECORD LIKE factory.*
	DEFINE stockRec RECORD LIKE stock.*
	DEFINE itemIdx INTEGER = 0

	TRY
		CALL declareCursors()

		VAR firstTime = TRUE

		FOREACH cursSingleOrder
			USING orderNumber
			INTO orderRec.*,
				  itemRec.*,
				  customerRec.*,
				  factoryRec.*,
				  stockRec.*

			LET itemIdx += 1
			IF firstTime THEN
				#Map order header values
				CALL singleOrder.mapOrder(orderRec, customerRec, factoryRec)
				LET firstTime = FALSE
			END IF
			CALL singleOrder.items[itemIdx].mapItem(itemRec, stockRec)

		END FOREACH

		IF singleOrder.order_num IS NULL THEN
			CALL com.WebServiceEngine.SetRestError(404, SFMT("No order record found for order number %1", orderNumber))
		END IF

	CATCH
		CALL com.WebServiceEngine.SetRestError(500, "Internal error when fetching order record")
	END TRY

	RETURN singleOrder

END FUNCTION #getOrders

PUBLIC FUNCTION addOrder (orderPayload TInputOrder)
	ATTRIBUTES (
		WSPost,
		WSPath="/orders",
		WSDescription="Insert/post an order"
	) RETURNS (INTEGER)

	DEFINE r_order t_orders

	#First map payload
	LET r_order.order_num = 0
	LET r_order.order_date = orderPayload.order_date
	LET r_order.fac_code = orderPayload.fac_code
	LET r_order.store_num = orderPayload.store_num
	LET r_order.ship_instr = orderPayload.shipping
	LET r_order.promo = orderPayload.promo

	#Next validate the payload (Order record)
	VAR r_valid = order_validate.validateOrder(TRUE, r_order)
	IF NOT r_valid.success THEN
		CALL com.WebServiceEngine.SetRestError(404, r_valid.validMessage)
	END IF

	#Validate the payload (Item records)
	VAR idx = 0
	FOR idx = 1 TO orderPayload.items.getLength()
		LET r_valid = order_validate.validateItem(TRUE, r_order.promo, orderPayload.items[idx])
		IF NOT r_valid.success THEN
			CALL com.WebServiceEngine.SetRestError(404, r_valid.validMessage)
		END IF
	END FOR

	TRY

		#Start the database transaction
		BEGIN WORK

		LET r_order.order_num = insertOrderRec(r_order, orderPayload.items)
		IF r_order.order_num > 0 THEN
			COMMIT WORK
		ELSE
			ROLLBACK WORK
			CALL com.WebServiceEngine.SetRestError(404, "Order not added")
		END IF

		RETURN r_order.order_num

	CATCH

		ROLLBACK WORK
		CALL com.WebServiceEngine.SetRestError(500, "Internal error adding order record")

	END TRY

	RETURN 0

END FUNCTION #addOrder

PUBLIC FUNCTION updateOrder (orderPayload TInputOrder)
	ATTRIBUTES (
		WSPut,
		WSPath="/orders",
		WSDescription="Update/put an order"
	) RETURNS ()

	DEFINE r_order t_orders

	#First map payload
	LET r_order.order_num = orderPayload.order_num
	LET r_order.order_date = orderPayload.order_date
	LET r_order.fac_code = orderPayload.fac_code
	LET r_order.store_num = orderPayload.store_num
	LET r_order.ship_instr = orderPayload.shipping
	LET r_order.promo = orderPayload.promo

	#Next validate the payload (Order record)
	VAR r_valid = order_validate.validateOrder(FALSE, r_order)
	IF NOT r_valid.success THEN
		CALL com.WebServiceEngine.SetRestError(404, r_valid.validMessage)
	END IF

	#Validate the payload (Item records)
	VAR idx = 0
	FOR idx = 1 TO orderPayload.items.getLength()
		VAR r_item = orderPayload.items[idx]
		LET r_item.order_num = r_order.order_num
		LET r_valid = order_validate.validateItem(FALSE, r_order.promo, r_item)
		IF NOT r_valid.success THEN
			CALL com.WebServiceEngine.SetRestError(404, r_valid.validMessage)
			RETURN
		END IF
	END FOR

	TRY

		#Start the database transaction
		BEGIN WORK

		IF updateOrderRec(r_order, orderPayload.items) THEN
			COMMIT WORK
		ELSE
			ROLLBACK WORK
			CALL com.WebServiceEngine.SetRestError(404, "Order not updated")
		END IF

	CATCH

		ROLLBACK WORK
		CALL com.WebServiceEngine.SetRestError(500, "Internal error updating order record")

	END TRY

END FUNCTION #updateOrder

PUBLIC FUNCTION deleteOrder(orderNumber INTEGER ATTRIBUTES (WSParam))
	ATTRIBUTES (
		WSDelete,
		WSPath="/orders/{orderNumber}",
		WSDescription="delete an order"
	) RETURNS ()

	TRY

		BEGIN WORK

		IF deleteOrderRec(orderNumber) THEN
			COMMIT WORK
		ELSE
			ROLLBACK WORK
			CALL com.WebServiceEngine.SetRestError(404, "Order record not found")
		END IF

	CATCH

		ROLLBACK WORK
		CALL com.WebServiceEngine.SetRestError(500, "Internal error deleting order record")

	END TRY

END FUNCTION #deleteOrder




