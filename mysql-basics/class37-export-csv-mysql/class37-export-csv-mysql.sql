/* 

We can export to .csv file or .txt file

*/

/* First, you need to know where the file will be stored */

/* First, run this command to know the path */

SHOW VARIABLES LIKE "secure_file_priv";

/*

+------------------+------------------------------------------------+
| Variable_name    | Value                                          |
+------------------+------------------------------------------------+
| secure_file_priv | C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ |
+------------------+------------------------------------------------+

*/

/* Will be stored in C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ */

use example

/*

For example, let's save all the records in the
customers in a .txt file. On export, we will tell the
DBMS that we want to save the file to the c: / drive with the
example.txt. We want to separate each record
',' and limit each column with ''''.

*/

select * from comclien
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\examplebackup1.txt'
fields terminated by ','
enclosed by '''';

select * from comclien
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\examplebackup1.csv'
fields terminated by ','
enclosed by '''';

/* Another example */

SELECT * FROM calculo_receita.ingrediente 
INTO OUTFILE 'C:\\Temp\\teste.csv'
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';