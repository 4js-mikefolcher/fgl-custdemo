MAIN

   #DATABASE custdemo
   

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE mytest   

   WHENEVER ANY ERROR STOP

   CREATE TABLE mytest (
      rec_key SERIAL PRIMARY KEY,
      rec_text VARCHAR(255)
   )

   INSERT INTO mytest VALUES(0, 'Hello World')
   VAR serialValue =  sqlca.sqlerrd[2]
   DISPLAY SFMT("Serial Value: %1", serialValue)

   DROP TABLE mytest   

END MAIN
