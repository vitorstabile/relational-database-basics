/* Update clause is used to  alter values of a specific row in a column */

/* SQL: update (table name) set (column name) = (value) where (column name with especific value - common use is primary key); */

/* after the update, to save, you have to use the command commit */

/* SQL: commit; */

/* to dismiss the update, use the command rollback */

/* SQL: rollback; */

/*  Caution - Use the Where clause for every update and delete SQL command */

update comclien set c_nomeclien = 'AARONSON FURNITURE' where n_numeclien = 1;

commit;

update comclien set c_nomeclien = 'AARONSON FURNITURE', c_cidaclien = 'LONDRINA', c_estaclien = 'PR' where n_numeclien = 1;

commit;

update comclien set c_nomeclien = 'AARONSON' where n_numeclien = 1;

rollback;