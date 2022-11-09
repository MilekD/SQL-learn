--1--

create view Janusz as(
  select 
   t.transaction_date, 
    extract(year from t.transaction_date) as trans_year,
    t.transaction_value,
    tc.category_name,
    ts.subcategory_name,
    tt.transaction_type_name,
    bat.ba_type
  from expense_tracker.transactions t 
  join expense_tracker.transaction_bank_accounts tba on tba.id_trans_ba = t.id_trans_ba
  join expense_tracker.bank_account_owner bao on tba.id_ba_own= bao.id_ba_own and bao.owner_name='Janusz Kowalski'
  join expense_tracker.bank_account_types bat on bat.id_ba_type = tba.id_ba_typ
  join expense_tracker.transaction_category tc on tc.id_trans_cat=t.id_trans_cat
  join expense_tracker.transaction_subcategory ts on ts.id_trans_subcat=t.id_trans_subcat 
  join expense_tracker.transaction_type tt on tt.id_trans_type = t.id_trans_type
)
;


create view Grazyna as(
  select 
    t.transaction_date, 
    extract(year from t.transaction_date) as trans_year,
    t.transaction_value,
    tc.category_name,
    ts.subcategory_name,
    tt.transaction_type_name,
    bat.ba_type
  from expense_tracker.transactions t 
  join expense_tracker.transaction_bank_accounts tba on tba.id_trans_ba = t.id_trans_ba
  join expense_tracker.bank_account_owner bao on tba.id_ba_own= bao.id_ba_own and bao.owner_name='Grażyna Kowalska'
  join expense_tracker.bank_account_types bat on bat.id_ba_type = tba.id_ba_typ
  join expense_tracker.transaction_category tc on tc.id_trans_cat=t.id_trans_cat
  join expense_tracker.transaction_subcategory ts on ts.id_trans_subcat=t.id_trans_subcat 
  join expense_tracker.transaction_type tt on tt.id_trans_type = t.id_trans_type
 )
;


create view Janusz_Grazynka as(
  select 
    t.transaction_date, 
    extract(year from t.transaction_date) as trans_year,
    t.transaction_value,
    tc.category_name,
    ts.subcategory_name,
    tt.transaction_type_name,
    bat.ba_type
  from expense_tracker.transactions t 
  join expense_tracker.transaction_bank_accounts tba on tba.id_trans_ba = t.id_trans_ba
  join expense_tracker.bank_account_owner bao on tba.id_ba_own= bao.id_ba_own and bao.owner_name='Janusz i Grażynka'
  join expense_tracker.bank_account_types bat on bat.id_ba_type = tba.id_ba_typ
  join expense_tracker.transaction_category tc on tc.id_trans_cat=t.id_trans_cat
  join expense_tracker.transaction_subcategory ts on ts.id_trans_subcat=t.id_trans_subcat 
  join expense_tracker.transaction_type tt on tt.id_trans_type = t.id_trans_type
)
;


--2--

select trans_year,
  transaction_type_name,
  category_name,
  array_agg(distinct subcategory_name) as subcategories_name,
  sum(transaction_value) as suma
from janusz_grazynka
group by trans_year,transaction_type_name,category_name

--3--

create table monthly_budget_planned(
	year_month varchar(7) primary key,
	budget_planned numeric (10,2),
	left_budget numeric (10,2)
	);


insert into expense_tracker.monthly_budget_planned
values ('2022_11',8000,8000);

--4--

create function left_bud()
	returns trigger
	language plpgsql
	as $$
		begin
			if(TG_OP='INSERT') then
			update expense_tracker.monthly_budget_planned
			set left_budget= left_budget+new.transaction_value
			where "year_month"='2022_11';
		elsif (TG_OP='DELETE') then
			update expense_tracker.monthly_budget_planned
			set left_budget= left_budget+old.transaction_value
			where "year_month"='2022_11';	
		elsif (TG_OP='UPDATE') then
			update expense_tracker.monthly_budget_planned
			set left_budget= left_budget+new.transaction_value
			where "year_month"='2022_11';
			
			end if;
		return null;
		end ;
	$$;


create trigger left_bud_trig
	after insert or update or delete
	on expense_tracker.transactions
	for each row 
	execute procedure left_bud()
	
--5--	
	
INSERT INTO expense_tracker.transactions
(id_transaction, id_trans_ba, id_trans_cat, id_trans_subcat, id_trans_type, id_user, transaction_date, transaction_value, transaction_description, insert_date, update_date)
VALUES(123456, 6, 10, 51, 4, NULL, '2022-11-09', 1000.00, 'a718', '2022-11-09 19:03:03.866', '2020-11-09 19:03:03.866');


update expense_tracker.transactions
set transaction_value= 1510
where id_transaction = 123456;


delete from expense_tracker.transactions where id_transaction = 123456;
	
select * from expense_tracker.monthly_budget_planned;

--6--

-data wstawiana do transactions nie ma zadnego powiazania z data, ktora dotyczy tabeli Monthly_budget_planned
wiec daty z kolejnych miesiecy rowniez beda zmienialy wartosc kolumny left_budget.

-brakuje constrainta sprawdzajacego czy planowany budzet zostal przekroczony?
