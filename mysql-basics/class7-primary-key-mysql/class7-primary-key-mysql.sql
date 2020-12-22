/* The Primary Key:

create table comclien(n_numeclien int not null auto_increment,
					c_codiclien varchar(10),
					c_nomeclien varchar(50),
					c_razaclien varchar(50),
					d_dataclien date,
					c_cnpjclien varchar(20),
					c_foneclien varchar(15),
					primary key (n_numeclien));

The primary key is what makes the line or record a
unique table. Originated, an automatic sequence is extracted
for the generation of this key so that it will not be repeated. In
our case, the n_numeclien will be unique, that is, no pair of
rows have the same value in the same column. It will be a
numeric preference string that identifies a record.

In the MySQL, to make a column a primary key:

create table (table name)((column name 1)(data type) not null auto_increment,
						  (column name 2)(data type),
						  (column name 3)(data type),
						   ....
						   ....
						   primary key (column name 1)); 
*/