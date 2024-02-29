# =============================================================================
# Generated using Genero Ghost Client 4.01.01-202209161147
# =============================================================================
IMPORT FGL ggc

MAIN
    CALL ggc.setApplicationName("OrderEntryPlus")
    CALL ggc.parseOptions()

    # Register scenario functions
    CALL ggc.registerScenario(FUNCTION play_0)

    # Start execution and exits when the scenario ends
    # Exit status is 1 in case of error, 0 on success.
    CALL ggc.play()
END MAIN

# Scenario OrderEntryPlus_mikefolcher_d8717b2e id : 0
PRIVATE FUNCTION play_0()
    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setTableSize("s_items", 7)

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("query") -- Query query

    CALL ggc.assert(ggc.getFocus() == "orders.order_num", SFMT("Focused field name is not valid, expected: 'orders.order_num', got: '%1'", ggc.getFocus()))
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.order_num")

    CALL ggc.setValue("28")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.order_date", SFMT("Focused field name is not valid, expected: 'orders.order_date', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- --
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("accept") -- Accept accept

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("update") -- Update update

    CALL ggc.assert(ggc.getFocus() == "orders.order_date", SFMT("Focused field name is not valid, expected: 'orders.order_date', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setCellFocus("s_items", "quantity", 1)

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.ship_instr")

    CALL ggc.assert(ggc.getFocus() == "orders.ship_instr", SFMT("Focused field name is not valid, expected: 'orders.ship_instr', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "MIKEF", SFMT("Focused field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getValue())) -- CHAR(10)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.promo")

    CALL ggc.assert(ggc.getFocus() == "orders.promo", SFMT("Focused field name is not valid, expected: 'orders.promo', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "Y", SFMT("Focused field value is not valid, expected: 'Y', got: '%1'", ggc.getValue())) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setValue("N")

    CALL ggc.assert(ggc.getFocus() == "orders.promo", SFMT("Focused field name is not valid, expected: 'orders.promo', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "N", SFMT("Focused field value is not valid, expected: 'N', got: '%1'", ggc.getValue())) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setCellFocus("s_items", "quantity", 1)

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "8", SFMT("Focused field value is not valid, expected: '8', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "5.00", SFMT("Focused field value is not valid, expected: '5.00', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "744", SFMT("Focused field value is not valid, expected: '744', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setCellFocus("s_items", "quantity", 1)

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "8", SFMT("Focused field value is not valid, expected: '8', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("5")

    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "5.00", SFMT("Focused field value is not valid, expected: '5.00', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("")

    CALL ggc.key("shift-tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "5", SFMT("Focused field value is not valid, expected: '5', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "744", SFMT("Focused field value is not valid, expected: '744', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.action("prevrow") -- Previous

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "456", SFMT("Focused field value is not valid, expected: '456', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "5", SFMT("Focused field value is not valid, expected: '5', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.setCellFocus("s_items", "quantity", 2)

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "2", SFMT("Focused field value is not valid, expected: '2', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "225.86", SFMT("Focused field value is not valid, expected: '225.86', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("")

    CALL ggc.key("shift-tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "2", SFMT("Focused field value is not valid, expected: '2', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.action("nextrow") -- Next

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11.57", SFMT("Focused field value is not valid, expected: '11.57', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.action("prevrow") -- Previous

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "310", SFMT("Focused field value is not valid, expected: '310', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("lightbulbs     ")
    CALL ggc.checkNoError()
    CALL ggc.action("prevrow") -- Previous

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "744", SFMT("Focused field value is not valid, expected: '744', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "2", SFMT("Focused field value is not valid, expected: '2', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.action("nextrow") -- Next

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "14", SFMT("Focused field value is not valid, expected: '14', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("11")

    CALL ggc.key("shift-tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "310", SFMT("Focused field value is not valid, expected: '310', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("faucets        ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11", SFMT("Focused field value is not valid, expected: '11', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("shift-tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "310", SFMT("Focused field value is not valid, expected: '310', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11", SFMT("Focused field value is not valid, expected: '11', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11.57", SFMT("Focused field value is not valid, expected: '11.57', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.setValue("")

    CALL ggc.key("shift-tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11", SFMT("Focused field value is not valid, expected: '11', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("shift-tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "310", SFMT("Focused field value is not valid, expected: '310', got: '%1'", ggc.getValue())) -- INTEGER
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "11", SFMT("Focused field value is not valid, expected: '11', got: '%1'", ggc.getValue())) -- SMALLINT
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "s_items", SFMT("Focused field name is not valid, expected: 's_items', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.assertEquals(ggc.getValue(), "12.85", SFMT("Focused field value is not valid, expected: '12.85', got: '%1'", ggc.getValue())) -- DECIMAL(8,2)
    CALL ggc.checkMessage("sink stoppers  ")
    CALL ggc.checkNoError()
    CALL ggc.action("save") -- Save save

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/21/2023", SFMT("Field value is not valid, expected: '08/21/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "MIKEF", SFMT("Field value is not valid, expected: 'MIKEF', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkMessage("Order updated")
    CALL ggc.checkNoError()
    CALL ggc.action("exit") -- Exit exit

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkMessage("Order updated")
    CALL ggc.checkNoError()
    CALL ggc.action("exit") -- Exit exit

    CALL ggc.end()
END FUNCTION

