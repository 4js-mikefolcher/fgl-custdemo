# =============================================================================
# Generated using Genero Ghost Client 4.01.01-202209161147
# =============================================================================
IMPORT FGL ggc

MAIN
    CALL ggc.setApplicationName("OrderEntryPlus")
    CALL ggc.parseOptions()

    # Register scenario functions
    CALL ggc.registerScenario(FUNCTION playTestDeleteCancel)

    # Start execution and exits when the scenario ends
    # Exit status is 1 in case of error, 0 on success.
    CALL ggc.play()
END MAIN

# Scenario OrderEntryPlus_mikefolcher_Delete_Cancel id : 0
PRIVATE FUNCTION playTestDeleteCancel()

	 DISPLAY "Starting the Delete Cancel test"

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
    CALL ggc.action("query") -- Query query

    CALL ggc.assert(ggc.getFocus() == "orders.order_num", SFMT("Focused field name is not valid, expected: 'orders.order_num', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- --
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- --
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.key("tab")

    CALL ggc.assert(ggc.getFocus() == "orders.order_date", SFMT("Focused field name is not valid, expected: 'orders.order_date', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- --
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- --
    CALL ggc.assertEquals(ggc.getValue(), "", SFMT("Focused field value is not valid, expected: '', got: '%1'", ggc.getValue())) -- DATE
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.setFocus("orders.order_date")

    CALL ggc.setValue("8/20/2023")

    CALL ggc.action("accept") -- Accept accept

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "28", SFMT("Field value is not valid, expected: '28', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "104", SFMT("Field value is not valid, expected: '104', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "N", SFMT("Field value is not valid, expected: 'N', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("last") -- Last last

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "32", SFMT("Field value is not valid, expected: '32', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("delete") -- Delete delete

    CALL ggc.assert(ggc.getFocus() == "delete", SFMT("Focused field name is not valid, expected: 'delete', got: '%1'", ggc.getFocus()))
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "32", SFMT("Field value is not valid, expected: '32', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("cancel") -- Cancel

    CALL ggc.assert(ggc.getFocus() == "first", SFMT("Focused field name is not valid, expected: 'first', got: '%1'", ggc.getFocus()))
    #CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "32", SFMT("Field value is not valid, expected: '32', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "08/20/2023", SFMT("Field value is not valid, expected: '08/20/2023', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "106", SFMT("Field value is not valid, expected: '106', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "PHL", SFMT("Field value is not valid, expected: 'PHL', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "FEDEX", SFMT("Field value is not valid, expected: 'FEDEX', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "Y", SFMT("Field value is not valid, expected: 'Y', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkError("Delete canceled")
    CALL ggc.action("exit") -- Exit exit

    CALL ggc.assert(ggc.getFocus() == "query", SFMT("Focused field name is not valid, expected: 'query', got: '%1'", ggc.getFocus()))
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.order_date"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.order_date"))) -- DATE
    CALL ggc.assertEquals(ggc.getFieldValue("orders.store_num"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.store_num"))) -- INTEGER
    CALL ggc.assertEquals(ggc.getFieldValue("orders.fac_code"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.fac_code"))) -- CHAR(3)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.ship_instr"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.ship_instr"))) -- CHAR(10)
    CALL ggc.assertEquals(ggc.getFieldValue("orders.promo"), "", SFMT("Field value is not valid, expected: '', got: '%1'", ggc.getFieldValue("orders.promo"))) -- CHAR(1)
    CALL ggc.checkNoMessage()
    CALL ggc.checkNoError()
    CALL ggc.action("exit") -- Exit exit

	 CALL ggc.end()

END FUNCTION

