# =============================================================================
# Generated using Genero Ghost Client 4.01.01-202209161147
# =============================================================================
IMPORT FGL ggc

MAIN
    CALL ggc.setApplicationName("OrderEntryPlus")
    CALL ggc.parseOptions()

    # Register scenario functions
    CALL ggc.registerScenario(FUNCTION playAddTest)

    # Start execution and exits when the scenario ends
    # Exit status is 1 in case of error, 0 on success.
    CALL ggc.play()
END MAIN

# Scenario OrderEntryPlus_Add id : 0
PRIVATE FUNCTION playAddTest()
	DEFINE todayDate DATE
	LET todayDate = TODAY - 7 UNITS DAY

	 DISPLAY "Starting the Add test"

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- --
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setTableSize("s_items", 7)

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- --
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("add") -- Add add

    CALL ggc.assert(ggc.getFocus() == "orders.order_date", SFMT("Focused field name is not valid, expected: 'orders.order_date', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- DATE
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.order_date")

    CALL ggc.setValue("8/20/2023")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.store_num", SFMT("Focused field name is not valid, expected: 'orders.store_num', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setValue("106")

    CALL ggc.assert(ggc.getFocus() == "orders.store_num", SFMT("Focused field name is not valid, expected: 'orders.store_num', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "106", SFMT("Focused field value is not valid, expected: '106', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.fac_code", SFMT("Focused field name is not valid, expected: 'orders.fac_code', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- CHAR(3)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setValue("PHL")

    CALL ggc.assert(ggc.getFocus() == "orders.fac_code", SFMT("Focused field name is not valid, expected: 'orders.fac_code', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "PHL", SFMT("Focused field value is not valid, expected: 'PHL', got: '%1'", ggc.getValue())) -- CHAR(3)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.ship_instr", SFMT("Focused field name is not valid, expected: 'orders.ship_instr', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- CHAR(10)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.ship_instr")

    CALL ggc.setValue("FEDEX")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.promo", SFMT("Focused field name is not valid, expected: 'orders.promo', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "N", SFMT("Focused field value is not valid, expected: 'N', got: '%1'", ggc.getValue())) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setValue("Y")

    CALL ggc.assert(ggc.getFocus() == "orders.promo", SFMT("Focused field name is not valid, expected: 'orders.promo', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "Y", SFMT("Focused field value is not valid, expected: 'Y', got: '%1'", ggc.getValue())) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setValue("310")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "310", SFMT("Focused field value is not valid, expected: '310', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("3")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11.57", SFMT("Focused field value is not valid, expected: '11.57', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("456")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "456", SFMT("Focused field value is not valid, expected: '456', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("2")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "5.00", SFMT("Focused field value is not valid, expected: '5.00', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("744")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "744", SFMT("Focused field value is not valid, expected: '744', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("1")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "0", SFMT("Field value is not valid, expected: '0', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "225.86", SFMT("Focused field value is not valid, expected: '225.86', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.action("save") -- Save save

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.action("query") -- Query query

    CALL ggc.assert(ggc.getFocus() == "orders.order_num", SFMT("Focused field name is not valid, expected: 'orders.order_num', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.order_date")

    CALL ggc.assert(ggc.getFocus() == "orders.order_date", SFMT("Focused field name is not valid, expected: 'orders.order_date', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- DATE
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.order_date")

    CALL ggc.setValue("8/20/2023")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.store_num", SFMT("Focused field name is not valid, expected: 'orders.store_num', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "8/20/2023", SFMT("Field value is not valid, expected: '8/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.action("accept") -- Accept accept

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.action("last") -- Last last

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "32", SFMT("Field value is not valid, expected: '32', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.action("exit") -- Exit exit

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkMessage("Order added")
    CALL ggc.checkNoError()
    CALL ggc.action("exit") -- Exit exit

	 CALL ggc.end()

END FUNCTION

