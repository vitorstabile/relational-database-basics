/* We can create a table with the select clause */

/* QUERY: create table (table name) as (select (column name) from (table name)); */

create table comclien_bkp as (select * from comclien);

create table comclien_bkp2 as (select * from comclien where c_estaclien = 'SP');

select * from comclien_bkp;

select * from comclien_bkp2;