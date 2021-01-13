/* Create Backups Online */

/* With cmd, navegate to bin folder */

C:\Program Files\MySQL\MySQL Server 8.0\bin

/* Use this command to backup the database */

mysqldump -u root -p example > C:\Users\solun\Desktop\examplebackup.sql

/* To export trigger, functions and procedures */

mysqldump -u root -p --routines --triggers example > C:\Users\solun\Desktop\examplebackup.sql

/* Especific table */

mysqldump -u root -p example comclien > C:\Users\solun\Desktop\examplebackup.sql

/* All Databases */

mysqldump -u root -p --all-databases > C:\Users\solun\Desktop\examplebackup.sql

/* Import backup */

create database example2;

/* With cmd, navegate to bin folder */

C:\Program Files\MySQL\MySQL Server 8.0\bin

/* Make a back up */

mysqldump -u root -p --routines --triggers example > C:\Users\solun\Desktop\examplebackup.sql

/* In the same cmd, make */

mysql -h localhost -u root -p example2 < C:\Users\solun\Desktop\examplebackup.sql

use example2;

show tables;