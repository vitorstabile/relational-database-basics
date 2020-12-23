/* We can alter a table with select */
 
 update comcontato set c_cidacontato = 'LONDRINA', c_estacontato = 'PR' where n_numeclien in ( select n_numeclien from comclien_bkp);