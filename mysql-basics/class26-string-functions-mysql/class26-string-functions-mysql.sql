/* String functions (characters) can be used to modify the data, with respect to the selected values, */
/*	but also in the way they are presented. Or yet, */
/*	modify them for validation. */

/* substr() */

/* In this SQL function, we put the name of the column and the position of what we want. */
/* After that, we put what we want */

/* length() */

/* In this SQL function, we count how much characters we want */

select c_codiprodu, c_descprodu from comprodu where substr(c_codiprodu,1,3) = '123' and length(c_codiprodu) > 4;

select substr(c_razaclien,1,5) Razao_Social, length(c_codiclien) Tamanho_Cod from comclien where n_numeclien = 1;

/* Concat() */

/* In this SQL function, we can concat two or more columns */

select concat(c_razaforne,' - fone: ', c_foneforne) from comforne order by c_razaforne;

/* concat_ws() */

/* In this SQL function, we can inform the separator */

select concat(c_codiclien,' ',c_razaclien, ' ', c_nomeclien) from comclien where c_razaclien like 'GREA%';

select concat_ws(';',c_codiclien, c_razaclien, c_nomeclien) from comclien where c_razaclien like 'GREA%';

/* Lcase() and lower() */

/* In this SQL function, we can lower letters */

select lcase(c_razaclien) from comclien;

/* Ucase() */

/* In this SQL function, we can large the letters */

select ucase('banco de dados mysql') from dual;