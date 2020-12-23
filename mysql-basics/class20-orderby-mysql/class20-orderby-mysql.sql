/* The order by is used to ordinate the select */

select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne, comclien.c_nomeclien /* projection - table comvenda - comforne and comclien */
from comvenda /*source table comvenda */
inner join comforne /* junction table comforne */
on comvenda.n_numeforne = comforne.n_numeforne
inner join comclien /* junction table comclien */
on comvenda.n_numeclien = comclien.n_numeclien
order by c_nomeclien;

select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne, comclien.c_nomeclien /* projection - table comvenda - comforne and comclien */
from comvenda /*source table comvenda */
inner join comforne /* junction table comforne */
on comvenda.n_numeforne = comforne.n_numeforne
inner join comclien /* junction table comclien */
on comvenda.n_numeclien = comclien.n_numeclien
order by n_numevenda;

select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne, comclien.c_nomeclien /* projection - table comvenda - comforne and comclien */
from comvenda /*source table comvenda */
inner join comforne /* junction table comforne */
on comvenda.n_numeforne = comforne.n_numeforne
inner join comclien /* junction table comclien */
on comvenda.n_numeclien = comclien.n_numeclien
order by n_valovenda;

select comvenda.n_numevenda, comvenda.n_valovenda, comforne.c_nomeforne, comclien.c_nomeclien /* projection - table comvenda - comforne and comclien */
from comvenda /*source table comvenda */
inner join comforne /* junction table comforne */
on comvenda.n_numeforne = comforne.n_numeforne
inner join comclien /* junction table comclien */
on comvenda.n_numeclien = comclien.n_numeclien
order by c_nomeforne;