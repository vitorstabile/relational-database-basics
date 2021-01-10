/* We created a process to generate the commission, which can be */
/* executed manually or with scheduled events. */

/* However, the our system is not very large and does not have numerous */
/* number of records. We could then do this operation in */
/* real time, at the exact moment the sale is launched. */
/* We will achieve this through triggers. */

/* trigger is a set of operations that are performed */
/* automatically when a change is made to a record that */
/* is related to a table. It can be invoked before or */
/* after a change to an insert, update or delete, */
/* there can be up to 6 triggers per table. */

/* Trigger Structure */

DELIMITER $$  /* 1: we define the delimiter */

CREATE TRIGGER NAME /* 2: We created the trigger with create trigger and put a name for the trigger */
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABLE_NAME /* 3: We define whether the trigger will be triggered Before or after an Insert or Delete or Update in the table */
FOR EACH ROW

BEGIN

	SQL_QUERY
	
END

$$

delimiter ;

/*BEFORE INSERT E BEFORE UPDATE TRIGGER */

/* How we want to perform the calculation */
/* of the commission automatically, we must create two triggers: one */
/* when you enter a new sale and another when the */
/* we update. We will use the before insert conditions */
/* before insertion) and before update. Beyond */
/* of these two, there are others that I will show in sequence. */

/* To carry out our operation, we must consult the percentage */
/* of the salesperson registration commission to generate the calculation. */
/* Putting into practice what we have already learned, we will create a */
/* function to have this percentage. */

delimiter $$

create function rt_percentual_comissao(vn_n_numevende int)
returns float deterministic
begin
	declare percentual_comissao float(10,2);
	
	select n_porcvende
		into percentual_comissao
		from convende
		where n_numevende = vn_n_numevende;
		
		return percentual_comissao;
		end;
$$
delimiter ;

/* Now let's go to the code to create the trigger before insertion. */
/* Note that I will use the same calculation that I used in procedure. */

delimiter $$

create trigger tri_vendas_bi
before insert on comvenda
for each row

begin
	declare percentual_comissao float(10,2);
	declare valor_comissao float(10,2);
	
	/*busco o percentual de comissão que o vendedor deve receber */
	
	select rt_percentual_comissao(new.n_numevende) into percentual_comissao;
	
	/* calculo comissão */
	
	set valor_comissao = ((new.n_totavenda * percentual_comissao) / 100);
	
	/* recebo no novo valor de comissão */
	
	set new.n_vcomvenda = valor_comissao;
	
end
$$
delimeter ;

/* Now, when you insert a new record in the table */
/* sales, the calculation of the seller's commission amount will be */
/* performed and the field will be filled. */

/* However, the total value of the sale can be changed and, in the event of */
/* insertion or withdrawal of an item from it, the amount of the commission to be */
/* paid to the seller will also change. So we must create more */
/* a trigger on the sales table to make an update */
/* that amount for when that happens. */

delimiter $$

create trigger tri_vendas_bu
before update on comvenda
for each row

begin

declare percentual_comissao float(10,2);
declare valor_comissao float(10,2);

/* No update, verifico se o valor total novo da venda */
/* é diferente do total anterior, pois se forem iguais, */
/* não há necessidade do cálculo */

if (old.n_totavenda <> new.n_totavenda) then
	select rt_percentual_comissao(new.n_numevende) into percentual_comissao;
	
	/* cálculo da comissão */
	
	set
	valor_comissao = ((new.n_totavenda * percentual_comissao) / 100);
	
	/* recebo no novo valor de comissão */
	
	set new.n_vcomvenda = valor_comissao;
	
end if
end
$$
delimiter ;

/*AFTER INSERT E AFTER UPDATE TRIGGER */

/* We made triggers to perform the calculation based on the value of */
/* sales amount. However, we are manually adding your items */
/* and entering in the field n_totavenda. This can cause */
/* error occurs, unlike when inserted from */
/* an application; however, we can make this calculation */
/* performed automatically using a trigger. */

/* This time, we will use the types after insert (after */
/* insert) and after update (after changing) in the table */
/* comivenda (items of sale), so that, after inserting the */
/* products, the value of your total is calculated and the field n_totavenda is updated. */

delimiter $$

create trigger tri_vendas_ai
after insert on comivenda
for each row
begin

/* declaro as variáveis que utilizarei */

	declare vtotal_itens float(10,2) default 0;
	declare total_item float(10,2) default 0;
	declare fimLoop boolean default false;
	
	/* cursor para buscar os itens já registrados da venda */
	declare busca_itens cursor for
		select n_valoivenda from comivenda where n_numevenda = new.n_numevenda;
		
	/*Handler para encerrar o loop antes da última linha */
	
	declare continue handler for sqlstate '02000' set fimLoop = true;
	
	/*abro o cursor */
	open busca_itens;
	/* declaro e inicio o loop */
	itens : loop fetch busca_itens into total_item;
	
	/* encerra o bloco quando o cursor não retornar mais linhas */
	
	if fimLoop then
		leave itens;
	end if;
	
	/* somo o valor total dos itens(produtos) */
	set vtotal_itens = vtotal_itens + total_item;
	
