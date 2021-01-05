/* Round() */

/* This SQL function is used to round values */

select round('213.142',2) from dual;

/* format() */

/* This SQL function is used to format and round values */

select format('21123.142',2) from dual;

/* truncate() */

/* This SQL function is used to truncate values */

select truncate(max(n_totavenda),0) maior_venda from comvenda;

/* Sqrt() */

/* This SQL function is used to square root of values */

select sqrt(4);

/* Pi, Sin, Cos and tan */

select pi();

select sin(pi());

select cos(pi());

select tan(pi()+1);