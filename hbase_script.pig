--CREATING A RELATION BY LOADING USER DATA FILE
users = LOAD '/user/mugilmithran/employees.csv' 
USING PigStorage(',') 
AS (FirstName:chararray, LastName:chararray, Email:chararray, Phone:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE users INTO 'hbase://employees' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('empname:FirstName,empname:LastName,empinfo:Email,empinfo:Phone');