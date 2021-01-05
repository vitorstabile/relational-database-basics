/*

* : multiplication;
/ : division;
+ : addition;
- : subtraction.

*/

/* to make operations, we have to use the select clause */

/* * : multiplication */

select (n_qtdeivenda * n_valoivenda) multiplicação from comivenda where n_numeivenda = 4;

/* / : division */

select truncate((sum(n_valoivenda) / count(n_numeivenda)),2) divisão from comivenda;

/* + : addition */

select (n_valoivenda + n_descivenda) adição from comivenda where n_numeivenda = 4;

/* - : subtraction */

select (n_valoivenda - n_descivenda) subtração from comivenda where n_numeivenda = 4;