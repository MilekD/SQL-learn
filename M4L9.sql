----------1------------
create role user_training3 with login password 'asd';
grant connect on database postgres to user_training3;
grant create on database postgres to user_training3;
----------2------------
create schema trainingg authorization user_training3;
----------3------------
drop role user_training3;
----------4------------
reassign owned by user_training3 to postgres;  -- error: permission denied to reassign objects?
drop role user_training3;
----------5------------
create role reporting_ro;
grant connect on database postgres to reporting_ro;
grant usage on schema training to reporting_ro;
grant create on schema training to reporting_ro;
grant all privileges on all tables in schema training to reporting_ro;
----------6------------
create role reporting_user with login password 'dsa';
grant reporting_ro to reporting_user;
----------7------------
create table training.tabela;
----------8------------
revoke create on schema training from reporting_ro;
