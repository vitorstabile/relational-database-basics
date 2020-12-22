/* Delete clause is used to erase values form column. */

/* Is not like drop. Drop is used to erase objects from database, like tables, columns, views, procedures...*/

/* SQL: delete from (table name) where (column name with especific value - common use is primary key); */

/* after the delete, to save, you have to use the command commit */

/* SQL: commit; */

/* to dismiss the delete, use the command rollback */

/* SQL: rollback; */

/*  Caution - Use the Where clause for every update and delete SQL command */

delete from comclien where n_numeclien = 1;

commit;

delete from comclien;

commit;