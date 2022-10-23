create role expense_tracker_user with login password 'zxc';
grant connect on database postgres to expense_tracker_user;
revoke create on schema public from PUBLIC;
drop schema if exists expense_tracker CASCADE;
create role expense_tracker_group;
create schema expense_tracker authorization expense_tracker_group;
grant connect on database postgres to expense_tracker_group;
grant all privileges on all tables in schema expense_tracker to expense_tracker_group;
grant expense_tracker_group to expense_tracker_user
	

drop table if exists expense_tracker.bank_account_owner cascade;
create table if not exists expense_tracker.bank_account_owner (
	id_ba_own int primary key,
	owner_name varchar(50) not null,
	owner_desc varchar(250),
	user_login int not null,
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp,
	);
	

drop table if exists expense_tracker.bank_account_types cascade;
create table if not exists expense_tracker.bank_account_types (
	id_ba_type int primary key,
	ba_type varchar(50) not null,
	ba_desc varchar(250),
	active boolean default 'True' not null,
	is_common_account boolean default 'False' not null,
	id_ba_own int,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp,
	foreign key (id_ba_own) references expense_tracker.bank_account_owner (id_ba_own)
	);

drop table if exists expense_tracker.transaction_bank_accounts cascade;	
create table if not exists expense_tracker.transaction_bank_accounts(
	id_trans_ba int primary key,
	id_ba_own int,
	id_ba_type int,
	bank_account_name varchar(50) not null,
	bank_account_desc varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp,
	foreign key (id_ba_own) references expense_tracker.bank_account_owner (id_ba_own),
	foreign key (id_ba_type) references expense_tracker.bank_account_types (id_ba_type)
	);


drop table if exists expense_tracker.transactions_category cascade;
create table if not exists expense_tracker.transaction_category(
	id_trans_cat int primary key,
	category_name varchar(50) not null,
	category_description varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

drop table if exists expense_tracker.transactions_subcategory cascade;
create table if not exists expense_tracker.transaction_subcategory(
	id_trans_subcat int primary key,
	id_trans_cat int,
	subcategory_name varchar(50) not null,
	subcategory_description varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp,
	foreign key (id_trans_cat) references expense_tracker.transaction_category (id_trans_cat)
	);

drop table if exists expense_tracker.transactions_type cascade;
create table if not exists expense_tracker.transaction_type(
	id_trans_type int primary key,
	transaction_type_name varchar(50),
	transaction_type_description varchar(250),
	active boolean default 'True' not null,
	insert_date timestamp default current_timestamp,
	update_date timestamp default current_timestamp
	);

drop table if exists expense_tracker.users cascade;
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

drop table if exists expense_tracker.transactions cascade;	
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
	update_date timestamp default current_timestamp,
	foreign key (id_trans_ba) references expense_tracker.transaction_bank_accounts (id_trans_ba),
	foreign key (id_trans_cat) references expense_tracker.transaction_category (id_trans_cat),
	foreign key (id_trans_subcat) references expense_tracker.transaction_subcategory (id_trans_subcat),
	foreign key (id_trans_type) references expense_tracker.transaction_type (id_trans_type),
	foreign key (id_user) references expense_tracker.users (id_user)
	);