end loop itens;

close busca_itens;

/* atualizo o total da venda */
update comvenda set n_totavenda = vtotal_itens where n_numevenda = new.n_numevenda;

end
$$
delimiter ;

/* Agora temos a mesma situação que tínhamos anteriormente,
pois a tabela de itens da venda pode ser atualizada e, se isso
ocorrer, o valor de seu total ficará incorreto. Por isso, devemos
criar uma trigger que o atualizará se o valor do item for alterado;
mas somente na condição de o novo ser diferente do antigo. Esse
não sendo o caso, não é necessário executar os cálculos.

*/

delimiter $$
create trigger tri_ivendas_au
after update on comivenda
for each row
begin

/* declaro as variáveis que utilizarei */

declare vtotal_itens float(10,2) default 0;
declare total_item float(10,2) default 0;
declare fimLoop boolean default false;

/* cursor para buscar os itens já registrados da venda */

declare busca_itens cursor for select n_valoivenda from comivenda where n_numevenda = new.n_numevenda;

/* Handler para encerrar o loop antes da última linha */

declare continue handler for sqlstate '02000' set fimLoop = true;

/* verifico se há necessidade de alteração */
/* faço somente se o novo valor for alterado */

if new.n_valoivenda <> old.n_valoivenda then

/* abro o cursor */
open busca_itens;
/* declaro e inicio o loop */

itens : loop

fetch busca_itens into total_item;

/*encerra o bloco quando o cursor não retornar mais linhas */

	if fimLoop then
		leave itens;
	end if;
	
	/* somo o valor total dos itens(produtos) */
	
	set vtotal_itens = vtotal_itens + total_item;

end loop itens;

close busca_itens;

/* atualizo o total da venda */

update comvenda set n_totavenda = vtotal_itens where n_numevenda = new.n_numevenda;

end if;
end
$$
delimeter ;

/*BEFORE DELETE E AFTER DELETE TRIGGER */

/*
Now, you may have the following question: what if we
we delete an item from a sale? Really, if that happens
at this time, your total amount will be incorrect, as we have
just the triggers for insert and update. To correct this
problem, let's create one for the delete as well.
*/

delimiter $$
create trigger tri_ivendas_af
after delete on comivenda
for each row
begin
/* declaro as variáveis que utilizarei */
declare vtotal_itens float(10,2) default 0;
declare total_item float(10,2) default 0;
declare fimLoop boolean default false;
/* cursor para buscar os itens já registrados da venda */

declare busca_itens cursor for
select n_valoivenda
from comivenda
where n_numevenda = old.n_numevenda;

/*Handler para encerrar o loop antes da última linha */
declare continue handler for
sqlstate '02000'
set fimLoop = true;
/* abro o cursor */
open busca_itens;
/* declaro e inicio o loop */
itens : loop

fetch busca_itens into total_item;

/*encerra o bloco quando o cursor não retornar mais linhas.*/

if fimLoop then
leave itens;
end if;
## somo o valor total dos itens(produtos)
set vtotal_itens = vtotal_itens + total_item;
end loop itens;
close busca_itens;
## atualizo o total da venda
update comvenda set n_totavenda = vtotal_itens
where n_numevenda = old.n_numevenda;
end
$$
delimiter ;

/*

We have one more situation that we can resolve using the
trigger: on delete. Remember the integrity issues of data.
 A table that has a foreign key cannot be deleted
a record without first deleting the primary record.

*/

delimiter $$
create trigger tri_vendas_bf
before delete on comvenda
for each row
begin
/* declaro as variáveis que utilizarei /*

declare vtotal_itens float(10,2) default 0;
declare total_item float(10,2) default 0;
declare fimLoop boolean default false;

/* verifico se há necessidade de alteração */
/* faço somente se o novo valor for alterado */
/* cursor para buscar os itens já registrados da venda */

declare busca_itens cursor for
select n_valoivenda
from comivenda
where n_numevenda = old.n_numevenda;

/*Handler para encerrar o loop antes da última linha */

declare continue handler for
sqlstate '02000'
set fimLoop = true;

/* abro o cursor */
open busca_itens;
/* declaro e inicio o loop */
itens : loop

fetch busca_itens into total_item;

/*encerra o bloco quando o cursor não retornar mais linhas */

if fimLoop then
leave itens;
end if;

/* somo o valor total dos itens(produtos) */

set vtotal_itens = vtotal_itens + total_item;

end loop itens;

close busca_itens;

/* atualizo o total da venda */

delete from comivenda where n_numevenda = old.n_numevenda;
end
$$
delimiter ;

/* TRIGGER STATUS */

/* to disable trigger */

alter trigger tri_vendas_bi desable;

/* to enable trigger */

alter trigger tri_vendas_bi enable;

/* to drop trigger */

drop trigger tri_vendas_bi;