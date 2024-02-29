SCHEMA custdemo

PUBLIC TYPE TValidation RECORD
	success BOOLEAN,
	validMessage STRING
END RECORD

PRIVATE DEFINE stockCache DICTIONARY OF RECORD LIKE stock.*
PRIVATE DEFINE cursorsDefined BOOLEAN = FALSE

PRIVATE FUNCTION declareCursors() RETURNS ()
	DEFINE sqlText STRING

	WHENEVER ANY ERROR RAISE

	IF NOT cursorsDefined THEN

		LET sqlText = "SELECT orders.* FROM orders WHERE order_num = ?"
		PREPARE prepSingleOrder FROM sqlText
		DECLARE cursSingleOrder CURSOR FOR prepSingleOrder

		LET sqlText = "SELECT factory.fac_name FROM factory WHERE fac_code = ?"
		PREPARE prepSingleFactory FROM sqlText
		DECLARE cursSingleFactory CURSOR FOR prepSingleFactory

		LET sqlText = "SELECT customer.store_name FROM customer WHERE store_num = ?"
		PREPARE prepSingleCustomer FROM sqlText
		DECLARE cursSingleCustomer CURSOR FOR prepSingleCustomer

		LET sqlText = "SELECT stock.* FROM stock WHERE stock_num = ?"
		PREPARE prepSingleStock FROM sqlText
		DECLARE cursSingleStock CURSOR FOR prepSingleStock

		LET cursorsDefined = TRUE

	END IF

END FUNCTION #declareCursors

PUBLIC FUNCTION validateOrder(addMode BOOLEAN, r_orders RECORD LIKE orders.* INOUT) RETURNS (TValidation)
	DEFINE valid TValidation = (success: TRUE, validMessage: "Validate Record")

	CALL declareCursors()
	VAR recNotFound = FALSE

	IF addMode THEN

		LET r_orders.order_num = 0

	ELSE

		#Fetch the order record
		OPEN cursSingleOrder USING r_orders.order_num
		FETCH cursSingleOrder
		LET recNotFound = (sqlca.sqlcode <> 0)
		CLOSE cursSingleOrder

		IF recNotFound THEN
			LET valid.success = FALSE
			CALL valid.invalidate("No order record found for the order number entered")
			RETURN valid
		END IF

	END IF

	LET valid = validateOrderField("order_date", r_orders)
	IF NOT valid.success THEN
		RETURN valid
	END IF

	LET valid = validateOrderField("store_num", r_orders)
	IF NOT valid.success THEN
		RETURN valid
	END IF

	LET valid = validateOrderField("fac_code", r_orders)
	IF NOT valid.success THEN
		RETURN valid
	END IF

	LET valid = validateOrderField("promo", r_orders)
	IF NOT valid.success THEN
		RETURN valid
	END IF

	RETURN valid

END FUNCTION #validateOrder

PUBLIC FUNCTION validateOrderField(fieldName STRING, r_orders RECORD LIKE orders.* INOUT) RETURNS (TValidation)
	DEFINE valid TValidation = (success: TRUE, validMessage: "Validate Field")

	CALL declareCursors()

	CASE fieldName.toLowerCase()
		WHEN "order_date"
			IF r_orders.order_date IS NULL THEN
				CALL valid.invalidate("Order Date is required")
			END IF
		WHEN "store_num"
			IF r_orders.store_num IS NULL THEN
				CALL valid.invalidate("Customer store number is required")
			ELSE
				#Fetch the customer record
				VAR recNotFound = TRUE
				OPEN cursSingleCustomer USING r_orders.store_num
				FETCH cursSingleCustomer
				LET recNotFound = (sqlca.sqlcode <> 0)
				CLOSE cursSingleCustomer

				IF recNotFound THEN
					LET valid.success = FALSE
					CALL valid.invalidate("No Customer record found for the store number entered")
				END IF
			END IF
		WHEN "fac_code"
			IF r_orders.fac_code IS NULL THEN
				CALL valid.invalidate("Factory code is required")
			ELSE
				#Fetch the factory record
				VAR recNotFound = TRUE
				OPEN cursSingleFactory USING r_orders.fac_code
				FETCH cursSingleFactory
				LET recNotFound = (sqlca.sqlcode <> 0)
				CLOSE cursSingleFactory

				IF recNotFound THEN
					CALL valid.invalidate("No Factory record found for the factory code entered")
				END IF
			END IF
		WHEN "promo"
			IF r_orders.promo IS NULL THEN
				CALL valid.invalidate("Promotion is required")
			ELSE
				IF r_orders.promo NOT MATCHES "[YN]" THEN
					CALL valid.invalidate("Invalid Promotion value, must be Y or N")
				END IF
			END IF

	END CASE

	RETURN valid

