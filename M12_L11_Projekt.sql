--1--

alter table users 
drop column password_salt

update users set user_password = crypt(user_password,gen_salt('md5')) 

select * from users


--2--

--a--
with show_info_about_fk as (
SELECT
    tc.table_schema, 
    tc.constraint_name, 
    tc.table_name, 
    kcu.column_name, 
    ccu.table_schema AS foreign_table_schema,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
      AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
      AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'         --zwraca informacje, ktore tabele maja klucz obcy
	),
 tables_with_fk as(
   select distinct(table_name) 
   from show_info_about_fk
   )                                -- kolumny z kluczem obcym bez dupliaktow
   select * from transactions     --nie wiem jak przy uzyciu basic sql brac po kolei kazda wartosc z query zwracajacego liste kolumn.
   where 
   -1 in ( select string_agg(c.column_name,',')
   from information_schema."columns" as c where table_schema='expense_tracker' and table_name= 'transactions')   -- nie dziala mi wyszukiwanie wsrod wszsytkich kolumn wartosci -1
   
   
   -- nie wiem jak iterowac przez tabele, prawdopodobnie potrzebne sa kursory i bardziej zaawansowany sql. 
   
   
   
   
   --b--
with cnt_col as(
  SELECT count(*) as count_columns
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE table_name = 'transactions'
),
cnt_row as(
 SELECT count(*) as count_rows from transactions t 
 ),
 total_rows_cols as(
 SELECT (cnt_col.count_columns*cnt_row.count_rows) as total from cnt_col,cnt_row
 ),
null_values as(
 SELECT
     SUM(
     (
     	(CASE WHEN id_user IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN id_transaction IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN id_trans_cat IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN id_trans_subcat IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN id_trans_type IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN transaction_date IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN transaction_value IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN transaction_description IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN insert_date IS NULL THEN 1 ELSE 0 end )+
     	(CASE WHEN update_date IS NULL THEN 1 ELSE 0 end )
     )
     	)
     as null_value_count      
from expense_tracker.transactions
 )
 
 SELECT cast(null_value_count as float)/cast(total as float)*100 as null_prcnt
 from null_values,total_rows_cols
 
 
 
 
3.

  -Korzysta z niej wiele rodzin / osób (czy trzymasz wszystko w jednym
    schemacie / czy schemat per użytkownik (rodzina) ?)

   - Myslę, ze moglbym wszytko trzymac w jednym schemacie, ze wzgledu na to, ze i tak odfiltrowuje dane dla konkretnej osoby w razie potrzeby.
   Wowczas nie musialbym za kazdym razem tworzyc tabel, dla pojedynczej osoby.
   
   - Jak zarządzasz użytkownikami i hasłami?
   
   Hasla szyfruje, pasword_salt generuje pry uzyciu algorytmu md5, usuwam kolumne user_password i password_salt z tabeli users.
   Uzytkownikow weryfikuje poprzez zwrocenie wartosci true dla przykladowego query:
   select user_pasword_secret = crypt(user_password,user_password_secret) 
   
   Jak wykorzystasz wnioski z poprzednich modułów (które tabele, klucze obce
  zostają / nie zostają, jak podejdziesz do wydajności itd.)
  
  - Tabele categories moge zlaczyc razem z subcategories. Dla zwiekszenia wydajnosci stosuje indeksy i partycjonowanie ze wzgledu na np. rok

   
