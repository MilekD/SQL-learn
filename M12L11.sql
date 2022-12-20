--1--
--chyba nie do konca zrozumialem polecenie--

select pt.schemaname, 
        pt.tablename,
        pt.tableowner, 
        pv.viewname,
        pv.viewowner,
        pi2.indexname 
from pg_catalog.pg_tables pt 
left join pg_catalog.pg_views pv on pt.schemaname = pv.schemaname 
left join pg_catalog.pg_indexes pi2 on pt.schemaname = pi2.schemaname 


--2--

--szyfrowanie
select crypt('ultraSilneHa3l0$567', gen_salt('md5'))
select encrypt('ultraSilneHa3l0$567'::bytea,gen_salt('md5')::bytea, 'aes' ),


--sprawdzanie
select user_password_secret= crypt('ultraSilneHa3l0$567',crypt('ultraSilneHa3l0$567', gen_salt('md5'))) as correct_password
from ...


--3--

DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers (
id SERIAL,
c_name TEXT,
c_mail TEXT,
c_phone VARCHAR(9),
c_description TEXT
);
INSERT INTO customers (c_name, c_mail, c_phone, c_description)
 VALUES ('Krzysztof Bury', 'kbur@domein.pl', '123789456',
left(md5(random()::text), 15)),
 ('Onufry Zagłoba', 'zagloba@ogniemimieczem.pl',
'100000001', left(md5(random()::text), 15)),
('Krzysztof Bury', 'kbur@domein.pl', '123789456',
left(md5(random()::text), 15)),
('Pan Wołodyjowski', 'p.wolodyj@polska.pl',
'987654321', left(md5(random()::text), 15)),
('Michał Skrzetuski', 'michal<at>zamek.pl',
'654987231', left(md5(random()::text), 15)),
('Bohun Tuhajbejowicz', NULL, NULL,
left(md5(random()::text), 15));

select * from customers

--a--
--dodanie tabeli numerujacej powtarzajace się rekordy
alter table customers 
add column rc int

-- update dodanej tabeli rc
update customers 
set rc = v_customers.rc
from (
	select row_number(*) over (partition by c_name) as rc,id
	from customers 
	) as v_customers 
where customers.id=v_customers.id

--usuniecie duplikatu
delete from customers where rc>1

--b--
with regex as (
select regexp_match(c_mail,'@(.*)$')  as match from customers 
)
select concat('X@',match[1]) as a from regex
where match is not null

--c--
select concat(repeat('X',length(c_phone)-3), substring(c_phone,length(c_phone)-2,length(c_phone))) from customers 
