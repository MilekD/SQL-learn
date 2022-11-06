--1--
select
tc.category_name,
sum(t.transaction_value)
from expense_tracker.transactions t 
left join expense_tracker.transaction_category tc 
on t.id_trans_cat = tc.id_trans_cat 
group by tc.category_name,t.transaction_value 
;

--2--
select
tbaa.bank_account_name,
cat.category_name,
extract(year from t.transaction_date) as trans_year,
sum(t.transaction_value)
from expense_tracker.transactions t 
join (select * 
	  from
	  expense_tracker.transaction_category tc
	  where tc.category_name = 'UŻYWKI'
	  ) cat on cat.id_trans_cat=t.id_trans_cat 
join (select * 
	  from expense_tracker.transaction_bank_accounts tba
	  where tba.bank_account_name = 'ROR - Janusz'
	  ) tbaa on tbaa.id_trans_ba = t.id_trans_ba 
group by 1,2,3
having extract(year from t.transaction_date) = 2020
;

--3--
select 
	tt2.transaction_type_name,
	tba2.bank_account_name,
	extract(year from t.transaction_date) as rok,	  
	extract(year from t.transaction_date)||'_'||extract(quarter from t.transaction_date) as rok_kwartal,
	extract(year from t.transaction_date)||'_'||extract(month from t.transaction_date) as rok_miesiac,
	sum(t.transaction_value)
from expense_tracker.transactions t
join (select * from 
	  expense_tracker.transaction_type tt 
	  where tt.transaction_type_name = 'Obciążenie') tt2
on t.id_trans_type = tt2.id_trans_type 
join (select * 
	  from expense_tracker.transaction_bank_accounts tba
	  where tba.bank_account_name = 'ROR - Janusz i Grażynka'
	  ) tba2 
on t.id_trans_ba = tba2.id_trans_ba 
group by rollup ( (1),(2),(3),(4),(5))
having extract(year from t.transaction_date) = 2019 
;

--4--

--4--

with rok_sum as (
select 
	extract(year from t.transaction_date) as rok,
	sum(t.transaction_value) as suma
from expense_tracker.transactions t
join (select * from 
	expense_tracker.transaction_type tt 
	where tt.transaction_type_name = 'Obciążenie') tt2
on t.id_trans_type = tt2.id_trans_type 
join (select * 
	  from expense_tracker.transaction_bank_accounts tba
	  where tba.bank_account_name = 'ROR - Janusz i Grażynka'
	  ) tba2 
on t.id_trans_ba = tba2.id_trans_ba 
group by (1)
having extract(year from t.transaction_date) >= 2014
),
prev_y as (
select 
  *,
lag (suma) over (order by rok) as prev_year_sum
from rok_sum
) 
select 
 *,
 prev_year_sum - suma as increases_of_spend_yoy
from prev_y
;