END FUNCTION #validateOrderField

PUBLIC FUNCTION validateItem(addMode BOOLEAN, promoFlag STRING, r_item RECORD LIKE items.* INOUT) RETURNS (TValidation)
	DEFINE valid TValidation = (success: TRUE, validMessage: "Valid Record")

	CALL declareCursors()
	VAR recNotFound = FALSE

	IF addMode THEN

		LET r_item.order_num = 0

	ELSE

		#Fetch the order record
		OPEN cursSingleOrder USING r_item.order_num
		FETCH cursSingleOrder
		LET recNotFound = (sqlca.sqlcode <> 0)
		CLOSE cursSingleOrder

		IF recNotFound THEN
			LET valid.success = FALSE
			CALL valid.invalidate("No order record found for the order number entered")
			RETURN valid
		END IF

	END IF

	LET valid = validateItemField("stock_num", r_item)
	IF NOT valid.success THEN
		RETURN valid
	END IF

	LET valid = validateItemField("quantity", r_item)
	IF NOT valid.success THEN
		RETURN valid
	END IF

	IF r_item.price IS NULL THEN
		CALL setItemPrice(promoFlag, r_item)
	ELSE
		LET valid = validateItemField("price", r_item)
	END IF

	RETURN valid

END FUNCTION #validateItem

PUBLIC FUNCTION validateItemField(fieldName STRING, r_item RECORD LIKE items.*) RETURNS (TValidation)
	DEFINE valid TValidation = (success: TRUE, validMessage: "Valid Record")
	DEFINE r_stock RECORD LIKE stock.*

	CASE fieldName.toLowerCase()

		WHEN "stock_num"
			IF r_item.stock_num IS NULL THEN
				CALL valid.invalidate("Stock number is required")
			ELSE
				#Fetch the stock record
				VAR recNotFound = TRUE
				OPEN cursSingleStock USING r_item.stock_num
				FETCH cursSingleStock INTO r_stock.*
				LET recNotFound = (sqlca.sqlcode <> 0)
				CLOSE cursSingleStock

				IF recNotFound THEN
					CALL valid.invalidate("No Stock record found for the stock number entered")
				ELSE
					LET stockCache[r_stock.stock_num] = r_stock
				END IF
			END IF

		WHEN "quantity"
			IF r_item.quantity IS NULL OR r_item.quantity <= 0 THEN
				CALL valid.invalidate("Quantity must be greater than zero")
			END IF

		WHEN "price"
			IF r_item.price <= 0 THEN
				CALL valid.invalidate("Price must be greater than zero")
			END IF

	END CASE

	RETURN valid

END FUNCTION #validateItemField

PUBLIC FUNCTION setItemPrice(promoFlag STRING, r_item RECORD LIKE items.* INOUT) RETURNS ()

	VAR r_stock = getLastStock(r_item.stock_num)
	IF r_item.price IS NULL OR r_item.price <= 0 THEN
		IF promoFlag.toUpperCase() == "Y" THEN
			LET r_item.price = NVL(r_stock.promo_price, 0)
		ELSE
			LET r_item.price = NVL(r_stock.reg_price, 0)
		END IF
	END IF

END FUNCTION #setItemPrice

PUBLIC FUNCTION getLastStock(stockNum LIKE items.stock_num) RETURNS (RECORD LIKE stock.*)
	DEFINE r_stock RECORD LIKE stock.*

	INITIALIZE r_stock.* TO NULL
	IF stockCache.contains(stockNum) THEN
		LET r_stock = stockCache[stockNum]
	END IF

	RETURN r_stock

END FUNCTION #getLastStock

PRIVATE FUNCTION (self TValidation) invalidate(validMessage STRING) RETURNS ()

	LET self.success = FALSE
	LET self.validMessage = validMessage

END FUNCTION #invalidate