SCHEMA custdemo

PUBLIC FUNCTION deleteOrderRec(orderNumber INTEGER) RETURNS (BOOLEAN)

	#Raise the error to the calling function
	WHENEVER ANY ERROR RAISE

	DELETE FROM orders WHERE order_num = orderNumber
	IF sqlca.sqlerrd[3] < 1 THEN
		RETURN FALSE
	END IF

	DELETE FROM items WHERE order_num = orderNumber

	RETURN TRUE

END FUNCTION #deleteOrderRec

PUBLIC FUNCTION updateOrderRec(
	r_order RECORD LIKE orders.*,
	r_items DYNAMIC ARRAY OF RECORD LIKE items.*
) RETURNS (BOOLEAN)

	WHENEVER ANY ERROR RAISE

	UPDATE orders
		SET order_date = r_order.order_date,
			 store_num = r_order.store_num,
			 fac_code = r_order.fac_code,
			 ship_instr = r_order.ship_instr,
			 promo = r_order.promo
		WHERE order_num = r_order.order_num

	IF sqlca.sqlerrd[3] < 1 THEN
		RETURN FALSE
	END IF

	DELETE FROM items WHERE order_num = r_order.order_num

	VAR idx = 0
	FOR idx = 1 TO r_items.getLength()
		VAR r_item = r_items[idx]
		LET r_item.order_num = r_order.order_num
		INSERT INTO items (order_num, stock_num, quantity, price)
			VALUES (r_item.order_num, r_item.stock_num, r_item.quantity, r_item.price)
	END FOR

	RETURN TRUE

END FUNCTION #updateOrderRec

PUBLIC FUNCTION insertOrderRec(
	r_order RECORD LIKE orders.*,
	r_items DYNAMIC ARRAY OF RECORD LIKE items.*
) RETURNS (INTEGER)

	WHENEVER ANY ERROR RAISE

	LET r_order.order_num = 0

	INSERT INTO orders (order_num, order_date, store_num, fac_code, ship_instr, promo)
		VALUES (r_order.order_num, r_order.order_date, r_order.store_num, r_order.fac_code, r_order.ship_instr, r_order.promo)

	LET r_order.order_num = sqlca.sqlerrd[2]

	VAR idx = 0
	FOR idx = 1 TO r_items.getLength()
		VAR r_item = r_items[idx]
		LET r_item.order_num = r_order.order_num
		INSERT INTO items (order_num, stock_num, quantity, price)
			VALUES (r_item.order_num, r_item.stock_num, r_item.quantity, r_item.price)
	END FOR

	RETURN r_order.order_num

END FUNCTION #insertOrderRec

