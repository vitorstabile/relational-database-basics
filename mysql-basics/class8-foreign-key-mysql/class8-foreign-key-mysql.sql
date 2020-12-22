/* The Foreign Key:

The foreign key defines a relationship between tables,
commonly called referential integrity. This rule is based
in the fact that a foreign key in a table is the key
primary in another.

When we created the comvenda table, we included columns of
other tables, such as n_numeclien, n_numeforne and
n_numeprodu. These columns are referencing a record in
your source table. However, as we only created the field, but
nothing that informs the bank about this reference, we should do
this, passing an instruction to our DBMS through the
constraints, as the codes show in the sequence.

To create and reference foreign keys, use the commands

- QUERY: alter table (table name) add constraint (name of the constraint)
		 foreign key (the column of the foreign key in the current table)
			references (table name reference of the foreign key)(the column of the primary key table reference)
				on delete no action
				on update no action;
				
*/
				
alter table comvenda add constraint fk_comprodu_comforne
	foreign key(n_numeforne)
		references comforne(n_numeforne)
			on delete no action
			on update no action;
			
alter table comvenda add constraint fk_comprodu_comvende
	foreign key(n_numevende)
		references comvende(n_numevende)
			on delete no action
			on update no action;
			
alter table comvenda add constraint fk_comvenda_comclien
	foreign key(n_numeclien)
		references comclien(n_numeclien)
			on delete no action
			on update no action;
			
alter table comivenda add constraint fk_comivenda_comprodu
	foreign key(n_numeprodu)
		references comprodu (n_numeprodu)
			on delete no action
			on update no action;
			
alter table comivenda add constraint fk_comivenda_comvenda
	foreign key(n_numevenda)
		references comvenda (n_numevenda)
			on delete no action
			on update no action;
		