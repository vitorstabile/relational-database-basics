/* Logical Operators */

/* OR -> For a true output, just one condition have to be true */

/* AND -> For a true output, all condition have to be true */

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien = 1 and c_razaclien like '%AARONSON%';
 
select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien = 1 and c_razaclien = 'LITTLER  LTDA';

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien = 1 or c_razaclien = 'LITTLER  LTDA';

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien = 2 or c_razaclien = 'LITTLER  LTDA';

select n_numeclien, c_codiclien, c_razaclien from comclien where (n_numeclien = 2 or c_razaclien = 'AUTO WORKS LTDA') or (n_numeclien = 3 or c_razaclien = 'DAHLKEMPER  LTDA');

select n_numeclien, c_codiclien, c_razaclien from comclien where (n_numeclien = 2 or c_razaclien = 'AUTO WORKS LTDA') and (n_numeclien = 3 or c_razaclien = 'DAHLKEMPER  LTDA');

select n_numeclien, c_codiclien, c_razaclien from comclien where (n_numeclien = 2 and c_razaclien = 'LITTLER  LTDA') or (n_numeclien = 3 and c_razaclien = 'KELSEY  NEIGHBOURHOOD');

select n_numeclien, c_codiclien, c_razaclien from comclien where (n_numeclien = 2 and c_razaclien = 'LITTLER  LTDA') and (n_numeclien = 3 and c_razaclien = 'KELSEY  NEIGHBOURHOOD');

select n_numeclien, c_codiclien, c_razaclien from comclien where (n_numeclien = 2 or c_razaclien = 'AUTO WORKS LTDA') or (n_numeclien = 3 and c_razaclien = 'KELSEY  NEIGHBOURHOOD');

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien = 2 or (n_numeclien = 3 and c_razaclien = 'KELSEY  NEIGHBOURHOOD');

select n_numeclien, c_codiclien, c_razaclien from comclien where n_numeclien = 2 and (n_numeclien = 3 or c_razaclien = 'KELSEY  NEIGHBOURHOOD');