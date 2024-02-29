IMPORT os
IMPORT FGL order_validate
IMPORT FGL db_order

DATABASE custdemo

DEFINE r_orders RECORD LIKE orders.*
DEFINE r_stock RECORD LIKE stock.*
DEFINE r_factory RECORD LIKE factory.*
DEFINE r_customer RECORD LIKE customer.*

DEFINE queryText STRING

TYPE t_items RECORD LIKE items.*

TYPE t_itemst RECORD
	order_num LIKE items.order_num,
	stock_num LIKE items.stock_num,
	quantity LIKE items.quantity,
	price LIKE items.price,
	subtotal DECIMAL (10,2)
END RECORD

DEFINE r_items t_items
DEFINE a_items DYNAMIC ARRAY OF t_itemst

MAIN
   DEFINE quitFlag SMALLINT

   WHENEVER ANY ERROR CALL errorHandler
   CALL STARTLOG("order_entry_plus.log")

   DATABASE custdemo
   CALL prepareSQL()

	VAR styleFile = SFMT("..%1resources%1default.4st", os.Path.separator())
	CALL ui.Interface.loadStyles(styleFile)

	VAR actionFile = SFMT("..%1resources%1default.4ad", os.Path.separator())
	CALL ui.Interface.loadActionDefaults(actionFile)
   
   OPEN WINDOW orderForm WITH FORM "orders_plus"
	CLOSE WINDOW SCREEN

   LET quitFlag = FALSE
   WHILE NOT quitFlag

      MENU "Orders"
         COMMAND "Query"
            IF orderQuery() THEN
               CALL displayScroll()
            END IF
            CLEAR FORM
         COMMAND "Add"
            IF enterOrder(TRUE) THEN
               MESSAGE "Order added" 
            ELSE
               ERROR "Order canceled"
            END IF
            CLEAR FORM
         COMMAND "Exit"
            LET quitFlag = TRUE
            EXIT MENU
      END MENU   

   END WHILE
   CLOSE WINDOW orderForm

END MAIN

FUNCTION prepareSQL()

   DECLARE cursItems CURSOR
		FROM "SELECT items.* FROM items WHERE order_num = ?"

END FUNCTION #prepareSQL

FUNCTION orderQuery()
   DEFINE wherePart CHAR(200)

   CONSTRUCT wherePart ON orders.* FROM s_orders.*

      ON ACTION zoom ATTRIBUTES(TEXT="Table Help")
         CASE
            WHEN INFIELD(store_num)
               CALL zoomCustomer() RETURNING r_customer.store_num, r_customer.store_name
               IF r_customer.store_num IS NOT NULL THEN
                  DISPLAY r_customer.store_num TO s_orders.store_num
               END IF
            WHEN INFIELD(fac_code)
               CALL zoomFactory() RETURNING r_factory.*
               IF r_factory.fac_code IS NOT NULL THEN
                  DISPLAY r_factory.fac_code TO s_orders.fac_code
               END IF
         END CASE

   END CONSTRUCT

   IF int_flag THEN
      RETURN FALSE
   END IF

   LET int_flag = FALSE

   LET queryText = "SELECT orders.* FROM orders",
                   " WHERE ", wherePart CLIPPED
   CALL buildUserQuery()
   RETURN fetchOrder("F")

END FUNCTION #orderQuery

FUNCTION buildUserQuery()

   DECLARE cursOrderQuery SCROLL CURSOR FROM queryText
   OPEN cursOrderQuery

END FUNCTION #buildUserQuery

FUNCTION fetchOrder(fetchAction STRING)
   DEFINE idx INTEGER

   CASE fetchAction.toUpperCase()
      WHEN "F" 
         FETCH FIRST cursOrderQuery INTO r_orders.*
      WHEN "P" 
         FETCH PREVIOUS cursOrderQuery INTO r_orders.*
      WHEN "N" 
         FETCH NEXT cursOrderQuery INTO r_orders.*
      WHEN "L" 
         FETCH LAST cursOrderQuery INTO r_orders.*
      WHEN "S" 
         FETCH CURRENT cursOrderQuery INTO r_orders.*
      WHEN "C"
         CLOSE cursOrderQuery
         INITIALIZE r_orders.* TO NULL
   END CASE

   IF sqlca.sqlcode == 0 THEN

      #Initialize the item section
      CALL a_items.clear()
      INITIALIZE r_items.* TO NULL
		CALL displayItems()

      #Display the selected record to the screen
      DISPLAY r_orders.* TO s_orders.*

      IF fetchAction.toUpperCase() != "C" THEN

         #Fetch the order items
         LET idx = 0
         FOREACH cursItems USING r_orders.order_num INTO r_items.*
            LET idx = idx + 1
				CALL a_items[idx].copyFrom(r_items)
         END FOREACH
			CALL displayItems()

      END IF 
      RETURN TRUE
   END IF

   RETURN FALSE

END FUNCTION #fetchOrder

