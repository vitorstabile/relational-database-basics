/* To make subquery's, we need to use the clauses in, not in, exists and not exists */

/* in and not in */

/* we want to  return two clients in a same query */

/* the query below gives a error */

select c_codiclien, c_razaclien from comclien where n_numeclien = 1,2;

/* To do this, we use the clause in or not in */

select c_codiclien, c_razaclien from comclien where n_numeclien in (1,2);

select c_codiclien, c_razaclien from comclien where n_numeclien not in (1,2);

/* we can make a subquery */

select c_razaclien from comclien where n_numeclien in (select n_numeclien from comvenda where n_numeclien);

select c_razaclien from comclien where n_numeclien not in (select n_numeclien from comvenda where n_numeclien);

/* Always compare primary key from one table to foreign key from the other table) */

select c_codivenda, (select c_razaclien from comclien where n_numeclien = comvenda.n_numeclien) from comvenda;

select n_numevenda, (select c_descprodu from comprodu where n_numeprodu = comivenda.n_numeprodu) from comivenda;