#+ Database creation script for IBM Informix
#+
#+ Note: This script is a helper script to create an empty database schema
#+       Adapt it to fit your needs
IMPORT os

PRIVATE DEFINE dbType STRING
PRIVATE DEFINE progressText STRING
  
MAIN

	OPEN WINDOW mainWindow WITH FORM "dbform"
	CLOSE WINDOW SCREEN

	DATABASE custdemo

	LET dbType = upshift(fgl_db_driver_type())

	DISPLAY dbType TO formonly.db_type
	MENU
		ON ACTION do_create
			LET progressText = ""
			CALL db_drop_tables()
			CALL db_create_tables()
			CALL db_grant()
			CALL db_load_data()
			CALL displayProgress("Done!")
			MESSAGE "Database created and initial data loaded"
		ON ACTION CLOSE
			EXIT MENU
	END MENU

	CLOSE WINDOW mainWindow

END MAIN
  
#+ Note: This script is a helper script to create an empty database schema
#+       Adapt it to fit your needs
 
#+ Create all tables in database.
FUNCTION db_create_tables()
    WHENEVER ERROR STOP
 
    EXECUTE IMMEDIATE "CREATE TABLE customer (
        store_num SERIAL PRIMARY KEY,
        store_name CHAR(25),
        addr CHAR(20),
        addr2 CHAR(20),
        city CHAR(15),
        state CHAR(2),
        zipcode CHAR(5),
        contact_name CHAR(30),
        phone CHAR(18))"
	 CALL displayProgress("Table customer created")

    EXECUTE IMMEDIATE "CREATE TABLE factory (
        fac_code CHAR(3) NOT NULL PRIMARY KEY,
        fac_name CHAR(15))"
	 CALL displayProgress("Table factory created")

    EXECUTE IMMEDIATE "CREATE TABLE items (
        order_num INTEGER NOT NULL,
        stock_num INTEGER NOT NULL,
        quantity SMALLINT,
        price DECIMAL(8,2))"
	 CALL displayProgress("Table items created")

    EXECUTE IMMEDIATE "CREATE TABLE orders (
        order_num SERIAL PRIMARY KEY,
        order_date DATE,
        store_num INTEGER NOT NULL,
        fac_code CHAR(3),
        ship_instr CHAR(10),
        promo CHAR(1))"
	 CALL displayProgress("Table orders created")

    EXECUTE IMMEDIATE "CREATE TABLE state (
        state_code CHAR(2) NOT NULL PRIMARY KEY,
        state_name CHAR(15))"
	 CALL displayProgress("Table state created")

    EXECUTE IMMEDIATE "CREATE TABLE stock (
        stock_num SERIAL PRIMARY KEY,
        fac_code CHAR(3) NOT NULL,
        description CHAR(15),
        reg_price DECIMAL(8,2),
        promo_price DECIMAL(8,2),
        price_updated DATE,
        unit CHAR(4))"
	 CALL displayProgress("Table stock created")
 
END FUNCTION

FUNCTION db_grant()

   IF dbType == "ORA" THEN
      GRANT SELECT,UPDATE,INSERT,DELETE ON customer TO PUBLIC
      GRANT SELECT,UPDATE,INSERT,DELETE ON factory TO PUBLIC
      GRANT SELECT,UPDATE,INSERT,DELETE ON items TO PUBLIC
      GRANT SELECT,UPDATE,INSERT,DELETE ON orders TO PUBLIC
      GRANT SELECT,UPDATE,INSERT,DELETE ON state TO PUBLIC
      GRANT SELECT,UPDATE,INSERT,DELETE ON stock TO PUBLIC

      EXECUTE IMMEDIATE SFMT("GRANT SELECT ON %1_srl TO PUBLIC", "customer")
      EXECUTE IMMEDIATE SFMT("GRANT SELECT ON %1_srl TO PUBLIC", "orders")
      EXECUTE IMMEDIATE SFMT("GRANT SELECT ON %1_srl TO PUBLIC", "stock")
	   CALL displayProgress("Setting table permissions")
   END IF

END FUNCTION #db_grant
  
#+ Drop all tables from database.
FUNCTION db_drop_tables()
    WHENEVER ERROR CONTINUE
  
    EXECUTE IMMEDIATE "DROP TABLE customer"
    EXECUTE IMMEDIATE "DROP TABLE factory"
    EXECUTE IMMEDIATE "DROP TABLE items"
    EXECUTE IMMEDIATE "DROP TABLE orders"
    EXECUTE IMMEDIATE "DROP TABLE state"
    EXECUTE IMMEDIATE "DROP TABLE stock"

	 CALL displayProgress("Dropping tables")

	 WHENEVER ERROR STOP
  
END FUNCTION
  
#+ Load data for all tables in database.
FUNCTION db_load_data()
    CONSTANT cFileNameBase = "%1.unl"
    CONSTANT cFileNameDB = "%1-%2.unl"
    CONSTANT cSQLInsert = "INSERT INTO %1"
    DEFINE lTableName  STRING
    DEFINE lSQL        STRING
    DEFINE lFileName   STRING
    DEFINE lTables DYNAMIC ARRAY OF STRING = [
                       "customer",
                       "factory",
                       "items",
                       "orders",
                       "state",
                       "stock"
                       ]
    DEFINE lIndex INTEGER
    WHENEVER ERROR STOP
  
    FOR lIndex = 1 TO lTables.getLength()
        LET lTableName = lTables[lIndex]
        LET lFileName = SFMT(cFileNameDB, lTableName, dbType.toLowerCase())
        IF NOT os.Path.exists(lFileName) THEN
           LET lFileName = SFMT(cFileNameBase, lTableName)
        END IF
        LET lSQL = SFMT(cSQLInsert, lTableName)
        DISPLAY SFMT("LOAD FROM %1 %2", lFileName, lSQL)
        LOAD FROM lFileName lSQL

		  CALL displayProgress(SFMT("%1 records loaded into %2", sqlca.sqlerrd[3], lTables[lIndex]))

    END FOR
  
END FUNCTION #db_load_data

PRIVATE FUNCTION displayProgress(updateMessage STRING) RETURNS ()

	IF progressText.getLength() > 0 THEN
		LET progressText = progressText.append("\n")
	END IF

	LET progressText = progressText.append(updateMessage)
	DISPLAY progressText TO formonly.db_info
	CALL ui.Interface.refresh()

END FUNCTION #displayProgress
