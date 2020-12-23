/* To give a temporaly name for a column in a selec, we can use aliases with as clause*/

select c_codiclien as CODIGO, c_nomeclien as CLIENTE from comclien where n_numeclien not in(1,2,3,4);

select c_codivenda as Cod_Venda, (select c_razaclien from comclien where n_numeclien = comvenda.n_numeclien) as Nome_Cliente from comvenda;