FUNCTION displayScroll()
   DEFINE fetchResult SMALLINT

   MENU "Scroll"
      COMMAND "First"
         LET fetchResult = fetchOrder("F")
      COMMAND "Previous"
         LET fetchResult = fetchOrder("P")
         IF NOT fetchResult THEN
            ERROR "Current record is the first in the search list"
         END IF
      COMMAND "Next"
         LET fetchResult = fetchOrder("N")
         IF NOT fetchResult THEN
            ERROR "Current record is the last in the search list"
         END IF
      COMMAND "Last"
         LET fetchResult = fetchOrder("L")
      COMMAND "Update"
         IF enterOrder(FALSE) THEN
            MESSAGE "Order updated"
            CALL buildUserQuery()
            LET fetchResult = fetchOrder("F")
         ELSE
            ERROR "Order canceled"
            LET fetchResult = fetchOrder("S")
         END IF
      COMMAND "Delete"
         IF deleteOrder() THEN
            MESSAGE "Order deleted"
            CALL buildUserQuery()
            LET fetchResult = fetchOrder("F")
         ELSE
            ERROR "Delete canceled"
            LET fetchResult = fetchOrder("S")
         END IF
      COMMAND "Exit"
         LET fetchResult = fetchOrder("C")
         EXIT MENU
   END MENU 
   
END FUNCTION #displayScroll

FUNCTION displayItems()

	DISPLAY ARRAY a_items TO s_items.*
		BEFORE DISPLAY
			EXIT DISPLAY
	END DISPLAY

END FUNCTION #displayItems

FUNCTION enterOrder(addMode)
   DEFINE addMode SMALLINT
   DEFINE recNotFound SMALLINT
   DEFINE rowIdx INTEGER
	DEFINE r_itemst t_itemst

   IF addMode THEN
      INITIALIZE r_orders.* TO NULL
      LET r_orders.order_num = 0
		LET r_orders.promo = "N"
      CALL a_items.clear()
   END IF

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT r_orders.* FROM s_orders.*
			ATTRIBUTES(WITHOUT DEFAULTS = TRUE)

			BEFORE INPUT
				LET recNotFound = FALSE 

			ON ACTION zoom ATTRIBUTES(TEXT="Table Help")
				CASE
					WHEN INFIELD(store_num)
						CALL zoomCustomer() RETURNING r_customer.store_num, r_customer.store_name
						IF r_customer.store_num IS NOT NULL THEN
							LET r_orders.store_num = r_customer.store_num
						END IF
					WHEN INFIELD(fac_code)
						CALL zoomFactory() RETURNING r_factory.*
						IF r_factory.fac_code IS NOT NULL THEN
							LET r_orders.fac_code = r_factory.fac_code
						END IF
				END CASE

			AFTER FIELD order_date
				VAR valid = validateOrderField("order_date", r_orders)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD order_date
				END IF

			AFTER FIELD store_num
				VAR valid = validateOrderField("store_num", r_orders)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD order_date
				END IF

			AFTER FIELD fac_code
				VAR valid = validateOrderField("fac_code", r_orders)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD order_date
				END IF

			AFTER FIELD promo
				VAR valid = validateOrderField("promo", r_orders)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD order_date
				END IF

			AFTER INPUT
				VAR valid = validateOrder(addMode, r_orders)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD CURRENT
				END IF

		END INPUT

		INPUT ARRAY a_items FROM s_items.*
			ATTRIBUTES(WITHOUT DEFAULTS = TRUE)

			BEFORE INPUT
				LET rowIdx = DIALOG.getCurrentRow("s_items")
				DISPLAY SFMT("Before Input: %1", rowIdx)

			BEFORE ROW
				LET rowIdx = DIALOG.getCurrentRow("s_items")
				LET a_items[rowIdx].order_num = r_orders.order_num
				DISPLAY a_items[rowIdx].order_num TO s_items[rowIdx].order_num
				DISPLAY SFMT("Before Row: %1", rowIdx)

			ON ACTION zoom ATTRIBUTES(TEXT="Table Help")
				IF INFIELD(stock_num) THEN
					CALL zoomStock() RETURNING r_stock.stock_num, r_stock.description
					IF r_stock.stock_num IS NOT NULL THEN
						LET a_items[rowIdx].stock_num = r_stock.stock_num
						NEXT FIELD CURRENT
					END IF
				END IF

			BEFORE FIELD stock_num, quantity, price
				DISPLAY SFMT("Before field %1 in Row %2",DIALOG.getCurrentItem(), rowIdx)


			AFTER FIELD stock_num
				--LET a_items[rowIdx].order_num = r_orders.order_num
				LET r_items = a_items[rowIdx].toItemRec()
				VAR valid = validateItemField("stock_num", r_items)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD stock_num
				END IF

				CALL setItemPrice(r_orders.promo, r_items)
				LET r_stock = getLastStock(r_items.stock_num)
				CALL a_items[rowIdx].copyFrom(r_items)

				MESSAGE r_stock.description
				DISPLAY SFMT("After field %1 in Row %2",DIALOG.getCurrentItem(), rowIdx)

			AFTER FIELD quantity
				LET r_items = a_items[rowIdx].toItemRec()
				VAR valid = validateItemField("quantity", r_items)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD quantity
				END IF
				LET a_items[rowIdx].subtotal = r_items.quantity * r_items.price
				DISPLAY SFMT("After field %1 in Row %2",DIALOG.getCurrentItem(), rowIdx)

			AFTER FIELD price
				LET r_items = a_items[rowIdx].toItemRec()
				VAR valid = validateItemField("quantity", r_items)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD quantity
				END IF
				LET a_items[rowIdx].subtotal = r_items.quantity * r_items.price
				DISPLAY SFMT("After field %1 in Row %2",DIALOG.getCurrentItem(), rowIdx)

			AFTER ROW
				LET a_items[rowIdx].order_num = r_orders.order_num
				LET r_items = a_items[rowIdx].toItemRec()
				LET r_items.order_num = r_orders.order_num
				VAR valid = validateItem(addMode, r_orders.promo, r_items)
				IF NOT valid.success THEN
					ERROR valid.validMessage
					NEXT FIELD quantity
				END IF
				DISPLAY SFMT("After Row: %1", rowIdx)

			AFTER INPUT
				DISPLAY SFMT("After Input with current row is: %1", rowIdx)

		END INPUT

		ON ACTION save ATTRIBUTES(TEXT="Save")
			ACCEPT DIALOG

		ON ACTION CANCEL
			LET int_flag = TRUE
			EXIT DIALOG

	END DIALOG

   IF int_flag THEN
		LET int_flag = FALSE
      RETURN FALSE
   END IF

	VAR itemList DYNAMIC ARRAY OF t_items = NULL

	FOR rowIdx = 1 TO a_items.getLength()
		LET itemList[rowIdx] = a_items[rowIdx].toItemRec()
	END FOR

	VAR dbSuccess = TRUE

   IF addMode THEN

		TRY
			BEGIN WORK
			LET r_orders.order_num = insertOrderRec(r_orders, itemList)
			IF r_orders.order_num > 0 THEN
				COMMIT WORK
			ELSE
				ROLLBACK WORK
				LET dbSuccess = FALSE
			END IF

		CATCH
			ROLLBACK WORK
			LET dbSuccess = FALSE
		END TRY

   ELSE

		TRY
			BEGIN WORK
			IF updateOrderRec(r_orders, itemList) THEN
				COMMIT WORK
			ELSE
				ROLLBACK WORK
				LET dbSuccess = FALSE
			END IF

		CATCH

			ROLLBACK WORK
			LET dbSuccess = FALSE

		END TRY

   END IF

   RETURN dbSuccess

