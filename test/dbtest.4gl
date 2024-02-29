MAIN
   DEFINE customerCount INTEGER
   
   DATABASE custdemo

   SELECT COUNT(*) INTO customerCount FROM customer

   DISPLAY SFMT("The number of customers is %1", customerCount)

END MAIN
