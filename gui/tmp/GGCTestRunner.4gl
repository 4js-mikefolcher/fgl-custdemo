IMPORT os
IMPORT xml

PRIVATE TYPE TTestProgram RECORD
	app STRING ATTRIBUTE(XMLAttribute, XMLName="app"),
	dir STRING ATTRIBUTE(XMLAttribute, XMLName="dir")
END RECORD

PRIVATE TYPE TTestPrograms RECORD
	app STRING ATTRIBUTE(XMLAttribute, XMLName="app"),
	tests DYNAMIC ARRAY ATTRIBUTE(XMLList) OF TTestProgram ATTRIBUTE(XMLName="Test")
END RECORD

PRIVATE TYPE TTestGroups RECORD
	groups DYNAMIC ARRAY ATTRIBUTE(XMLList) OF TTestPrograms ATTRIBUTE(XMLName="TestGroup")
END RECORD

MAIN

	IF num_args() > 1 THEN
		#TODO: Run the program interactively
		DISPLAY "Pass the name of the test XML file to run"
		EXIT PROGRAM -1
	END IF

	VAR idx = 0
	FOR idx = 1 TO num_args()

		VAR xmlFile = arg_val(idx)
		IF os.Path.exists(xmlFile) == TRUE THEN
			CALL runTests(xmlFile)
		ELSE
			DISPLAY SFMT("File %1 does not exist", xmlFile)
		END IF

	END FOR

END MAIN

PRIVATE FUNCTION runTests(xmlFile STRING) RETURNS ()
	DEFINE testPrograms TTestGroups ATTRIBUTE (XMLName="TestGroups")

	VAR xmlDoc = xml.DomDocument.Create()
	CALL xmlDoc.load(xmlFile)

	VAR xmlNode = xmlDoc.getDocumentElement()
	CALL xml.Serializer.DomToVariable(xmlNode, testPrograms)

	CALL testPrograms.executeTestGroups()

END FUNCTION #runTests

PRIVATE FUNCTION (self TTestGroups) executeTestGroups() RETURNS ()

	VAR idx = 0
	FOR idx = 1 TO self.groups.getLength()
		CALL self.groups[idx].executeTests()
	END FOR

END FUNCTION #executeTests

PRIVATE FUNCTION (self TTestPrograms) executeTests() RETURNS ()

	VAR idx = 0
	VAR appCommand = SFMT("fglrun %1", self.app)
	FOR idx = 1 TO self.tests.getLength()
		CALL self.tests[idx].executeTest(appCommand)
	END FOR

END FUNCTION #executeTest

PRIVATE FUNCTION (self TTestProgram) executeTest(testCommand STRING) RETURNS ()

	VAR ggcCommand = SFMT(
		"fglrun %1%2%3 tcp --command-line \"%4\"",
		self.dir,
		os.Path.separator(),
		self.app,
		testCommand
	)
	VAR runValue = 0
	DISPLAY SFMT("Running command: %1", ggcCommand)
	RUN ggcCommand IN FORM MODE RETURNING runValue

	IF runValue != 0 THEN
		DISPLAY "TEST FAILED!!!!!!!"
	ELSE
		DISPLAY "Test was successful!"
	END IF

END FUNCTION #executeTest