END FUNCTION #enterOrder

FUNCTION deleteOrder()
   DEFINE deleteRecord SMALLINT

	VAR deleteMessage = SFMT("Confirm deletion of order #%1?", r_orders.order_num)

   LET deleteRecord = FALSE
   MENU "Delete Order"
		ATTRIBUTES(STYLE="dialog", COMMENT=deleteMessage)

      COMMAND "Delete"
         LET deleteRecord = TRUE
         EXIT MENU

      COMMAND "Cancel"
         EXIT MENU

   END MENU

   IF deleteRecord THEN

		TRY

			BEGIN WORK

			IF deleteOrderRec(r_orders.order_num) THEN
				COMMIT WORK
			ELSE
				ROLLBACK WORK
				LET deleteRecord = FALSE
			END IF

		CATCH

			ROLLBACK WORK
			LET deleteRecord = FALSE

		END TRY


   END IF

   RETURN deleteRecord

END FUNCTION #deleteOrder

FUNCTION errorHandler()

	VAR fatalMessage = "A fatal error occurred, please review the log file 'order_entry_plus.log'\n"
	LET fatalMessage ,= "for more details."

	MENU "Fatal Error"
		ATTRIBUTES(STYLE="dialog", COMMENT=fatalMessage, IMAGE="alert")
		COMMAND "OK"
			EXIT MENU
	END MENU

   EXIT PROGRAM -1

END FUNCTION #errorHandler

PRIVATE FUNCTION (self t_itemst) copyFrom(lr_items t_items) RETURNS  ()

	LET self.order_num = lr_items.order_num
	LET self.stock_num = lr_items.stock_num
	LET self.quantity = lr_items.quantity
	LET self.price = lr_items.price
	LET self.subtotal = self.quantity * self.price

END FUNCTION #copyFrom

PRIVATE FUNCTION (self t_itemst) toItemRec() RETURNS (t_items)
	DEFINE r_item t_items

	LET r_item.order_num = self.order_num
	LET r_item.stock_num = self.stock_num
	LET r_item.quantity = self.quantity
	LET r_item.price = self.price

	RETURN r_item

END FUNCTION #toItemRec
