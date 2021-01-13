/*

In order to assist in improving queries, MySQL
provides us indexes. When we create as our own
tables, we have already created a primary key index (primary key).
However, it is not used to make this optimization of
performance, as it only serves to take care of the integrity of data.

The initial measure we should take to improve the time
of queries is the creation of indexes for the tables

But what happens to this performance gain? When a table has no indexes, its records are
disorderly and a consultation will have to go through them all. If
if we add an index, a new table is generated. The amount
records of this new one is the same as the original one, the difference is
that they are organized.

/*

/* Create Index in a new table */

create table t1(
c1 int not null auto_increment,
c2 varchar(10),
c3 varchar(200),
c4 varchar(200),
c5 date,
c6 varchar(15),
c7 varchar(15),
primary key (c1),
index idx_t1(c2));

/* Create Index in a existing table */

alter table comclien add index idx_comclien_3(c_razaclien);

alter table comclien add index idx_comclien_4(c_codiclien);

show indexes from comclien;

/* When use */

/*

You should give preference to columns that we use to
search, ordering or grouping, in clauses: where,
joins, order by or group by.

*/

/* Won't use */

/*

f a column contains very different values ​​(for example,
the one that keeps the ages), an index will differentiate the records
quickly. However, it will not help with one that is used to
store gender (sex) records and contains only the values
M or F.

*/

/* Unique Index */

/*

MySQL also has other types of indexes. Another more
common is the unique index. As the name says, it is an index
that also serves to restrict duplication of data. To
create it in a column, you're telling the DBMS that it doesn't
can accept duplicate records there.

*/

alter table comvenda add unique index idx_comvenda_1(c_codivenda);

show indexes from comvenda;
