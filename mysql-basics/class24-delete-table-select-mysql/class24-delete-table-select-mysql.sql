/* We can delete a table with select */
 
delete from comcontato where n_numeclien not in (select n_numeclien from comvenda );
 
commit;