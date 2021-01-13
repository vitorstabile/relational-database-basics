/* 

We also know that every time we rewrite the same
consultation, we will achieve the same results as before. 

That is a serious task, as there are several ways to write a
same consultation. To alleviate this situation and also thinking
in performance and time saved, we can quickly transform these queries into a view. 

From that, she will remain stored on the database server at
form of a table so that we can consult it every time
we need, without having to rewrite it

A view is an object that belongs to a database,
defined and based on selects statements, returning a
given view of data from one or more tables. Those
objects are sometimes called virtual tables, formed from
other tables that, in turn, are called based tables or other Views. 
In some cases, these are upgradeable and can be insert, update and
delete, which actually modifies your based tables.

*/

/* Create View */

create or replace view clientes_vendas_fornecedor as
select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne, comclien.c_nomeclien /* projection - table comvenda - comforne and comclien */
from comvenda
inner join comforne
on comvenda.n_numeforne = comforne.n_numeforne
inner join comclien
on comvenda.n_numeclien = comclien.n_numeclien;

select * from clientes_vendas_fornecedor;

/* Update views */

/* 

For you to be able to insert, update and delete a record
through a view, it cannot have joins and functions
aggregators, such as group by.

*/

create or replace view produtos as
select n_numeprodu,
c_codiprodu,
c_descprodu,
n_valoprodu,
c_situprodu,
n_numeforne
from comprodu;

insert into produtos values (6,'0006','SMART WATCH','2412.98','A',1);

update produtos set n_valoprodu = '1245.99' where n_numeprodu = 6;