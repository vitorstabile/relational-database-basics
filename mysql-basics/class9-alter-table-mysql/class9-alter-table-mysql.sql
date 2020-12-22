/* Alter Table is use to alter the type of the field */

/* SQL: alter table (table name) (add or drop) column (column name) (data type) */

/* 
	add - add table

	drop - Delete table
*/

alter table comclien add column c_cidaclien varchar(50);

alter table comclien drop column c_estclien;

alter table comclien add column c_estaclien varchar(50);

/* You can use with the modify clause to alter the data type without add or drop column */

alter table comclien modify column c_estaclien int;

alter table comclien modify column c_estaclien varchar(100);
