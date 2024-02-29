MAIN

   #DATABASE custdemo
   CONNECT TO "generodb+driver='dbmora'"
   EXECUTE IMMEDIATE "ALTER SESSION SET CURRENT_SCHEMA = custdemo"

   CALL defineSQL()
   CALL doInsert()
   CALL doInsert2()

END MAIN

PRIVATE FUNCTION defineSQL() RETURNS ()

   VAR sqlText = "INSERT INTO orders (order_num, order_date, store_num, fac_code, ship_instr, promo) " ||
                 " VALUES(0,?,?,?,?,?)"
   PREPARE insertOrders FROM sqlText

END FUNCTION #defineSQL

PRIVATE FUNCTION doInsert() RETURNS ()
   DEFINE orderDate DATE
   DEFINE storeNum INTEGER = 110
   DEFINE facCode VARCHAR(3) = "PHL"
   DEFINE shipInstr VARCHAR(5) = "FEDEX"
   DEFINE promoVal CHAR(1) = "Y"
   DEFINE orderNum INTEGER

   LET orderDate = TODAY

   EXECUTE insertOrders USING orderDate, storeNum, facCode, shipInstr, promoVal
   LET orderNum = sqlca.sqlerrd[2]
   #LET orderNum = db_get_last_serial("native2","orders")
   DISPLAY SFMT("Order number is %1", orderNum)

END FUNCTION

PRIVATE FUNCTION doInsert2() RETURNS ()
   DEFINE orderDate DATE
   DEFINE storeNum INTEGER = 110
   DEFINE facCode VARCHAR(3) = "PHL"
   DEFINE shipInstr VARCHAR(5) = "FEDEX"
   DEFINE promoVal CHAR(1) = "Y"
   DEFINE orderNum INTEGER

   LET orderDate = TODAY + 1 UNITS DAY
   INSERT INTO orders (order_num, order_date, store_num, fac_code, ship_instr, promo)
      VALUES(0, orderDate, storeNum, facCode, shipInstr, promoVal)
   LET orderNum = sqlca.sqlerrd[2]
   DISPLAY SFMT("Order number is %1", orderNum)


END FUNCTION #doInsert2
