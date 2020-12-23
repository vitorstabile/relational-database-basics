/* Select is a clause used to make a selection of what you want to see */

/* SQL: select (column name) from (table name); */

select * from comclien;

/* if you want to select multiples column */

select n_numeclien, c_codiclien, c_razaclien from comclien;

/* if you want to select a specify row */

select n_numeclien, c_codiclien, c_razaclien from comclien where c_codiclien = '0001';

/* if you want to select a specify row, but diferent from what have the where clause */

select n_numeclien, c_codiclien, c_razaclien from comclien where c_codiclien <> '0001';

/* We can use the operators >, <, >=, <=, for numeric types */

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien < 3;

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien > 3;

/* for strings, we can use the like clause with % */

select n_numeclien, c_codiclien, c_razaclien from comclien where c_razaclien like 'L%';

select n_numeclien, c_codiclien, c_razaclien from comclien where c_razaclien like '%LIT%';

select n_numeclien, c_codiclien, c_razaclien from comclien where c_razaclien like '%LTDA';