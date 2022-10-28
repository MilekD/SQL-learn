drop schema if exists dml_exercises cascade;

create schema dml_exercises;

create table dml_exercises.sales (
	id serial,
	sales_date timestamp not null,
	sales_amount numeric(38,2),
	sales_qty numeric(10,2),
	added_by text default 'admin',
	constraint sales_less_1k check (sales_amount<=1000)
);

insert into dml_exercises.sales(sales_date,sales_amount,sales_qty)
values('2015-01-10 00:51:14',5,2), 
       ('2025-11-10 10:41:14',3.5,20);


insert into dml_exercises.sales(sales_date,sales_amount,sales_qty,added_by)
values('2025-10-10 09:19:14',15,20,NULL);


insert into dml_exercises.sales(sales_date,sales_amount,sales_qty)
values('2025-10-10 09:19:14',1501,20);


INSERT INTO dml_exercises.sales (sales_date, sales_amount,sales_qty, added_by)
 VALUES ('20/11/2019', 101, 50, NULL);                                                  --date/time field value out of range: "20/11/2019"

show datestyle; -- dlaczego u mnie zwraca ISO,MDY , a u Ciebie na filmie zwracalo ISO,DMY ?

INSERT INTO dml_exercises.sales (sales_date, sales_amount,sales_qty, added_by)
 VALUES ('04/04/2020', 101, 50, NULL);


INSERT INTO dml_exercises.sales (sales_date, sales_amount, sales_qty,added_by)
 SELECT NOW() + (random() * (interval '90 days')) + '30 days',
 random() * 500 + 1,
 random() * 100 + 1,
 NULL
 FROM generate_series(1, 2000) s(i);                        -- czy s(i) jest potrzebne?
 
update dml_exercises.sales
set added_by = 'sales_over_200'
where sales_amount>= 200;

delete from dml_exercises.sales where added_by is null;

truncate dml_exercises.sales restart identity;
