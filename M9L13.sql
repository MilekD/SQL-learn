--1--

create or replace view emea_2020 as (  
select 
  p.product_name,
  p.product_code,
  s.*
from products p
join sales s on s.sal_prd_id= p.id
             and extract(year from s.sal_date)||'_'||extract(quarter from s.sal_date) = '2022_4'
join product_manufactured_region pmr on pmr.id = p.product_man_region 
where pmr.region_name = 'EMEA'
);


--2--

drop view emea_2020 

create materialized view emea_2020 as(
  select 
    row_number() over (order by p.product_name,p.product_code,sal_date) as id_index,
    p.product_name,
    p.product_code,
    sum(s.sal_value) over (partition by p.product_code order by s.sal_date) as suma ,
    s.*
  from products p
  join sales s on s.sal_prd_id= p.id
              and extract(year from s.sal_date)||'_'||extract(quarter from s.sal_date) = '2022_4'
  join product_manufactured_region pmr on pmr.id = p.product_man_region 
  where pmr.region_name = 'EMEA'
)
;

create unique index sal_idx on emea_2020(id_index);

refresh materialized view concurrently emea_2020 ;


--3--

select p.product_code,
  pmr.region_name,
  array_agg(p.product_name) as prod_tab
from products p
left join product_manufactured_region pmr on pmr.id=p.product_man_region 
group by p.product_code,pmr.region_name
;


--4--

create table if not exists tab_from_3 as
(
  with a as (
    select p.product_code,
      pmr.region_name,
      array_agg(p.product_name) as prod_tab
    from products p
    left join product_manufactured_region pmr on pmr.id=p.product_man_region 
    group by p.product_code,pmr.region_name
    )
  select *,
    case 
	    when prod_tab[2] is null then false
	    else true
	    end as more_than_1
  from a
)

select * from tab_from_3 
;


--5--

CREATE TABLE sales_archive (
	id serial,
	sal_description text,
	sal_date date,
	sal_value numeric(10, 2),
	sal_prd_id integer,
	added_by text DEFAULT 'admin',
	operation_type varchar(1) not null,
	archived_at timestamp default now()
);


--6--

create function archive_function()
	returns trigger
	language plpgsql
	as $$
		begin 
			if(TG_OP='DELETE') then
			  insert into sales_archive (operation_type,sal_description,sal_date,sal_value,sal_prd_id,added_by)
			  values ('D', old.sal_description,old.sal_date,old.sal_value,old.sal_prd_id,old.added_by);
			elsif (tg_op='UPDATE') then
				insert into sales_archive (operation_type,sal_description,sal_date,sal_value,sal_prd_id,added_by)
			  	values ('U', old.sal_description,old.sal_date,old.sal_value,old.sal_prd_id,old.added_by);
		end if;
	return null;
	end;
	$$;


create trigger sal_archive_trigger
	after delete or update 
	on sales
	for each row 
	execute procedure archive_function();


delete  
from sales s
where extract (year from s.sal_date)||'_'||extract(month from s.sal_date) = '2022_10'
returning *;

select * from sales_archive;
