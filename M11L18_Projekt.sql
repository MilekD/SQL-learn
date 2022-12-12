explain analyze
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
having extract(year from t.transaction_date) = 2022
;

-- without index on transaction_category
Planning Time: 3.123 ms
Execution Time: 7.164 ms

CREATE INDEX idx_tcat_cat_name ON expense_tracker.transaction_category (category_name);

-- with index on transaction_category
Planning Time: 1.020 ms
Execution Time: 2.348 ms

CREATE INDEX idx_tba_acc_name ON expense_tracker.transaction_bank_accounts (bank_account_name);
-- with index on transaction_bank_accounts
Planning Time: 3.330 ms
Execution Time: 1.712 ms



CREATE INDEX idx_trans_year ON expense_tracker.transactions (extract(year from transaction_date));
-- with transactions (extract(year from transaction_date))
Planning Time: 0.181 ms
Execution Time: 1.522 ms

-------------

CREATE TABLE IF NOT EXISTS EXPENSE_TRACKER.TRANSACTIONS_PARTITIONED (
 ID_TRANSACTION serial,
 ID_TRANS_BA integer REFERENCES EXPENSE_TRACKER.TRANSACTION_BANK_ACCOUNTS (ID_TRANS_BA),
 ID_TRANS_CAT integer REFERENCES EXPENSE_TRACKER.TRANSACTION_CATEGORY (ID_TRANS_CAT),
 ID_TRANS_SUBCAT integer REFERENCES EXPENSE_TRACKER.TRANSACTION_SUBCATEGORY (ID_TRANS_SUBCAT),
 ID_TRANS_TYPE integer REFERENCES EXPENSE_TRACKER.TRANSACTION_TYPE (ID_TRANS_TYPE),
 ID_USER integer REFERENCES EXPENSE_TRACKER.USERS (ID_USER),
 TRANSACTION_DATE date default current_date,
 TRANSACTION_VALUE numeric(9,2),
 TRANSACTION_DESCRIPTION text,
 INSERT_DATE timestamp default current_timestamp,
 UPDATE_DATE timestamp default current_timestamp,
 PRIMARY KEY (ID_TRANSACTION, TRANSACTION_DATE)
) PARTITION BY RANGE(TRANSACTION_DATE);



CREATE TABLE transactions_y2015 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2015-01-01') TO ('2016-01-01');
 
CREATE TABLE transactions_y2016 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2016-01-01') TO ('2017-01-01');

CREATE TABLE transactions_y2017 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2017-01-01') TO ('2018-01-01');
CREATE TABLE transactions_y2018 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2018-01-01') TO ('2019-01-01');
CREATE TABLE transactions_y2019 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2019-01-01') TO ('2020-01-01');

CREATE TABLE transactions_y2020 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE transactions_y2021 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

CREATE TABLE transactions_y2022 PARTITION OF TRANSACTIONS_PARTITIONED
 FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
 

select * from transactions_y2020;

DROP TABLE IF EXISTS transactions CASCADE;

ALTER TABLE IF exists transactions_partitioned RENAME TO transactions;


-- after partitioning 
Planning Time: 0.311 ms
Execution Time: 0.073 ms
