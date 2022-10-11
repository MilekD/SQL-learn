  create schema if not exists expense_tracker;

	--drop table if exists expense_tracker.bank_account_owner;

	create table if not exists expense_tracker.bank_account_owner (
	id_ba_own int primary key,
	owner_name varchar(50) not null,
	owner_desc varchar(250),
	user_login int not null,
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp
	);
	

	--drop table if exists expense_tracker.bank_account_types;

	create table if not exists expense_tracker.bank_account_types (
	id_ba_type int primary key,
	ba_type varchar(50) not null,
	ba_desc varchar(250),
	active boolean default 'True' not null,
	is_common_account boolean default 'False' not null,
	id_ba_own int,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

	--drop table if exists expense_tracker.transactions;
	
	create table if not exists expense_tracker.transactions (
	id_transaction int primary key,
	id_trans_ba int,
	id_trans_cat int,
	id_trans_subcat int,
	id_trans_type int,
	id_user int,
	transaction_date date default current_date,
	transaction_value numeric(9,2),
	transaction_description text,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

	--drop table if exists expense_tracker.transactions_bank_accounts;
	
	create table if not exists expense_tracker.transaction_bank_accounts(
	id_trans_ba int primary key,
	id_ba_own int,
	id_ba_type int,
	bank_account_name varchar(50),
	bank_account_desc varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

	--drop table if exists expense_tracker.transactions_category;

	create table if not exists expense_tracker.transaction_category(
	id_trans_cat int primary key,
	category_name varchar(50),
	category_description varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

	--drop table if exists expense_tracker.transactions_subcategory;

	create table if not exists expense_tracker.transaction_subcategory(
	id_trans_subcat int primary key,
	id_trans_cat int,
	subcategory_name varchar(50),
	subcategory_description varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

	--drop table if exists expense_tracker.transactions_type;

	create table if not exists expense_tracker.transaction_type(
	id_trans_type int primary key,
	transaction_type_name varchar(50),
	transaction_type_description varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

	--drop table if exists expense_tracker.users;

	create table if not exists expense_tracker.users(
	id_user int primary key,
	user_login varchar(25) not null,
	user_name varchar(50) not null,
	user_password varchar(100) not null,
	password_salt varchar(100) not null,
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);
