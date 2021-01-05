/* The aggregation functions is responsible to group many values and return one value for a group */

/* Order By */

/* In this SQL function is gonna order by name in a select, but we have the repeated values */

select c_codiclien, c_razaclien 
from comvenda, comclien 
where comvenda.n_numeclien = comclien.n_numeclien 
order by c_razaclien;

/* Group by */

/* In this SQL function we don't have repeated values in a select */

select c_codiclien, c_razaclien
from comclien, comvenda
where comvenda.n_numeclien = comclien.n_numeclien
group by c_codiclien, c_razaclien
order by c_razaclien;

/* Count() */

/* In this SQL function, we can count the values from a select */

select c_codiclien, c_razaclien, count(n_numevenda) Qtde
from comclien, comvenda
where comvenda.n_numeclien = comclien.n_numeclien
group by c_codiclien, c_razaclien
order by c_razaclien;

/* We can count the datas from a table */

select count(*) from comclien;

/* Having count() */

/* This SQL function is use with count() function to specify a condition */

select c_razaclien, count(n_numevenda)
from comclien, comvenda
where comvenda.n_numeclien = comclien.n_numeclien
group by c_razaclien
having count(n_numevenda) > 2;

/* Max() and Min() */

/* This SQL function is to return the max or min value from a cloumn */

select max(n_totavenda) maior_venda from comvenda;

select min(n_totavenda) menor_venda from comvenda;

/* In the same time */

select min(n_totavenda) menor_venda, max(n_totavenda) maior_venda from comvenda;

/* Sum() */

/* This SQL function is use to sum values */

select sum(n_valovenda) valor_venda, 
	   sum(n_descvenda) descontos, 
	   sum(n_totavenda) total_venda
from comvenda
where d_datavenda between '2015-01-01' and '2015-01-31';

/* Avg() */

/* This SQL function is use to make average values from a column. We can put the float size */

select format(avg(n_totavenda),2) from comvenda;