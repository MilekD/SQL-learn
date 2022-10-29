--1--
select count (distinct product_code) from products;
		
--2--
select case when
  Count(distinct product_code) = count(distinct product_name) then 'unikatowe' 
  else 'nieunikatowe'
  end 
from products p 

--3--
select product_name
from products p
where product_code in ('PRD1','PRD9');


--4--
select * 
from sales 
where sal_date between '08/01/2022' and '08/31/2022'
order by sal_value desc, sal_date asc ;
		
		
--5--
select *
from products p 
where not exists(
	select 1
	from sales s
	 where p.id = s.sal_product_id
	 );
		
--6--
select * 
from products p 
where p.id=ANY(
	select s.sal_product_id
	from sales s
	where s.sal_value>100
	);
		
		
--7--
			 
DROP TABLE IF EXISTS products_old_warehouse cascade;		
CREATE TABLE products_old_warehouse (
  id SERIAL,
  product_name VARCHAR(100),
  product_code VARCHAR(10),
  product_quantity NUMERIC(10,2),
  manufactured_date DATE,
  added_by TEXT DEFAULT 'admin',
  created_date TIMESTAMP DEFAULT now()
);		
		

INSERT INTO products_old_warehouse (product_name, product_code, product_quantity,
manufactured_date)
 SELECT 'Product '||floor(random() * 10 + 1)::int,
 'PRD'||floor(random() * 10 + 1)::int,
 random() * 10 + 1,
 CAST((NOW() - (random() * (interval '90 days')))::timestamp AS date)
 FROM generate_series(1, 5) s(i);
		
select * from products_old_warehouse	
		
		
--8--
select product_name,
	product_code
from   products 
union 
select product_name,
	product_code
from products_old_warehouse    --jak wziac 5 dowolnych wierszy z products?

--9--
select product_code
from products 
except 
select product_code
from products_old_warehouse
		

--10--
select * from sales
order by sal_value desc
limit 10;

--11--

select 
	substring(sal_description,1,3) 
from  sales 
limit 3 				

--12--
select *
from sales
where sal_description like 'c4c%'
