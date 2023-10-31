use mysql;
drop user rami@localhost;
select * from user;
create user rami@localhost identified by "111";
set password for youssef@localhost=PASSWORD("222");
rename user rami@localhost to youssef@localhost;
show grants for youssef@localhost;
revoke select
on lts.salarie
from youssef@localhost;