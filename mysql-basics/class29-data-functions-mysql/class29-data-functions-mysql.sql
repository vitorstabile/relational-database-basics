/* The Data Format for MySQL YYYY-MM-DD */

/* Curdate() */

/* Return the local date */

 select curdate();
 
 /* now() and sysdate() */

/* Return the hour and local date */

select now();

select sysdate();

/* curtime() */

/* Return just the hour local */

select curtime();

/* datediff() */

/* The difference btwen two dates */

select datediff('2015-02-01 23:59:59','2015-01-01');

/* date_add() */

/* Add a date */

select date_add('2013-01-01', interval 31 day);

/* dayname() */

/* return the name of the date */

select dayname('2015-01-01');

/* dayname() */

/* return the day of the month */

select dayofmonth('2015-01-01');

/* extract() */

/* extract a year of a date */

select extract(year from '2015-01-01');

/* last_day() */

/* extract the last day of a month */

select last_day('2015-02-01');

/* Format a date */

/* date_format() */

select date_format('2015-01-10',get_format(date,'EUR'));

select str_to_date('01.01.2015',get_format(date,'USA'));