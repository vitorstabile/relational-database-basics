/* If we want a report with two tables or more, we have to use the clause join */

/* For join clause with two or more tables, we need to use selection, projection and junction */

/* We need to see the relational diagram. In the example below, we will make a join table with the comvenda table */

/* this table have his own primary key n_numevenda and two other foreign key n_numeforne from comforne and n_numeclien from comclien */

/* Three table example */

select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne, comclien.c_nomeclien /* projection - table comvenda - comforne and comclien */
from comvenda /*source table comvenda */
inner join comforne /* junction table comforne */
on comvenda.n_numeforne = comforne.n_numeforne
inner join comclien /* junction table comclien */
on comvenda.n_numeclien = comclien.n_numeclien;

/* Two table example */

select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne /* projection - table comvenda - comforne */
from comvenda /*source table comvenda */
inner join comforne /* junction table comforne */
on comvenda.n_numeforne = comforne.n_numeforne;