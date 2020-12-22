/* Insert is used to insert values to a column in a specific table */ 

/* SQL form 1 (Caution with the sequence): insert into (table name) values (value1, value2, value3...); */

/* SQL form 2 (most used): insert into (table name) (column name1, column name2...) values (value1 for column name1, value2 for column name2...); */

/* SQL form 3 (Just MYSQL): insert into (table name) */
/*  values (value column name1, value column name2, value column name3...) */
/*  (value column name1, value column name2, value column name3...); */

/* Form 2 */
insert into comclien(n_numeclien,c_codiclien,c_nomeclien,c_razaclien,d_dataclien,c_cnpjclien,c_foneclien,c_cidaclien,c_estaclien) values (1,'0001','AARONSON','AARONSON FURNITURE LTDA','2015-02-17','17.807.928/0001-85','(21) 8167-6584','QUEIMADOS','RJ');

/* Form 1 */
insert into comclien values (2,'0001','AARONSON','AARONSON FURNITURE LTDA','2015-02-17','17.807.928/0001-85','(21) 8167-6584','QUEIMADOS','RJ');

