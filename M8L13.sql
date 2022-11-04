--1--
select 
pmr.region_name,
avg(product_quantity) 
from products p 
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
group by pmr.region_name
order by 2 desc
;

--2--
select 
pmr.region_name, 
string_agg(p.product_name,',' order by p.product_name) as prod_list
from products p 
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
group by 
pmr.region_name 
;
--3--

select 
pmr.region_name,
p.product_name, 
count(s.sal_prd_id)
from sales s 
left join products p 
on s.sal_prd_id = p.id 
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
group by 1,2
having pmr.region_name = 'EMEA'
;

-- Ponizej wydajniejsze o 1ms, czy da sie to napsiac jeszcze wydajniej?


select 
pmr2.region_name,
p.product_name, 
count(s.sal_prd_id)
from sales s 
left join products p 
on s.sal_prd_id = p.id 
join (select * from
		product_manufactured_region pmr 
		where pmr.region_name='EMEA')pmr2 on p.product_man_region=pmr2.id	
group by 1,2
;

--4--
with ab as(
select s.sal_value,
extract (year from s.sal_date) ||'-'||extract (month from s.sal_date)  as rok_miesiac
from sales s 
)
select 
rok_miesiac,
sum(sal_value) as suma
from ab
group by rok_miesiac
order by suma desc
;

-- Dlaczego takie zapytanie jak pozniej nie zwraca oczekiwanych rezultatow?

with ab as(
select s.sal_value,
extract (year from s.sal_date) ||'-'||extract (month from s.sal_date)  as rok_miesiac
from sales s 
)
select 
sal_value,
rok_miesiac,
sum(sal_value) over (partition by rok_miesiac)
from ab
;

--5--
select 
	coalesce(extract(year from p.manufactured_date),2022) as manufactured_year,
	pmr.region_name,
	p.product_code,
grouping (coalesce(extract(year from p.manufactured_date),2022),pmr.region_name,p.product_code ),
avg(product_quantity)
from products p 
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
group by grouping sets (
	(coalesce(extract(year from p.manufactured_date),2022)),
	(pmr.region_name),
	(p.product_code)				
	)
;

--6--

select 
	p.product_name,
	p.product_code,
	p.manufactured_date,
	p.product_man_region,
	pmr.region_name,
	sum (p.product_quantity) over (partition by pmr.region_name)
from products p 
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
;

--7--
with tab as(
select 
	p.product_name,
	p.product_code,
	p.manufactured_date,
	p.product_man_region,
	pmr.region_name,
	sum (p.product_quantity) over (partition by pmr.region_name) as sum
from products p 
left join product_manufactured_region pmr 
on p.product_man_region = pmr.id
)
select *
from (select 
	product_name,
	region_name,
	dense_rank () over (order by sum desc) as drank
	from tab) ab
where ab.drank=2
;
