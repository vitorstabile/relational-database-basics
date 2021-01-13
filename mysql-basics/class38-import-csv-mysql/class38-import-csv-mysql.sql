/* 

We can import to .csv file or .txt file

*/

/* First, you need to know where the file will be stored */

/* First, run this command to know the path */

SHOW VARIABLES LIKE "secure_file_priv";

/*

+------------------+------------------------------------------------+
| Variable_name    | Value                                          |
+------------------+------------------------------------------------+
| secure_file_priv | C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ |
+------------------+------------------------------------------------+

*/

/* Will be stored in C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\ */

/*

The import via file can be very useful in actions of
popular data in a database or import it from others
systems or banks, as I described earlier. Of the same
way that export, it will not depend on an application or
of a tool.

*/

create table comuser(n_numeuser int not null auto_increment,n_nomeuser varchar(100),n_nascuser date,primary key(n_numeuser));

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\example5.txt'
into table comuser
fields terminated by ','
lines terminated by '\n';

/* export */

select * from comuser
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\example6.txt'
fields terminated by ','
enclosed by '''';

/* Another example */

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:\\Users\\vep08.FESTPANDOMAIN\\Desktop\\Teste.csv'
INTO TABLE calculo_receita.ingrediente
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
(id, codigo, descricao, custo);

SELECT * FROM calculo_receita.ingrediente;