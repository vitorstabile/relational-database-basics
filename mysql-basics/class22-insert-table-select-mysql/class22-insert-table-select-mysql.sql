/* We can insert into atable with the select clause */

/* QUERY: insert into (table name) (select (column name) from (table name)); */

create table comcontato( n_numecontato int not null auto_increment, c_nomecontato varchar(200), c_fonecontato varchar(30), c_cidacontato varchar(200), c_estacontato varchar(2), n_numeclien int, primary key(n_numecontato));

insert into comcontato(select n_numeclien,c_nomeclien,c_foneclien,c_cidaclien,c_estaclien,n_numeclien from comclien);

select * from comcontato;

/* with multiple tables */

insert into comventp_teste (n_numeivenda, n_numeprodu,c_descprodu,n_valoivenda) select n_numeivenda,n_numeprodu,(select c_descprodu from comprodu where n_numeprodu = comivenda.n_numeprodu),n_valoivenda from comivenda;