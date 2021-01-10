/* Stored Procedure */

/*This is a example of a stored procedure */
/* We gonna make another example more easy */

alter table comvenda add n_vcomvenda float(10,2);

/* Once the fields are generated, we will create our stored procedure
which should look for the percentage value of each seller,
perform the processing and then update the
commission value column in the sales table. */


/* We will use the procedure to make this update, because in
our scenario, we had already created the bank without those columns and the
our system is already in production, that is, we are assuming that there are
people using it */ 

/* The delimeter of the procedure. Normalym use $$ */

delimiter $$

create procedure processa_comissionamento(in data_inicial date,in data_final date, out total_processado int )
begin
	declare total_venda float(10,2) default 0;
	declare venda int default 0;
	declare vendedor int default 0;
	declare comissao float(10,2) default 0;
	declare valor_comissao float(10,2) default 0;
	declare aux int default 0;
	declare fimloop int default 0;
	
	/* cursor para buscar os registros a serem */
	/* processados entre a data inicial e data final */
	/* e valor total de venda é maior que zero */

	declare busca_pedido cursor for select n_numevenda, n_totavenda, n_numevende from comvenda
		    where d_datavenda between data_inicial
			and data_final
			and n_totavenda > 0 ;
			 
	/* Faço aqui um tratamento para o banco não */
	/* executar o loop quando ele terminar */
	/* evitando que retorne qualquer erro */
	declare continue handler for sqlstate '02000' set fimloop = 1;

	/* abro o cursor */
	open busca_pedido;
	
		/* inicio do loop */
		vendas: LOOP
		
		/* Aqui verifico se o loop terminou */
		/* e saio do loop */
		if fimloop = 1 then leave vendas;
		end if;
		
		/* recebo o resultado da consulta em cada variável */
		fetch busca_pedido into venda, total_venda,vendedor;
		
		/* busco o valor do percentual de cada vendedor */
		select n_porcvende into comissao from comvende where n_numevende = vendedor;
		
		/* verifico se o percentual do vendedor é maior */
		/* que zero logo após a condição deve ter o then */
		if (comissao > 0 ) then
			/* calculo o valor da comissao */
			set valor_comissao = ((total_venda * comissao) / 100);
			
			/* faço o update na tabela comvenda com o */
			/* valor da comissão */
			update comvenda set n_vcomvenda = valor_comissao where n_numevenda = venda;
			commit;
			
		/* verifico se o percentual do vendedor é igual */
        /* zero na regra do nosso sistema se o vendedor */
        /* tem 0 ele ganha 0 porcento de comissão */
		elseif (comissao = 0) then
		
			update comvenda set n_vcomvenda = 0 where n_numevenda = venda;
			commit;
		/* se ele não possuir registro no percentual de */
		/* comissão ele irá ganhar 1 de comissão */
		/* isso pela regra de negócio do nosso sistema */
		else
			set comissao = 1;
			set valor_comissao = ((total_venda * comissao) / 100);
			
			update comvenda set n_vcomvenda = valor_comissao where n_numevenda = venda;
			commit;
		/* fecho o if */
		end if;
		
		set comissao = 0;
		/*utilizo a variável aux para contar a quantidade */
		set aux = aux +1 ;
	end loop vendas;
		/* atribuo o total de vendas para a variável de */
		/* saída */
	set total_processado = aux;
	/* fecho o cursor */
	close busca_pedido;
	
	/*retorno o total de vendas processadas */
	
	end$$
	
delimiter ;

/* To use the procedure */

call processa_comissionamento('2015-01-01','2015-05-30' ,@a);
select @a;

select * from comvenda;

/* A more simple procedure */

create table comexample (n_numetotal int not null auto_increment, n_numevende int not null, n_valortotal float(10,2), primary key(n_numetotal));

alter table comexample add constraint fk_comexample_comvende
	foreign key(n_numevende)
		references comvende (n_numevende)
			on delete no action
			on update no action;

insert into comexample (n_numevende) select n_numevende from comvende;

/* we gonna calculate the total value from each vendor */

delimiter $$

create procedure total_value()
begin
	select comvende.n_numevende, sum(comvenda.n_vcomvenda)
	from comvenda
	inner join comvende
	on comvende.n_numevende = comvenda.n_numevende
	group by n_numevende;

	/* or */

	/* select n_numevende, sum(n_vcomvenda) from comvenda group by n_numevende; */
	
	end$$
delimeter ;

call total_value();