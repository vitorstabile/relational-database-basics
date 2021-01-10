/* With the procedures, we were able to carry out processing, and */
/* yet, if we want to, get some return. Functions are used */
/* specifically to return something. */

/* We can spend some parameter with the same type of declaration that we make in */
/* procedure and inform the type of return we will have. */

/* If you want to create something to get some feedback, I advise */
/* use of a function, because we can use them in the middle */
/* consultation, unlike the procedure, that we have to */
/* run with a specific command. */

/* Let's create a function to return the name of the client, according with the number of the client */

delimiter $$

create function rt_nome_cliente(vn_numeclien int)
	returns varchar(50) deterministic
	
	begin
	
		declare nome varchar(50);
		
		select c_nomeclien into nome from comclien where n_numeclien = vn_numeclien;
		
		return nome;
		
	end $$
	
delimiter ;

/* estou passando como parâmetro o id do cliente igual a 1 */

select rt_nome_cliente(1);

/* we can use function with select */

/* irei retornar o código da venda, nome do cliente e a */
/* data da venda ordenando pelo nome e em seguida pela data */

select c_codivenda, rt_nome_cliente(n_numeclien), d_datavenda from comvenda order by 2,3;