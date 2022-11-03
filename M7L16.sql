DROP TABLE IF EXISTS products, sales, product_manufactured_region CASCADE;

CREATE TABLE products (
	id SERIAL,
	product_name VARCHAR(100),
	product_code VARCHAR(10),
	product_quantity NUMERIC(10,2),	
	manufactured_date DATE,
	product_man_region INTEGER,
	added_by TEXT DEFAULT 'admin',
	created_date TIMESTAMP DEFAULT now()
);

CREATE TABLE sales (
	id SERIAL,
	sal_description TEXT,
	sal_date DATE,
	sal_value NUMERIC(10,2),
	sal_prd_id INTEGER,
	added_by TEXT DEFAULT 'admin',
	created_date TIMESTAMP DEFAULT now()
);

CREATE TABLE product_manufactured_region (
	id SERIAL,
	region_name VARCHAR(25),
	region_code VARCHAR(10),
	established_year INTEGER
);

INSERT INTO product_manufactured_region (region_name, region_code, established_year)
	  VALUES ('EMEA', 'E_EMEA', 2010),
	  		 ('EMEA', 'W_EMEA', 2012),
	  		 ('APAC', NULL, 2019),
	  		 ('North America', NULL, 2012),
	  		 ('Africa', NULL, 2012);

INSERT INTO products (product_name, product_code, product_quantity, manufactured_date, product_man_region)
     SELECT 'Product '||floor(random() * 10 + 1)::int,
            'PRD'||floor(random() * 10 + 1)::int,
            random() * 10 + 1,
            CAST((NOW() - (random() * (interval '90 days')))::timestamp AS date),
            CEIL(random()*(10-5))::int
       FROM generate_series(1, 10) s(i);  
      
INSERT INTO sales (sal_description, sal_date, sal_value, sal_prd_id)
     SELECT left(md5(i::text), 15),
     		CAST((NOW() - (random() * (interval '60 days'))) AS DATE),	
     		random() * 100 + 1,
        	floor(random() * 10)+1::int            
       FROM generate_series(1, 10000) s(i);   


      

--1---
select *
from sales s 
join products p
on s.sal_prd_id=p.id
where p.product_name in(select
				p.product_name 
				from products p
				join product_manufactured_region pr
				on p.product_man_region=pr.id
				where pr.region_name = 'EMEA')
limit 100
;

--2--
select p.*,
	   pr.region_name
from products p 
left join product_manufactured_region pr
on p.product_man_region=pr.id and pr.established_year>2012
;

--3--
select p.*,
pr.region_name
from products p 
left join product_manufactured_region pr
on p.product_man_region=pr.id
where pr.established_year>2012
;

--4--

select distinct(pr.product_name),
	   extract(year from s.sal_date) ||'_'|| extract(month from s.sal_date) as ROK_MIESIAC
from sales s 
right join (select p.id, p.product_quantity,p.product_name  
			from products p 
			where p.product_quantity>5) pr 
			on s.sal_prd_id=pr.id
order by 1 desc
;

--5--
insert into product_manufactured_region (region_name,region_code,established_year)
values ('South America',null,2013)
;
select p.*,
pr.*
from products p
full join product_manufactured_region pr
on p.product_man_region=pr.id
;

--6--
select p.*,
pr.*
from products p
left join product_manufactured_region pr
on p.product_man_region=pr.id
union
select p.*,
pr.*
from products p
right join product_manufactured_region pr
on p.product_man_region=pr.id
;

--7--
with subquery as (
	select p.id, p.product_quantity,p.product_name  
			from products p 
			where p.product_quantity>5 
) 
select distinct(su.product_name),
	   extract(year from s.sal_date) ||'_'|| extract(month from s.sal_date) as ROK_MIESIAC
from sales s 
right join subquery su
on s.sal_prd_id=su.id
order by 1 desc
;

--8--
delete from products p
where exists (select
				*
				from products p2
				left join product_manufactured_region pr
				on p2.product_man_region=pr.id
				where pr.region_name = 'EMEA' 
				and pr.region_code ='E_EMEA')
returning *                                   --- to query usuwa wszystkie rekordy. Czy nie lepiej zamist exists uzyc ...where p.id in (select p2.id...)?
 ;

--9--

with recursive fib(n,m) as(
	select 0,1
	union all
	select fib.m,fib.n+m
	from fib
	where n<100
) select n from fib
;
