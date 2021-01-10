/*

We created a procedure to do the processing of
commissions. However, performing this processing may result in a
very boring activity. We can schedule events to do so
automatically and periodically. For this, we use the event
scheduler.

*/

/* 


Let's program the procedure
processa_comissionamento to run once a week.
Therefore, we will use on schedule every 1 week, which will
run the first time on '2015-03-01' at 23:00 hours.
First, we must enable the event_scheduler in our
DBMS, because, by default, it is disabled. Open the prompt and
type the command:

*/

set global event_scheduler = on;

delimiter $$
create event processa_comissao
on schedule every 1 week starts '2015-03-01 23:38:00'
do
	begin
	call processa_comissionamento(current_date() - interval 7 day, current_date(), @a );
	end
$$
delimiter ;

/* disable event */

alter event processa_comissao_event disable;

/* enable event */

alter event processa_comissao_event enable;
