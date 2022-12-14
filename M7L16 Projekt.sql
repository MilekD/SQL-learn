

-----------QUERIES AT THE BOTTOM--------------

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: expense_tracker; Type: SCHEMA; Schema: -; Owner: expense_tracker_group
--

CREATE SCHEMA expense_tracker;


ALTER SCHEMA expense_tracker OWNER TO expense_tracker_group;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bank_account_owner; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.bank_account_owner (
    id_ba_own integer NOT NULL,
    owner_name character varying(50) NOT NULL,
    owner_desc character varying(250),
    user_login integer NOT NULL,
    active character(1) DEFAULT 1 NOT NULL,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.bank_account_owner OWNER TO expense_tracker_group;

--
-- Name: bank_account_owner_id_ba_own_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.bank_account_owner_id_ba_own_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.bank_account_owner_id_ba_own_seq OWNER TO expense_tracker_group;

--
-- Name: bank_account_owner_id_ba_own_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.bank_account_owner_id_ba_own_seq OWNED BY expense_tracker.bank_account_owner.id_ba_own;


--
-- Name: bank_account_types; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.bank_account_types (
    id_ba_type integer NOT NULL,
    ba_type character varying(50) NOT NULL,
    ba_desc character varying(250),
    active character(1) DEFAULT 1 NOT NULL,
    is_common_account character(1) DEFAULT 0 NOT NULL,
    id_ba_own integer,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.bank_account_types OWNER TO expense_tracker_group;

--
-- Name: bank_account_types_id_ba_type_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.bank_account_types_id_ba_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.bank_account_types_id_ba_type_seq OWNER TO expense_tracker_group;

--
-- Name: bank_account_types_id_ba_type_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.bank_account_types_id_ba_type_seq OWNED BY expense_tracker.bank_account_types.id_ba_type;


--
-- Name: transaction_bank_accounts; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.transaction_bank_accounts (
    id_trans_ba integer NOT NULL,
    id_ba_own integer,
    id_ba_typ integer,
    bank_account_name character varying(50) NOT NULL,
    bank_account_desc character varying(250),
    active character(1) DEFAULT 1 NOT NULL,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.transaction_bank_accounts OWNER TO expense_tracker_group;

--
-- Name: transaction_bank_accounts_id_trans_ba_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.transaction_bank_accounts_id_trans_ba_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.transaction_bank_accounts_id_trans_ba_seq OWNER TO expense_tracker_group;

--
-- Name: transaction_bank_accounts_id_trans_ba_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.transaction_bank_accounts_id_trans_ba_seq OWNED BY expense_tracker.transaction_bank_accounts.id_trans_ba;


--
-- Name: transaction_category; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.transaction_category (
    id_trans_cat integer NOT NULL,
    category_name character varying(50) NOT NULL,
    category_description character varying(250),
    active character(1) DEFAULT 1 NOT NULL,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.transaction_category OWNER TO expense_tracker_group;

--
-- Name: transaction_category_id_trans_cat_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.transaction_category_id_trans_cat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.transaction_category_id_trans_cat_seq OWNER TO expense_tracker_group;

--
-- Name: transaction_category_id_trans_cat_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.transaction_category_id_trans_cat_seq OWNED BY expense_tracker.transaction_category.id_trans_cat;


--
-- Name: transaction_subcategory; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.transaction_subcategory (
    id_trans_subcat integer NOT NULL,
    id_trans_cat integer,
    subcategory_name character varying(50) NOT NULL,
    subcategory_description character varying(250),
    active character(1) DEFAULT 1 NOT NULL,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.transaction_subcategory OWNER TO expense_tracker_group;

--
-- Name: transaction_subcategory_id_trans_subcat_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.transaction_subcategory_id_trans_subcat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.transaction_subcategory_id_trans_subcat_seq OWNER TO expense_tracker_group;

--
-- Name: transaction_subcategory_id_trans_subcat_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.transaction_subcategory_id_trans_subcat_seq OWNED BY expense_tracker.transaction_subcategory.id_trans_subcat;


--
-- Name: transaction_type; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.transaction_type (
    id_trans_type integer NOT NULL,
    transaction_type_name character varying(50) NOT NULL,
    transaction_type_desc character varying(250),
    active character(1) DEFAULT 1 NOT NULL,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.transaction_type OWNER TO expense_tracker_group;

--
-- Name: transaction_type_id_trans_type_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.transaction_type_id_trans_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.transaction_type_id_trans_type_seq OWNER TO expense_tracker_group;

--
-- Name: transaction_type_id_trans_type_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.transaction_type_id_trans_type_seq OWNED BY expense_tracker.transaction_type.id_trans_type;


--
-- Name: transactions; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.transactions (
    id_transaction integer NOT NULL,
    id_trans_ba integer,
    id_trans_cat integer,
    id_trans_subcat integer,
    id_trans_type integer,
    id_user integer,
    transaction_date date DEFAULT CURRENT_DATE,
    transaction_value numeric(9,2),
    transaction_description text,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.transactions OWNER TO expense_tracker_group;

--
-- Name: transactions_id_transaction_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.transactions_id_transaction_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.transactions_id_transaction_seq OWNER TO expense_tracker_group;

--
-- Name: transactions_id_transaction_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.transactions_id_transaction_seq OWNED BY expense_tracker.transactions.id_transaction;


--
-- Name: users; Type: TABLE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE TABLE expense_tracker.users (
    id_user integer NOT NULL,
    user_login character varying(25) NOT NULL,
    user_name character varying(50) NOT NULL,
    user_password character varying(100) NOT NULL,
    password_salt character varying(100) NOT NULL,
    active character(1) DEFAULT 1 NOT NULL,
    insert_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE expense_tracker.users OWNER TO expense_tracker_group;

--
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: expense_tracker; Owner: expense_tracker_group
--

CREATE SEQUENCE expense_tracker.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expense_tracker.users_id_user_seq OWNER TO expense_tracker_group;

--
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER SEQUENCE expense_tracker.users_id_user_seq OWNED BY expense_tracker.users.id_user;


--
-- Name: bank_account_owner id_ba_own; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.bank_account_owner ALTER COLUMN id_ba_own SET DEFAULT nextval('expense_tracker.bank_account_owner_id_ba_own_seq'::regclass);


--
-- Name: bank_account_types id_ba_type; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.bank_account_types ALTER COLUMN id_ba_type SET DEFAULT nextval('expense_tracker.bank_account_types_id_ba_type_seq'::regclass);


--
-- Name: transaction_bank_accounts id_trans_ba; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_bank_accounts ALTER COLUMN id_trans_ba SET DEFAULT nextval('expense_tracker.transaction_bank_accounts_id_trans_ba_seq'::regclass);


--
-- Name: transaction_category id_trans_cat; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_category ALTER COLUMN id_trans_cat SET DEFAULT nextval('expense_tracker.transaction_category_id_trans_cat_seq'::regclass);


--
-- Name: transaction_subcategory id_trans_subcat; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_subcategory ALTER COLUMN id_trans_subcat SET DEFAULT nextval('expense_tracker.transaction_subcategory_id_trans_subcat_seq'::regclass);


--
-- Name: transaction_type id_trans_type; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_type ALTER COLUMN id_trans_type SET DEFAULT nextval('expense_tracker.transaction_type_id_trans_type_seq'::regclass);


--
-- Name: transactions id_transaction; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions ALTER COLUMN id_transaction SET DEFAULT nextval('expense_tracker.transactions_id_transaction_seq'::regclass);


--
-- Name: users id_user; Type: DEFAULT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.users ALTER COLUMN id_user SET DEFAULT nextval('expense_tracker.users_id_user_seq'::regclass);


--
-- Data for Name: bank_account_owner; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.bank_account_owner (id_ba_own, owner_name, owner_desc, user_login, active, insert_date, update_date) FROM stdin;
1	Janusz Kowalski	Pan Janusz - G??owa Rodziny	1	1	2020-10-29 19:02:16.665897	2020-10-29 19:02:16.665897
2	Gra??yna Kowalska	Pani Gra??yna - Szyja Rodziny	2	1	2020-10-29 19:02:16.665897	2020-10-29 19:02:16.665897
3	Janusz i Gra??ynka	Pan Janusz i Gra??ynka w??a??ciciele.	2	1	2020-10-29 19:02:16.665897	2020-10-29 19:02:16.665897
\.


--
-- Data for Name: bank_account_types; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.bank_account_types (id_ba_type, ba_type, ba_desc, active, is_common_account, id_ba_own, insert_date, update_date) FROM stdin;
-1	<unknown>	<unknown>	1	0	\N	2020-10-29 19:02:19.168893	2020-10-29 19:02:19.168893
1	ROR	Rachunek oszcz??dno??ciowo rozliczeniowy.	1	0	1	2020-10-29 19:02:20.738772	2020-10-29 19:02:20.738772
2	ROR	Rachunek oszcz??dno??ciowo rozliczeniowy.	1	0	2	2020-10-29 19:02:20.738772	2020-10-29 19:02:20.738772
3	OSZCZ	Rachunek oszcz??dno??ciowy.	1	0	1	2020-10-29 19:02:20.738772	2020-10-29 19:02:20.738772
4	OSZCZ	Rachunek oszcz??dno??ciowy.	1	0	2	2020-10-29 19:02:20.738772	2020-10-29 19:02:20.738772
5	ROR - WSP??LNY	Rachunek oszcz??dno??ciowo rozliczeniowy wsp??lny.	1	1	3	2020-10-29 19:02:20.738772	2020-10-29 19:02:20.738772
6	OSZCZ - WSP??LNY	Rachunek oszcz??dno??ciowy wsp??lny.	1	1	3	2020-10-29 19:02:20.738772	2020-10-29 19:02:20.738772
\.


--
-- Data for Name: transaction_bank_accounts; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.transaction_bank_accounts (id_trans_ba, id_ba_own, id_ba_typ, bank_account_name, bank_account_desc, active, insert_date, update_date) FROM stdin;
-1	\N	\N	<unknown>	<unknown>	1	2020-10-29 19:02:25.298067	2020-10-29 19:02:25.298067
1	1	1	ROR - Janusz	ROR Janusza.	1	2020-10-29 19:02:26.782809	2020-10-29 19:02:26.782809
2	2	2	ROR - Gra??yna	ROR Gra??ynki	1	2020-10-29 19:02:26.782809	2020-10-29 19:02:26.782809
3	1	3	OSZCZ - Janusz	Oszcz??dno??ciowe konto Janusza.	1	2020-10-29 19:02:26.782809	2020-10-29 19:02:26.782809
4	2	4	OSZCZ - Gra??yna	Oszcz??dno??ciowe konto Gra??ynki.	1	2020-10-29 19:02:26.782809	2020-10-29 19:02:26.782809
5	3	5	ROR - Janusz i Gra??ynka	ROR Janusza i Gra??ynki	1	2020-10-29 19:02:26.782809	2020-10-29 19:02:26.782809
6	3	6	OSZCZ - Janusz i Gra??ynka	Oszcz??dno??ciowe konto Janusza i Gra??ynki	1	2020-10-29 19:02:26.782809	2020-10-29 19:02:26.782809
\.


--
-- Data for Name: transaction_category; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.transaction_category (id_trans_cat, category_name, category_description, active, insert_date, update_date) FROM stdin;
-1	<unknown>	<unknown>	1	2020-10-29 19:02:33.654006	2020-10-29 19:02:33.654006
1	JEDZENIE	Kategoria zwi??zana z zakupami spo??ywczymi i jedzeniem	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
2	PRZYCH??D	Kategoria dotycz??ca przychod??w w bud??ecie.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
3	U??YWKI	Alkohol, Papierosy.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
4	OP??ATY_RACHUNKI	Op??aty og??lne - pr??d, gaz, woda itd.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
5	ZDROWIE_CHEMIA	Wszystko zwi??zane z og??lnie poj??tym zdrowie i chemi?? domow??.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
6	UBRANIE	Kategoria zwi??zana z ubiorem.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
7	RELAKS	Kategoria zwi??zana z og??lnym relaksem - wakacje, kino, teatr itp.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
8	TRANSPORT	Samoch??d, taxi, komunikacja publiczna.	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
9	INNE_WYDATKI	Kategoria zwi??zana z zakupami spo??ywczymi i jedzeniem	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
10	OSZCZ??DNO??CI	Kategoria zwi??zana z zakupami spo??ywczymi i jedzeniem	1	2020-10-29 19:02:36.161919	2020-10-29 19:02:36.161919
\.


--
-- Data for Name: transaction_subcategory; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.transaction_subcategory (id_trans_subcat, id_trans_cat, subcategory_name, subcategory_description, active, insert_date, update_date) FROM stdin;
-1	\N	<unknown>	<unknown>	1	2020-10-29 19:02:39.132933	2020-10-29 19:02:39.132933
1	2	Wynagrodzenie	Wynagrodzenie	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
2	2	Zwroty	Zwroty	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
3	2	Wp??ata	Wp??ata	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
4	1	Junk Food	Junk Food	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
5	1	Zakupy spo??ywcze	Zakupy spo??ywcze	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
6	1	Jedzenie Miasto	Jedzenie Miasto	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
7	1	Jedzenie Praca	Jedzenie Praca	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
8	1	S??odycze	S??odycze	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
9	3	Alkohol	Alkohol	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
10	4	Czynsz	Czynsz	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
11	4	Gaz	Gaz	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
12	4	Pr??d	Pr??d	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
13	4	Internet i TV	Internet i TV	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
14	4	Ubezpieczenie	Ubezpieczenie	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
15	4	Telefon	Telefon	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
16	4	PIT podatek	PIT podatek	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
17	4	????obek/Przedszkole	????obek/Przedszkole	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
18	5	Kosmetyki	Kosmetyki	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
19	5	Lekarz	Lekarz	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
20	5	Apteka	Apteka	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
21	5	Szpital	Szpital	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
22	5	Fryzjer	Fryzjer	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
23	5	Chemia	Chemia	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
24	6	Zakupy ubraniowe	Zakupy ubraniowe	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
25	6	Szewc	Szewc	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
26	6	Krawiec	Krawiec	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
27	7	Wakacje	Wakacje	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
28	7	Kino	Kino	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
29	7	Teatr Opera	Teatr Opera	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
30	7	Koncert	Koncert	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
31	7	Spa	Spa	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
32	7	Fitness	Fitness	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
33	7	Ksi????ki	Ksi????ki	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
34	7	Gry	Gry	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
35	7	Basen	Basen	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
36	7	Muzeum	Muzeum	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
37	8	Parkingi	Parkingi	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
38	8	MPK	MPK	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
39	8	PKP	PKP	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
40	8	Samoch??d	Samoch??d	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
41	8	Taxi	Taxi	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
42	8	Bus	Bus	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
43	9	Inne wydatk	Inne wydatk	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
44	9	Bankomat	Bankomat	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
45	9	Prezenty	Prezenty	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
46	9	Technologie	Technologie	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
47	9	Op??aty Prowizje banku	Op??aty Prowizje banku	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
48	9	Darowizna	Darowizna	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
49	9	Rata AGD	Rata AGD	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
50	9	Przelewy Bankowe	Przelewy Bankowe	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
51	10	Oszcz??dno??ci	Oszcz??dno??ci	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
52	10	Odsetki	Odsetki	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
53	10	Lokata	Lokata	1	2020-10-29 19:02:43.598628	2020-10-29 19:02:43.598628
\.


--
-- Data for Name: transaction_type; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.transaction_type (id_trans_type, transaction_type_name, transaction_type_desc, active, insert_date, update_date) FROM stdin;
-1	<unknown>	<unknown>	1	2020-10-29 19:02:30.13263	2020-10-29 19:02:30.13263
1	Uznanie	Wp??yw na konto.	1	2020-10-29 19:02:31.295824	2020-10-29 19:02:31.295824
2	Obci????enie	Wydatek z konta.	1	2020-10-29 19:02:31.295824	2020-10-29 19:02:31.295824
3	Wyp??ata w??asna	Przelew / wyp??ata w??asna z konta.	1	2020-10-29 19:02:31.295824	2020-10-29 19:02:31.295824
4	Wp??ata w??asna	Przelew / wp??ata w??asna na konto.	1	2020-10-29 19:02:31.295824	2020-10-29 19:02:31.295824
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.transactions (id_transaction, id_trans_ba, id_trans_cat, id_trans_subcat, id_trans_type, id_user, transaction_date, transaction_value, transaction_description, insert_date, update_date) FROM stdin;
1	1	1	6	2	\N	2015-07-01	-13.71	d17	2020-10-29 19:03:03.849687	2020-10-29 19:03:03.849687
2	5	1	5	2	\N	2015-07-01	-17.69	fb6	2020-10-29 19:03:03.855611	2020-10-29 19:03:03.855611
3	5	9	44	3	\N	2015-07-01	-50.00	7d4	2020-10-29 19:03:03.858065	2020-10-29 19:03:03.858065
4	5	9	-1	2	\N	2015-07-01	-5.00	28d	2020-10-29 19:03:03.86042	2020-10-29 19:03:03.86042
5	5	10	51	4	\N	2015-07-01	3000.00	3d2	2020-10-29 19:03:03.862404	2020-10-29 19:03:03.862404
6	6	10	51	4	\N	2015-07-02	1500.00	e2f	2020-10-29 19:03:03.864296	2020-10-29 19:03:03.864296
7	6	10	51	4	\N	2015-07-02	1000.00	a78	2020-10-29 19:03:03.866311	2020-10-29 19:03:03.866311
8	5	4	14	2	\N	2015-07-02	-120.00	cf8	2020-10-29 19:03:03.868105	2020-10-29 19:03:03.868105
9	5	10	51	3	\N	2015-07-02	-1500.00	e2f	2020-10-29 19:03:03.869843	2020-10-29 19:03:03.869843
10	1	1	-1	2	\N	2015-07-03	-12.00	7f4	2020-10-29 19:03:03.871511	2020-10-29 19:03:03.871511
11	1	1	4	2	\N	2015-07-03	-2.00	577	2020-10-29 19:03:03.87354	2020-10-29 19:03:03.87354
12	1	1	-1	2	\N	2015-07-03	-3.00	828	2020-10-29 19:03:03.875353	2020-10-29 19:03:03.875353
13	1	1	6	2	\N	2015-07-03	-19.00	331	2020-10-29 19:03:03.877204	2020-10-29 19:03:03.877204
14	1	1	-1	2	\N	2015-07-03	-10.00	ba5	2020-10-29 19:03:03.879838	2020-10-29 19:03:03.879838
15	1	1	4	2	\N	2015-07-03	-17.00	751	2020-10-29 19:03:03.882292	2020-10-29 19:03:03.882292
16	1	1	6	2	\N	2015-07-03	-4.00	759	2020-10-29 19:03:03.884659	2020-10-29 19:03:03.884659
17	1	6	25	2	\N	2015-07-03	-30.00	d0e	2020-10-29 19:03:03.886426	2020-10-29 19:03:03.886426
18	5	5	19	2	\N	2015-07-03	-150.00	a67	2020-10-29 19:03:03.888433	2020-10-29 19:03:03.888433
19	1	2	1	1	\N	2015-07-04	3784.73	79f	2020-10-29 19:03:03.890345	2020-10-29 19:03:03.890345
20	1	10	51	3	\N	2015-07-04	-1276.31	be5	2020-10-29 19:03:03.892591	2020-10-29 19:03:03.892591
21	1	10	51	3	\N	2015-07-04	-2000.00	8d3	2020-10-29 19:03:03.895053	2020-10-29 19:03:03.895053
22	3	10	51	4	\N	2015-07-04	2000.00	3ee	2020-10-29 19:03:03.896797	2020-10-29 19:03:03.896797
23	6	10	51	4	\N	2015-07-04	1276.31	3ce	2020-10-29 19:03:03.898663	2020-10-29 19:03:03.898663
24	5	1	5	2	\N	2015-07-04	-102.90	20c	2020-10-29 19:03:03.900502	2020-10-29 19:03:03.900502
25	5	4	47	2	\N	2015-07-04	-8.00	b22	2020-10-29 19:03:03.902341	2020-10-29 19:03:03.902341
26	1	1	6	2	\N	2015-07-05	-2.00	fbd	2020-10-29 19:03:03.904271	2020-10-29 19:03:03.904271
27	5	1	6	2	\N	2015-07-05	-38.50	248	2020-10-29 19:03:03.906238	2020-10-29 19:03:03.906238
28	2	6	24	2	\N	2015-07-04	-50.00	dfc	2020-10-29 19:03:03.908286	2020-10-29 19:03:03.908286
29	2	1	5	2	\N	2015-07-03	-5.88	fd8	2020-10-29 19:03:03.910459	2020-10-29 19:03:03.910459
30	5	1	5	2	\N	2015-07-06	-17.23	e50	2020-10-29 19:03:03.912365	2020-10-29 19:03:03.912365
31	2	1	5	2	\N	2015-07-06	-4.00	ce6	2020-10-29 19:03:03.914308	2020-10-29 19:03:03.914308
32	2	7	28	2	\N	2015-07-04	-14.00	a3c	2020-10-29 19:03:03.916336	2020-10-29 19:03:03.916336
33	2	10	51	3	\N	2015-07-02	-1000.00	53f	2020-10-29 19:03:03.919107	2020-10-29 19:03:03.919107
34	6	10	51	4	\N	2015-07-02	1000.00	779	2020-10-29 19:03:03.921858	2020-10-29 19:03:03.921858
35	2	6	25	1	\N	2015-07-04	30.00	110	2020-10-29 19:03:03.924531	2020-10-29 19:03:03.924531
36	2	7	6	2	\N	2015-07-06	-11.50	ef3	2020-10-29 19:03:03.927689	2020-10-29 19:03:03.927689
37	2	5	18	2	\N	2015-07-06	-7.00	018	2020-10-29 19:03:03.930695	2020-10-29 19:03:03.930695
38	1	1	-1	2	\N	2015-07-07	-150.00	77e	2020-10-29 19:03:03.933729	2020-10-29 19:03:03.933729
39	5	1	5	2	\N	2015-07-07	-41.08	e5f	2020-10-29 19:03:03.937023	2020-10-29 19:03:03.937023
40	2	1	5	2	\N	2015-07-08	-12.64	857	2020-10-29 19:03:03.938935	2020-10-29 19:03:03.938935
41	5	5	20	2	\N	2015-07-08	-24.45	fbe	2020-10-29 19:03:03.940905	2020-10-29 19:03:03.940905
42	2	5	18	2	\N	2015-07-08	-73.23	846	2020-10-29 19:03:03.944398	2020-10-29 19:03:03.944398
43	1	1	7	2	\N	2015-07-08	-10.52	d17	2020-10-29 19:03:03.94681	2020-10-29 19:03:03.94681
44	5	5	19	2	\N	2015-07-09	-30.00	7d3	2020-10-29 19:03:03.949284	2020-10-29 19:03:03.949284
45	5	1	5	2	\N	2015-07-09	-34.34	6ee	2020-10-29 19:03:03.952307	2020-10-29 19:03:03.952307
46	1	8	37	2	\N	2015-07-11	-4.00	9ef	2020-10-29 19:03:03.954338	2020-10-29 19:03:03.954338
47	1	1	5	2	\N	2015-07-11	-2.20	a85	2020-10-29 19:03:03.956938	2020-10-29 19:03:03.956938
48	1	1	4	2	\N	2015-07-11	-1.49	d46	2020-10-29 19:03:03.959678	2020-10-29 19:03:03.959678
49	1	1	6	2	\N	2015-07-10	-7.80	86f	2020-10-29 19:03:03.962325	2020-10-29 19:03:03.962325
50	1	1	5	2	\N	2015-07-10	-2.80	2c4	2020-10-29 19:03:03.964797	2020-10-29 19:03:03.964797
51	1	1	4	2	\N	2015-07-12	-133.00	59d	2020-10-29 19:03:03.967385	2020-10-29 19:03:03.967385
52	1	2	1	1	\N	2015-07-12	100.00	06b	2020-10-29 19:03:03.969871	2020-10-29 19:03:03.969871
53	1	8	37	2	\N	2015-07-14	-8.00	9ef	2020-10-29 19:03:03.972495	2020-10-29 19:03:03.972495
54	1	8	37	2	\N	2015-07-13	-8.00	9ef	2020-10-29 19:03:03.975202	2020-10-29 19:03:03.975202
55	1	2	51	4	\N	2015-07-12	2000.00	e9b	2020-10-29 19:03:03.977735	2020-10-29 19:03:03.977735
56	3	9	-1	3	\N	2015-07-12	-2000.00	d44	2020-10-29 19:03:03.980439	2020-10-29 19:03:03.980439
57	1	1	7	2	\N	2015-07-14	-11.36	d17	2020-10-29 19:03:03.982815	2020-10-29 19:03:03.982815
58	1	1	5	2	\N	2015-07-14	-8.66	4d7	2020-10-29 19:03:03.985046	2020-10-29 19:03:03.985046
59	5	5	18	2	\N	2015-07-12	-39.97	6df	2020-10-29 19:03:03.987423	2020-10-29 19:03:03.987423
60	1	1	5	2	\N	2015-07-12	-285.27	87f	2020-10-29 19:03:03.989748	2020-10-29 19:03:03.989748
61	1	1	5	2	\N	2015-07-13	-14.52	b2f	2020-10-29 19:03:03.992095	2020-10-29 19:03:03.992095
62	1	1	5	2	\N	2015-07-13	-7.97	bcf	2020-10-29 19:03:03.994706	2020-10-29 19:03:03.994706
63	5	1	5	2	\N	2015-07-13	-32.09	b90	2020-10-29 19:03:03.997396	2020-10-29 19:03:03.997396
64	1	5	20	2	\N	2015-07-14	-33.89	7dd	2020-10-29 19:03:04.000101	2020-10-29 19:03:04.000101
65	5	5	20	2	\N	2015-07-14	-13.90	911	2020-10-29 19:03:04.00286	2020-10-29 19:03:04.00286
66	1	5	20	1	\N	2015-07-14	13.90	911	2020-10-29 19:03:04.005545	2020-10-29 19:03:04.005545
67	5	5	-1	2	\N	2015-07-14	-26.12	35a	2020-10-29 19:03:04.008117	2020-10-29 19:03:04.008117
68	5	1	5	2	\N	2015-07-14	-12.08	610	2020-10-29 19:03:04.010793	2020-10-29 19:03:04.010793
69	1	6	24	2	\N	2015-07-14	-39.99	429	2020-10-29 19:03:04.013492	2020-10-29 19:03:04.013492
70	5	6	24	1	\N	2015-07-14	39.99	585	2020-10-29 19:03:04.016063	2020-10-29 19:03:04.016063
71	5	1	5	2	\N	2015-07-14	-107.25	2d9	2020-10-29 19:03:04.018528	2020-10-29 19:03:04.018528
72	2	4	15	2	\N	2015-07-16	-58.36	ecf	2020-10-29 19:03:04.021307	2020-10-29 19:03:04.021307
73	2	4	15	2	\N	2015-07-16	-19.99	8d9	2020-10-29 19:03:04.023691	2020-10-29 19:03:04.023691
74	2	5	20	2	\N	2015-07-13	-18.99	7b3	2020-10-29 19:03:04.026542	2020-10-29 19:03:04.026542
75	2	6	24	2	\N	2015-07-16	-41.90	f34	2020-10-29 19:03:04.029227	2020-10-29 19:03:04.029227
76	5	5	19	2	\N	2015-07-16	-120.00	99a	2020-10-29 19:03:04.031644	2020-10-29 19:03:04.031644
77	5	5	20	2	\N	2015-07-18	-45.99	3ea	2020-10-29 19:03:04.034023	2020-10-29 19:03:04.034023
78	5	5	18	2	\N	2015-07-18	-44.64	ef8	2020-10-29 19:03:04.036803	2020-10-29 19:03:04.036803
79	1	1	-1	2	\N	2015-07-18	-25.24	7d2	2020-10-29 19:03:04.03919	2020-10-29 19:03:04.03919
80	1	2	1	4	\N	2015-07-18	79.90	24f	2020-10-29 19:03:04.04163	2020-10-29 19:03:04.04163
81	5	5	20	2	\N	2015-07-16	-35.79	3b4	2020-10-29 19:03:04.043807	2020-10-29 19:03:04.043807
82	1	8	37	2	\N	2015-07-16	-4.00	921	2020-10-29 19:03:04.045622	2020-10-29 19:03:04.045622
83	1	5	20	2	\N	2015-07-17	-33.89	bbe	2020-10-29 19:03:04.048041	2020-10-29 19:03:04.048041
84	1	5	20	2	\N	2015-07-17	-4.50	19c	2020-10-29 19:03:04.05062	2020-10-29 19:03:04.05062
85	5	4	47	2	\N	2015-07-13	-5.00	64a	2020-10-29 19:03:04.052973	2020-10-29 19:03:04.052973
86	1	1	5	2	\N	2015-07-18	-2.89	99e	2020-10-29 19:03:04.055044	2020-10-29 19:03:04.055044
87	1	4	15	2	\N	2015-07-20	-50.00	b3d	2020-10-29 19:03:04.057357	2020-10-29 19:03:04.057357
88	1	8	37	2	\N	2015-07-20	-28.10	076	2020-10-29 19:03:04.060201	2020-10-29 19:03:04.060201
89	1	1	5	2	\N	2015-07-20	-4.50	2c4	2020-10-29 19:03:04.06341	2020-10-29 19:03:04.06341
90	1	1	5	2	\N	2015-07-20	-7.50	5fd	2020-10-29 19:03:04.066726	2020-10-29 19:03:04.066726
91	1	6	24	2	\N	2015-07-20	-339.00	7d9	2020-10-29 19:03:04.069911	2020-10-29 19:03:04.069911
92	1	9	45	2	\N	2015-07-20	-79.00	976	2020-10-29 19:03:04.072865	2020-10-29 19:03:04.072865
93	5	9	-1	2	\N	2015-07-20	-37.76	0ca	2020-10-29 19:03:04.075462	2020-10-29 19:03:04.075462
94	5	1	5	2	\N	2015-07-21	-11.70	4b7	2020-10-29 19:03:04.078242	2020-10-29 19:03:04.078242
95	1	4	15	2	\N	2015-07-21	-2.28	6d1	2020-10-29 19:03:04.080894	2020-10-29 19:03:04.080894
96	5	1	5	2	\N	2015-07-21	-13.96	646	2020-10-29 19:03:04.083708	2020-10-29 19:03:04.083708
97	5	5	20	2	\N	2015-07-23	-28.00	8d6	2020-10-29 19:03:04.086753	2020-10-29 19:03:04.086753
98	5	1	5	2	\N	2015-07-23	-67.09	b90	2020-10-29 19:03:04.089871	2020-10-29 19:03:04.089871
99	2	5	19	1	\N	2015-07-17	211.00	fc1	2020-10-29 19:03:04.092817	2020-10-29 19:03:04.092817
100	2	5	19	2	\N	2015-07-24	-211.00	02f	2020-10-29 19:03:04.095283	2020-10-29 19:03:04.095283
101	5	5	19	1	\N	2015-07-24	211.00	498	2020-10-29 19:03:04.0979	2020-10-29 19:03:04.0979
102	2	9	45	2	\N	2015-07-24	-339.00	8dc	2020-10-29 19:03:04.100312	2020-10-29 19:03:04.100312
103	1	9	45	1	\N	2015-07-24	339.00	8fd	2020-10-29 19:03:04.102846	2020-10-29 19:03:04.102846
104	1	9	-1	2	\N	2015-07-24	-159.00	608	2020-10-29 19:03:04.105339	2020-10-29 19:03:04.105339
105	1	9	-1	2	\N	2015-07-24	-128.00	608	2020-10-29 19:03:04.108336	2020-10-29 19:03:04.108336
106	1	1	5	2	\N	2015-07-24	-1.98	d93	2020-10-29 19:03:04.110813	2020-10-29 19:03:04.110813
107	5	9	45	2	\N	2015-07-27	-300.00	03f	2020-10-29 19:03:04.113267	2020-10-29 19:03:04.113267
108	5	4	47	2	\N	2015-07-27	-5.00	28d	2020-10-29 19:03:04.115182	2020-10-29 19:03:04.115182
109	5	5	20	2	\N	2015-07-27	-8.99	b2b	2020-10-29 19:03:04.117288	2020-10-29 19:03:04.117288
110	5	5	20	2	\N	2015-07-27	-18.90	6cf	2020-10-29 19:03:04.11995	2020-10-29 19:03:04.11995
111	5	1	5	2	\N	2015-07-27	-38.61	e4b	2020-10-29 19:03:04.122175	2020-10-29 19:03:04.122175
112	1	1	-1	2	\N	2015-07-27	-23.45	084	2020-10-29 19:03:04.124407	2020-10-29 19:03:04.124407
113	1	8	40	2	\N	2015-07-27	-14.00	68e	2020-10-29 19:03:04.126821	2020-10-29 19:03:04.126821
114	1	1	5	2	\N	2015-07-27	-5.50	473	2020-10-29 19:03:04.129144	2020-10-29 19:03:04.129144
115	5	5	19	2	\N	2015-07-28	-11.00	d27	2020-10-29 19:03:04.131477	2020-10-29 19:03:04.131477
116	5	1	5	2	\N	2015-07-28	-27.08	5ae	2020-10-29 19:03:04.133753	2020-10-29 19:03:04.133753
117	5	4	13	2	\N	2015-07-28	-49.90	97a	2020-10-29 19:03:04.13685	2020-10-29 19:03:04.13685
118	2	2	2	1	\N	2015-07-27	40.00	c11	2020-10-29 19:03:04.139554	2020-10-29 19:03:04.139554
119	2	1	5	2	\N	2015-07-25	-9.19	507	2020-10-29 19:03:04.142025	2020-10-29 19:03:04.142025
120	2	1	5	2	\N	2015-07-30	-10.86	5f2	2020-10-29 19:03:04.144572	2020-10-29 19:03:04.144572
121	1	1	4	2	\N	2015-07-31	-1.50	613	2020-10-29 19:03:04.146759	2020-10-29 19:03:04.146759
122	1	1	7	2	\N	2015-07-31	-5.50	0e8	2020-10-29 19:03:04.148751	2020-10-29 19:03:04.148751
123	1	1	-1	2	\N	2015-07-29	-84.00	91f	2020-10-29 19:03:04.151424	2020-10-29 19:03:04.151424
124	1	7	29	2	\N	2015-07-29	-142.00	cc4	2020-10-29 19:03:04.153825	2020-10-29 19:03:04.153825
125	1	2	1	1	\N	2015-07-29	7667.53	d79	2020-10-29 19:03:04.156049	2020-10-29 19:03:04.156049
126	5	5	20	2	\N	2015-07-29	-32.79	0f3	2020-10-29 19:03:04.158163	2020-10-29 19:03:04.158163
127	1	1	5	2	\N	2015-07-31	-10.90	8a0	2020-10-29 19:03:04.160481	2020-10-29 19:03:04.160481
128	2	5	19	1	\N	2015-07-30	129.00	5a5	2020-10-29 19:03:04.162941	2020-10-29 19:03:04.162941
129	2	2	1	1	\N	2015-07-29	6434.18	f84	2020-10-29 19:03:04.165473	2020-10-29 19:03:04.165473
130	2	10	3	3	\N	2015-07-29	-3000.00	2d6	2020-10-29 19:03:04.167902	2020-10-29 19:03:04.167902
131	1	9	-1	3	\N	2015-08-01	-1500.00	409	2020-10-29 19:03:04.169895	2020-10-29 19:03:04.169895
132	1	10	51	3	\N	2015-08-01	-800.00	336	2020-10-29 19:03:04.171992	2020-10-29 19:03:04.171992
133	1	10	51	3	\N	2015-08-01	-700.00	e6e	2020-10-29 19:03:04.173963	2020-10-29 19:03:04.173963
134	1	1	4	2	\N	2015-08-01	-6.09	9d5	2020-10-29 19:03:04.175998	2020-10-29 19:03:04.175998
135	1	1	5	2	\N	2015-08-01	-3.50	473	2020-10-29 19:03:04.178281	2020-10-29 19:03:04.178281
136	3	10	51	4	\N	2015-08-01	1500.00	e15	2020-10-29 19:03:04.180565	2020-10-29 19:03:04.180565
137	5	8	40	2	\N	2015-08-01	-225.70	250	2020-10-29 19:03:04.182912	2020-10-29 19:03:04.182912
138	1	4	15	2	\N	2015-08-01	-5.00	ceb	2020-10-29 19:03:04.18536	2020-10-29 19:03:04.18536
139	5	9	44	3	\N	2015-08-01	-100.00	462	2020-10-29 19:03:04.187912	2020-10-29 19:03:04.187912
140	2	2	3	4	\N	2015-08-01	100.00	a8a	2020-10-29 19:03:04.190274	2020-10-29 19:03:04.190274
141	5	2	3	4	\N	2015-08-01	1500.00	fd8	2020-10-29 19:03:04.192716	2020-10-29 19:03:04.192716
142	5	1	5	2	\N	2015-08-01	-5.78	eb9	2020-10-29 19:03:04.195211	2020-10-29 19:03:04.195211
143	6	10	51	4	\N	2015-08-01	4500.00	da3	2020-10-29 19:03:04.197748	2020-10-29 19:03:04.197748
144	6	2	-1	1	\N	2015-08-01	40.93	187	2020-10-29 19:03:04.200395	2020-10-29 19:03:04.200395
145	6	4	47	2	\N	2015-08-01	-7.78	b1a	2020-10-29 19:03:04.202791	2020-10-29 19:03:04.202791
146	1	7	31	2	\N	2015-08-01	-129.00	72e	2020-10-29 19:03:04.204737	2020-10-29 19:03:04.204737
147	5	2	3	4	\N	2015-08-02	100.00	d15	2020-10-29 19:03:04.206892	2020-10-29 19:03:04.206892
148	5	5	21	2	\N	2015-08-02	-45.00	fbe	2020-10-29 19:03:04.20853	2020-10-29 19:03:04.20853
149	5	5	20	2	\N	2015-08-02	-5.18	b8c	2020-10-29 19:03:04.211146	2020-10-29 19:03:04.211146
150	5	1	5	2	\N	2015-08-02	-72.20	20c	2020-10-29 19:03:04.213268	2020-10-29 19:03:04.213268
151	1	8	38	2	\N	2015-08-02	-21.00	a4d	2020-10-29 19:03:04.215607	2020-10-29 19:03:04.215607
152	1	1	5	2	\N	2015-08-03	-3.50	473	2020-10-29 19:03:04.217958	2020-10-29 19:03:04.217958
153	1	8	38	2	\N	2015-08-03	-46.00	72e	2020-10-29 19:03:04.219972	2020-10-29 19:03:04.219972
154	1	8	38	1	\N	2015-08-04	21.00	fdd	2020-10-29 19:03:04.221987	2020-10-29 19:03:04.221987
155	1	1	5	2	\N	2015-08-04	-2.50	ce5	2020-10-29 19:03:04.223936	2020-10-29 19:03:04.223936
156	2	10	51	3	\N	2015-08-04	-2000.00	d30	2020-10-29 19:03:04.226099	2020-10-29 19:03:04.226099
157	2	5	19	3	\N	2015-08-03	-129.00	5a5	2020-10-29 19:03:04.227752	2020-10-29 19:03:04.227752
158	5	5	19	4	\N	2015-08-03	129.00	5a5	2020-10-29 19:03:04.229436	2020-10-29 19:03:04.229436
159	5	1	5	2	\N	2015-08-06	-51.16	6ee	2020-10-29 19:03:04.23112	2020-10-29 19:03:04.23112
160	2	5	18	2	\N	2015-08-06	-39.90	866	2020-10-29 19:03:04.232785	2020-10-29 19:03:04.232785
161	5	10	51	4	\N	2015-08-01	3000.00	6a0	2020-10-29 19:03:04.234433	2020-10-29 19:03:04.234433
162	5	10	51	3	\N	2015-08-01	-1500.00	2c3	2020-10-29 19:03:04.236099	2020-10-29 19:03:04.236099
163	6	10	51	4	\N	2015-08-01	1500.00	2c3	2020-10-29 19:03:04.237722	2020-10-29 19:03:04.237722
164	2	2	2	1	\N	2015-08-06	85.90	92f	2020-10-29 19:03:04.239401	2020-10-29 19:03:04.239401
165	6	10	51	4	\N	2015-08-04	2000.00	d30	2020-10-29 19:03:04.241095	2020-10-29 19:03:04.241095
166	1	1	4	2	\N	2015-08-07	-16.00	8c6	2020-10-29 19:03:04.243311	2020-10-29 19:03:04.243311
167	1	1	4	2	\N	2015-08-06	-18.00	33b	2020-10-29 19:03:04.246013	2020-10-29 19:03:04.246013
168	1	1	4	2	\N	2015-08-06	-4.85	0d2	2020-10-29 19:03:04.248715	2020-10-29 19:03:04.248715
169	1	9	-1	2	\N	2015-08-08	-5.00	356	2020-10-29 19:03:04.251434	2020-10-29 19:03:04.251434
170	1	1	-1	2	\N	2015-08-07	-240.00	23a	2020-10-29 19:03:04.254696	2020-10-29 19:03:04.254696
171	5	5	20	2	\N	2015-08-05	-21.80	141	2020-10-29 19:03:04.257615	2020-10-29 19:03:04.257615
172	1	1	7	2	\N	2015-08-05	-11.18	66a	2020-10-29 19:03:04.260126	2020-10-29 19:03:04.260126
173	5	1	5	2	\N	2015-08-10	-104.89	820	2020-10-29 19:03:04.262994	2020-10-29 19:03:04.262994
174	2	1	-1	2	\N	2015-08-08	-15.00	ba2	2020-10-29 19:03:04.264786	2020-10-29 19:03:04.264786
175	1	1	4	2	\N	2015-08-11	-2.00	2b4	2020-10-29 19:03:04.266583	2020-10-29 19:03:04.266583
176	1	1	7	2	\N	2015-08-12	-6.43	ce0	2020-10-29 19:03:04.268461	2020-10-29 19:03:04.268461
177	5	1	5	2	\N	2015-08-11	-18.47	e22	2020-10-29 19:03:04.270199	2020-10-29 19:03:04.270199
178	1	9	-1	2	\N	2015-08-12	-11.86	327	2020-10-29 19:03:04.271866	2020-10-29 19:03:04.271866
179	5	1	5	2	\N	2015-08-12	-141.51	20c	2020-10-29 19:03:04.273738	2020-10-29 19:03:04.273738
180	5	1	5	2	\N	2015-08-14	-59.04	20c	2020-10-29 19:03:04.275465	2020-10-29 19:03:04.275465
181	5	5	20	2	\N	2015-08-14	-53.90	79f	2020-10-29 19:03:04.277389	2020-10-29 19:03:04.277389
182	2	5	18	2	\N	2015-08-14	-44.85	846	2020-10-29 19:03:04.279174	2020-10-29 19:03:04.279174
183	2	6	24	2	\N	2015-08-14	-50.00	dfc	2020-10-29 19:03:04.280984	2020-10-29 19:03:04.280984
184	1	1	5	2	\N	2015-08-13	-6.90	2c4	2020-10-29 19:03:04.283748	2020-10-29 19:03:04.283748
185	1	1	6	2	\N	2015-08-15	-7.60	20c	2020-10-29 19:03:04.286595	2020-10-29 19:03:04.286595
186	1	1	-1	2	\N	2015-08-14	-30.00	75b	2020-10-29 19:03:04.289302	2020-10-29 19:03:04.289302
187	1	9	45	2	\N	2015-08-13	-200.81	37b	2020-10-29 19:03:04.29189	2020-10-29 19:03:04.29189
188	5	1	5	2	\N	2015-08-16	-63.28	055	2020-10-29 19:03:04.294738	2020-10-29 19:03:04.294738
189	1	9	-1	2	\N	2015-08-16	-267.00	8d9	2020-10-29 19:03:04.296964	2020-10-29 19:03:04.296964
190	1	1	4	2	\N	2015-08-18	-2.00	f60	2020-10-29 19:03:04.298636	2020-10-29 19:03:04.298636
191	5	1	5	2	\N	2015-08-18	-20.86	2a9	2020-10-29 19:03:04.300222	2020-10-29 19:03:04.300222
192	5	5	20	2	\N	2015-08-19	-43.00	8fd	2020-10-29 19:03:04.301676	2020-10-29 19:03:04.301676
193	5	5	20	2	\N	2015-08-18	-17.90	835	2020-10-29 19:03:04.30313	2020-10-29 19:03:04.30313
194	5	1	5	2	\N	2015-08-20	-62.74	20a	2020-10-29 19:03:04.304676	2020-10-29 19:03:04.304676
195	5	1	5	2	\N	2015-08-12	-104.89	222	2020-10-29 19:03:04.306331	2020-10-29 19:03:04.306331
196	5	5	18	2	\N	2015-08-08	-55.89	846	2020-10-29 19:03:04.308022	2020-10-29 19:03:04.308022
197	2	6	24	2	\N	2015-08-17	-50.00	dfc	2020-10-29 19:03:04.310341	2020-10-29 19:03:04.310341
198	5	1	5	2	\N	2015-08-21	-39.79	ab6	2020-10-29 19:03:04.312068	2020-10-29 19:03:04.312068
199	1	1	5	2	\N	2015-08-22	-21.86	876	2020-10-29 19:03:04.31369	2020-10-29 19:03:04.31369
200	1	9	-1	2	\N	2015-08-22	-259.00	ea2	2020-10-29 19:03:04.315979	2020-10-29 19:03:04.315979
201	1	5	20	2	\N	2015-08-21	-6.20	3f4	2020-10-29 19:03:04.318825	2020-10-29 19:03:04.318825
202	1	1	6	2	\N	2015-08-22	-132.00	cc5	2020-10-29 19:03:04.32161	2020-10-29 19:03:04.32161
203	1	1	-1	2	\N	2015-08-20	-18.28	3ea	2020-10-29 19:03:04.323776	2020-10-29 19:03:04.323776
204	1	1	7	2	\N	2015-08-20	-13.80	9de	2020-10-29 19:03:04.326756	2020-10-29 19:03:04.326756
205	1	1	7	2	\N	2015-08-21	-4.50	a66	2020-10-29 19:03:04.329569	2020-10-29 19:03:04.329569
206	1	9	-1	4	\N	2015-08-21	1500.00	2c0	2020-10-29 19:03:04.331968	2020-10-29 19:03:04.331968
207	3	9	-1	3	\N	2015-08-21	-1500.00	2c0	2020-10-29 19:03:04.334168	2020-10-29 19:03:04.334168
208	1	10	51	3	\N	2015-08-21	-500.00	f8c	2020-10-29 19:03:04.336466	2020-10-29 19:03:04.336466
209	2	1	6	2	\N	2015-08-22	-10.00	f04	2020-10-29 19:03:04.339297	2020-10-29 19:03:04.339297
210	1	10	51	3	\N	2015-08-21	-500.00	e26	2020-10-29 19:03:04.341307	2020-10-29 19:03:04.341307
211	5	2	3	4	\N	2015-08-21	500.00	e26	2020-10-29 19:03:04.343752	2020-10-29 19:03:04.343752
212	5	1	5	2	\N	2015-08-23	-23.39	3ad	2020-10-29 19:03:04.345757	2020-10-29 19:03:04.345757
213	1	1	5	2	\N	2015-08-25	-5.70	b7b	2020-10-29 19:03:04.348443	2020-10-29 19:03:04.348443
214	5	5	20	2	\N	2015-08-26	-14.90	ce6	2020-10-29 19:03:04.351025	2020-10-29 19:03:04.351025
215	2	1	5	2	\N	2015-08-26	-7.70	ecd	2020-10-29 19:03:04.353147	2020-10-29 19:03:04.353147
216	1	1	5	2	\N	2015-08-25	-8.00	b4d	2020-10-29 19:03:04.355436	2020-10-29 19:03:04.355436
217	1	1	4	2	\N	2015-08-27	-3.30	f60	2020-10-29 19:03:04.357743	2020-10-29 19:03:04.357743
218	1	1	4	2	\N	2015-08-26	-2.00	f60	2020-10-29 19:03:04.359844	2020-10-29 19:03:04.359844
219	5	9	-1	2	\N	2015-08-27	-525.00	e62	2020-10-29 19:03:04.361917	2020-10-29 19:03:04.361917
220	5	5	19	2	\N	2015-08-27	-200.00	7de	2020-10-29 19:03:04.364372	2020-10-29 19:03:04.364372
221	5	1	5	2	\N	2015-08-27	-50.00	1fe	2020-10-29 19:03:04.366395	2020-10-29 19:03:04.366395
222	5	9	-1	2	\N	2015-08-26	-35.50	43c	2020-10-29 19:03:04.368124	2020-10-29 19:03:04.368124
223	5	9	-1	2	\N	2015-08-29	-200.00	7b3	2020-10-29 19:03:04.370696	2020-10-29 19:03:04.370696
224	1	1	7	2	\N	2015-08-27	-9.80	756	2020-10-29 19:03:04.372957	2020-10-29 19:03:04.372957
225	1	1	7	2	\N	2015-08-27	-13.24	9de	2020-10-29 19:03:04.374742	2020-10-29 19:03:04.374742
226	5	1	5	2	\N	2015-08-27	-108.40	adf	2020-10-29 19:03:04.377423	2020-10-29 19:03:04.377423
227	1	2	1	1	\N	2015-08-26	8400.05	003	2020-10-29 19:03:04.379254	2020-10-29 19:03:04.379254
228	1	9	-1	2	\N	2015-08-27	-1500.00	4ef	2020-10-29 19:03:04.3815	2020-10-29 19:03:04.3815
229	1	4	15	2	\N	2015-08-27	-21.00	5a8	2020-10-29 19:03:04.383285	2020-10-29 19:03:04.383285
230	1	8	38	2	\N	2015-08-27	-46.00	72e	2020-10-29 19:03:04.38512	2020-10-29 19:03:04.38512
231	1	10	51	2	\N	2015-08-27	-500.00	d7d	2020-10-29 19:03:04.386762	2020-10-29 19:03:04.386762
232	5	2	3	4	\N	2015-08-27	1500.00	63d	2020-10-29 19:03:04.388488	2020-10-29 19:03:04.388488
233	6	2	3	4	\N	2015-08-27	1500.00	499	2020-10-29 19:03:04.390493	2020-10-29 19:03:04.390493
234	6	2	3	4	\N	2015-08-27	3500.00	14b	2020-10-29 19:03:04.392461	2020-10-29 19:03:04.392461
235	1	10	51	3	\N	2015-08-27	-400.00	c38	2020-10-29 19:03:04.394281	2020-10-29 19:03:04.394281
236	3	2	3	4	\N	2015-08-27	400.00	c38	2020-10-29 19:03:04.396263	2020-10-29 19:03:04.396263
237	5	1	6	2	\N	2015-08-29	-930.00	941	2020-10-29 19:03:04.398794	2020-10-29 19:03:04.398794
238	5	1	5	2	\N	2015-08-29	-80.58	a0f	2020-10-29 19:03:04.400878	2020-10-29 19:03:04.400878
239	5	5	18	2	\N	2015-08-30	-123.40	454	2020-10-29 19:03:04.402544	2020-10-29 19:03:04.402544
240	1	1	7	2	\N	2015-08-28	-15.74	9de	2020-10-29 19:03:04.404762	2020-10-29 19:03:04.404762
241	1	1	7	2	\N	2015-08-31	-3.45	ce5	2020-10-29 19:03:04.407422	2020-10-29 19:03:04.407422
242	6	10	51	4	\N	2015-08-31	5000.00	462	2020-10-29 19:03:04.409857	2020-10-29 19:03:04.409857
243	5	2	2	4	\N	2015-08-31	100.00	037	2020-10-29 19:03:04.411661	2020-10-29 19:03:04.411661
244	5	9	-1	2	\N	2015-08-30	-269.00	fe9	2020-10-29 19:03:04.41334	2020-10-29 19:03:04.41334
245	1	1	5	2	\N	2015-08-31	-96.00	6f8	2020-10-29 19:03:04.414999	2020-10-29 19:03:04.414999
246	5	5	18	2	\N	2015-08-29	-13.57	eff	2020-10-29 19:03:04.416603	2020-10-29 19:03:04.416603
247	2	2	1	1	\N	2015-08-26	7780.60	43c	2020-10-29 19:03:04.418251	2020-10-29 19:03:04.418251
248	2	10	51	3	\N	2015-08-28	-3000.00	61d	2020-10-29 19:03:04.419968	2020-10-29 19:03:04.419968
249	2	10	51	2	\N	2015-08-28	-295.00	b71	2020-10-29 19:03:04.422637	2020-10-29 19:03:04.422637
250	2	1	8	2	\N	2015-08-29	-50.00	041	2020-10-29 19:03:04.42539	2020-10-29 19:03:04.42539
251	5	8	40	2	\N	2015-10-03	-133.07	a4e	2020-10-29 19:03:04.42739	2020-10-29 19:03:04.42739
252	5	1	5	2	\N	2015-10-04	-89.21	20c	2020-10-29 19:03:04.429573	2020-10-29 19:03:04.429573
253	1	1	7	2	\N	2015-10-02	-21.00	a6d	2020-10-29 19:03:04.431862	2020-10-29 19:03:04.431862
254	1	1	7	2	\N	2015-10-02	-17.50	a6d	2020-10-29 19:03:04.434382	2020-10-29 19:03:04.434382
255	1	1	7	2	\N	2015-10-02	-60.00	63d	2020-10-29 19:03:04.436418	2020-10-29 19:03:04.436418
256	1	1	5	2	\N	2015-10-01	-8.07	568	2020-10-29 19:03:04.438971	2020-10-29 19:03:04.438971
257	1	1	7	2	\N	2015-10-01	-2.45	756	2020-10-29 19:03:04.44111	2020-10-29 19:03:04.44111
258	1	1	7	2	\N	2015-10-01	-11.45	615	2020-10-29 19:03:04.443238	2020-10-29 19:03:04.443238
259	1	1	-1	2	\N	2015-10-04	-15.08	27f	2020-10-29 19:03:04.444959	2020-10-29 19:03:04.444959
260	1	1	6	2	\N	2015-10-02	-5.00	d7e	2020-10-29 19:03:04.446756	2020-10-29 19:03:04.446756
261	5	4	12	2	\N	2015-10-04	-126.36	7c8	2020-10-29 19:03:04.448329	2020-10-29 19:03:04.448329
262	5	4	10	2	\N	2015-10-04	-327.77	01c	2020-10-29 19:03:04.449906	2020-10-29 19:03:04.449906
263	1	8	38	2	\N	2015-10-06	-64.00	912	2020-10-29 19:03:04.451441	2020-10-29 19:03:04.451441
264	5	1	5	2	\N	2015-10-05	-61.20	6ee	2020-10-29 19:03:04.45295	2020-10-29 19:03:04.45295
265	2	10	51	3	\N	2015-10-05	-1500.00	a95	2020-10-29 19:03:04.454469	2020-10-29 19:03:04.454469
266	2	10	51	3	\N	2015-10-05	-500.00	734	2020-10-29 19:03:04.456211	2020-10-29 19:03:04.456211
267	2	10	51	3	\N	2015-10-05	-2500.00	577	2020-10-29 19:03:04.457852	2020-10-29 19:03:04.457852
268	6	10	51	4	\N	2015-10-05	1500.00	a95	2020-10-29 19:03:04.459593	2020-10-29 19:03:04.459593
269	4	10	51	4	\N	2015-10-05	2500.00	577	2020-10-29 19:03:04.461433	2020-10-29 19:03:04.461433
270	2	1	6	2	\N	2015-10-06	-8.90	951	2020-10-29 19:03:04.463155	2020-10-29 19:03:04.463155
271	2	4	13	1	\N	2015-10-06	80.00	10c	2020-10-29 19:03:04.464842	2020-10-29 19:03:04.464842
272	1	9	-1	2	\N	2015-10-06	-50.00	a47	2020-10-29 19:03:04.466733	2020-10-29 19:03:04.466733
273	1	2	1	1	\N	2015-10-06	297.68	b42	2020-10-29 19:03:04.468911	2020-10-29 19:03:04.468911
274	2	1	5	2	\N	2015-10-07	-4.70	ecd	2020-10-29 19:03:04.470956	2020-10-29 19:03:04.470956
275	2	1	5	2	\N	2015-10-07	-7.80	720	2020-10-29 19:03:04.472987	2020-10-29 19:03:04.472987
276	5	5	19	2	\N	2015-10-08	-200.00	b9d	2020-10-29 19:03:04.474989	2020-10-29 19:03:04.474989
277	2	1	6	2	\N	2015-10-08	-10.00	dcc	2020-10-29 19:03:04.477159	2020-10-29 19:03:04.477159
278	5	1	5	2	\N	2015-10-12	-16.73	193	2020-10-29 19:03:04.479552	2020-10-29 19:03:04.479552
279	2	6	24	2	\N	2015-10-12	-33.00	e4a	2020-10-29 19:03:04.481844	2020-10-29 19:03:04.481844
280	5	1	5	2	\N	2015-10-13	-45.21	6ee	2020-10-29 19:03:04.484198	2020-10-29 19:03:04.484198
281	5	1	5	2	\N	2015-10-15	-14.19	0d3	2020-10-29 19:03:04.486347	2020-10-29 19:03:04.486347
282	5	1	5	2	\N	2015-10-15	-9.23	ecd	2020-10-29 19:03:04.488535	2020-10-29 19:03:04.488535
283	2	8	38	2	\N	2015-10-16	-40.00	94a	2020-10-29 19:03:04.490824	2020-10-29 19:03:04.490824
284	2	7	32	2	\N	2015-10-16	-5.00	048	2020-10-29 19:03:04.49306	2020-10-29 19:03:04.49306
285	5	6	24	2	\N	2015-10-16	-21.00	ef4	2020-10-29 19:03:04.495536	2020-10-29 19:03:04.495536
286	2	1	5	2	\N	2015-10-19	-3.50	ecd	2020-10-29 19:03:04.497825	2020-10-29 19:03:04.497825
287	1	1	4	2	\N	2015-10-10	-3.30	0c1	2020-10-29 19:03:04.49969	2020-10-29 19:03:04.49969
288	1	1	5	2	\N	2015-10-10	-1.71	473	2020-10-29 19:03:04.501396	2020-10-29 19:03:04.501396
289	5	8	40	2	\N	2015-10-18	-211.63	dba	2020-10-29 19:03:04.502671	2020-10-29 19:03:04.502671
290	5	1	5	2	\N	2015-10-10	-69.77	6ee	2020-10-29 19:03:04.503905	2020-10-29 19:03:04.503905
291	1	1	7	2	\N	2015-10-08	-27.40	683	2020-10-29 19:03:04.505155	2020-10-29 19:03:04.505155
292	1	1	6	2	\N	2015-10-09	-28.70	302	2020-10-29 19:03:04.506543	2020-10-29 19:03:04.506543
293	1	1	5	2	\N	2015-10-03	-4.73	32a	2020-10-29 19:03:04.507949	2020-10-29 19:03:04.507949
294	5	1	5	2	\N	2015-10-11	-8.00	32a	2020-10-29 19:03:04.509182	2020-10-29 19:03:04.509182
295	1	1	5	2	\N	2015-10-10	-9.67	0e9	2020-10-29 19:03:04.510914	2020-10-29 19:03:04.510914
296	1	1	7	2	\N	2015-10-15	-2.45	0e8	2020-10-29 19:03:04.512167	2020-10-29 19:03:04.512167
297	5	1	-1	2	\N	2015-10-10	-21.14	ea6	2020-10-29 19:03:04.513415	2020-10-29 19:03:04.513415
298	1	1	-1	2	\N	2015-10-16	-22.97	ef4	2020-10-29 19:03:04.514641	2020-10-29 19:03:04.514641
299	1	1	-1	2	\N	2015-10-17	-43.09	ef4	2020-10-29 19:03:04.515838	2020-10-29 19:03:04.515838
300	5	2	3	4	\N	2015-10-05	300.00	e80	2020-10-29 19:03:04.517081	2020-10-29 19:03:04.517081
301	5	1	5	2	\N	2015-10-20	-87.92	ad1	2020-10-29 19:03:04.51828	2020-10-29 19:03:04.51828
302	5	1	5	2	\N	2015-10-20	-13.96	b3e	2020-10-29 19:03:04.519488	2020-10-29 19:03:04.519488
303	5	1	6	2	\N	2015-10-22	-35.00	7cf	2020-10-29 19:03:04.520704	2020-10-29 19:03:04.520704
304	5	1	5	2	\N	2015-10-22	-13.50	4aa	2020-10-29 19:03:04.522237	2020-10-29 19:03:04.522237
305	2	6	24	2	\N	2015-10-22	-18.00	6d5	2020-10-29 19:03:04.523534	2020-10-29 19:03:04.523534
306	2	1	5	2	\N	2015-10-22	-6.48	ed5	2020-10-29 19:03:04.524888	2020-10-29 19:03:04.524888
307	1	9	-1	2	\N	2015-10-22	-6.40	c3b	2020-10-29 19:03:04.526147	2020-10-29 19:03:04.526147
308	1	1	7	2	\N	2015-10-22	-11.13	550	2020-10-29 19:03:04.527389	2020-10-29 19:03:04.527389
309	5	2	3	1	\N	2015-10-23	200.00	be4	2020-10-29 19:03:04.528686	2020-10-29 19:03:04.528686
310	2	6	24	2	\N	2015-10-23	-104.97	a0f	2020-10-29 19:03:04.530033	2020-10-29 19:03:04.530033
311	1	1	-1	2	\N	2015-10-23	-26.00	a5e	2020-10-29 19:03:04.531321	2020-10-29 19:03:04.531321
312	1	1	7	2	\N	2015-10-23	-2.45	f60	2020-10-29 19:03:04.532776	2020-10-29 19:03:04.532776
313	1	1	4	2	\N	2015-10-23	-2.49	dc1	2020-10-29 19:03:04.534082	2020-10-29 19:03:04.534082
314	1	1	-1	2	\N	2015-10-23	-35.34	091	2020-10-29 19:03:04.535279	2020-10-29 19:03:04.535279
315	1	1	-1	2	\N	2015-10-23	-16.00	a17	2020-10-29 19:03:04.536467	2020-10-29 19:03:04.536467
316	5	1	5	2	\N	2015-10-24	-99.47	6ee	2020-10-29 19:03:04.537757	2020-10-29 19:03:04.537757
317	1	1	4	2	\N	2015-10-23	-2.00	0c1	2020-10-29 19:03:04.539005	2020-10-29 19:03:04.539005
318	1	1	5	2	\N	2015-10-23	-3.00	473	2020-10-29 19:03:04.540198	2020-10-29 19:03:04.540198
319	2	6	24	2	\N	2015-10-24	-10.00	0e5	2020-10-29 19:03:04.541376	2020-10-29 19:03:04.541376
320	2	6	24	2	\N	2015-10-24	-6.12	238	2020-10-29 19:03:04.542706	2020-10-29 19:03:04.542706
321	2	5	18	2	\N	2015-10-24	-40.00	895	2020-10-29 19:03:04.544115	2020-10-29 19:03:04.544115
322	5	4	13	2	\N	2015-10-26	-49.90	97a	2020-10-29 19:03:04.545571	2020-10-29 19:03:04.545571
323	2	6	24	2	\N	2015-10-27	-40.10	7e1	2020-10-29 19:03:04.547633	2020-10-29 19:03:04.547633
324	2	9	45	2	\N	2015-10-27	-299.00	d41	2020-10-29 19:03:04.550002	2020-10-29 19:03:04.550002
325	2	1	5	2	\N	2015-10-27	-9.18	2b3	2020-10-29 19:03:04.552439	2020-10-29 19:03:04.552439
326	2	9	-1	2	\N	2015-10-27	-641.00	f19	2020-10-29 19:03:04.554936	2020-10-29 19:03:04.554936
327	2	2	1	1	\N	2015-10-27	6681.37	c76	2020-10-29 19:03:04.557348	2020-10-29 19:03:04.557348
328	2	10	51	3	\N	2015-10-27	-1500.00	ab7	2020-10-29 19:03:04.55989	2020-10-29 19:03:04.55989
329	2	10	51	3	\N	2015-10-27	-1500.00	0ba	2020-10-29 19:03:04.561434	2020-10-29 19:03:04.561434
330	5	10	51	4	\N	2015-10-27	1500.00	ab7	2020-10-29 19:03:04.563305	2020-10-29 19:03:04.563305
331	6	10	51	4	\N	2015-10-27	1500.00	0ba	2020-10-29 19:03:04.564968	2020-10-29 19:03:04.564968
332	5	10	51	3	\N	2015-10-27	-2000.00	1ce	2020-10-29 19:03:04.566827	2020-10-29 19:03:04.566827
333	6	10	51	4	\N	2015-10-27	2000.00	1ce	2020-10-29 19:03:04.568611	2020-10-29 19:03:04.568611
334	2	10	51	3	\N	2015-10-27	-2000.00	ca8	2020-10-29 19:03:04.570201	2020-10-29 19:03:04.570201
335	4	10	51	4	\N	2015-10-27	2000.00	ca8	2020-10-29 19:03:04.571724	2020-10-29 19:03:04.571724
336	1	2	1	1	\N	2015-10-28	8400.05	72a	2020-10-29 19:03:04.57336	2020-10-29 19:03:04.57336
337	1	10	51	3	\N	2015-10-28	-500.00	954	2020-10-29 19:03:04.575052	2020-10-29 19:03:04.575052
338	1	10	51	3	\N	2015-10-28	-1850.00	2e9	2020-10-29 19:03:04.577192	2020-10-29 19:03:04.577192
339	1	10	51	3	\N	2015-10-28	-1500.00	314	2020-10-29 19:03:04.578728	2020-10-29 19:03:04.578728
340	6	10	51	4	\N	2015-10-28	1500.00	314	2020-10-29 19:03:04.580302	2020-10-29 19:03:04.580302
341	1	10	51	3	\N	2015-10-28	-4400.00	3ee	2020-10-29 19:03:04.58205	2020-10-29 19:03:04.58205
342	3	10	51	4	\N	2015-10-28	4400.00	3ee	2020-10-29 19:03:04.583715	2020-10-29 19:03:04.583715
343	5	1	5	2	\N	2015-10-26	-8.69	7d2	2020-10-29 19:03:04.585528	2020-10-29 19:03:04.585528
344	2	1	6	2	\N	2015-10-29	-30.00	739	2020-10-29 19:03:04.587108	2020-10-29 19:03:04.587108
345	5	1	5	2	\N	2015-10-29	-36.11	6ee	2020-10-29 19:03:04.588611	2020-10-29 19:03:04.588611
346	5	5	20	2	\N	2015-10-29	-53.99	bd0	2020-10-29 19:03:04.590416	2020-10-29 19:03:04.590416
347	2	5	19	2	\N	2015-10-29	-50.00	412	2020-10-29 19:03:04.591962	2020-10-29 19:03:04.591962
348	2	9	45	2	\N	2015-10-29	-39.90	0e5	2020-10-29 19:03:04.59351	2020-10-29 19:03:04.59351
349	2	8	38	2	\N	2015-10-30	-40.00	f6a	2020-10-29 19:03:04.595044	2020-10-29 19:03:04.595044
350	2	1	-1	2	\N	2015-10-30	-22.00	afb	2020-10-29 19:03:04.596523	2020-10-29 19:03:04.596523
351	2	8	41	2	\N	2015-10-30	-17.00	2a9	2020-10-29 19:03:04.598428	2020-10-29 19:03:04.598428
352	5	1	5	2	\N	2015-10-31	-50.00	3ea	2020-10-29 19:03:04.599993	2020-10-29 19:03:04.599993
353	5	4	10	2	\N	2015-10-31	-327.77	cf8	2020-10-29 19:03:04.601567	2020-10-29 19:03:04.601567
354	5	4	11	2	\N	2015-10-31	-124.00	528	2020-10-29 19:03:04.60323	2020-10-29 19:03:04.60323
355	6	2	2	1	\N	2015-10-31	9.29	15b	2020-10-29 19:03:04.604779	2020-10-29 19:03:04.604779
356	5	1	5	2	\N	2015-10-31	-28.11	439	2020-10-29 19:03:04.606219	2020-10-29 19:03:04.606219
357	5	1	5	2	\N	2015-10-31	-81.27	320	2020-10-29 19:03:04.607721	2020-10-29 19:03:04.607721
358	1	1	-1	2	\N	2015-10-31	-25.00	dcd	2020-10-29 19:03:04.609812	2020-10-29 19:03:04.609812
359	1	1	-1	2	\N	2015-10-31	-34.00	5d7	2020-10-29 19:03:04.61167	2020-10-29 19:03:04.61167
360	1	1	-1	2	\N	2015-10-31	-16.00	6ef	2020-10-29 19:03:04.613476	2020-10-29 19:03:04.613476
361	2	1	5	1	\N	2015-09-01	0.00	d23	2020-10-29 19:03:04.615579	2020-10-29 19:03:04.615579
362	2	10	51	3	\N	2015-09-01	-3500.00	c06	2020-10-29 19:03:04.617356	2020-10-29 19:03:04.617356
363	5	1	5	2	\N	2015-09-01	-123.40	e7e	2020-10-29 19:03:04.618971	2020-10-29 19:03:04.618971
364	5	4	13	2	\N	2015-09-01	-49.90	97a	2020-10-29 19:03:04.620585	2020-10-29 19:03:04.620585
365	5	1	5	2	\N	2015-09-01	-50.00	bfa	2020-10-29 19:03:04.622249	2020-10-29 19:03:04.622249
366	5	10	51	4	\N	2015-09-01	3000.00	ec4	2020-10-29 19:03:04.623831	2020-10-29 19:03:04.623831
367	5	4	10	2	\N	2015-09-01	-397.40	297	2020-10-29 19:03:04.625507	2020-10-29 19:03:04.625507
368	5	10	51	3	\N	2015-09-01	-1500.00	e85	2020-10-29 19:03:04.627319	2020-10-29 19:03:04.627319
369	6	10	51	4	\N	2015-09-01	1500.00	e85	2020-10-29 19:03:04.628876	2020-10-29 19:03:04.628876
370	6	10	51	4	\N	2015-09-01	3500.00	c06	2020-10-29 19:03:04.630275	2020-10-29 19:03:04.630275
371	1	1	7	2	\N	2015-09-02	-3.85	0e8	2020-10-29 19:03:04.631682	2020-10-29 19:03:04.631682
372	1	1	4	2	\N	2015-09-02	-5.50	ce5	2020-10-29 19:03:04.633136	2020-10-29 19:03:04.633136
373	1	9	-1	2	\N	2015-09-02	-100.00	af8	2020-10-29 19:03:04.634442	2020-10-29 19:03:04.634442
374	6	2	-1	1	\N	2015-09-01	44.11	15b	2020-10-29 19:03:04.635772	2020-10-29 19:03:04.635772
375	5	1	5	2	\N	2015-09-02	-44.98	6ee	2020-10-29 19:03:04.637119	2020-10-29 19:03:04.637119
376	5	5	20	2	\N	2015-09-02	-43.00	139	2020-10-29 19:03:04.638302	2020-10-29 19:03:04.638302
377	5	5	20	2	\N	2015-09-04	-78.40	035	2020-10-29 19:03:04.639936	2020-10-29 19:03:04.639936
378	2	5	18	2	\N	2015-09-04	-55.23	015	2020-10-29 19:03:04.641252	2020-10-29 19:03:04.641252
379	2	4	15	2	\N	2015-09-04	-111.88	efa	2020-10-29 19:03:04.642641	2020-10-29 19:03:04.642641
380	2	4	15	2	\N	2015-09-04	-40.06	efa	2020-10-29 19:03:04.644271	2020-10-29 19:03:04.644271
381	1	1	4	2	\N	2015-09-03	-1.60	786	2020-10-29 19:03:04.645687	2020-10-29 19:03:04.645687
382	1	1	7	2	\N	2015-09-04	-13.52	9de	2020-10-29 19:03:04.647177	2020-10-29 19:03:04.647177
383	5	1	5	2	\N	2015-09-07	-12.94	9d8	2020-10-29 19:03:04.648651	2020-10-29 19:03:04.648651
384	5	1	5	2	\N	2015-09-05	-40.21	adf	2020-10-29 19:03:04.650187	2020-10-29 19:03:04.650187
385	1	1	6	2	\N	2015-09-05	-20.00	45e	2020-10-29 19:03:04.651623	2020-10-29 19:03:04.651623
386	1	1	4	2	\N	2015-09-05	-12.70	04b	2020-10-29 19:03:04.653086	2020-10-29 19:03:04.653086
387	1	9	-1	2	\N	2015-09-06	-5.00	aa1	2020-10-29 19:03:04.654459	2020-10-29 19:03:04.654459
388	1	1	6	2	\N	2015-09-05	-50.00	f9d	2020-10-29 19:03:04.655897	2020-10-29 19:03:04.655897
389	5	9	45	2	\N	2015-09-08	-600.00	3b7	2020-10-29 19:03:04.657533	2020-10-29 19:03:04.657533
390	5	2	3	4	\N	2015-09-08	105.70	933	2020-10-29 19:03:04.659141	2020-10-29 19:03:04.659141
391	5	2	3	4	\N	2015-09-08	105.70	933	2020-10-29 19:03:04.660882	2020-10-29 19:03:04.660882
392	2	9	45	2	\N	2015-09-08	-45.00	d45	2020-10-29 19:03:04.662363	2020-10-29 19:03:04.662363
393	5	2	2	1	\N	2015-09-09	19.90	938	2020-10-29 19:03:04.663968	2020-10-29 19:03:04.663968
394	5	4	10	2	\N	2015-09-10	-9.93	b2e	2020-10-29 19:03:04.665509	2020-10-29 19:03:04.665509
395	5	1	5	2	\N	2015-09-10	-90.39	00d	2020-10-29 19:03:04.667061	2020-10-29 19:03:04.667061
396	1	8	37	2	\N	2015-09-10	-1.00	67f	2020-10-29 19:03:04.668903	2020-10-29 19:03:04.668903
397	1	1	4	2	\N	2015-09-10	-1.60	ea5	2020-10-29 19:03:04.670308	2020-10-29 19:03:04.670308
398	1	1	7	2	\N	2015-09-10	-2.45	756	2020-10-29 19:03:04.671689	2020-10-29 19:03:04.671689
399	1	1	7	2	\N	2015-09-10	-10.39	b98	2020-10-29 19:03:04.673198	2020-10-29 19:03:04.673198
400	1	8	37	2	\N	2015-09-10	-27.70	074	2020-10-29 19:03:04.674916	2020-10-29 19:03:04.674916
401	1	9	45	2	\N	2015-09-09	-359.85	d41	2020-10-29 19:03:04.676611	2020-10-29 19:03:04.676611
402	2	6	24	2	\N	2015-09-11	-99.90	c52	2020-10-29 19:03:04.678658	2020-10-29 19:03:04.678658
403	2	5	18	2	\N	2015-09-11	-39.99	b51	2020-10-29 19:03:04.680289	2020-10-29 19:03:04.680289
404	2	8	38	2	\N	2015-09-11	-30.00	074	2020-10-29 19:03:04.682525	2020-10-29 19:03:04.682525
405	2	8	38	2	\N	2015-09-11	-5.60	8b8	2020-10-29 19:03:04.684261	2020-10-29 19:03:04.684261
406	1	1	-1	2	\N	2015-09-12	-17.44	283	2020-10-29 19:03:04.685942	2020-10-29 19:03:04.685942
407	5	1	6	2	\N	2015-09-13	-69.00	2fd	2020-10-29 19:03:04.687654	2020-10-29 19:03:04.687654
408	1	9	45	2	\N	2015-09-12	-20.00	ec8	2020-10-29 19:03:04.689216	2020-10-29 19:03:04.689216
409	5	1	5	2	\N	2015-09-13	-14.38	237	2020-10-29 19:03:04.690924	2020-10-29 19:03:04.690924
410	2	4	13	2	\N	2015-09-14	-44.99	206	2020-10-29 19:03:04.692412	2020-10-29 19:03:04.692412
411	2	4	15	2	\N	2015-09-14	-3.60	9b2	2020-10-29 19:03:04.694918	2020-10-29 19:03:04.694918
412	2	6	24	2	\N	2015-09-12	-89.98	b88	2020-10-29 19:03:04.696943	2020-10-29 19:03:04.696943
413	2	9	-1	2	\N	2015-09-12	-80.00	9da	2020-10-29 19:03:04.698436	2020-10-29 19:03:04.698436
414	5	9	44	2	\N	2015-09-12	-50.00	400	2020-10-29 19:03:04.699999	2020-10-29 19:03:04.699999
415	5	1	5	2	\N	2015-09-12	-55.06	e7e	2020-10-29 19:03:04.701447	2020-10-29 19:03:04.701447
416	5	4	12	2	\N	2015-09-15	-185.33	ccf	2020-10-29 19:03:04.702902	2020-10-29 19:03:04.702902
417	2	1	6	2	\N	2015-09-15	-32.90	a66	2020-10-29 19:03:04.704389	2020-10-29 19:03:04.704389
418	1	1	4	2	\N	2015-09-14	-1.50	60a	2020-10-29 19:03:04.705835	2020-10-29 19:03:04.705835
419	1	1	4	2	\N	2015-09-14	-8.49	996	2020-10-29 19:03:04.707513	2020-10-29 19:03:04.707513
420	1	2	2	1	\N	2015-09-14	200.81	227	2020-10-29 19:03:04.709046	2020-10-29 19:03:04.709046
421	1	1	7	2	\N	2015-09-16	-16.89	9de	2020-10-29 19:03:04.710588	2020-10-29 19:03:04.710588
422	1	1	7	2	\N	2015-09-16	-5.34	51a	2020-10-29 19:03:04.712164	2020-10-29 19:03:04.712164
423	5	1	5	2	\N	2015-09-16	-78.74	e5f	2020-10-29 19:03:04.713672	2020-10-29 19:03:04.713672
424	2	9	-1	2	\N	2015-09-16	-35.00	9da	2020-10-29 19:03:04.71514	2020-10-29 19:03:04.71514
425	5	1	5	2	\N	2015-09-16	-11.76	fa5	2020-10-29 19:03:04.716734	2020-10-29 19:03:04.716734
426	1	1	4	2	\N	2015-09-16	-1.60	870	2020-10-29 19:03:04.718192	2020-10-29 19:03:04.718192
427	2	1	5	2	\N	2015-09-19	-3.87	473	2020-10-29 19:03:04.71965	2020-10-29 19:03:04.71965
428	1	5	18	2	\N	2015-09-19	-11.79	3cd	2020-10-29 19:03:04.721167	2020-10-29 19:03:04.721167
429	5	5	18	2	\N	2015-09-19	-98.97	484	2020-10-29 19:03:04.722755	2020-10-29 19:03:04.722755
430	5	1	5	2	\N	2015-09-19	-19.93	27e	2020-10-29 19:03:04.724331	2020-10-29 19:03:04.724331
431	1	5	22	2	\N	2015-09-19	-35.00	09f	2020-10-29 19:03:04.725703	2020-10-29 19:03:04.725703
432	5	1	5	2	\N	2015-09-19	-7.67	660	2020-10-29 19:03:04.727523	2020-10-29 19:03:04.727523
433	5	1	5	2	\N	2015-09-19	-18.97	660	2020-10-29 19:03:04.728901	2020-10-29 19:03:04.728901
434	2	1	5	2	\N	2015-09-20	-17.00	1a7	2020-10-29 19:03:04.73024	2020-10-29 19:03:04.73024
435	2	1	5	2	\N	2015-09-20	-70.00	4a7	2020-10-29 19:03:04.731584	2020-10-29 19:03:04.731584
436	5	10	51	4	\N	2015-09-21	900.00	786	2020-10-29 19:03:04.733014	2020-10-29 19:03:04.733014
437	5	1	5	2	\N	2015-09-21	-26.60	6ee	2020-10-29 19:03:04.734379	2020-10-29 19:03:04.734379
438	2	1	6	2	\N	2015-09-22	-35.00	dc6	2020-10-29 19:03:04.735711	2020-10-29 19:03:04.735711
439	5	5	20	2	\N	2015-09-22	-49.99	cd1	2020-10-29 19:03:04.73743	2020-10-29 19:03:04.73743
440	5	6	24	2	\N	2015-09-22	-24.00	e34	2020-10-29 19:03:04.738745	2020-10-29 19:03:04.738745
441	5	5	20	2	\N	2015-09-22	-51.00	1a9	2020-10-29 19:03:04.740081	2020-10-29 19:03:04.740081
442	2	1	6	2	\N	2015-09-23	-41.00	362	2020-10-29 19:03:04.741424	2020-10-29 19:03:04.741424
443	5	6	24	2	\N	2015-09-23	-9.00	5a6	2020-10-29 19:03:04.742777	2020-10-29 19:03:04.742777
444	5	1	5	2	\N	2015-09-23	-13.96	646	2020-10-29 19:03:04.744554	2020-10-29 19:03:04.744554
445	5	1	5	2	\N	2015-09-21	-9.40	568	2020-10-29 19:03:04.746036	2020-10-29 19:03:04.746036
446	1	1	7	2	\N	2015-09-24	-8.92	9de	2020-10-29 19:03:04.74764	2020-10-29 19:03:04.74764
447	1	4	15	2	\N	2015-09-20	-21.00	ceb	2020-10-29 19:03:04.749028	2020-10-29 19:03:04.749028
448	1	8	42	2	\N	2015-09-24	-32.00	04a	2020-10-29 19:03:04.750295	2020-10-29 19:03:04.750295
449	1	8	42	2	\N	2015-09-24	-29.00	631	2020-10-29 19:03:04.751579	2020-10-29 19:03:04.751579
450	1	2	1	1	\N	2015-09-24	8400.05	166	2020-10-29 19:03:04.752894	2020-10-29 19:03:04.752894
451	1	1	5	2	\N	2015-09-27	-12.34	568	2020-10-29 19:03:04.754212	2020-10-29 19:03:04.754212
452	5	8	40	2	\N	2015-09-25	-146.93	290	2020-10-29 19:03:04.755446	2020-10-29 19:03:04.755446
453	5	1	5	2	\N	2015-09-25	-2.79	1eb	2020-10-29 19:03:04.756663	2020-10-29 19:03:04.756663
454	5	5	20	2	\N	2015-09-28	-17.59	b67	2020-10-29 19:03:04.757919	2020-10-29 19:03:04.757919
455	5	5	19	2	\N	2015-09-26	-330.00	21f	2020-10-29 19:03:04.759176	2020-10-29 19:03:04.759176
456	5	2	2	1	\N	2015-09-25	27.90	6fc	2020-10-29 19:03:04.760745	2020-10-29 19:03:04.760745
457	5	10	51	3	\N	2015-09-27	-1000.00	03c	2020-10-29 19:03:04.762236	2020-10-29 19:03:04.762236
458	6	10	51	4	\N	2015-09-27	1000.00	03c	2020-10-29 19:03:04.763517	2020-10-29 19:03:04.763517
459	1	10	51	3	\N	2015-09-28	-500.00	c1f	2020-10-29 19:03:04.764862	2020-10-29 19:03:04.764862
460	1	10	51	3	\N	2015-09-28	-1500.00	615	2020-10-29 19:03:04.766156	2020-10-29 19:03:04.766156
461	1	10	51	3	\N	2015-09-28	-1500.00	686	2020-10-29 19:03:04.767371	2020-10-29 19:03:04.767371
462	3	10	51	4	\N	2015-09-28	200.00	f31	2020-10-29 19:03:04.768596	2020-10-29 19:03:04.768596
463	3	10	51	4	\N	2015-09-28	4000.00	3ee	2020-10-29 19:03:04.769836	2020-10-29 19:03:04.769836
464	1	10	51	3	\N	2015-09-28	-200.00	c38	2020-10-29 19:03:04.771235	2020-10-29 19:03:04.771235
465	1	10	51	3	\N	2015-09-28	-4000.00	010	2020-10-29 19:03:04.772567	2020-10-29 19:03:04.772567
466	6	10	51	4	\N	2015-09-28	1500.00	217	2020-10-29 19:03:04.773984	2020-10-29 19:03:04.773984
467	2	1	6	2	\N	2015-09-25	-29.00	895	2020-10-29 19:03:04.775402	2020-10-29 19:03:04.775402
468	2	8	38	2	\N	2015-09-24	-30.00	074	2020-10-29 19:03:04.776884	2020-10-29 19:03:04.776884
469	5	4	13	2	\N	2015-09-28	-49.90	3e1	2020-10-29 19:03:04.778342	2020-10-29 19:03:04.778342
470	2	4	15	2	\N	2015-09-29	-40.60	efa	2020-10-29 19:03:04.779756	2020-10-29 19:03:04.779756
471	1	1	7	2	\N	2015-09-29	-8.82	9de	2020-10-29 19:03:04.781189	2020-10-29 19:03:04.781189
472	1	1	7	2	\N	2015-09-29	-3.85	ec9	2020-10-29 19:03:04.782544	2020-10-29 19:03:04.782544
473	2	2	1	1	\N	2015-09-29	6500.60	51d	2020-10-29 19:03:04.783878	2020-10-29 19:03:04.783878
474	2	10	51	3	\N	2015-09-29	-1500.00	693	2020-10-29 19:03:04.785398	2020-10-29 19:03:04.785398
475	5	10	51	4	\N	2015-09-29	1500.00	693	2020-10-29 19:03:04.78666	2020-10-29 19:03:04.78666
476	1	4	14	2	\N	2015-09-29	-68.00	c5e	2020-10-29 19:03:04.787848	2020-10-29 19:03:04.787848
477	1	9	45	2	\N	2015-09-29	-5.00	cb5	2020-10-29 19:03:04.789085	2020-10-29 19:03:04.789085
478	1	1	5	2	\N	2015-09-29	-21.79	2f1	2020-10-29 19:03:04.790311	2020-10-29 19:03:04.790311
479	1	1	7	2	\N	2015-09-29	-24.00	a93	2020-10-29 19:03:04.791934	2020-10-29 19:03:04.791934
480	5	2	3	4	\N	2015-11-01	1500.00	591	2020-10-29 19:03:04.793353	2020-10-29 19:03:04.793353
481	1	8	38	2	\N	2015-11-01	-64.00	912	2020-10-29 19:03:04.794777	2020-10-29 19:03:04.794777
482	5	8	42	2	\N	2015-11-03	-23.00	26b	2020-10-29 19:03:04.796046	2020-10-29 19:03:04.796046
483	5	5	20	2	\N	2015-11-03	-25.80	879	2020-10-29 19:03:04.797263	2020-10-29 19:03:04.797263
484	2	9	-1	2	\N	2015-11-03	-12.00	6f3	2020-10-29 19:03:04.798399	2020-10-29 19:03:04.798399
485	5	9	45	2	\N	2015-11-03	-48.00	6e0	2020-10-29 19:03:04.799549	2020-10-29 19:03:04.799549
486	1	8	42	2	\N	2015-11-05	-21.00	4e6	2020-10-29 19:03:04.800708	2020-10-29 19:03:04.800708
487	1	1	7	2	\N	2015-11-05	-5.69	b98	2020-10-29 19:03:04.801876	2020-10-29 19:03:04.801876
488	5	8	39	2	\N	2015-11-05	-20.00	dbe	2020-10-29 19:03:04.803085	2020-10-29 19:03:04.803085
489	5	5	19	2	\N	2015-11-05	-330.00	e6c	2020-10-29 19:03:04.804373	2020-10-29 19:03:04.804373
490	1	8	37	2	\N	2015-11-05	-3.70	ec9	2020-10-29 19:03:04.805789	2020-10-29 19:03:04.805789
491	5	8	40	2	\N	2015-11-07	-14.99	021	2020-10-29 19:03:04.807171	2020-10-29 19:03:04.807171
492	5	1	5	2	\N	2015-11-07	-60.02	39a	2020-10-29 19:03:04.808511	2020-10-29 19:03:04.808511
493	5	8	40	2	\N	2015-11-07	-59.99	499	2020-10-29 19:03:04.809995	2020-10-29 19:03:04.809995
494	5	9	45	2	\N	2015-11-07	-14.90	38a	2020-10-29 19:03:04.811469	2020-10-29 19:03:04.811469
495	2	1	-1	2	\N	2015-11-05	-11.00	ee6	2020-10-29 19:03:04.813635	2020-10-29 19:03:04.813635
496	2	6	24	2	\N	2015-11-07	-445.79	beb	2020-10-29 19:03:04.815487	2020-10-29 19:03:04.815487
497	5	1	5	2	\N	2015-11-08	-24.62	e5f	2020-10-29 19:03:04.816954	2020-10-29 19:03:04.816954
498	2	6	24	1	\N	2015-11-09	291.86	ed4	2020-10-29 19:03:04.818286	2020-10-29 19:03:04.818286
499	2	6	24	2	\N	2015-11-09	-25.00	8fc	2020-10-29 19:03:04.819567	2020-10-29 19:03:04.819567
500	2	5	18	2	\N	2015-11-09	-39.46	846	2020-10-29 19:03:04.821172	2020-10-29 19:03:04.821172
501	1	1	6	2	\N	2015-11-11	-5.00	946	2020-10-29 19:03:04.822434	2020-10-29 19:03:04.822434
502	1	1	-1	2	\N	2015-11-11	-10.00	a29	2020-10-29 19:03:04.823706	2020-10-29 19:03:04.823706
503	5	8	40	2	\N	2015-11-10	-120.40	a6f	2020-10-29 19:03:04.824962	2020-10-29 19:03:04.824962
504	5	1	5	2	\N	2015-11-07	-10.93	2f1	2020-10-29 19:03:04.826849	2020-10-29 19:03:04.826849
505	1	5	22	2	\N	2015-11-09	-40.00	684	2020-10-29 19:03:04.828592	2020-10-29 19:03:04.828592
506	1	1	6	2	\N	2015-11-11	-43.00	a58	2020-10-29 19:03:04.830041	2020-10-29 19:03:04.830041
507	1	1	4	2	\N	2015-11-10	-4.89	130	2020-10-29 19:03:04.831506	2020-10-29 19:03:04.831506
508	1	9	-1	2	\N	2015-11-11	-2.00	051	2020-10-29 19:03:04.833046	2020-10-29 19:03:04.833046
509	1	5	18	2	\N	2015-11-09	-80.63	007	2020-10-29 19:03:04.834472	2020-10-29 19:03:04.834472
510	1	8	38	2	\N	2015-11-11	-26.40	074	2020-10-29 19:03:04.835934	2020-10-29 19:03:04.835934
511	1	1	5	2	\N	2015-11-12	-7.90	2f1	2020-10-29 19:03:04.838658	2020-10-29 19:03:04.838658
512	1	1	-1	2	\N	2015-11-12	-143.75	2a2	2020-10-29 19:03:04.840936	2020-10-29 19:03:04.840936
513	1	6	24	2	\N	2015-11-12	-19.99	e57	2020-10-29 19:03:04.842384	2020-10-29 19:03:04.842384
514	3	9	-1	3	\N	2015-11-12	-1000.00	860	2020-10-29 19:03:04.844819	2020-10-29 19:03:04.844819
515	1	9	-1	4	\N	2015-11-12	1000.00	860	2020-10-29 19:03:04.84735	2020-10-29 19:03:04.84735
516	5	8	40	2	\N	2015-11-15	-150.29	a4e	2020-10-29 19:03:04.849159	2020-10-29 19:03:04.849159
517	1	1	6	2	\N	2015-11-13	-19.00	69c	2020-10-29 19:03:04.851006	2020-10-29 19:03:04.851006
518	1	1	-1	2	\N	2015-11-13	-36.00	c36	2020-10-29 19:03:04.852913	2020-10-29 19:03:04.852913
519	1	1	4	2	\N	2015-11-15	-2.29	4d2	2020-10-29 19:03:04.85457	2020-10-29 19:03:04.85457
520	2	2	2	1	\N	2015-11-16	700.00	848	2020-10-29 19:03:04.856413	2020-10-29 19:03:04.856413
521	2	1	5	2	\N	2015-11-16	-5.90	ecd	2020-10-29 19:03:04.858319	2020-10-29 19:03:04.858319
522	2	4	13	2	\N	2015-11-16	-19.99	f2b	2020-10-29 19:03:04.860591	2020-10-29 19:03:04.860591
523	2	10	51	3	\N	2015-11-16	-500.00	968	2020-10-29 19:03:04.862144	2020-10-29 19:03:04.862144
524	4	10	51	4	\N	2015-11-16	500.00	968	2020-10-29 19:03:04.863461	2020-10-29 19:03:04.863461
525	2	1	6	2	\N	2015-11-17	-44.40	111	2020-10-29 19:03:04.864713	2020-10-29 19:03:04.864713
526	5	1	5	2	\N	2015-11-17	-6.84	ea2	2020-10-29 19:03:04.866053	2020-10-29 19:03:04.866053
527	5	1	5	2	\N	2015-11-18	-73.80	6ee	2020-10-29 19:03:04.867433	2020-10-29 19:03:04.867433
528	5	1	5	2	\N	2015-11-18	-16.19	141	2020-10-29 19:03:04.868906	2020-10-29 19:03:04.868906
529	5	5	19	2	\N	2015-11-19	-200.00	ed1	2020-10-29 19:03:04.870349	2020-10-29 19:03:04.870349
530	5	1	5	2	\N	2015-11-19	-12.70	0cf	2020-10-29 19:03:04.871784	2020-10-29 19:03:04.871784
531	5	1	5	2	\N	2015-11-19	-6.30	f13	2020-10-29 19:03:04.873201	2020-10-29 19:03:04.873201
532	5	5	20	2	\N	2015-11-20	-110.30	9ec	2020-10-29 19:03:04.874627	2020-10-29 19:03:04.874627
533	2	5	20	2	\N	2015-11-20	-39.90	3bb	2020-10-29 19:03:04.876283	2020-10-29 19:03:04.876283
534	5	6	24	2	\N	2015-11-20	-16.00	ef4	2020-10-29 19:03:04.87788	2020-10-29 19:03:04.87788
535	2	1	5	2	\N	2015-11-20	-3.20	6a9	2020-10-29 19:03:04.879606	2020-10-29 19:03:04.879606
536	2	8	41	2	\N	2015-11-21	-20.00	6da	2020-10-29 19:03:04.881245	2020-10-29 19:03:04.881245
537	2	1	5	2	\N	2015-11-21	-9.32	ebb	2020-10-29 19:03:04.882715	2020-10-29 19:03:04.882715
538	2	9	-1	2	\N	2015-11-21	-39.00	718	2020-10-29 19:03:04.884218	2020-10-29 19:03:04.884218
539	5	5	20	2	\N	2015-11-23	-35.47	13a	2020-10-29 19:03:04.88558	2020-10-29 19:03:04.88558
540	2	1	5	2	\N	2015-11-23	-10.77	b28	2020-10-29 19:03:04.887064	2020-10-29 19:03:04.887064
541	5	1	5	2	\N	2015-11-23	-9.03	ea2	2020-10-29 19:03:04.888404	2020-10-29 19:03:04.888404
542	2	8	38	2	\N	2015-11-23	-50.00	074	2020-10-29 19:03:04.889846	2020-10-29 19:03:04.889846
543	2	1	5	2	\N	2015-11-26	-7.98	e7f	2020-10-29 19:03:04.891368	2020-10-29 19:03:04.891368
544	2	1	5	2	\N	2015-11-26	-3.90	ecd	2020-10-29 19:03:04.893056	2020-10-29 19:03:04.893056
545	5	1	5	2	\N	2015-11-26	-19.17	200	2020-10-29 19:03:04.894607	2020-10-29 19:03:04.894607
546	5	5	20	2	\N	2015-11-27	-78.40	cc1	2020-10-29 19:03:04.896323	2020-10-29 19:03:04.896323
547	5	5	20	2	\N	2015-11-27	-21.99	a9c	2020-10-29 19:03:04.89805	2020-10-29 19:03:04.89805
548	5	5	18	2	\N	2015-11-27	-39.17	846	2020-10-29 19:03:04.90016	2020-10-29 19:03:04.90016
549	5	1	5	2	\N	2015-11-28	-54.97	497	2020-10-29 19:03:04.901542	2020-10-29 19:03:04.901542
550	1	1	4	2	\N	2015-11-27	-2.00	f60	2020-10-29 19:03:04.902958	2020-10-29 19:03:04.902958
551	1	1	-1	2	\N	2015-11-28	-17.00	615	2020-10-29 19:03:04.90442	2020-10-29 19:03:04.90442
552	1	1	-1	2	\N	2015-11-21	-20.00	6be	2020-10-29 19:03:04.905882	2020-10-29 19:03:04.905882
553	1	1	-1	2	\N	2015-11-21	-68.00	ac1	2020-10-29 19:03:04.907555	2020-10-29 19:03:04.907555
554	1	1	-1	2	\N	2015-11-21	-44.00	777	2020-10-29 19:03:04.909062	2020-10-29 19:03:04.909062
555	1	1	4	2	\N	2015-11-21	-18.95	534	2020-10-29 19:03:04.910836	2020-10-29 19:03:04.910836
556	1	1	7	2	\N	2015-11-25	-2.45	044	2020-10-29 19:03:04.912811	2020-10-29 19:03:04.912811
557	1	1	5	2	\N	2015-11-25	-10.04	568	2020-10-29 19:03:04.914185	2020-10-29 19:03:04.914185
558	5	1	5	2	\N	2015-11-25	-11.13	568	2020-10-29 19:03:04.915469	2020-10-29 19:03:04.915469
559	5	1	5	2	\N	2015-11-25	-64.39	e5f	2020-10-29 19:03:04.917409	2020-10-29 19:03:04.917409
560	1	1	4	2	\N	2015-11-25	-35.28	178	2020-10-29 19:03:04.919136	2020-10-29 19:03:04.919136
561	1	2	1	1	\N	2015-11-27	7267.40	2cc	2020-10-29 19:03:04.920979	2020-10-29 19:03:04.920979
562	1	10	51	3	\N	2015-11-28	-500.00	47c	2020-10-29 19:03:04.922927	2020-10-29 19:03:04.922927
563	1	10	51	3	\N	2015-11-28	-1850.00	ed5	2020-10-29 19:03:04.924887	2020-10-29 19:03:04.924887
564	1	10	51	3	\N	2015-11-28	-1500.00	779	2020-10-29 19:03:04.926436	2020-10-29 19:03:04.926436
565	6	10	51	4	\N	2015-11-28	1500.00	779	2020-10-29 19:03:04.928865	2020-10-29 19:03:04.928865
566	1	8	38	2	\N	2015-11-28	-46.00	912	2020-10-29 19:03:04.9311	2020-10-29 19:03:04.9311
567	2	2	1	1	\N	2015-11-28	5266.94	e3e	2020-10-29 19:03:04.932505	2020-10-29 19:03:04.932505
568	2	10	51	3	\N	2015-11-28	-1500.00	247	2020-10-29 19:03:04.933867	2020-10-29 19:03:04.933867
569	6	10	51	4	\N	2015-11-28	1500.00	b81	2020-10-29 19:03:04.935124	2020-10-29 19:03:04.935124
570	2	10	51	3	\N	2015-11-28	-1500.00	c04	2020-10-29 19:03:04.936344	2020-10-29 19:03:04.936344
571	5	10	51	4	\N	2015-11-28	1500.00	779	2020-10-29 19:03:04.937875	2020-10-29 19:03:04.937875
572	2	4	15	2	\N	2015-11-28	-42.54	9d8	2020-10-29 19:03:04.939269	2020-10-29 19:03:04.939269
573	2	10	51	3	\N	2015-11-29	-1500.00	7ab	2020-10-29 19:03:04.941029	2020-10-29 19:03:04.941029
574	4	10	51	4	\N	2015-11-29	1500.00	7ab	2020-10-29 19:03:04.942399	2020-10-29 19:03:04.942399
575	5	4	10	2	\N	2015-11-29	-327.77	09a	2020-10-29 19:03:04.944231	2020-10-29 19:03:04.944231
576	5	4	12	2	\N	2015-11-29	-126.36	424	2020-10-29 19:03:04.945644	2020-10-29 19:03:04.945644
577	5	4	11	2	\N	2015-11-29	-99.00	303	2020-10-29 19:03:04.946993	2020-10-29 19:03:04.946993
578	2	5	18	2	\N	2015-11-30	-23.57	6d2	2020-10-29 19:03:04.948253	2020-10-29 19:03:04.948253
579	2	1	5	2	\N	2015-11-30	-6.50	ecd	2020-10-29 19:03:04.949554	2020-10-29 19:03:04.949554
580	5	1	5	2	\N	2015-11-30	0.00	349	2020-10-29 19:03:04.950954	2020-10-29 19:03:04.950954
581	1	8	41	2	\N	2015-11-30	-5.00	e73	2020-10-29 19:03:04.952312	2020-10-29 19:03:04.952312
582	1	1	4	2	\N	2015-11-30	-2.00	f60	2020-10-29 19:03:04.953787	2020-10-29 19:03:04.953787
583	1	9	45	2	\N	2015-11-30	-50.00	933	2020-10-29 19:03:04.955381	2020-10-29 19:03:04.955381
584	1	9	45	2	\N	2015-11-30	-20.00	d9b	2020-10-29 19:03:04.956691	2020-10-29 19:03:04.956691
585	1	10	51	3	\N	2015-11-30	-3500.00	c59	2020-10-29 19:03:04.958123	2020-10-29 19:03:04.958123
586	3	10	51	4	\N	2015-11-30	3500.00	c59	2020-10-29 19:03:04.95947	2020-10-29 19:03:04.95947
587	5	10	51	4	\N	2015-12-02	1500.00	785	2020-10-29 19:03:04.961381	2020-10-29 19:03:04.961381
588	5	1	5	2	\N	2015-12-01	-69.53	6ee	2020-10-29 19:03:04.962794	2020-10-29 19:03:04.962794
589	5	5	20	2	\N	2015-12-01	-25.97	e23	2020-10-29 19:03:04.964337	2020-10-29 19:03:04.964337
590	2	4	15	2	\N	2015-12-01	-44.51	aa9	2020-10-29 19:03:04.965657	2020-10-29 19:03:04.965657
591	2	9	45	2	\N	2015-12-03	-70.10	7b5	2020-10-29 19:03:04.967015	2020-10-29 19:03:04.967015
592	5	6	24	2	\N	2015-12-03	-38.90	9b6	2020-10-29 19:03:04.968344	2020-10-29 19:03:04.968344
593	5	5	20	2	\N	2015-12-03	-21.52	c7f	2020-10-29 19:03:04.9697	2020-10-29 19:03:04.9697
594	5	6	24	2	\N	2015-12-03	-9.90	dc4	2020-10-29 19:03:04.971069	2020-10-29 19:03:04.971069
595	5	5	20	2	\N	2015-12-04	-16.06	ec3	2020-10-29 19:03:04.97235	2020-10-29 19:03:04.97235
596	2	1	5	2	\N	2015-12-04	-11.08	07d	2020-10-29 19:03:04.973634	2020-10-29 19:03:04.973634
597	2	9	45	2	\N	2015-12-03	-34.80	6d4	2020-10-29 19:03:04.974866	2020-10-29 19:03:04.974866
598	2	6	24	2	\N	2015-12-07	-6.00	af3	2020-10-29 19:03:04.976262	2020-10-29 19:03:04.976262
599	5	1	5	2	\N	2015-12-07	-24.75	88c	2020-10-29 19:03:04.977616	2020-10-29 19:03:04.977616
600	2	1	-1	2	\N	2015-12-05	-10.00	595	2020-10-29 19:03:04.978922	2020-10-29 19:03:04.978922
601	2	5	18	2	\N	2015-12-08	-11.88	b9f	2020-10-29 19:03:04.980294	2020-10-29 19:03:04.980294
602	5	5	20	2	\N	2015-12-09	-14.99	4e3	2020-10-29 19:03:04.981685	2020-10-29 19:03:04.981685
603	2	1	5	2	\N	2015-12-09	-7.60	ecd	2020-10-29 19:03:04.982977	2020-10-29 19:03:04.982977
604	5	5	20	2	\N	2015-12-10	-102.68	a64	2020-10-29 19:03:04.984404	2020-10-29 19:03:04.984404
605	1	5	20	2	\N	2015-12-09	-20.00	94b	2020-10-29 19:03:04.986391	2020-10-29 19:03:04.986391
606	1	1	4	2	\N	2015-12-10	-2.00	f60	2020-10-29 19:03:04.988185	2020-10-29 19:03:04.988185
607	1	1	4	2	\N	2015-12-05	-1.80	205	2020-10-29 19:03:04.98952	2020-10-29 19:03:04.98952
608	1	1	4	2	\N	2015-12-10	-5.40	23d	2020-10-29 19:03:04.991227	2020-10-29 19:03:04.991227
609	1	1	4	2	\N	2015-12-10	-2.00	f60	2020-10-29 19:03:04.992741	2020-10-29 19:03:04.992741
610	1	9	45	2	\N	2015-12-04	-83.75	4d2	2020-10-29 19:03:04.994411	2020-10-29 19:03:04.994411
611	1	1	6	2	\N	2015-12-10	-72.00	13c	2020-10-29 19:03:04.995867	2020-10-29 19:03:04.995867
612	1	9	45	2	\N	2015-12-14	-10.00	9be	2020-10-29 19:03:04.99727	2020-10-29 19:03:04.99727
613	1	9	45	2	\N	2015-12-04	-149.00	dfe	2020-10-29 19:03:04.999029	2020-10-29 19:03:04.999029
614	1	1	7	2	\N	2015-12-06	-3.85	756	2020-10-29 19:03:05.000515	2020-10-29 19:03:05.000515
615	1	1	5	2	\N	2015-12-02	-3.55	473	2020-10-29 19:03:05.001984	2020-10-29 19:03:05.001984
616	1	9	-1	2	\N	2015-12-13	-2.00	35a	2020-10-29 19:03:05.003369	2020-10-29 19:03:05.003369
617	1	9	45	2	\N	2015-12-12	-59.00	ba0	2020-10-29 19:03:05.004872	2020-10-29 19:03:05.004872
618	5	9	45	2	\N	2015-12-13	-100.00	8b4	2020-10-29 19:03:05.006443	2020-10-29 19:03:05.006443
619	5	1	5	2	\N	2015-12-13	-15.80	e7f	2020-10-29 19:03:05.008441	2020-10-29 19:03:05.008441
620	1	1	-1	2	\N	2015-12-12	-6.50	362	2020-10-29 19:03:05.009959	2020-10-29 19:03:05.009959
621	5	1	5	2	\N	2015-12-12	-63.14	e5f	2020-10-29 19:03:05.012579	2020-10-29 19:03:05.012579
622	5	1	5	2	\N	2015-12-05	-269.76	013	2020-10-29 19:03:05.01528	2020-10-29 19:03:05.01528
623	2	9	45	2	\N	2015-12-13	-15.00	8b4	2020-10-29 19:03:05.017876	2020-10-29 19:03:05.017876
624	2	4	13	2	\N	2015-12-13	-19.99	95e	2020-10-29 19:03:05.020023	2020-10-29 19:03:05.020023
625	1	7	33	2	\N	2015-12-09	-4.92	568	2020-10-29 19:03:05.02248	2020-10-29 19:03:05.02248
626	3	10	51	3	\N	2015-12-13	-9500.00	860	2020-10-29 19:03:05.024618	2020-10-29 19:03:05.024618
627	1	10	51	4	\N	2015-12-13	9500.00	860	2020-10-29 19:03:05.02665	2020-10-29 19:03:05.02665
628	1	9	46	2	\N	2015-12-13	-3404.36	fcb	2020-10-29 19:03:05.028786	2020-10-29 19:03:05.028786
629	5	9	45	2	\N	2015-12-14	-12.50	f50	2020-10-29 19:03:05.030916	2020-10-29 19:03:05.030916
630	5	9	45	2	\N	2015-12-15	-124.99	a84	2020-10-29 19:03:05.032998	2020-10-29 19:03:05.032998
631	2	9	45	2	\N	2015-12-15	-181.95	892	2020-10-29 19:03:05.035093	2020-10-29 19:03:05.035093
632	5	1	5	2	\N	2015-12-17	-14.65	e7e	2020-10-29 19:03:05.03719	2020-10-29 19:03:05.03719
633	2	8	38	2	\N	2015-12-17	-55.60	bcb	2020-10-29 19:03:05.039228	2020-10-29 19:03:05.039228
634	2	9	45	2	\N	2015-12-17	-7.99	fb3	2020-10-29 19:03:05.041628	2020-10-29 19:03:05.041628
635	2	9	45	2	\N	2015-12-17	-49.00	218	2020-10-29 19:03:05.043421	2020-10-29 19:03:05.043421
636	2	9	45	2	\N	2015-12-17	-100.00	385	2020-10-29 19:03:05.044723	2020-10-29 19:03:05.044723
637	5	1	5	2	\N	2015-12-18	-102.50	88c	2020-10-29 19:03:05.046037	2020-10-29 19:03:05.046037
638	2	9	45	2	\N	2015-12-18	-5.60	5b1	2020-10-29 19:03:05.047358	2020-10-29 19:03:05.047358
639	2	8	41	2	\N	2015-12-18	-17.00	35e	2020-10-29 19:03:05.04928	2020-10-29 19:03:05.04928
640	2	1	-1	2	\N	2015-12-18	-10.00	b9c	2020-10-29 19:03:05.050573	2020-10-29 19:03:05.050573
641	2	9	45	2	\N	2015-12-19	-43.56	cb1	2020-10-29 19:03:05.051796	2020-10-29 19:03:05.051796
642	5	5	20	2	\N	2015-12-19	-75.05	ab3	2020-10-29 19:03:05.053039	2020-10-29 19:03:05.053039
643	2	1	6	2	\N	2015-12-19	-24.70	da5	2020-10-29 19:03:05.054366	2020-10-29 19:03:05.054366
644	5	1	-1	2	\N	2015-12-20	-8.80	fa9	2020-10-29 19:03:05.055449	2020-10-29 19:03:05.055449
645	1	9	46	2	\N	2015-12-18	-9.00	3ac	2020-10-29 19:03:05.056582	2020-10-29 19:03:05.056582
646	1	9	45	2	\N	2015-12-18	-15.00	0e1	2020-10-29 19:03:05.057697	2020-10-29 19:03:05.057697
647	1	1	7	2	\N	2015-12-18	-10.99	615	2020-10-29 19:03:05.058797	2020-10-29 19:03:05.058797
648	1	1	-1	2	\N	2015-12-16	-19.00	570	2020-10-29 19:03:05.060127	2020-10-29 19:03:05.060127
649	1	1	4	2	\N	2015-12-17	-2.00	e1c	2020-10-29 19:03:05.06124	2020-10-29 19:03:05.06124
650	1	2	1	1	\N	2015-12-21	7751.72	e86	2020-10-29 19:03:05.062396	2020-10-29 19:03:05.062396
651	1	10	51	3	\N	2015-12-21	-1850.00	88d	2020-10-29 19:03:05.063708	2020-10-29 19:03:05.063708
652	1	10	51	3	\N	2015-12-21	-500.00	f8c	2020-10-29 19:03:05.065024	2020-10-29 19:03:05.065024
653	1	10	51	3	\N	2015-12-21	-1500.00	db2	2020-10-29 19:03:05.066234	2020-10-29 19:03:05.066234
654	6	10	51	4	\N	2015-12-21	1500.00	db2	2020-10-29 19:03:05.067417	2020-10-29 19:03:05.067417
655	1	9	45	2	\N	2015-12-21	-1400.00	ff9	2020-10-29 19:03:05.068552	2020-10-29 19:03:05.068552
656	1	9	-1	2	\N	2015-12-21	-25.00	21a	2020-10-29 19:03:05.069637	2020-10-29 19:03:05.069637
657	2	2	-1	1	\N	2015-12-21	1400.00	ff9	2020-10-29 19:03:05.070754	2020-10-29 19:03:05.070754
658	2	2	1	1	\N	2015-12-22	5236.37	e7c	2020-10-29 19:03:05.071861	2020-10-29 19:03:05.071861
659	2	10	51	3	\N	2015-12-22	-1500.00	1ba	2020-10-29 19:03:05.072953	2020-10-29 19:03:05.072953
660	5	10	51	4	\N	2015-12-22	1500.00	fb5	2020-10-29 19:03:05.074048	2020-10-29 19:03:05.074048
661	2	10	51	3	\N	2015-12-22	-1500.00	b04	2020-10-29 19:03:05.075119	2020-10-29 19:03:05.075119
662	6	10	51	4	\N	2015-12-22	1500.00	3f9	2020-10-29 19:03:05.076227	2020-10-29 19:03:05.076227
663	5	1	5	2	\N	2015-12-21	-5.50	ecd	2020-10-29 19:03:05.077302	2020-10-29 19:03:05.077302
664	2	6	24	2	\N	2015-12-22	-50.00	dfc	2020-10-29 19:03:05.078395	2020-10-29 19:03:05.078395
665	5	9	45	2	\N	2015-12-22	-32.60	5fe	2020-10-29 19:03:05.079482	2020-10-29 19:03:05.079482
666	5	4	10	2	\N	2015-12-22	-327.77	94c	2020-10-29 19:03:05.080551	2020-10-29 19:03:05.080551
667	5	4	12	2	\N	2015-12-22	-126.36	4c1	2020-10-29 19:03:05.081759	2020-10-29 19:03:05.081759
668	1	1	7	2	\N	2015-12-22	-15.09	615	2020-10-29 19:03:05.083227	2020-10-29 19:03:05.083227
669	1	1	5	2	\N	2015-12-22	-12.00	568	2020-10-29 19:03:05.084537	2020-10-29 19:03:05.084537
670	5	4	13	2	\N	2015-12-22	-49.90	bf4	2020-10-29 19:03:05.085942	2020-10-29 19:03:05.085942
671	5	8	40	2	\N	2015-12-23	-154.33	980	2020-10-29 19:03:05.087483	2020-10-29 19:03:05.087483
672	5	1	5	2	\N	2015-12-23	-6.48	ed0	2020-10-29 19:03:05.088623	2020-10-29 19:03:05.088623
673	1	1	5	2	\N	2015-12-24	-86.53	e5f	2020-10-29 19:03:05.089773	2020-10-29 19:03:05.089773
674	5	8	42	2	\N	2015-12-28	-64.00	10e	2020-10-29 19:03:05.090847	2020-10-29 19:03:05.090847
675	1	7	32	2	\N	2015-12-28	-55.00	cf0	2020-10-29 19:03:05.091904	2020-10-29 19:03:05.091904
676	1	1	-1	2	\N	2015-12-26	-60.50	5b2	2020-10-29 19:03:05.093043	2020-10-29 19:03:05.093043
677	1	1	-1	2	\N	2015-12-25	-11.98	1a5	2020-10-29 19:03:05.09453	2020-10-29 19:03:05.09453
678	5	7	27	1	\N	2015-12-28	1000.00	048	2020-10-29 19:03:05.095723	2020-10-29 19:03:05.095723
679	6	7	27	2	\N	2015-12-28	-1000.00	048	2020-10-29 19:03:05.097076	2020-10-29 19:03:05.097076
680	5	7	27	2	\N	2015-12-28	-2186.90	66c	2020-10-29 19:03:05.098419	2020-10-29 19:03:05.098419
681	5	7	27	2	\N	2015-12-28	-5.00	e11	2020-10-29 19:03:05.099812	2020-10-29 19:03:05.099812
682	1	1	5	2	\N	2015-12-24	-9.60	568	2020-10-29 19:03:05.101026	2020-10-29 19:03:05.101026
683	2	4	15	2	\N	2015-12-27	-42.13	451	2020-10-29 19:03:05.102149	2020-10-29 19:03:05.102149
684	5	4	13	2	\N	2015-12-27	-69.99	174	2020-10-29 19:03:05.103201	2020-10-29 19:03:05.103201
685	2	6	24	2	\N	2015-12-28	-39.90	a86	2020-10-29 19:03:05.104231	2020-10-29 19:03:05.104231
686	2	9	46	2	\N	2015-12-28	-3250.00	ae6	2020-10-29 19:03:05.105251	2020-10-29 19:03:05.105251
687	5	9	44	2	\N	2015-12-29	-40.00	4a3	2020-10-29 19:03:05.106254	2020-10-29 19:03:05.106254
688	5	1	5	2	\N	2015-12-29	-109.93	841	2020-10-29 19:03:05.107288	2020-10-29 19:03:05.107288
689	1	10	51	3	\N	2015-12-29	-5000.00	789	2020-10-29 19:03:05.108405	2020-10-29 19:03:05.108405
690	3	10	51	4	\N	2015-12-29	5000.00	789	2020-10-29 19:03:05.109513	2020-10-29 19:03:05.109513
691	1	9	46	2	\N	2015-12-29	-2511.00	0c1	2020-10-29 19:03:05.110714	2020-10-29 19:03:05.110714
692	1	9	46	2	\N	2015-12-29	-19.00	509	2020-10-29 19:03:05.111906	2020-10-29 19:03:05.111906
693	1	9	46	2	\N	2015-12-29	-56.90	e9c	2020-10-29 19:03:05.113006	2020-10-29 19:03:05.113006
694	1	9	46	2	\N	2015-12-29	-31.14	add	2020-10-29 19:03:05.114088	2020-10-29 19:03:05.114088
695	1	1	4	2	\N	2015-12-31	-3.30	e2e	2020-10-29 19:03:05.11523	2020-10-29 19:03:05.11523
696	1	1	-1	2	\N	2015-12-31	-8.49	ce1	2020-10-29 19:03:05.116288	2020-10-29 19:03:05.116288
697	1	1	5	2	\N	2015-12-28	-4.00	473	2020-10-29 19:03:05.117292	2020-10-29 19:03:05.117292
698	1	9	45	2	\N	2015-12-31	-25.48	da6	2020-10-29 19:03:05.11829	2020-10-29 19:03:05.11829
699	1	1	6	2	\N	2015-12-30	-8.00	45e	2020-10-29 19:03:05.119605	2020-10-29 19:03:05.119605
700	1	9	-1	2	\N	2015-12-22	-10.68	4b6	2020-10-29 19:03:05.120691	2020-10-29 19:03:05.120691
701	1	1	-1	2	\N	2015-12-30	-64.00	8be	2020-10-29 19:03:05.121715	2020-10-29 19:03:05.121715
702	1	5	18	2	\N	2015-12-30	-43.03	0ec	2020-10-29 19:03:05.122737	2020-10-29 19:03:05.122737
703	2	9	45	2	\N	2015-12-31	-32.36	22e	2020-10-29 19:03:05.124165	2020-10-29 19:03:05.124165
704	2	9	-1	2	\N	2015-12-31	-16.79	b9f	2020-10-29 19:03:05.125517	2020-10-29 19:03:05.125517
705	5	10	51	4	\N	2016-01-04	1500.00	f12	2020-10-29 19:03:05.12686	2020-10-29 19:03:05.12686
706	1	1	5	2	\N	2016-01-01	-7.80	838	2020-10-29 19:03:05.1283	2020-10-29 19:03:05.1283
707	5	8	40	2	\N	2016-01-01	-162.60	c7c	2020-10-29 19:03:05.129465	2020-10-29 19:03:05.129465
708	1	2	1	1	\N	2016-01-04	1404.00	896	2020-10-29 19:03:05.130606	2020-10-29 19:03:05.130606
709	1	10	51	3	\N	2016-01-04	-1000.00	039	2020-10-29 19:03:05.131754	2020-10-29 19:03:05.131754
710	3	10	51	4	\N	2016-01-04	1000.00	039	2020-10-29 19:03:05.132974	2020-10-29 19:03:05.132974
711	1	1	5	2	\N	2016-01-04	-2.60	473	2020-10-29 19:03:05.134149	2020-10-29 19:03:05.134149
712	1	5	18	2	\N	2016-01-07	-26.98	0ec	2020-10-29 19:03:05.13525	2020-10-29 19:03:05.13525
713	1	8	38	2	\N	2016-01-07	-49.00	912	2020-10-29 19:03:05.136387	2020-10-29 19:03:05.136387
714	1	1	7	2	\N	2016-01-07	-12.00	b98	2020-10-29 19:03:05.137514	2020-10-29 19:03:05.137514
715	1	9	45	2	\N	2016-01-05	-122.90	4cf	2020-10-29 19:03:05.138735	2020-10-29 19:03:05.138735
716	1	1	7	2	\N	2016-01-07	-2.45	756	2020-10-29 19:03:05.14004	2020-10-29 19:03:05.14004
717	2	1	5	2	\N	2016-01-03	-11.56	d32	2020-10-29 19:03:05.141228	2020-10-29 19:03:05.141228
718	2	9	46	2	\N	2016-01-02	-29.00	5c2	2020-10-29 19:03:05.14275	2020-10-29 19:03:05.14275
719	2	6	24	2	\N	2016-01-02	-49.99	e75	2020-10-29 19:03:05.144506	2020-10-29 19:03:05.144506
720	2	5	22	2	\N	2016-01-02	-79.00	9da	2020-10-29 19:03:05.145767	2020-10-29 19:03:05.145767
721	5	1	5	2	\N	2016-01-02	-53.55	20c	2020-10-29 19:03:05.147252	2020-10-29 19:03:05.147252
722	5	1	5	2	\N	2016-01-02	-6.94	8b2	2020-10-29 19:03:05.148503	2020-10-29 19:03:05.148503
723	5	8	40	2	\N	2016-01-09	-182.24	c5e	2020-10-29 19:03:05.149674	2020-10-29 19:03:05.149674
724	1	1	5	2	\N	2016-01-08	-4.45	b71	2020-10-29 19:03:05.150806	2020-10-29 19:03:05.150806
725	1	1	7	2	\N	2016-01-08	-12.42	b98	2020-10-29 19:03:05.151978	2020-10-29 19:03:05.151978
726	5	9	45	1	\N	2016-01-08	100.00	18e	2020-10-29 19:03:05.153364	2020-10-29 19:03:05.153364
727	5	1	5	2	\N	2016-01-09	-16.38	627	2020-10-29 19:03:05.154567	2020-10-29 19:03:05.154567
728	2	1	5	2	\N	2016-01-09	-6.80	f13	2020-10-29 19:03:05.15641	2020-10-29 19:03:05.15641
729	2	9	45	2	\N	2016-01-12	-87.70	800	2020-10-29 19:03:05.15765	2020-10-29 19:03:05.15765
730	2	4	13	2	\N	2016-01-12	-28.99	95e	2020-10-29 19:03:05.158923	2020-10-29 19:03:05.158923
731	5	1	5	2	\N	2016-01-09	-69.63	6ee	2020-10-29 19:03:05.160712	2020-10-29 19:03:05.160712
732	5	6	24	2	\N	2016-01-14	-54.70	62d	2020-10-29 19:03:05.162287	2020-10-29 19:03:05.162287
733	2	9	45	2	\N	2016-01-14	-29.90	fbd	2020-10-29 19:03:05.163472	2020-10-29 19:03:05.163472
734	2	6	24	1	\N	2016-01-15	50.00	04b	2020-10-29 19:03:05.164611	2020-10-29 19:03:05.164611
735	2	1	-1	2	\N	2016-01-14	-13.90	57e	2020-10-29 19:03:05.165735	2020-10-29 19:03:05.165735
736	5	5	20	2	\N	2016-01-15	-59.59	16c	2020-10-29 19:03:05.166998	2020-10-29 19:03:05.166998
737	2	5	18	2	\N	2016-01-15	-13.57	341	2020-10-29 19:03:05.169116	2020-10-29 19:03:05.169116
738	5	5	18	1	\N	2016-01-15	13.57	341	2020-10-29 19:03:05.170307	2020-10-29 19:03:05.170307
739	1	1	4	2	\N	2016-01-13	-2.00	dea	2020-10-29 19:03:05.171626	2020-10-29 19:03:05.171626
740	5	9	-1	2	\N	2016-01-17	-3.00	2e5	2020-10-29 19:03:05.172766	2020-10-29 19:03:05.172766
741	5	1	5	2	\N	2016-01-14	-10.13	568	2020-10-29 19:03:05.173972	2020-10-29 19:03:05.173972
742	5	1	5	2	\N	2016-01-13	-6.70	568	2020-10-29 19:03:05.175138	2020-10-29 19:03:05.175138
743	5	1	5	2	\N	2016-01-12	-9.46	e48	2020-10-29 19:03:05.176324	2020-10-29 19:03:05.176324
744	5	1	5	2	\N	2016-01-16	-73.29	e5f	2020-10-29 19:03:05.178486	2020-10-29 19:03:05.178486
745	1	1	5	2	\N	2016-01-11	-7.29	568	2020-10-29 19:03:05.179786	2020-10-29 19:03:05.179786
746	1	1	7	2	\N	2016-01-11	-3.85	756	2020-10-29 19:03:05.181086	2020-10-29 19:03:05.181086
747	1	1	7	2	\N	2016-01-11	-12.17	b52	2020-10-29 19:03:05.182234	2020-10-29 19:03:05.182234
748	5	1	5	2	\N	2016-01-17	-7.99	e48	2020-10-29 19:03:05.183434	2020-10-29 19:03:05.183434
749	2	1	-1	2	\N	2016-01-16	-10.00	d41	2020-10-29 19:03:05.184692	2020-10-29 19:03:05.184692
750	2	8	38	2	\N	2016-01-18	-5.60	9ee	2020-10-29 19:03:05.18597	2020-10-29 19:03:05.18597
751	2	8	38	2	\N	2016-01-18	-46.00	9dc	2020-10-29 19:03:05.187236	2020-10-29 19:03:05.187236
752	2	8	38	2	\N	2016-01-19	-7.60	9ee	2020-10-29 19:03:05.18844	2020-10-29 19:03:05.18844
753	5	1	5	2	\N	2016-01-21	-120.38	6ee	2020-10-29 19:03:05.189623	2020-10-29 19:03:05.189623
754	2	9	46	2	\N	2016-01-23	-13.00	50b	2020-10-29 19:03:05.19076	2020-10-29 19:03:05.19076
755	1	1	6	2	\N	2016-01-24	-86.00	aab	2020-10-29 19:03:05.191959	2020-10-29 19:03:05.191959
756	1	1	7	2	\N	2016-01-22	-4.40	ca8	2020-10-29 19:03:05.193208	2020-10-29 19:03:05.193208
757	1	5	22	2	\N	2016-01-23	-35.00	09f	2020-10-29 19:03:05.194591	2020-10-29 19:03:05.194591
758	1	1	7	2	\N	2016-01-21	-12.84	b98	2020-10-29 19:03:05.195933	2020-10-29 19:03:05.195933
759	1	1	7	2	\N	2016-01-22	-15.18	b98	2020-10-29 19:03:05.197212	2020-10-29 19:03:05.197212
760	5	1	5	2	\N	2016-01-20	-14.70	b3e	2020-10-29 19:03:05.198482	2020-10-29 19:03:05.198482
761	1	1	7	2	\N	2016-01-19	-2.45	756	2020-10-29 19:03:05.199716	2020-10-29 19:03:05.199716
762	5	4	13	2	\N	2016-01-25	-49.90	4a2	2020-10-29 19:03:05.201045	2020-10-29 19:03:05.201045
763	2	9	45	2	\N	2016-01-25	-24.80	288	2020-10-29 19:03:05.202247	2020-10-29 19:03:05.202247
764	2	1	5	2	\N	2016-01-25	-5.40	ecd	2020-10-29 19:03:05.203456	2020-10-29 19:03:05.203456
765	2	1	-1	2	\N	2016-01-22	-7.00	d67	2020-10-29 19:03:05.204827	2020-10-29 19:03:05.204827
766	5	1	5	2	\N	2016-01-26	-16.33	754	2020-10-29 19:03:05.20613	2020-10-29 19:03:05.20613
767	2	4	15	2	\N	2016-01-28	-42.62	46e	2020-10-29 19:03:05.207309	2020-10-29 19:03:05.207309
768	2	1	5	2	\N	2016-01-28	-8.78	e7f	2020-10-29 19:03:05.208474	2020-10-29 19:03:05.208474
769	2	1	5	2	\N	2016-01-29	-6.60	ecd	2020-10-29 19:03:05.209855	2020-10-29 19:03:05.209855
770	1	2	1	1	\N	2016-01-27	8316.05	ad5	2020-10-29 19:03:05.211358	2020-10-29 19:03:05.211358
771	1	1	6	2	\N	2016-01-30	-28.60	c65	2020-10-29 19:03:05.212693	2020-10-29 19:03:05.212693
772	1	8	37	2	\N	2016-01-30	-2.50	dd4	2020-10-29 19:03:05.214018	2020-10-29 19:03:05.214018
773	2	8	37	2	\N	2016-01-30	-4.50	dd4	2020-10-29 19:03:05.215342	2020-10-29 19:03:05.215342
774	5	7	32	2	\N	2016-01-30	-50.00	7d2	2020-10-29 19:03:05.216825	2020-10-29 19:03:05.216825
775	1	1	5	2	\N	2016-01-29	-11.33	568	2020-10-29 19:03:05.218687	2020-10-29 19:03:05.218687
776	1	1	5	2	\N	2016-01-27	-4.40	07d	2020-10-29 19:03:05.220214	2020-10-29 19:03:05.220214
777	5	1	5	2	\N	2016-01-30	-42.60	e5f	2020-10-29 19:03:05.221451	2020-10-29 19:03:05.221451
778	1	10	51	3	\N	2016-01-30	-500.00	f8c	2020-10-29 19:03:05.222756	2020-10-29 19:03:05.222756
779	1	10	51	3	\N	2016-01-30	-1500.00	29a	2020-10-29 19:03:05.224121	2020-10-29 19:03:05.224121
780	5	10	51	4	\N	2016-01-30	1500.00	29a	2020-10-29 19:03:05.225428	2020-10-29 19:03:05.225428
781	1	10	51	3	\N	2016-01-30	-1500.00	e76	2020-10-29 19:03:05.226839	2020-10-29 19:03:05.226839
782	6	10	51	4	\N	2016-01-30	1500.00	e76	2020-10-29 19:03:05.228235	2020-10-29 19:03:05.228235
783	1	10	51	3	\N	2016-01-30	-350.00	f23	2020-10-29 19:03:05.229844	2020-10-29 19:03:05.229844
784	1	10	51	3	\N	2016-01-30	-2000.00	bb3	2020-10-29 19:03:05.23114	2020-10-29 19:03:05.23114
785	3	10	51	4	\N	2016-01-30	2000.00	bb3	2020-10-29 19:03:05.232324	2020-10-29 19:03:05.232324
786	1	10	51	3	\N	2016-01-30	-500.00	ec9	2020-10-29 19:03:05.233606	2020-10-29 19:03:05.233606
787	5	10	51	4	\N	2016-01-30	500.00	ec9	2020-10-29 19:03:05.23494	2020-10-29 19:03:05.23494
788	2	2	1	1	\N	2016-01-28	4601.24	e96	2020-10-29 19:03:05.236158	2020-10-29 19:03:05.236158
789	2	10	51	3	\N	2016-01-30	-1500.00	83c	2020-10-29 19:03:05.237419	2020-10-29 19:03:05.237419
790	5	10	51	4	\N	2016-01-30	1500.00	83c	2020-10-29 19:03:05.238777	2020-10-29 19:03:05.238777
791	2	10	51	3	\N	2016-01-30	-1500.00	65b	2020-10-29 19:03:05.240177	2020-10-29 19:03:05.240177
792	6	10	51	4	\N	2016-01-30	1500.00	65b	2020-10-29 19:03:05.2414	2020-10-29 19:03:05.2414
793	2	10	51	3	\N	2016-01-30	-500.00	5b1	2020-10-29 19:03:05.242591	2020-10-29 19:03:05.242591
794	4	10	51	4	\N	2016-01-30	500.00	5b1	2020-10-29 19:03:05.243923	2020-10-29 19:03:05.243923
795	5	4	10	2	\N	2016-01-31	-420.00	297	2020-10-29 19:03:05.245308	2020-10-29 19:03:05.245308
796	5	4	12	2	\N	2016-01-31	-126.36	d41	2020-10-29 19:03:05.246636	2020-10-29 19:03:05.246636
797	5	8	40	2	\N	2016-01-31	-20.00	18e	2020-10-29 19:03:05.248041	2020-10-29 19:03:05.248041
798	1	10	51	2	\N	2016-01-30	-1500.00	d41	2020-10-29 19:03:05.249376	2020-10-29 19:03:05.249376
799	5	10	51	4	\N	2016-01-30	500.00	d41	2020-10-29 19:03:05.250704	2020-10-29 19:03:05.250704
800	6	10	51	4	\N	2016-01-30	1000.00	d41	2020-10-29 19:03:05.252196	2020-10-29 19:03:05.252196
801	5	8	40	2	\N	2016-02-05	-34.98	7aa	2020-10-29 19:03:05.253741	2020-10-29 19:03:05.253741
802	5	7	27	2	\N	2016-02-04	-11.00	651	2020-10-29 19:03:05.255197	2020-10-29 19:03:05.255197
803	5	8	40	2	\N	2016-02-05	-20.00	18e	2020-10-29 19:03:05.256782	2020-10-29 19:03:05.256782
804	5	7	27	2	\N	2016-02-03	-44.00	8c5	2020-10-29 19:03:05.258232	2020-10-29 19:03:05.258232
805	5	1	5	2	\N	2016-02-03	-84.12	639	2020-10-29 19:03:05.259637	2020-10-29 19:03:05.259637
806	5	1	5	2	\N	2016-02-03	-25.78	639	2020-10-29 19:03:05.261354	2020-10-29 19:03:05.261354
807	5	1	5	2	\N	2016-02-03	-103.77	639	2020-10-29 19:03:05.262793	2020-10-29 19:03:05.262793
808	5	4	10	2	\N	2016-02-01	-420.90	f2f	2020-10-29 19:03:05.264208	2020-10-29 19:03:05.264208
809	5	4	12	2	\N	2016-02-01	-126.36	41d	2020-10-29 19:03:05.265838	2020-10-29 19:03:05.265838
810	5	1	5	2	\N	2016-02-01	-42.62	6ee	2020-10-29 19:03:05.267366	2020-10-29 19:03:05.267366
811	5	8	40	2	\N	2016-02-02	-137.94	503	2020-10-29 19:03:05.269058	2020-10-29 19:03:05.269058
812	1	9	45	2	\N	2016-02-06	-27.00	779	2020-10-29 19:03:05.270436	2020-10-29 19:03:05.270436
813	5	1	5	2	\N	2016-02-06	-90.75	adf	2020-10-29 19:03:05.272274	2020-10-29 19:03:05.272274
814	2	1	6	2	\N	2016-02-06	-13.00	0b1	2020-10-29 19:03:05.273639	2020-10-29 19:03:05.273639
815	5	1	5	2	\N	2016-02-06	-40.00	639	2020-10-29 19:03:05.275236	2020-10-29 19:03:05.275236
816	5	1	5	2	\N	2016-02-06	-30.00	639	2020-10-29 19:03:05.276695	2020-10-29 19:03:05.276695
817	2	1	5	1	\N	2016-02-06	30.00	639	2020-10-29 19:03:05.27822	2020-10-29 19:03:05.27822
818	5	7	27	2	\N	2016-02-07	-561.90	586	2020-10-29 19:03:05.280081	2020-10-29 19:03:05.280081
819	5	7	27	2	\N	2016-02-08	-43.34	5f5	2020-10-29 19:03:05.281384	2020-10-29 19:03:05.281384
820	1	8	38	2	\N	2016-02-08	-46.00	6e8	2020-10-29 19:03:05.282745	2020-10-29 19:03:05.282745
821	1	8	38	2	\N	2016-02-08	-28.20	074	2020-10-29 19:03:05.284316	2020-10-29 19:03:05.284316
822	2	1	6	2	\N	2016-02-09	-3.50	c00	2020-10-29 19:03:05.285889	2020-10-29 19:03:05.285889
823	2	1	6	2	\N	2016-02-09	-28.00	485	2020-10-29 19:03:05.287316	2020-10-29 19:03:05.287316
824	2	1	6	2	\N	2016-02-09	-12.90	a7e	2020-10-29 19:03:05.288894	2020-10-29 19:03:05.288894
825	2	6	24	2	\N	2016-02-11	-44.99	346	2020-10-29 19:03:05.290267	2020-10-29 19:03:05.290267
826	5	1	5	2	\N	2016-02-11	-58.54	4cb	2020-10-29 19:03:05.292118	2020-10-29 19:03:05.292118
827	5	1	5	2	\N	2016-02-11	-27.93	cd0	2020-10-29 19:03:05.29375	2020-10-29 19:03:05.29375
828	2	1	6	2	\N	2016-02-11	-3.90	c00	2020-10-29 19:03:05.295649	2020-10-29 19:03:05.295649
829	2	6	24	2	\N	2016-02-11	-24.99	761	2020-10-29 19:03:05.297218	2020-10-29 19:03:05.297218
830	2	1	6	2	\N	2016-02-12	-3.90	449	2020-10-29 19:03:05.298664	2020-10-29 19:03:05.298664
831	2	1	6	2	\N	2016-02-13	-11.00	6b0	2020-10-29 19:03:05.30029	2020-10-29 19:03:05.30029
832	2	1	6	2	\N	2016-02-13	-12.00	88b	2020-10-29 19:03:05.301585	2020-10-29 19:03:05.301585
833	1	1	7	2	\N	2016-02-09	-2.00	f60	2020-10-29 19:03:05.302958	2020-10-29 19:03:05.302958
834	1	1	5	2	\N	2016-02-09	-1.50	473	2020-10-29 19:03:05.304558	2020-10-29 19:03:05.304558
835	1	1	5	2	\N	2016-02-09	-4.40	473	2020-10-29 19:03:05.306463	2020-10-29 19:03:05.306463
836	1	1	7	2	\N	2016-02-12	-14.82	474	2020-10-29 19:03:05.307835	2020-10-29 19:03:05.307835
837	5	1	5	2	\N	2016-02-13	-93.11	320	2020-10-29 19:03:05.309526	2020-10-29 19:03:05.309526
838	1	1	-1	2	\N	2016-02-12	-114.00	914	2020-10-29 19:03:05.311791	2020-10-29 19:03:05.311791
839	1	2	3	4	\N	2016-02-15	295.00	580	2020-10-29 19:03:05.314041	2020-10-29 19:03:05.314041
840	2	8	41	2	\N	2016-02-13	-20.00	06e	2020-10-29 19:03:05.315802	2020-10-29 19:03:05.315802
841	2	6	24	2	\N	2016-02-13	-53.17	359	2020-10-29 19:03:05.317537	2020-10-29 19:03:05.317537
842	5	9	46	2	\N	2016-02-14	-154.00	3c8	2020-10-29 19:03:05.319223	2020-10-29 19:03:05.319223
843	5	9	-1	2	\N	2016-02-14	-520.00	0cb	2020-10-29 19:03:05.320699	2020-10-29 19:03:05.320699
844	5	5	20	2	\N	2016-02-15	-79.87	742	2020-10-29 19:03:05.322481	2020-10-29 19:03:05.322481
845	2	1	5	2	\N	2016-02-15	-4.40	473	2020-10-29 19:03:05.323865	2020-10-29 19:03:05.323865
846	2	9	-1	2	\N	2016-02-14	-188.90	6ab	2020-10-29 19:03:05.325274	2020-10-29 19:03:05.325274
847	5	4	10	2	\N	2016-02-15	-89.00	505	2020-10-29 19:03:05.326762	2020-10-29 19:03:05.326762
848	1	2	2	1	\N	2016-02-15	43.30	9b8	2020-10-29 19:03:05.328228	2020-10-29 19:03:05.328228
849	2	9	46	2	\N	2016-02-16	-20.00	eb6	2020-10-29 19:03:05.329523	2020-10-29 19:03:05.329523
850	5	6	24	2	\N	2016-02-16	-19.90	31a	2020-10-29 19:03:05.330816	2020-10-29 19:03:05.330816
851	5	1	5	2	\N	2016-02-18	-94.12	c6b	2020-10-29 19:03:05.332291	2020-10-29 19:03:05.332291
852	2	1	5	2	\N	2016-02-18	-6.60	07d	2020-10-29 19:03:05.333526	2020-10-29 19:03:05.333526
853	2	6	24	2	\N	2016-02-18	-59.80	1f1	2020-10-29 19:03:05.33498	2020-10-29 19:03:05.33498
854	5	5	19	2	\N	2016-02-19	-300.00	1b7	2020-10-29 19:03:05.336332	2020-10-29 19:03:05.336332
855	5	1	5	2	\N	2016-02-19	-17.27	1d1	2020-10-29 19:03:05.337662	2020-10-29 19:03:05.337662
856	1	1	-1	2	\N	2016-02-20	-18.95	d7a	2020-10-29 19:03:05.338994	2020-10-29 19:03:05.338994
857	5	1	5	2	\N	2016-02-19	-9.48	5cb	2020-10-29 19:03:05.34035	2020-10-29 19:03:05.34035
858	5	1	5	2	\N	2016-02-19	-65.18	e5f	2020-10-29 19:03:05.341711	2020-10-29 19:03:05.341711
859	1	1	5	2	\N	2016-02-17	-4.38	993	2020-10-29 19:03:05.343176	2020-10-29 19:03:05.343176
860	1	1	4	2	\N	2016-02-17	-2.00	f60	2020-10-29 19:03:05.344783	2020-10-29 19:03:05.344783
861	1	1	4	2	\N	2016-02-17	-5.00	c84	2020-10-29 19:03:05.346131	2020-10-29 19:03:05.346131
862	1	1	7	2	\N	2016-02-19	-19.00	30a	2020-10-29 19:03:05.347537	2020-10-29 19:03:05.347537
863	5	1	5	2	\N	2016-02-19	-10.74	646	2020-10-29 19:03:05.348864	2020-10-29 19:03:05.348864
864	1	1	7	2	\N	2016-02-17	-14.65	1ee	2020-10-29 19:03:05.350408	2020-10-29 19:03:05.350408
865	1	1	7	2	\N	2016-02-18	-19.52	1ee	2020-10-29 19:03:05.352017	2020-10-29 19:03:05.352017
866	1	1	-1	2	\N	2016-02-18	-92.00	dcd	2020-10-29 19:03:05.353255	2020-10-29 19:03:05.353255
867	5	2	2	1	\N	2016-02-17	31.32	8e5	2020-10-29 19:03:05.354511	2020-10-29 19:03:05.354511
868	5	7	32	2	\N	2016-02-20	-30.00	fdb	2020-10-29 19:03:05.355779	2020-10-29 19:03:05.355779
869	2	6	24	2	\N	2016-02-21	-169.96	31b	2020-10-29 19:03:05.357051	2020-10-29 19:03:05.357051
870	5	1	5	2	\N	2016-02-20	-14.74	fdb	2020-10-29 19:03:05.358345	2020-10-29 19:03:05.358345
871	2	8	38	2	\N	2016-02-22	-46.00	6e8	2020-10-29 19:03:05.359696	2020-10-29 19:03:05.359696
872	2	4	13	2	\N	2016-02-22	-21.92	95e	2020-10-29 19:03:05.361227	2020-10-29 19:03:05.361227
873	1	5	18	2	\N	2016-02-22	-25.76	007	2020-10-29 19:03:05.362489	2020-10-29 19:03:05.362489
874	5	2	2	1	\N	2016-02-22	94.00	e44	2020-10-29 19:03:05.363799	2020-10-29 19:03:05.363799
875	2	5	18	2	\N	2016-02-25	-17.50	6cf	2020-10-29 19:03:05.365129	2020-10-29 19:03:05.365129
876	2	6	24	2	\N	2016-02-25	-19.99	535	2020-10-29 19:03:05.366439	2020-10-29 19:03:05.366439
877	2	5	18	2	\N	2016-02-25	-33.00	e17	2020-10-29 19:03:05.367841	2020-10-29 19:03:05.367841
878	2	5	18	2	\N	2016-02-26	-15.98	4ef	2020-10-29 19:03:05.369157	2020-10-29 19:03:05.369157
879	2	5	18	2	\N	2016-02-26	-13.58	220	2020-10-29 19:03:05.370468	2020-10-29 19:03:05.370468
880	5	5	18	2	\N	2016-02-26	-12.90	d24	2020-10-29 19:03:05.371785	2020-10-29 19:03:05.371785
881	2	2	1	1	\N	2016-02-26	3605.84	d90	2020-10-29 19:03:05.373077	2020-10-29 19:03:05.373077
882	1	2	1	1	\N	2016-02-26	10045.13	f12	2020-10-29 19:03:05.374655	2020-10-29 19:03:05.374655
883	1	10	51	3	\N	2016-02-26	-3000.00	548	2020-10-29 19:03:05.376307	2020-10-29 19:03:05.376307
884	6	10	51	4	\N	2016-02-26	3000.00	548	2020-10-29 19:03:05.377929	2020-10-29 19:03:05.377929
885	1	10	51	3	\N	2016-02-26	-1500.00	83e	2020-10-29 19:03:05.379599	2020-10-29 19:03:05.379599
886	5	10	51	4	\N	2016-02-26	1500.00	83e	2020-10-29 19:03:05.381144	2020-10-29 19:03:05.381144
887	1	10	51	3	\N	2016-02-26	-1500.00	83e	2020-10-29 19:03:05.382458	2020-10-29 19:03:05.382458
888	1	10	51	3	\N	2016-02-26	-500.00	b06	2020-10-29 19:03:05.383917	2020-10-29 19:03:05.383917
889	1	10	51	3	\N	2016-02-26	-3500.00	c26	2020-10-29 19:03:05.385339	2020-10-29 19:03:05.385339
890	3	10	51	4	\N	2016-02-26	3500.00	c26	2020-10-29 19:03:05.386916	2020-10-29 19:03:05.386916
891	1	1	4	2	\N	2016-02-26	-1.80	613	2020-10-29 19:03:05.388402	2020-10-29 19:03:05.388402
892	1	1	-1	2	\N	2016-02-26	-26.00	d91	2020-10-29 19:03:05.389951	2020-10-29 19:03:05.389951
893	1	1	7	2	\N	2016-02-26	-11.08	8f1	2020-10-29 19:03:05.391474	2020-10-29 19:03:05.391474
894	1	1	7	2	\N	2016-02-26	-17.21	8f1	2020-10-29 19:03:05.393094	2020-10-29 19:03:05.393094
895	5	4	10	2	\N	2016-02-26	-349.79	27c	2020-10-29 19:03:05.394893	2020-10-29 19:03:05.394893
896	5	4	11	2	\N	2016-02-26	-96.76	eec	2020-10-29 19:03:05.396233	2020-10-29 19:03:05.396233
897	1	1	5	2	\N	2016-02-20	-19.80	10a	2020-10-29 19:03:05.397579	2020-10-29 19:03:05.397579
898	5	1	5	2	\N	2016-02-27	-6.99	a17	2020-10-29 19:03:05.398837	2020-10-29 19:03:05.398837
899	2	4	15	2	\N	2016-02-28	-41.98	17a	2020-10-29 19:03:05.400108	2020-10-29 19:03:05.400108
900	5	1	5	2	\N	2016-02-27	-100.00	610	2020-10-29 19:03:05.401422	2020-10-29 19:03:05.401422
901	2	9	2	1	\N	2016-02-27	100.00	adb	2020-10-29 19:03:05.40259	2020-10-29 19:03:05.40259
902	5	1	5	2	\N	2016-02-27	-107.16	20c	2020-10-29 19:03:05.403945	2020-10-29 19:03:05.403945
903	1	1	5	2	\N	2016-02-27	-6.00	35a	2020-10-29 19:03:05.405186	2020-10-29 19:03:05.405186
904	5	4	13	2	\N	2016-03-01	-49.90	0d5	2020-10-29 19:03:05.406427	2020-10-29 19:03:05.406427
905	5	4	10	2	\N	2016-03-01	-22.04	490	2020-10-29 19:03:05.40798	2020-10-29 19:03:05.40798
906	5	9	-1	2	\N	2016-03-01	-30.00	56d	2020-10-29 19:03:05.409483	2020-10-29 19:03:05.409483
907	5	1	5	2	\N	2016-03-01	-12.17	193	2020-10-29 19:03:05.411781	2020-10-29 19:03:05.411781
908	5	10	51	4	\N	2016-03-01	1500.00	abd	2020-10-29 19:03:05.413211	2020-10-29 19:03:05.413211
909	1	1	4	2	\N	2016-03-01	-1.80	d98	2020-10-29 19:03:05.414441	2020-10-29 19:03:05.414441
910	1	1	7	2	\N	2016-03-01	-14.41	615	2020-10-29 19:03:05.415749	2020-10-29 19:03:05.415749
911	1	1	5	2	\N	2016-03-01	-12.27	1f4	2020-10-29 19:03:05.417075	2020-10-29 19:03:05.417075
912	1	1	-1	2	\N	2016-03-01	-17.48	353	2020-10-29 19:03:05.418302	2020-10-29 19:03:05.418302
913	5	7	27	2	\N	2016-03-01	-1005.72	bc7	2020-10-29 19:03:05.419513	2020-10-29 19:03:05.419513
914	5	7	27	2	\N	2016-03-01	-1107.80	1d6	2020-10-29 19:03:05.420742	2020-10-29 19:03:05.420742
915	2	10	51	3	\N	2016-03-01	-1000.00	5cb	2020-10-29 19:03:05.422128	2020-10-29 19:03:05.422128
916	2	10	51	3	\N	2016-03-01	-1000.00	ba5	2020-10-29 19:03:05.423359	2020-10-29 19:03:05.423359
917	5	10	51	4	\N	2016-03-01	1000.00	5cb	2020-10-29 19:03:05.424613	2020-10-29 19:03:05.424613
918	5	10	51	4	\N	2016-03-01	1000.00	ba5	2020-10-29 19:03:05.425949	2020-10-29 19:03:05.425949
919	1	9	46	2	\N	2016-03-01	-46.14	52f	2020-10-29 19:03:05.427128	2020-10-29 19:03:05.427128
920	2	6	25	2	\N	2016-03-02	-20.00	2b0	2020-10-29 19:03:05.428464	2020-10-29 19:03:05.428464
921	2	1	5	2	\N	2016-03-02	-14.38	621	2020-10-29 19:03:05.429753	2020-10-29 19:03:05.429753
922	5	10	51	2	\N	2016-03-03	-1000.00	b7b	2020-10-29 19:03:05.431063	2020-10-29 19:03:05.431063
923	2	10	51	1	\N	2016-03-03	1000.00	b7b	2020-10-29 19:03:05.432209	2020-10-29 19:03:05.432209
924	5	1	5	2	\N	2016-03-03	-57.75	6ee	2020-10-29 19:03:05.433386	2020-10-29 19:03:05.433386
925	2	8	38	2	\N	2016-03-03	-30.00	342	2020-10-29 19:03:05.43464	2020-10-29 19:03:05.43464
926	5	1	5	2	\N	2016-03-06	-21.40	9cd	2020-10-29 19:03:05.43584	2020-10-29 19:03:05.43584
927	1	1	7	2	\N	2016-03-04	-13.07	298	2020-10-29 19:03:05.437108	2020-10-29 19:03:05.437108
928	1	1	-1	2	\N	2016-03-04	-60.00	5d1	2020-10-29 19:03:05.438266	2020-10-29 19:03:05.438266
929	1	1	-1	2	\N	2016-03-04	-59.99	ad0	2020-10-29 19:03:05.439478	2020-10-29 19:03:05.439478
930	5	1	5	2	\N	2016-03-05	-49.92	e5f	2020-10-29 19:03:05.440753	2020-10-29 19:03:05.440753
931	5	1	5	2	\N	2016-03-05	-12.20	473	2020-10-29 19:03:05.442218	2020-10-29 19:03:05.442218
932	1	8	38	2	\N	2016-03-06	-46.00	1bf	2020-10-29 19:03:05.44341	2020-10-29 19:03:05.44341
933	5	1	5	2	\N	2016-03-07	-11.11	e31	2020-10-29 19:03:05.444797	2020-10-29 19:03:05.444797
934	5	1	5	2	\N	2016-03-08	-50.86	33e	2020-10-29 19:03:05.446299	2020-10-29 19:03:05.446299
935	5	9	-1	2	\N	2016-03-08	-20.00	7e1	2020-10-29 19:03:05.447467	2020-10-29 19:03:05.447467
936	2	1	-1	2	\N	2016-03-09	-27.00	fa0	2020-10-29 19:03:05.448623	2020-10-29 19:03:05.448623
937	5	4	12	2	\N	2016-03-10	-57.12	e99	2020-10-29 19:03:05.449999	2020-10-29 19:03:05.449999
938	5	1	5	2	\N	2016-03-11	-30.58	42c	2020-10-29 19:03:05.452231	2020-10-29 19:03:05.452231
939	2	9	45	2	\N	2016-03-11	-14.96	7e7	2020-10-29 19:03:05.454425	2020-10-29 19:03:05.454425
940	5	9	45	1	\N	2016-03-11	14.96	b79	2020-10-29 19:03:05.455853	2020-10-29 19:03:05.455853
941	1	1	7	2	\N	2016-03-11	-2.45	73e	2020-10-29 19:03:05.457419	2020-10-29 19:03:05.457419
942	5	1	5	2	\N	2016-03-12	-99.05	e5f	2020-10-29 19:03:05.458711	2020-10-29 19:03:05.458711
943	1	1	6	2	\N	2016-03-08	-105.00	f6d	2020-10-29 19:03:05.460681	2020-10-29 19:03:05.460681
944	1	9	46	2	\N	2016-03-11	-299.00	d3e	2020-10-29 19:03:05.462257	2020-10-29 19:03:05.462257
945	1	1	7	2	\N	2016-03-09	-15.42	b98	2020-10-29 19:03:05.4638	2020-10-29 19:03:05.4638
946	5	1	5	2	\N	2016-03-10	-11.70	b9f	2020-10-29 19:03:05.465297	2020-10-29 19:03:05.465297
947	5	1	5	2	\N	2016-03-10	-44.49	313	2020-10-29 19:03:05.46681	2020-10-29 19:03:05.46681
948	1	9	-1	2	\N	2016-03-12	-5.00	d7d	2020-10-29 19:03:05.468485	2020-10-29 19:03:05.468485
949	2	4	16	2	\N	2016-03-13	-1221.00	23b	2020-10-29 19:03:05.469913	2020-10-29 19:03:05.469913
950	2	5	22	2	\N	2016-03-13	-45.00	4ca	2020-10-29 19:03:05.471641	2020-10-29 19:03:05.471641
951	2	6	24	2	\N	2016-03-13	-110.94	e70	2020-10-29 19:03:05.473239	2020-10-29 19:03:05.473239
952	2	1	5	2	\N	2016-03-13	-10.60	e7f	2020-10-29 19:03:05.474629	2020-10-29 19:03:05.474629
953	2	10	51	3	\N	2016-03-13	-500.00	038	2020-10-29 19:03:05.476392	2020-10-29 19:03:05.476392
954	6	10	51	4	\N	2016-03-13	500.00	038	2020-10-29 19:03:05.477986	2020-10-29 19:03:05.477986
955	2	5	18	2	\N	2016-03-14	-18.99	6be	2020-10-29 19:03:05.479574	2020-10-29 19:03:05.479574
956	5	1	5	2	\N	2016-03-15	-28.43	ead	2020-10-29 19:03:05.480862	2020-10-29 19:03:05.480862
957	2	1	5	2	\N	2016-03-15	-8.50	07d	2020-10-29 19:03:05.481969	2020-10-29 19:03:05.481969
958	2	9	-1	2	\N	2016-03-15	-10.00	c2e	2020-10-29 19:03:05.483178	2020-10-29 19:03:05.483178
959	5	5	20	2	\N	2016-03-16	-53.99	74c	2020-10-29 19:03:05.484345	2020-10-29 19:03:05.484345
960	5	5	20	2	\N	2016-03-16	-28.35	c5e	2020-10-29 19:03:05.485527	2020-10-29 19:03:05.485527
961	5	5	18	2	\N	2016-03-16	-28.01	dca	2020-10-29 19:03:05.486695	2020-10-29 19:03:05.486695
962	5	1	5	2	\N	2016-03-16	-10.20	e19	2020-10-29 19:03:05.487894	2020-10-29 19:03:05.487894
963	2	1	5	1	\N	2016-03-16	10.20	e19	2020-10-29 19:03:05.489107	2020-10-29 19:03:05.489107
964	2	6	24	1	\N	2016-03-16	39.98	962	2020-10-29 19:03:05.490269	2020-10-29 19:03:05.490269
965	5	1	5	2	\N	2016-03-16	-50.38	621	2020-10-29 19:03:05.491469	2020-10-29 19:03:05.491469
966	5	1	5	2	\N	2016-03-18	-21.51	576	2020-10-29 19:03:05.492676	2020-10-29 19:03:05.492676
967	5	1	5	2	\N	2016-03-18	-17.40	f7c	2020-10-29 19:03:05.494121	2020-10-29 19:03:05.494121
968	2	1	5	1	\N	2016-03-18	17.40	f7c	2020-10-29 19:03:05.495613	2020-10-29 19:03:05.495613
969	2	7	30	2	\N	2016-03-18	-64.26	44c	2020-10-29 19:03:05.496912	2020-10-29 19:03:05.496912
970	1	2	2	1	\N	2016-03-15	300.00	884	2020-10-29 19:03:05.49821	2020-10-29 19:03:05.49821
971	1	9	45	2	\N	2016-03-19	-37.50	779	2020-10-29 19:03:05.500169	2020-10-29 19:03:05.500169
972	1	1	-1	2	\N	2016-03-18	-25.00	6ef	2020-10-29 19:03:05.501411	2020-10-29 19:03:05.501411
973	1	1	-1	2	\N	2016-03-18	-20.00	897	2020-10-29 19:03:05.502621	2020-10-29 19:03:05.502621
974	1	1	4	2	\N	2016-03-18	-17.85	534	2020-10-29 19:03:05.503985	2020-10-29 19:03:05.503985
975	5	1	5	2	\N	2016-03-19	-95.10	e5f	2020-10-29 19:03:05.505221	2020-10-29 19:03:05.505221
976	1	1	7	2	\N	2016-03-16	-9.96	298	2020-10-29 19:03:05.506369	2020-10-29 19:03:05.506369
977	1	1	7	2	\N	2016-03-14	-8.56	f06	2020-10-29 19:03:05.507554	2020-10-29 19:03:05.507554
978	1	1	7	2	\N	2016-03-16	-4.57	f06	2020-10-29 19:03:05.508722	2020-10-29 19:03:05.508722
979	1	1	7	2	\N	2016-03-15	-2.45	f06	2020-10-29 19:03:05.510249	2020-10-29 19:03:05.510249
980	1	1	7	2	\N	2016-03-17	-12.53	298	2020-10-29 19:03:05.511857	2020-10-29 19:03:05.511857
981	5	1	5	2	\N	2016-03-16	-12.23	7d2	2020-10-29 19:03:05.513337	2020-10-29 19:03:05.513337
982	4	9	-1	3	\N	2016-03-19	-500.00	72d	2020-10-29 19:03:05.514599	2020-10-29 19:03:05.514599
983	2	9	-1	4	\N	2016-03-19	500.00	72d	2020-10-29 19:03:05.515875	2020-10-29 19:03:05.515875
984	2	5	18	2	\N	2016-03-19	-39.99	add	2020-10-29 19:03:05.517216	2020-10-29 19:03:05.517216
985	2	9	45	2	\N	2016-03-19	-64.80	938	2020-10-29 19:03:05.51835	2020-10-29 19:03:05.51835
986	2	6	24	2	\N	2016-03-19	-399.00	25a	2020-10-29 19:03:05.519577	2020-10-29 19:03:05.519577
987	2	1	6	2	\N	2016-03-19	-34.00	5d1	2020-10-29 19:03:05.520745	2020-10-29 19:03:05.520745
988	2	8	38	2	\N	2016-03-19	-2.80	776	2020-10-29 19:03:05.521935	2020-10-29 19:03:05.521935
989	2	8	41	2	\N	2016-03-19	-24.00	35e	2020-10-29 19:03:05.523111	2020-10-29 19:03:05.523111
990	5	5	20	2	\N	2016-03-21	-9.50	8db	2020-10-29 19:03:05.52463	2020-10-29 19:03:05.52463
991	5	1	5	2	\N	2016-03-21	-86.66	e6d	2020-10-29 19:03:05.526114	2020-10-29 19:03:05.526114
992	2	1	5	2	\N	2016-03-21	-35.00	bb8	2020-10-29 19:03:05.527799	2020-10-29 19:03:05.527799
993	6	9	-1	3	\N	2016-03-21	-1000.00	1d0	2020-10-29 19:03:05.530688	2020-10-29 19:03:05.530688
994	5	9	-1	4	\N	2016-03-21	1000.00	1d0	2020-10-29 19:03:05.532227	2020-10-29 19:03:05.532227
995	2	7	32	2	\N	2016-03-21	-60.00	cfd	2020-10-29 19:03:05.533598	2020-10-29 19:03:05.533598
996	5	5	20	2	\N	2016-03-23	-17.99	875	2020-10-29 19:03:05.535116	2020-10-29 19:03:05.535116
997	5	9	45	2	\N	2016-03-23	-16.50	f12	2020-10-29 19:03:05.536984	2020-10-29 19:03:05.536984
998	5	1	5	2	\N	2016-03-24	-6.75	ecd	2020-10-29 19:03:05.538866	2020-10-29 19:03:05.538866
999	2	1	5	1	\N	2016-03-24	6.75	ecd	2020-10-29 19:03:05.540935	2020-10-29 19:03:05.540935
1000	5	7	32	2	\N	2016-03-24	-60.00	8d4	2020-10-29 19:03:05.542638	2020-10-29 19:03:05.542638
1001	2	7	32	1	\N	2016-03-24	60.00	8d4	2020-10-29 19:03:05.54414	2020-10-29 19:03:05.54414
1002	5	1	5	2	\N	2016-03-25	-21.38	8a9	2020-10-29 19:03:05.546355	2020-10-29 19:03:05.546355
1003	5	8	40	2	\N	2016-03-25	-98.00	444	2020-10-29 19:03:05.548251	2020-10-29 19:03:05.548251
1004	5	8	40	2	\N	2016-03-25	-167.88	a6f	2020-10-29 19:03:05.550248	2020-10-29 19:03:05.550248
1005	1	5	18	2	\N	2016-03-25	-26.97	846	2020-10-29 19:03:05.551866	2020-10-29 19:03:05.551866
1006	5	2	3	1	\N	2016-03-25	26.97	62a	2020-10-29 19:03:05.553484	2020-10-29 19:03:05.553484
1007	1	5	18	2	\N	2016-03-25	-60.51	846	2020-10-29 19:03:05.555172	2020-10-29 19:03:05.555172
1008	5	5	20	2	\N	2016-03-22	-48.80	dc6	2020-10-29 19:03:05.556851	2020-10-29 19:03:05.556851
1009	5	5	20	2	\N	2016-03-23	-62.29	6cb	2020-10-29 19:03:05.558475	2020-10-29 19:03:05.558475
1010	1	1	7	2	\N	2016-03-22	-8.37	73e	2020-10-29 19:03:05.560215	2020-10-29 19:03:05.560215
1011	1	1	4	2	\N	2016-03-22	-8.37	896	2020-10-29 19:03:05.562344	2020-10-29 19:03:05.562344
1012	1	1	7	2	\N	2016-03-23	-2.45	73e	2020-10-29 19:03:05.564323	2020-10-29 19:03:05.564323
1013	1	1	7	2	\N	2016-03-23	-15.75	b98	2020-10-29 19:03:05.566152	2020-10-29 19:03:05.566152
1014	1	6	24	2	\N	2016-03-21	-4.99	f85	2020-10-29 19:03:05.567515	2020-10-29 19:03:05.567515
1015	1	9	45	2	\N	2016-03-21	-44.50	21b	2020-10-29 19:03:05.569241	2020-10-29 19:03:05.569241
1016	1	9	46	2	\N	2016-03-26	-22.37	2ec	2020-10-29 19:03:05.571023	2020-10-29 19:03:05.571023
1017	1	2	1	1	\N	2016-03-25	8307.05	96d	2020-10-29 19:03:05.572758	2020-10-29 19:03:05.572758
1018	1	2	3	1	\N	2016-03-26	200.00	55c	2020-10-29 19:03:05.574459	2020-10-29 19:03:05.574459
1019	1	10	51	2	\N	2016-03-26	-200.00	55c	2020-10-29 19:03:05.576142	2020-10-29 19:03:05.576142
1020	1	10	51	3	\N	2016-03-29	-500.00	21b	2020-10-29 19:03:05.5779	2020-10-29 19:03:05.5779
1021	1	10	51	3	\N	2016-03-29	-1500.00	31a	2020-10-29 19:03:05.579603	2020-10-29 19:03:05.579603
1022	1	10	51	3	\N	2016-03-29	-600.00	c81	2020-10-29 19:03:05.581354	2020-10-29 19:03:05.581354
1023	5	10	51	4	\N	2016-03-29	600.00	c81	2020-10-29 19:03:05.583168	2020-10-29 19:03:05.583168
1024	1	10	51	3	\N	2016-03-29	-3500.00	ca5	2020-10-29 19:03:05.584828	2020-10-29 19:03:05.584828
1025	6	10	51	4	\N	2016-03-29	3500.00	ca5	2020-10-29 19:03:05.586574	2020-10-29 19:03:05.586574
1026	1	9	-1	1	\N	2016-03-29	22.00	4c7	2020-10-29 19:03:05.588366	2020-10-29 19:03:05.588366
1027	5	9	-1	3	\N	2016-03-29	-22.00	4c7	2020-10-29 19:03:05.59009	2020-10-29 19:03:05.59009
1028	2	2	1	1	\N	2016-03-24	3877.76	917	2020-10-29 19:03:05.591818	2020-10-29 19:03:05.591818
1029	2	5	19	3	\N	2016-03-26	-301.50	964	2020-10-29 19:03:05.593654	2020-10-29 19:03:05.593654
1030	5	5	19	4	\N	2016-03-26	301.50	18f	2020-10-29 19:03:05.59513	2020-10-29 19:03:05.59513
1031	2	4	15	2	\N	2016-03-29	-40.15	227	2020-10-29 19:03:05.59647	2020-10-29 19:03:05.59647
1032	2	10	51	3	\N	2016-03-29	-900.00	0f7	2020-10-29 19:03:05.59794	2020-10-29 19:03:05.59794
1033	5	10	51	4	\N	2016-03-29	900.00	0f7	2020-10-29 19:03:05.599285	2020-10-29 19:03:05.599285
1034	2	10	51	3	\N	2016-03-29	-900.00	c44	2020-10-29 19:03:05.600623	2020-10-29 19:03:05.600623
1035	6	10	51	4	\N	2016-03-29	900.00	c44	2020-10-29 19:03:05.603066	2020-10-29 19:03:05.603066
1036	2	10	51	3	\N	2016-03-29	-1000.00	cd9	2020-10-29 19:03:05.604502	2020-10-29 19:03:05.604502
1037	4	10	51	4	\N	2016-03-29	1000.00	cd9	2020-10-29 19:03:05.605918	2020-10-29 19:03:05.605918
1038	1	1	7	2	\N	2016-03-31	-8.19	b98	2020-10-29 19:03:05.607246	2020-10-29 19:03:05.607246
1039	1	1	5	2	\N	2016-03-30	-22.49	644	2020-10-29 19:03:05.60861	2020-10-29 19:03:05.60861
1040	2	4	12	2	\N	2016-04-02	-300.00	1b6	2020-10-29 19:03:05.610111	2020-10-29 19:03:05.610111
1041	5	9	45	2	\N	2016-04-02	-100.00	0a3	2020-10-29 19:03:05.611523	2020-10-29 19:03:05.611523
1042	2	8	38	2	\N	2016-04-05	-46.00	764	2020-10-29 19:03:05.612916	2020-10-29 19:03:05.612916
1043	5	5	20	2	\N	2016-04-05	-8.49	a91	2020-10-29 19:03:05.614284	2020-10-29 19:03:05.614284
1044	5	1	5	2	\N	2016-04-05	-25.00	a49	2020-10-29 19:03:05.61555	2020-10-29 19:03:05.61555
1045	2	1	5	1	\N	2016-04-05	25.00	01c	2020-10-29 19:03:05.616852	2020-10-29 19:03:05.616852
1046	5	4	10	2	\N	2016-04-06	-349.79	45a	2020-10-29 19:03:05.618253	2020-10-29 19:03:05.618253
1047	5	4	12	2	\N	2016-04-06	-96.17	8b7	2020-10-29 19:03:05.619486	2020-10-29 19:03:05.619486
1048	5	1	5	2	\N	2016-04-06	-106.73	6ee	2020-10-29 19:03:05.620836	2020-10-29 19:03:05.620836
1049	5	5	20	2	\N	2016-04-07	-45.97	7df	2020-10-29 19:03:05.622124	2020-10-29 19:03:05.622124
1050	5	5	20	2	\N	2016-04-07	-19.99	905	2020-10-29 19:03:05.62333	2020-10-29 19:03:05.62333
1051	5	1	5	2	\N	2016-04-07	-9.10	7f4	2020-10-29 19:03:05.624572	2020-10-29 19:03:05.624572
1052	2	1	6	2	\N	2016-04-07	-10.90	8bb	2020-10-29 19:03:05.626666	2020-10-29 19:03:05.626666
1053	5	4	10	2	\N	2016-04-07	-147.95	a93	2020-10-29 19:03:05.628268	2020-10-29 19:03:05.628268
1054	5	4	10	2	\N	2016-04-07	-11.15	16c	2020-10-29 19:03:05.629534	2020-10-29 19:03:05.629534
1055	5	8	40	2	\N	2016-04-02	-132.48	a4e	2020-10-29 19:03:05.630717	2020-10-29 19:03:05.630717
1056	1	1	-1	2	\N	2016-04-05	-55.00	266	2020-10-29 19:03:05.632071	2020-10-29 19:03:05.632071
1057	1	1	-1	2	\N	2016-04-07	-26.00	266	2020-10-29 19:03:05.633366	2020-10-29 19:03:05.633366
1058	1	1	-1	2	\N	2016-04-06	-11.00	266	2020-10-29 19:03:05.634806	2020-10-29 19:03:05.634806
1059	1	1	-1	2	\N	2016-04-06	-15.00	266	2020-10-29 19:03:05.636158	2020-10-29 19:03:05.636158
1060	1	4	16	2	\N	2016-04-09	-1712.00	a8d	2020-10-29 19:03:05.637348	2020-10-29 19:03:05.637348
1061	5	2	3	4	\N	2016-04-03	1500.00	3e0	2020-10-29 19:03:05.638569	2020-10-29 19:03:05.638569
1062	1	1	6	2	\N	2016-04-03	-50.00	884	2020-10-29 19:03:05.639972	2020-10-29 19:03:05.639972
1063	5	1	-1	2	\N	2016-04-03	-29.71	353	2020-10-29 19:03:05.64126	2020-10-29 19:03:05.64126
1064	5	1	5	2	\N	2016-04-04	-71.90	e5f	2020-10-29 19:03:05.642422	2020-10-29 19:03:05.642422
1065	1	1	4	2	\N	2016-04-01	-4.95	694	2020-10-29 19:03:05.643678	2020-10-29 19:03:05.643678
1066	1	1	7	2	\N	2016-04-01	-3.85	73e	2020-10-29 19:03:05.645382	2020-10-29 19:03:05.645382
1067	5	1	5	2	\N	2016-04-04	-10.74	b9f	2020-10-29 19:03:05.646728	2020-10-29 19:03:05.646728
1068	1	1	7	2	\N	2016-04-04	-14.13	b98	2020-10-29 19:03:05.6483	2020-10-29 19:03:05.6483
1069	1	6	24	2	\N	2016-04-06	-100.28	e34	2020-10-29 19:03:05.649759	2020-10-29 19:03:05.649759
1070	1	9	45	2	\N	2016-04-06	-54.90	8f9	2020-10-29 19:03:05.651266	2020-10-29 19:03:05.651266
1071	1	1	6	2	\N	2016-04-08	-12.00	f1f	2020-10-29 19:03:05.652481	2020-10-29 19:03:05.652481
1072	1	1	4	2	\N	2016-04-05	-7.80	23d	2020-10-29 19:03:05.65372	2020-10-29 19:03:05.65372
1073	1	1	7	2	\N	2016-04-05	-16.34	b98	2020-10-29 19:03:05.655122	2020-10-29 19:03:05.655122
1074	1	8	38	2	\N	2016-04-09	-46.00	912	2020-10-29 19:03:05.656548	2020-10-29 19:03:05.656548
1075	2	6	24	2	\N	2016-04-09	-63.00	f6e	2020-10-29 19:03:05.658126	2020-10-29 19:03:05.658126
1076	2	6	24	2	\N	2016-04-09	-169.00	b99	2020-10-29 19:03:05.659506	2020-10-29 19:03:05.659506
1077	5	1	5	2	\N	2016-04-11	-13.13	3ec	2020-10-29 19:03:05.660899	2020-10-29 19:03:05.660899
1078	5	1	5	2	\N	2016-04-11	-15.20	79c	2020-10-29 19:03:05.662431	2020-10-29 19:03:05.662431
1079	2	1	5	1	\N	2016-04-11	15.20	79c	2020-10-29 19:03:05.663899	2020-10-29 19:03:05.663899
1080	2	6	24	2	\N	2016-04-12	-81.90	87d	2020-10-29 19:03:05.665507	2020-10-29 19:03:05.665507
1081	5	1	5	2	\N	2016-04-13	-15.02	fc1	2020-10-29 19:03:05.666992	2020-10-29 19:03:05.666992
1082	2	5	18	2	\N	2016-04-13	-7.89	c70	2020-10-29 19:03:05.668538	2020-10-29 19:03:05.668538
1083	5	8	40	2	\N	2016-04-13	-708.20	82b	2020-10-29 19:03:05.669997	2020-10-29 19:03:05.669997
1084	1	1	7	2	\N	2016-04-13	-2.45	73e	2020-10-29 19:03:05.671426	2020-10-29 19:03:05.671426
1085	1	1	7	2	\N	2016-04-13	-3.45	31a	2020-10-29 19:03:05.672827	2020-10-29 19:03:05.672827
1086	1	2	1	1	\N	2016-04-11	972.00	5c7	2020-10-29 19:03:05.674529	2020-10-29 19:03:05.674529
1087	1	1	7	2	\N	2016-04-08	-9.64	e33	2020-10-29 19:03:05.676084	2020-10-29 19:03:05.676084
1088	1	10	51	3	\N	2016-04-13	-500.00	039	2020-10-29 19:03:05.677902	2020-10-29 19:03:05.677902
1089	3	10	51	4	\N	2016-04-13	500.00	039	2020-10-29 19:03:05.680222	2020-10-29 19:03:05.680222
1090	5	8	40	2	\N	2016-04-15	-59.00	138	2020-10-29 19:03:05.681625	2020-10-29 19:03:05.681625
1091	1	1	7	2	\N	2016-04-15	-14.08	b98	2020-10-29 19:03:05.682928	2020-10-29 19:03:05.682928
1092	1	1	7	2	\N	2016-04-14	-10.27	73e	2020-10-29 19:03:05.684213	2020-10-29 19:03:05.684213
1093	1	1	7	2	\N	2016-04-11	-9.48	b98	2020-10-29 19:03:05.685539	2020-10-29 19:03:05.685539
1094	2	1	-1	2	\N	2016-04-16	-61.00	41f	2020-10-29 19:03:05.686884	2020-10-29 19:03:05.686884
1095	5	5	19	2	\N	2016-04-16	-300.00	2a9	2020-10-29 19:03:05.689055	2020-10-29 19:03:05.689055
1096	5	1	5	2	\N	2016-04-17	-29.30	309	2020-10-29 19:03:05.690341	2020-10-29 19:03:05.690341
1097	5	8	42	2	\N	2016-04-19	-27.00	060	2020-10-29 19:03:05.691567	2020-10-29 19:03:05.691567
1098	5	8	42	2	\N	2016-04-19	-36.00	ad8	2020-10-29 19:03:05.692914	2020-10-29 19:03:05.692914
1099	5	1	5	2	\N	2016-04-16	-50.00	b6e	2020-10-29 19:03:05.694358	2020-10-29 19:03:05.694358
1100	1	5	22	2	\N	2016-04-16	-35.00	9da	2020-10-29 19:03:05.695752	2020-10-29 19:03:05.695752
1101	5	1	5	2	\N	2016-04-16	-85.85	e5f	2020-10-29 19:03:05.697942	2020-10-29 19:03:05.697942
1102	5	1	5	2	\N	2016-04-18	-85.14	9cd	2020-10-29 19:03:05.699229	2020-10-29 19:03:05.699229
1103	5	2	2	1	\N	2016-04-20	35.41	688	2020-10-29 19:03:05.700528	2020-10-29 19:03:05.700528
1104	5	1	5	2	\N	2016-04-19	-19.00	191	2020-10-29 19:03:05.701765	2020-10-29 19:03:05.701765
1105	2	1	5	1	\N	2016-04-19	19.00	191	2020-10-29 19:03:05.703418	2020-10-29 19:03:05.703418
1106	2	1	6	2	\N	2016-04-20	-30.50	d1f	2020-10-29 19:03:05.70475	2020-10-29 19:03:05.70475
1107	2	1	5	2	\N	2016-04-20	-7.00	ecd	2020-10-29 19:03:05.706144	2020-10-29 19:03:05.706144
1108	2	5	18	2	\N	2016-04-21	-52.51	cd1	2020-10-29 19:03:05.707365	2020-10-29 19:03:05.707365
1109	2	1	5	2	\N	2016-04-21	-59.41	e7e	2020-10-29 19:03:05.708736	2020-10-29 19:03:05.708736
1110	5	5	18	2	\N	2016-04-21	-56.22	9e3	2020-10-29 19:03:05.71011	2020-10-29 19:03:05.71011
1111	2	9	-1	4	\N	2016-04-22	200.00	39b	2020-10-29 19:03:05.712061	2020-10-29 19:03:05.712061
1112	4	9	-1	3	\N	2016-04-22	-200.00	39b	2020-10-29 19:03:05.713499	2020-10-29 19:03:05.713499
1113	2	1	5	2	\N	2016-04-22	-35.30	191	2020-10-29 19:03:05.7152	2020-10-29 19:03:05.7152
1114	2	6	24	2	\N	2016-04-22	-33.30	530	2020-10-29 19:03:05.716525	2020-10-29 19:03:05.716525
1115	2	4	13	2	\N	2016-04-23	-19.99	96b	2020-10-29 19:03:05.718483	2020-10-29 19:03:05.718483
1116	2	4	13	2	\N	2016-04-23	-28.30	96b	2020-10-29 19:03:05.720114	2020-10-29 19:03:05.720114
1117	3	9	-1	3	\N	2016-04-22	-3000.00	6ff	2020-10-29 19:03:05.721482	2020-10-29 19:03:05.721482
1118	5	9	-1	4	\N	2016-04-22	500.00	b09	2020-10-29 19:03:05.722815	2020-10-29 19:03:05.722815
1119	1	9	-1	4	\N	2016-04-22	2500.00	b72	2020-10-29 19:03:05.724265	2020-10-29 19:03:05.724265
1120	5	1	5	2	\N	2016-04-23	-17.73	e90	2020-10-29 19:03:05.725586	2020-10-29 19:03:05.725586
1121	5	1	5	2	\N	2016-04-23	-111.71	a4a	2020-10-29 19:03:05.726976	2020-10-29 19:03:05.726976
1122	1	1	7	2	\N	2016-04-21	-16.37	b98	2020-10-29 19:03:05.728949	2020-10-29 19:03:05.728949
1123	1	1	7	2	\N	2016-04-21	-6.77	73e	2020-10-29 19:03:05.730398	2020-10-29 19:03:05.730398
1124	1	1	4	2	\N	2016-04-22	-21.89	5ef	2020-10-29 19:03:05.732012	2020-10-29 19:03:05.732012
1125	1	1	7	2	\N	2016-04-22	-14.98	b98	2020-10-29 19:03:05.733402	2020-10-29 19:03:05.733402
1126	1	1	-1	2	\N	2016-04-22	-30.96	116	2020-10-29 19:03:05.735081	2020-10-29 19:03:05.735081
1127	5	1	5	2	\N	2016-04-23	-9.38	f73	2020-10-29 19:03:05.736474	2020-10-29 19:03:05.736474
1128	5	9	-1	2	\N	2016-04-23	-11.00	be0	2020-10-29 19:03:05.738174	2020-10-29 19:03:05.738174
1129	1	8	40	2	\N	2016-04-26	-2070.00	63a	2020-10-29 19:03:05.739569	2020-10-29 19:03:05.739569
1130	5	1	6	2	\N	2016-04-24	-10.20	6dc	2020-10-29 19:03:05.741023	2020-10-29 19:03:05.741023
1131	1	1	4	2	\N	2016-04-26	-4.29	214	2020-10-29 19:03:05.742382	2020-10-29 19:03:05.742382
1132	1	1	-1	2	\N	2016-04-26	-12.00	e12	2020-10-29 19:03:05.743792	2020-10-29 19:03:05.743792
1133	1	1	7	2	\N	2016-04-26	-2.45	73e	2020-10-29 19:03:05.745276	2020-10-29 19:03:05.745276
1134	1	1	-1	2	\N	2016-04-26	-20.00	6ef	2020-10-29 19:03:05.746647	2020-10-29 19:03:05.746647
1135	1	1	-1	2	\N	2016-04-26	-25.00	75b	2020-10-29 19:03:05.748066	2020-10-29 19:03:05.748066
1136	1	1	7	2	\N	2016-04-27	-3.85	73e	2020-10-29 19:03:05.749498	2020-10-29 19:03:05.749498
1137	1	2	1	1	\N	2016-04-26	8303.05	9e9	2020-10-29 19:03:05.750993	2020-10-29 19:03:05.750993
1138	5	1	5	2	\N	2016-04-24	-10.00	7d2	2020-10-29 19:03:05.75241	2020-10-29 19:03:05.75241
1139	5	4	13	2	\N	2016-04-25	-49.90	97a	2020-10-29 19:03:05.75381	2020-10-29 19:03:05.75381
1140	5	1	5	2	\N	2016-04-27	-7.60	b01	2020-10-29 19:03:05.755782	2020-10-29 19:03:05.755782
1141	1	9	45	2	\N	2016-04-27	-107.97	7e5	2020-10-29 19:03:05.757438	2020-10-29 19:03:05.757438
1142	1	10	51	3	\N	2016-04-27	-500.00	f8c	2020-10-29 19:03:05.75891	2020-10-29 19:03:05.75891
1143	1	10	51	3	\N	2016-04-27	-1500.00	5ee	2020-10-29 19:03:05.760403	2020-10-29 19:03:05.760403
1144	5	10	51	4	\N	2016-04-27	1500.00	5ee	2020-10-29 19:03:05.762489	2020-10-29 19:03:05.762489
1145	1	10	51	3	\N	2016-04-27	-5000.00	5fd	2020-10-29 19:03:05.764875	2020-10-29 19:03:05.764875
1146	3	10	51	4	\N	2016-04-27	5000.00	5fd	2020-10-29 19:03:05.767818	2020-10-29 19:03:05.767818
1147	1	10	51	3	\N	2016-04-27	-1000.00	685	2020-10-29 19:03:05.769237	2020-10-29 19:03:05.769237
1148	6	10	51	4	\N	2016-04-27	1000.00	685	2020-10-29 19:03:05.77095	2020-10-29 19:03:05.77095
1149	2	4	15	2	\N	2016-04-26	-42.05	efa	2020-10-29 19:03:05.772871	2020-10-29 19:03:05.772871
1150	5	1	5	2	\N	2016-04-26	-17.50	79c	2020-10-29 19:03:05.774579	2020-10-29 19:03:05.774579
1151	2	1	5	1	\N	2016-04-26	17.50	79c	2020-10-29 19:03:05.776334	2020-10-29 19:03:05.776334
1152	2	2	1	1	\N	2016-04-27	3742.30	716	2020-10-29 19:03:05.778232	2020-10-29 19:03:05.778232
1153	5	1	5	2	\N	2016-04-28	-59.41	c5a	2020-10-29 19:03:05.780018	2020-10-29 19:03:05.780018
1154	2	1	5	1	\N	2016-04-28	59.41	c5a	2020-10-29 19:03:05.781422	2020-10-29 19:03:05.781422
1155	5	1	5	2	\N	2016-04-28	-35.30	efd	2020-10-29 19:03:05.783481	2020-10-29 19:03:05.783481
1156	5	6	24	2	\N	2016-04-28	-33.30	1de	2020-10-29 19:03:05.785267	2020-10-29 19:03:05.785267
1157	2	1	5	1	\N	2016-04-28	35.30	efd	2020-10-29 19:03:05.786951	2020-10-29 19:03:05.786951
1158	2	6	24	1	\N	2016-04-28	33.30	1de	2020-10-29 19:03:05.78873	2020-10-29 19:03:05.78873
1159	2	10	51	3	\N	2016-04-28	-900.00	3c2	2020-10-29 19:03:05.791228	2020-10-29 19:03:05.791228
1160	5	10	51	4	\N	2016-04-28	900.00	3c2	2020-10-29 19:03:05.793603	2020-10-29 19:03:05.793603
1161	2	10	51	3	\N	2016-04-28	-900.00	5fe	2020-10-29 19:03:05.795647	2020-10-29 19:03:05.795647
1162	6	10	51	4	\N	2016-04-28	900.00	5fe	2020-10-29 19:03:05.797435	2020-10-29 19:03:05.797435
1163	5	4	10	2	\N	2016-04-28	-349.79	105	2020-10-29 19:03:05.799345	2020-10-29 19:03:05.799345
1164	5	4	12	2	\N	2016-04-28	-96.17	9e9	2020-10-29 19:03:05.801138	2020-10-29 19:03:05.801138
1165	5	4	11	2	\N	2016-04-28	-94.22	249	2020-10-29 19:03:05.802992	2020-10-29 19:03:05.802992
1166	1	1	7	2	\N	2016-04-28	-3.59	93d	2020-10-29 19:03:05.804912	2020-10-29 19:03:05.804912
1167	1	1	7	2	\N	2016-04-28	-2.45	73e	2020-10-29 19:03:05.806275	2020-10-29 19:03:05.806275
1168	5	5	20	2	\N	2016-04-29	-122.12	342	2020-10-29 19:03:05.807497	2020-10-29 19:03:05.807497
1169	2	5	18	2	\N	2016-04-29	-5.24	531	2020-10-29 19:03:05.808593	2020-10-29 19:03:05.808593
1170	5	5	18	2	\N	2016-04-29	-29.90	e0a	2020-10-29 19:03:05.809881	2020-10-29 19:03:05.809881
1171	5	5	18	2	\N	2016-04-29	-98.73	846	2020-10-29 19:03:05.811305	2020-10-29 19:03:05.811305
1172	5	5	18	2	\N	2016-04-29	-23.99	cab	2020-10-29 19:03:05.812658	2020-10-29 19:03:05.812658
1173	5	8	40	2	\N	2016-04-29	-174.57	a11	2020-10-29 19:03:05.813929	2020-10-29 19:03:05.813929
1174	1	1	-1	2	\N	2016-04-30	-45.10	0c1	2020-10-29 19:03:05.815052	2020-10-29 19:03:05.815052
1175	6	10	51	1	\N	2016-04-30	31.13	15b	2020-10-29 19:03:05.816187	2020-10-29 19:03:05.816187
1176	5	1	5	2	\N	2016-05-02	-43.30	a4a	2020-10-29 19:03:05.817453	2020-10-29 19:03:05.817453
1177	1	1	7	2	\N	2016-05-02	-2.45	b3d	2020-10-29 19:03:05.818647	2020-10-29 19:03:05.818647
1178	1	1	6	2	\N	2016-05-03	-5.00	8fc	2020-10-29 19:03:05.819756	2020-10-29 19:03:05.819756
1179	1	1	5	2	\N	2016-05-03	-6.58	67d	2020-10-29 19:03:05.820918	2020-10-29 19:03:05.820918
1180	5	1	5	2	\N	2016-05-04	-16.04	576	2020-10-29 19:03:05.822186	2020-10-29 19:03:05.822186
1181	2	9	-1	2	\N	2016-05-05	-29.99	ca8	2020-10-29 19:03:05.823342	2020-10-29 19:03:05.823342
1182	2	4	15	2	\N	2016-05-05	-40.00	8ce	2020-10-29 19:03:05.824553	2020-10-29 19:03:05.824553
1183	5	9	45	2	\N	2016-05-06	-89.70	0d3	2020-10-29 19:03:05.825845	2020-10-29 19:03:05.825845
1184	2	9	45	1	\N	2016-05-06	89.70	0d3	2020-10-29 19:03:05.827206	2020-10-29 19:03:05.827206
1185	2	5	18	2	\N	2016-05-06	-11.57	45d	2020-10-29 19:03:05.828983	2020-10-29 19:03:05.828983
1186	5	9	45	1	\N	2016-05-07	100.00	499	2020-10-29 19:03:05.830342	2020-10-29 19:03:05.830342
1187	5	1	5	2	\N	2016-05-08	-32.00	461	2020-10-29 19:03:05.831666	2020-10-29 19:03:05.831666
1188	5	5	18	2	\N	2016-05-08	-49.99	c45	2020-10-29 19:03:05.832963	2020-10-29 19:03:05.832963
1189	1	8	38	2	\N	2016-05-10	-46.00	ade	2020-10-29 19:03:05.834206	2020-10-29 19:03:05.834206
1190	1	9	-1	4	\N	2016-05-04	3000.00	63f	2020-10-29 19:03:05.835484	2020-10-29 19:03:05.835484
1191	3	9	-1	3	\N	2016-05-04	-3000.00	63f	2020-10-29 19:03:05.836781	2020-10-29 19:03:05.836781
1192	1	1	7	2	\N	2016-05-10	-3.85	73e	2020-10-29 19:03:05.838091	2020-10-29 19:03:05.838091
1193	1	1	7	2	\N	2016-05-09	-2.45	73e	2020-10-29 19:03:05.839437	2020-10-29 19:03:05.839437
1194	1	1	7	2	\N	2016-05-06	-12.27	e33	2020-10-29 19:03:05.840815	2020-10-29 19:03:05.840815
1195	5	1	5	2	\N	2016-05-08	-13.14	57e	2020-10-29 19:03:05.842354	2020-10-29 19:03:05.842354
1196	5	8	40	2	\N	2016-05-08	-158.60	a4e	2020-10-29 19:03:05.844112	2020-10-29 19:03:05.844112
1197	1	1	5	2	\N	2016-05-05	-5.47	c53	2020-10-29 19:03:05.845551	2020-10-29 19:03:05.845551
1198	1	5	18	2	\N	2016-05-05	-11.66	613	2020-10-29 19:03:05.846915	2020-10-29 19:03:05.846915
1199	1	9	45	2	\N	2016-05-05	-116.00	d56	2020-10-29 19:03:05.849006	2020-10-29 19:03:05.849006
1200	1	6	24	2	\N	2016-05-05	-519.98	460	2020-10-29 19:03:05.85122	2020-10-29 19:03:05.85122
1201	1	6	24	2	\N	2016-05-05	-549.99	26d	2020-10-29 19:03:05.852963	2020-10-29 19:03:05.852963
1202	1	6	24	2	\N	2016-05-05	-391.68	e5d	2020-10-29 19:03:05.854682	2020-10-29 19:03:05.854682
1203	5	1	5	2	\N	2016-05-10	-47.53	a4a	2020-10-29 19:03:05.856102	2020-10-29 19:03:05.856102
1204	2	9	-1	2	\N	2016-05-11	-100.00	730	2020-10-29 19:03:05.857517	2020-10-29 19:03:05.857517
1205	2	10	51	3	\N	2016-05-11	-1500.00	73c	2020-10-29 19:03:05.859833	2020-10-29 19:03:05.859833
1206	4	10	51	4	\N	2016-05-11	1500.00	73c	2020-10-29 19:03:05.861638	2020-10-29 19:03:05.861638
1207	2	9	-1	4	\N	2016-05-10	500.00	1ea	2020-10-29 19:03:05.863343	2020-10-29 19:03:05.863343
1208	2	5	18	2	\N	2016-05-02	-134.10	5a5	2020-10-29 19:03:05.865032	2020-10-29 19:03:05.865032
1209	1	1	4	2	\N	2016-05-11	-2.00	f60	2020-10-29 19:03:05.866404	2020-10-29 19:03:05.866404
1210	1	1	7	2	\N	2016-05-11	-4.01	757	2020-10-29 19:03:05.867997	2020-10-29 19:03:05.867997
1211	1	1	7	2	\N	2016-05-11	-2.45	73e	2020-10-29 19:03:05.869726	2020-10-29 19:03:05.869726
1212	1	8	38	2	\N	2016-05-11	-11.40	f79	2020-10-29 19:03:05.871162	2020-10-29 19:03:05.871162
1213	1	8	38	2	\N	2016-05-11	-28.00	074	2020-10-29 19:03:05.872989	2020-10-29 19:03:05.872989
1214	5	6	24	2	\N	2016-05-12	-7.00	318	2020-10-29 19:03:05.874446	2020-10-29 19:03:05.874446
1215	5	1	5	2	\N	2016-05-12	-13.00	e7f	2020-10-29 19:03:05.876219	2020-10-29 19:03:05.876219
1216	5	5	18	2	\N	2016-05-13	-22.98	9ad	2020-10-29 19:03:05.878141	2020-10-29 19:03:05.878141
1217	2	6	24	2	\N	2016-05-13	-189.99	751	2020-10-29 19:03:05.87991	2020-10-29 19:03:05.87991
1218	2	5	18	2	\N	2016-05-13	-33.98	360	2020-10-29 19:03:05.88164	2020-10-29 19:03:05.88164
1219	5	1	5	2	\N	2016-05-13	-9.06	ecd	2020-10-29 19:03:05.882995	2020-10-29 19:03:05.882995
1220	2	1	5	1	\N	2016-05-13	9.06	ecd	2020-10-29 19:03:05.884867	2020-10-29 19:03:05.884867
1221	1	9	45	2	\N	2016-05-10	-109.00	ef6	2020-10-29 19:03:05.886503	2020-10-29 19:03:05.886503
1222	1	1	7	2	\N	2016-05-12	-4.28	757	2020-10-29 19:03:05.888155	2020-10-29 19:03:05.888155
1223	1	1	7	2	\N	2016-05-13	-2.80	73e	2020-10-29 19:03:05.889906	2020-10-29 19:03:05.889906
1224	1	1	7	2	\N	2016-05-12	-2.80	73e	2020-10-29 19:03:05.89157	2020-10-29 19:03:05.89157
1225	1	1	7	2	\N	2016-05-13	-15.65	e33	2020-10-29 19:03:05.893661	2020-10-29 19:03:05.893661
1226	5	1	5	2	\N	2016-05-14	-12.62	d3a	2020-10-29 19:03:05.895522	2020-10-29 19:03:05.895522
1227	5	1	5	2	\N	2016-05-24	-22.00	79c	2020-10-29 19:03:05.89746	2020-10-29 19:03:05.89746
1228	2	1	5	1	\N	2016-05-24	22.00	79c	2020-10-29 19:03:05.899081	2020-10-29 19:03:05.899081
1229	5	7	27	4	\N	2016-05-14	2000.00	ffa	2020-10-29 19:03:05.900784	2020-10-29 19:03:05.900784
1230	6	7	27	3	\N	2016-05-14	-2000.00	ffa	2020-10-29 19:03:05.902914	2020-10-29 19:03:05.902914
1231	5	1	5	2	\N	2016-05-24	-9.48	4b4	2020-10-29 19:03:05.904633	2020-10-29 19:03:05.904633
1232	5	1	5	2	\N	2016-05-23	-30.63	e5f	2020-10-29 19:03:05.90633	2020-10-29 19:03:05.90633
1233	5	1	-1	2	\N	2016-05-24	-22.79	3ad	2020-10-29 19:03:05.907991	2020-10-29 19:03:05.907991
1234	5	1	5	2	\N	2016-05-24	-5.77	568	2020-10-29 19:03:05.90968	2020-10-29 19:03:05.90968
1235	5	1	5	2	\N	2016-05-24	-69.87	e5f	2020-10-29 19:03:05.911366	2020-10-29 19:03:05.911366
1236	5	1	6	2	\N	2016-05-20	-231.12	82e	2020-10-29 19:03:05.913636	2020-10-29 19:03:05.913636
1237	5	1	-1	2	\N	2016-05-17	-39.00	4dd	2020-10-29 19:03:05.915116	2020-10-29 19:03:05.915116
1238	5	7	27	2	\N	2016-05-14	-1428.45	aca	2020-10-29 19:03:05.916546	2020-10-29 19:03:05.916546
1239	1	7	34	2	\N	2016-05-22	-89.73	52f	2020-10-29 19:03:05.917902	2020-10-29 19:03:05.917902
1240	5	1	5	2	\N	2016-05-26	-11.28	621	2020-10-29 19:03:05.919287	2020-10-29 19:03:05.919287
1241	2	8	38	2	\N	2016-05-26	-5.60	f60	2020-10-29 19:03:05.920974	2020-10-29 19:03:05.920974
1242	2	8	38	2	\N	2016-05-26	-50.00	556	2020-10-29 19:03:05.922254	2020-10-29 19:03:05.922254
1243	2	1	6	2	\N	2016-05-26	-9.90	711	2020-10-29 19:03:05.923485	2020-10-29 19:03:05.923485
1244	5	9	45	2	\N	2016-05-26	-6.49	b52	2020-10-29 19:03:05.924778	2020-10-29 19:03:05.924778
1245	2	9	45	1	\N	2016-05-26	6.49	b52	2020-10-29 19:03:05.926045	2020-10-29 19:03:05.926045
1246	2	4	15	2	\N	2016-05-26	-45.13	efa	2020-10-29 19:03:05.927472	2020-10-29 19:03:05.927472
1247	2	4	13	2	\N	2016-05-26	-20.10	f2b	2020-10-29 19:03:05.928937	2020-10-29 19:03:05.928937
1248	2	2	1	1	\N	2016-05-26	5173.68	214	2020-10-29 19:03:05.930334	2020-10-29 19:03:05.930334
1249	2	10	51	2	\N	2016-05-26	-900.00	59e	2020-10-29 19:03:05.931697	2020-10-29 19:03:05.931697
1250	5	10	51	1	\N	2016-05-26	900.00	59e	2020-10-29 19:03:05.954796	2020-10-29 19:03:05.954796
1251	2	10	51	2	\N	2016-05-26	-900.00	a93	2020-10-29 19:03:05.95616	2020-10-29 19:03:05.95616
1252	6	10	51	1	\N	2016-05-26	900.00	a93	2020-10-29 19:03:05.9574	2020-10-29 19:03:05.9574
1253	2	10	51	2	\N	2016-05-26	-2200.00	aa1	2020-10-29 19:03:05.97694	2020-10-29 19:03:05.97694
1254	4	10	51	1	\N	2016-05-26	2200.00	aa1	2020-10-29 19:03:05.978458	2020-10-29 19:03:05.978458
1255	5	4	10	2	\N	2016-05-26	-349.79	297	2020-10-29 19:03:05.979652	2020-10-29 19:03:05.979652
1256	5	4	12	2	\N	2016-05-26	-96.17	b16	2020-10-29 19:03:05.980861	2020-10-29 19:03:05.980861
1257	5	4	11	2	\N	2016-05-26	-96.53	d3d	2020-10-29 19:03:05.982029	2020-10-29 19:03:05.982029
1258	2	5	22	2	\N	2016-05-27	-35.00	9da	2020-10-29 19:03:05.983191	2020-10-29 19:03:05.983191
1259	2	1	6	2	\N	2016-05-27	-9.50	c2c	2020-10-29 19:03:05.984491	2020-10-29 19:03:05.984491
1260	2	5	18	2	\N	2016-05-27	-2.99	658	2020-10-29 19:03:05.985942	2020-10-29 19:03:05.985942
1261	2	8	41	2	\N	2016-05-27	-12.60	0dc	2020-10-29 19:03:05.987078	2020-10-29 19:03:05.987078
1262	5	1	5	2	\N	2016-05-29	-58.10	e9d	2020-10-29 19:03:05.988158	2020-10-29 19:03:05.988158
1263	2	1	5	1	\N	2016-05-29	58.10	e9d	2020-10-29 19:03:05.989307	2020-10-29 19:03:05.989307
1264	1	2	1	1	\N	2016-05-24	8506.13	498	2020-10-29 19:03:05.990532	2020-10-29 19:03:05.990532
1265	1	1	-1	2	\N	2016-05-27	-17.17	353	2020-10-29 19:03:05.991924	2020-10-29 19:03:05.991924
1266	1	1	5	2	\N	2016-05-27	-4.18	dd3	2020-10-29 19:03:05.99325	2020-10-29 19:03:05.99325
1267	1	9	-1	2	\N	2016-05-27	-142.00	744	2020-10-29 19:03:05.99566	2020-10-29 19:03:05.99566
1268	1	8	38	2	\N	2016-05-27	-27.20	94a	2020-10-29 19:03:05.997333	2020-10-29 19:03:05.997333
1269	1	9	-1	2	\N	2016-05-27	-3.00	348	2020-10-29 19:03:05.998934	2020-10-29 19:03:05.998934
1270	1	9	-1	2	\N	2016-05-27	-86.00	73e	2020-10-29 19:03:06.000795	2020-10-29 19:03:06.000795
1271	5	1	5	2	\N	2016-05-30	-8.99	d83	2020-10-29 19:03:06.002396	2020-10-29 19:03:06.002396
1272	5	1	5	2	\N	2016-05-30	-5.29	dd3	2020-10-29 19:03:06.003986	2020-10-29 19:03:06.003986
1273	1	10	51	3	\N	2016-05-29	-700.00	f85	2020-10-29 19:03:06.005639	2020-10-29 19:03:06.005639
1274	1	10	51	3	\N	2016-05-29	-1500.00	902	2020-10-29 19:03:06.007312	2020-10-29 19:03:06.007312
1275	5	10	51	4	\N	2016-05-29	1500.00	902	2020-10-29 19:03:06.008842	2020-10-29 19:03:06.008842
1276	1	10	51	3	\N	2016-05-29	-3000.00	1cf	2020-10-29 19:03:06.010146	2020-10-29 19:03:06.010146
1277	6	10	51	4	\N	2016-05-29	3000.00	1cf	2020-10-29 19:03:06.011906	2020-10-29 19:03:06.011906
1278	1	1	6	2	\N	2016-05-28	-60.00	18f	2020-10-29 19:03:06.013601	2020-10-29 19:03:06.013601
1279	1	1	5	2	\N	2016-05-28	-8.81	6e9	2020-10-29 19:03:06.015047	2020-10-29 19:03:06.015047
1280	1	1	-1	2	\N	2016-05-28	-21.33	082	2020-10-29 19:03:06.017045	2020-10-29 19:03:06.017045
1281	1	10	51	3	\N	2016-05-29	-4000.00	e41	2020-10-29 19:03:06.018748	2020-10-29 19:03:06.018748
1282	3	10	51	4	\N	2016-05-29	4000.00	e41	2020-10-29 19:03:06.020377	2020-10-29 19:03:06.020377
1283	5	1	6	2	\N	2016-05-29	-180.00	d17	2020-10-29 19:03:06.021956	2020-10-29 19:03:06.021956
1284	1	1	4	2	\N	2016-05-27	-5.29	a4a	2020-10-29 19:03:06.023588	2020-10-29 19:03:06.023588
1285	5	1	5	2	\N	2016-05-27	-10.50	473	2020-10-29 19:03:06.025196	2020-10-29 19:03:06.025196
1286	5	1	5	2	\N	2016-05-25	-131.49	e5f	2020-10-29 19:03:06.026935	2020-10-29 19:03:06.026935
1287	1	10	51	4	\N	2016-05-25	200.00	eec	2020-10-29 19:03:06.028552	2020-10-29 19:03:06.028552
1288	5	8	40	2	\N	2016-05-29	-23.42	9d6	2020-10-29 19:03:06.030364	2020-10-29 19:03:06.030364
1289	5	8	40	2	\N	2016-05-29	-65.20	e52	2020-10-29 19:03:06.03205	2020-10-29 19:03:06.03205
1290	2	8	38	2	\N	2016-05-30	-46.00	1c5	2020-10-29 19:03:06.033977	2020-10-29 19:03:06.033977
1291	5	4	13	2	\N	2016-05-30	-49.90	b5c	2020-10-29 19:03:06.035629	2020-10-29 19:03:06.035629
1292	5	1	5	2	\N	2016-05-30	-54.30	785	2020-10-29 19:03:06.036961	2020-10-29 19:03:06.036961
1293	2	1	5	1	\N	2016-05-30	54.30	785	2020-10-29 19:03:06.038987	2020-10-29 19:03:06.038987
1294	2	9	44	2	\N	2016-05-31	-300.00	f32	2020-10-29 19:03:06.040566	2020-10-29 19:03:06.040566
1295	1	8	40	2	\N	2016-05-31	-517.00	3cb	2020-10-29 19:03:06.042098	2020-10-29 19:03:06.042098
1296	5	1	5	2	\N	2016-05-02	-43.30	a4a	2020-10-29 19:03:06.043773	2020-10-29 19:03:06.043773
1297	5	1	5	2	\N	2016-06-01	-13.30	92b	2020-10-29 19:03:06.045591	2020-10-29 19:03:06.045591
1298	2	1	5	1	\N	2016-06-01	13.30	92b	2020-10-29 19:03:06.046856	2020-10-29 19:03:06.046856
1299	2	1	6	2	\N	2016-06-01	-21.90	55d	2020-10-29 19:03:06.048115	2020-10-29 19:03:06.048115
1300	2	1	6	2	\N	2016-06-01	-5.00	cb5	2020-10-29 19:03:06.049747	2020-10-29 19:03:06.049747
1301	5	1	5	2	\N	2016-06-02	-13.86	d41	2020-10-29 19:03:06.051023	2020-10-29 19:03:06.051023
1302	5	1	6	2	\N	2016-06-06	-35.50	a85	2020-10-29 19:03:06.052709	2020-10-29 19:03:06.052709
1303	2	1	5	2	\N	2016-06-03	-1.99	0e7	2020-10-29 19:03:06.054113	2020-10-29 19:03:06.054113
1304	2	9	45	2	\N	2016-06-04	-4.79	6e6	2020-10-29 19:03:06.055495	2020-10-29 19:03:06.055495
1305	2	9	45	2	\N	2016-06-06	-80.00	e66	2020-10-29 19:03:06.057156	2020-10-29 19:03:06.057156
1306	5	1	5	2	\N	2016-06-07	-21.37	a36	2020-10-29 19:03:06.05867	2020-10-29 19:03:06.05867
1307	2	1	6	2	\N	2016-06-07	-10.90	0b6	2020-10-29 19:03:06.060131	2020-10-29 19:03:06.060131
1308	2	1	6	2	\N	2016-06-08	-35.50	a85	2020-10-29 19:03:06.0618	2020-10-29 19:03:06.0618
1309	5	1	6	1	\N	2016-06-08	35.50	2f5	2020-10-29 19:03:06.063228	2020-10-29 19:03:06.063228
1310	5	1	5	2	\N	2016-06-08	-15.78	fc1	2020-10-29 19:03:06.064698	2020-10-29 19:03:06.064698
1311	5	9	-1	2	\N	2016-06-04	-500.00	e1e	2020-10-29 19:03:06.066	2020-10-29 19:03:06.066
1312	5	8	40	2	\N	2016-06-01	-192.01	cf3	2020-10-29 19:03:06.067669	2020-10-29 19:03:06.067669
1313	5	8	40	2	\N	2016-06-05	-188.43	f53	2020-10-29 19:03:06.069215	2020-10-29 19:03:06.069215
1314	5	8	40	2	\N	2016-06-03	-183.74	705	2020-10-29 19:03:06.07075	2020-10-29 19:03:06.07075
1315	5	8	40	2	\N	2016-06-08	-517.00	85c	2020-10-29 19:03:06.072334	2020-10-29 19:03:06.072334
1316	1	1	4	2	\N	2016-06-07	-2.00	e33	2020-10-29 19:03:06.073907	2020-10-29 19:03:06.073907
1317	1	1	7	2	\N	2016-06-03	-2.45	756	2020-10-29 19:03:06.075533	2020-10-29 19:03:06.075533
1318	1	1	7	2	\N	2016-06-07	-3.64	f06	2020-10-29 19:03:06.077126	2020-10-29 19:03:06.077126
1319	1	1	5	2	\N	2016-06-06	-5.56	4e7	2020-10-29 19:03:06.079808	2020-10-29 19:03:06.079808
1320	1	1	7	2	\N	2016-06-06	-2.80	756	2020-10-29 19:03:06.081814	2020-10-29 19:03:06.081814
1321	1	1	5	2	\N	2016-06-04	-23.02	d5c	2020-10-29 19:03:06.083698	2020-10-29 19:03:06.083698
1322	1	1	7	2	\N	2016-06-03	-3.32	f06	2020-10-29 19:03:06.08565	2020-10-29 19:03:06.08565
1323	5	1	5	2	\N	2016-06-09	-15.96	45a	2020-10-29 19:03:06.087318	2020-10-29 19:03:06.087318
1324	5	9	45	2	\N	2016-06-09	-49.99	75b	2020-10-29 19:03:06.088833	2020-10-29 19:03:06.088833
1325	2	6	24	2	\N	2016-06-09	-16.00	8a6	2020-10-29 19:03:06.089956	2020-10-29 19:03:06.089956
1326	5	1	5	2	\N	2016-06-09	-6.50	3f5	2020-10-29 19:03:06.091143	2020-10-29 19:03:06.091143
1327	2	1	5	2	\N	2016-06-09	-6.10	09c	2020-10-29 19:03:06.092263	2020-10-29 19:03:06.092263
1328	5	9	-1	2	\N	2016-06-09	-36.50	869	2020-10-29 19:03:06.093447	2020-10-29 19:03:06.093447
1329	2	9	-1	1	\N	2016-06-09	36.50	b40	2020-10-29 19:03:06.094966	2020-10-29 19:03:06.094966
1330	5	1	5	2	\N	2016-06-10	-15.00	912	2020-10-29 19:03:06.096336	2020-10-29 19:03:06.096336
1331	2	1	6	2	\N	2016-06-10	-14.00	9d8	2020-10-29 19:03:06.097546	2020-10-29 19:03:06.097546
1332	1	1	5	2	\N	2016-06-09	-3.18	f4a	2020-10-29 19:03:06.098718	2020-10-29 19:03:06.098718
1333	1	1	7	2	\N	2016-06-09	-2.80	756	2020-10-29 19:03:06.099839	2020-10-29 19:03:06.099839
1334	5	1	5	2	\N	2016-06-11	-114.39	e5f	2020-10-29 19:03:06.101004	2020-10-29 19:03:06.101004
1335	1	1	-1	2	\N	2016-06-10	-20.55	f8a	2020-10-29 19:03:06.102166	2020-10-29 19:03:06.102166
1336	1	1	5	2	\N	2016-06-10	-3.12	52d	2020-10-29 19:03:06.103415	2020-10-29 19:03:06.103415
1337	1	1	-1	2	\N	2016-06-11	-130.10	3ab	2020-10-29 19:03:06.104772	2020-10-29 19:03:06.104772
1338	2	7	28	2	\N	2016-06-12	-14.00	843	2020-10-29 19:03:06.106028	2020-10-29 19:03:06.106028
1339	2	1	6	2	\N	2016-06-12	-11.50	1d4	2020-10-29 19:03:06.107222	2020-10-29 19:03:06.107222
1340	2	1	5	2	\N	2016-06-12	-15.80	e7f	2020-10-29 19:03:06.108375	2020-10-29 19:03:06.108375
1341	5	1	5	2	\N	2016-06-12	-15.80	e7f	2020-10-29 19:03:06.109455	2020-10-29 19:03:06.109455
1342	2	1	5	1	\N	2016-06-12	15.80	5ba	2020-10-29 19:03:06.11066	2020-10-29 19:03:06.11066
1343	1	1	4	2	\N	2016-06-12	-8.47	6e0	2020-10-29 19:03:06.112469	2020-10-29 19:03:06.112469
1344	5	6	24	2	\N	2016-06-13	-99.81	a7e	2020-10-29 19:03:06.114249	2020-10-29 19:03:06.114249
1345	2	6	24	2	\N	2016-06-13	-22.00	76a	2020-10-29 19:03:06.115951	2020-10-29 19:03:06.115951
1346	2	1	5	2	\N	2016-06-13	-11.20	903	2020-10-29 19:03:06.117763	2020-10-29 19:03:06.117763
1347	2	1	5	2	\N	2016-06-15	-11.00	ecd	2020-10-29 19:03:06.119394	2020-10-29 19:03:06.119394
1348	2	1	5	2	\N	2016-06-15	-40.73	129	2020-10-29 19:03:06.121151	2020-10-29 19:03:06.121151
1349	2	6	24	2	\N	2016-06-15	-39.99	4d2	2020-10-29 19:03:06.122685	2020-10-29 19:03:06.122685
1350	2	9	45	2	\N	2016-06-15	-64.90	dfc	2020-10-29 19:03:06.123887	2020-10-29 19:03:06.123887
1351	2	4	13	2	\N	2016-06-16	-19.99	fad	2020-10-29 19:03:06.125071	2020-10-29 19:03:06.125071
1352	2	5	18	2	\N	2016-06-16	-14.10	469	2020-10-29 19:03:06.126156	2020-10-29 19:03:06.126156
1353	2	5	18	2	\N	2016-06-16	-35.27	b91	2020-10-29 19:03:06.127278	2020-10-29 19:03:06.127278
1354	6	9	-1	3	\N	2016-06-16	-973.62	d41	2020-10-29 19:03:06.12859	2020-10-29 19:03:06.12859
1355	5	9	-1	4	\N	2016-06-16	973.62	d41	2020-10-29 19:03:06.130557	2020-10-29 19:03:06.130557
1356	5	1	5	2	\N	2016-06-17	-19.28	289	2020-10-29 19:03:06.131689	2020-10-29 19:03:06.131689
1357	2	1	5	2	\N	2016-06-17	-19.70	905	2020-10-29 19:03:06.132787	2020-10-29 19:03:06.132787
1358	5	1	5	2	\N	2016-06-17	-82.63	004	2020-10-29 19:03:06.133891	2020-10-29 19:03:06.133891
1359	2	1	5	1	\N	2016-06-17	82.63	004	2020-10-29 19:03:06.134959	2020-10-29 19:03:06.134959
1360	5	6	24	2	\N	2016-06-17	-22.00	35d	2020-10-29 19:03:06.136042	2020-10-29 19:03:06.136042
1361	2	6	24	1	\N	2016-06-17	22.00	35d	2020-10-29 19:03:06.137104	2020-10-29 19:03:06.137104
1362	1	8	38	2	\N	2016-06-17	-6.20	f79	2020-10-29 19:03:06.138102	2020-10-29 19:03:06.138102
1363	1	5	18	2	\N	2016-06-13	-103.41	846	2020-10-29 19:03:06.139126	2020-10-29 19:03:06.139126
1364	1	1	7	2	\N	2016-06-17	-5.03	72a	2020-10-29 19:03:06.140177	2020-10-29 19:03:06.140177
1365	1	1	7	2	\N	2016-06-13	-11.52	e33	2020-10-29 19:03:06.141213	2020-10-29 19:03:06.141213
1366	1	1	7	2	\N	2016-06-13	-3.92	72a	2020-10-29 19:03:06.142277	2020-10-29 19:03:06.142277
1367	1	1	7	2	\N	2016-06-13	-3.50	ae0	2020-10-29 19:03:06.143419	2020-10-29 19:03:06.143419
1368	1	1	7	2	\N	2016-06-16	-23.84	e33	2020-10-29 19:03:06.144487	2020-10-29 19:03:06.144487
1369	1	1	-1	2	\N	2016-06-16	-6.78	3ea	2020-10-29 19:03:06.145664	2020-10-29 19:03:06.145664
1370	5	1	5	2	\N	2016-06-18	-17.11	d9a	2020-10-29 19:03:06.146764	2020-10-29 19:03:06.146764
1371	1	1	5	2	\N	2016-06-18	-6.58	439	2020-10-29 19:03:06.147883	2020-10-29 19:03:06.147883
1372	5	1	5	2	\N	2016-06-18	-68.58	6ee	2020-10-29 19:03:06.148941	2020-10-29 19:03:06.148941
1373	2	1	-1	2	\N	2016-06-18	-9.00	43c	2020-10-29 19:03:06.149967	2020-10-29 19:03:06.149967
1374	2	1	-1	2	\N	2016-06-18	-8.00	b15	2020-10-29 19:03:06.151016	2020-10-29 19:03:06.151016
1375	2	1	-1	2	\N	2016-06-18	-8.00	b15	2020-10-29 19:03:06.152069	2020-10-29 19:03:06.152069
1376	2	1	-1	2	\N	2016-06-18	-27.00	4a6	2020-10-29 19:03:06.153554	2020-10-29 19:03:06.153554
1377	2	1	5	2	\N	2016-06-18	-9.50	461	2020-10-29 19:03:06.154673	2020-10-29 19:03:06.154673
1378	5	1	5	2	\N	2016-06-18	-9.50	8cb	2020-10-29 19:03:06.155781	2020-10-29 19:03:06.155781
1379	2	1	5	1	\N	2016-06-18	9.50	8cb	2020-10-29 19:03:06.156872	2020-10-29 19:03:06.156872
1380	2	6	24	2	\N	2016-06-19	-45.50	907	2020-10-29 19:03:06.157982	2020-10-29 19:03:06.157982
1381	2	1	5	2	\N	2016-06-19	-28.80	7c6	2020-10-29 19:03:06.159056	2020-10-29 19:03:06.159056
1382	5	6	24	2	\N	2016-06-19	-33.00	637	2020-10-29 19:03:06.160179	2020-10-29 19:03:06.160179
1383	5	1	5	2	\N	2016-06-19	-28.80	07b	2020-10-29 19:03:06.16145	2020-10-29 19:03:06.16145
1384	2	6	24	1	\N	2016-06-19	33.00	637	2020-10-29 19:03:06.162676	2020-10-29 19:03:06.162676
1385	2	1	5	1	\N	2016-06-19	28.80	07b	2020-10-29 19:03:06.163729	2020-10-29 19:03:06.163729
1386	2	1	5	2	\N	2016-06-21	-20.92	5ec	2020-10-29 19:03:06.165136	2020-10-29 19:03:06.165136
1387	5	1	5	2	\N	2016-06-21	-20.92	8b2	2020-10-29 19:03:06.166249	2020-10-29 19:03:06.166249
1388	2	1	5	1	\N	2016-06-21	20.92	e57	2020-10-29 19:03:06.167334	2020-10-29 19:03:06.167334
1389	2	1	5	2	\N	2016-06-22	-17.18	f2b	2020-10-29 19:03:06.168444	2020-10-29 19:03:06.168444
1390	5	1	5	2	\N	2016-06-21	-17.18	941	2020-10-29 19:03:06.169635	2020-10-29 19:03:06.169635
1391	2	1	5	1	\N	2016-06-21	17.18	941	2020-10-29 19:03:06.170997	2020-10-29 19:03:06.170997
1392	2	6	24	2	\N	2016-06-22	-45.00	128	2020-10-29 19:03:06.172122	2020-10-29 19:03:06.172122
1393	2	5	18	2	\N	2016-06-22	-23.97	293	2020-10-29 19:03:06.173172	2020-10-29 19:03:06.173172
1394	2	6	24	2	\N	2016-06-23	-44.60	ed5	2020-10-29 19:03:06.174272	2020-10-29 19:03:06.174272
1395	2	6	24	2	\N	2016-06-23	-55.70	6ab	2020-10-29 19:03:06.175389	2020-10-29 19:03:06.175389
1396	2	9	45	2	\N	2016-06-23	-39.90	1f1	2020-10-29 19:03:06.176496	2020-10-29 19:03:06.176496
1397	2	1	5	2	\N	2016-06-23	-14.00	d93	2020-10-29 19:03:06.177533	2020-10-29 19:03:06.177533
1398	2	5	18	2	\N	2016-06-24	-7.99	b4f	2020-10-29 19:03:06.178723	2020-10-29 19:03:06.178723
1399	1	1	7	2	\N	2016-06-23	-4.00	ae0	2020-10-29 19:03:06.17986	2020-10-29 19:03:06.17986
1400	1	1	4	2	\N	2016-06-23	-2.00	801	2020-10-29 19:03:06.180969	2020-10-29 19:03:06.180969
1401	1	1	5	2	\N	2016-06-22	-21.62	67d	2020-10-29 19:03:06.182002	2020-10-29 19:03:06.182002
1402	1	8	39	2	\N	2016-06-24	-29.10	04c	2020-10-29 19:03:06.183084	2020-10-29 19:03:06.183084
1403	1	1	7	2	\N	2016-06-23	-15.00	e33	2020-10-29 19:03:06.184268	2020-10-29 19:03:06.184268
1404	1	8	38	2	\N	2016-06-21	-46.00	483	2020-10-29 19:03:06.185402	2020-10-29 19:03:06.185402
1405	1	2	1	1	\N	2016-06-24	8303.05	0f0	2020-10-29 19:03:06.186648	2020-10-29 19:03:06.186648
1406	1	10	51	3	\N	2016-06-24	-1500.00	785	2020-10-29 19:03:06.187897	2020-10-29 19:03:06.187897
1407	5	10	51	4	\N	2016-06-24	1500.00	785	2020-10-29 19:03:06.189179	2020-10-29 19:03:06.189179
1408	1	10	51	3	\N	2016-06-24	-500.00	ece	2020-10-29 19:03:06.190453	2020-10-29 19:03:06.190453
1409	1	8	38	2	\N	2016-06-24	-27.99	074	2020-10-29 19:03:06.191678	2020-10-29 19:03:06.191678
1410	1	10	51	3	\N	2016-06-24	-1000.00	2e9	2020-10-29 19:03:06.193012	2020-10-29 19:03:06.193012
1411	3	10	51	4	\N	2016-06-24	1000.00	2e9	2020-10-29 19:03:06.194289	2020-10-29 19:03:06.194289
1412	1	10	51	3	\N	2016-06-24	-5000.00	85c	2020-10-29 19:03:06.196054	2020-10-29 19:03:06.196054
1413	6	10	51	4	\N	2016-06-24	5000.00	85c	2020-10-29 19:03:06.197368	2020-10-29 19:03:06.197368
1414	1	1	5	2	\N	2016-06-25	-4.50	473	2020-10-29 19:03:06.198752	2020-10-29 19:03:06.198752
1415	5	1	5	2	\N	2016-06-25	-2.55	c99	2020-10-29 19:03:06.199945	2020-10-29 19:03:06.199945
1416	5	1	5	2	\N	2016-06-25	-7.20	022	2020-10-29 19:03:06.201157	2020-10-29 19:03:06.201157
1417	1	1	-1	2	\N	2016-06-25	-25.12	f8a	2020-10-29 19:03:06.202301	2020-10-29 19:03:06.202301
1418	1	1	4	2	\N	2016-06-25	-10.00	d93	2020-10-29 19:03:06.203512	2020-10-29 19:03:06.203512
1419	5	1	5	2	\N	2016-06-25	-14.91	4f4	2020-10-29 19:03:06.204819	2020-10-29 19:03:06.204819
1420	5	1	5	2	\N	2016-06-25	-155.25	e5f	2020-10-29 19:03:06.206335	2020-10-29 19:03:06.206335
1421	5	1	6	2	\N	2016-06-26	-40.00	5c8	2020-10-29 19:03:06.20784	2020-10-29 19:03:06.20784
1422	1	1	6	2	\N	2016-06-26	-9.00	8fc	2020-10-29 19:03:06.209385	2020-10-29 19:03:06.209385
1423	2	1	5	2	\N	2016-06-26	-36.41	14c	2020-10-29 19:03:06.211007	2020-10-29 19:03:06.211007
1424	5	1	5	2	\N	2016-06-26	-36.41	958	2020-10-29 19:03:06.212322	2020-10-29 19:03:06.212322
1425	2	1	5	1	\N	2016-06-26	36.41	958	2020-10-29 19:03:06.213482	2020-10-29 19:03:06.213482
1426	2	1	-1	2	\N	2016-06-26	-9.50	6ae	2020-10-29 19:03:06.214495	2020-10-29 19:03:06.214495
1427	2	7	30	2	\N	2016-06-26	-10.00	62c	2020-10-29 19:03:06.21546	2020-10-29 19:03:06.21546
1428	1	1	5	2	\N	2016-06-26	-0.99	4a6	2020-10-29 19:03:06.216436	2020-10-29 19:03:06.216436
1429	5	5	20	2	\N	2016-06-27	-12.95	810	2020-10-29 19:03:06.217394	2020-10-29 19:03:06.217394
1430	2	1	5	2	\N	2016-06-27	-10.30	ecd	2020-10-29 19:03:06.218407	2020-10-29 19:03:06.218407
1431	5	4	13	2	\N	2016-06-27	-49.90	eb7	2020-10-29 19:03:06.219369	2020-10-29 19:03:06.219369
1432	2	2	1	1	\N	2016-06-27	3734.30	961	2020-10-29 19:03:06.22034	2020-10-29 19:03:06.22034
1433	2	10	51	3	\N	2016-06-27	-900.00	71c	2020-10-29 19:03:06.221289	2020-10-29 19:03:06.221289
1434	2	10	51	3	\N	2016-06-27	-900.00	a56	2020-10-29 19:03:06.222297	2020-10-29 19:03:06.222297
1435	5	10	51	4	\N	2016-06-27	900.00	71c	2020-10-29 19:03:06.223313	2020-10-29 19:03:06.223313
1436	6	10	51	4	\N	2016-06-27	900.00	a56	2020-10-29 19:03:06.224409	2020-10-29 19:03:06.224409
1437	2	10	51	3	\N	2016-06-27	-1100.00	741	2020-10-29 19:03:06.225458	2020-10-29 19:03:06.225458
1438	6	10	51	4	\N	2016-06-27	1100.00	741	2020-10-29 19:03:06.22658	2020-10-29 19:03:06.22658
1439	5	4	10	2	\N	2016-06-28	-373.99	19c	2020-10-29 19:03:06.228071	2020-10-29 19:03:06.228071
1440	5	4	12	2	\N	2016-06-28	-96.17	463	2020-10-29 19:03:06.229795	2020-10-29 19:03:06.229795
1441	2	4	15	2	\N	2016-06-28	-39.99	efa	2020-10-29 19:03:06.231045	2020-10-29 19:03:06.231045
1442	5	1	5	2	\N	2016-06-28	-60.53	35b	2020-10-29 19:03:06.232145	2020-10-29 19:03:06.232145
1443	1	1	7	2	\N	2016-06-27	-3.50	ae0	2020-10-29 19:03:06.233355	2020-10-29 19:03:06.233355
1444	1	9	46	2	\N	2016-06-28	-364.00	415	2020-10-29 19:03:06.234538	2020-10-29 19:03:06.234538
1445	1	1	-1	2	\N	2016-06-27	-23.55	fe9	2020-10-29 19:03:06.235604	2020-10-29 19:03:06.235604
1446	1	6	24	2	\N	2016-06-28	-75.02	0a0	2020-10-29 19:03:06.236684	2020-10-29 19:03:06.236684
1447	5	5	20	2	\N	2016-06-29	-43.60	e2d	2020-10-29 19:03:06.237819	2020-10-29 19:03:06.237819
1448	2	1	-1	2	\N	2016-06-29	-4.50	052	2020-10-29 19:03:06.238996	2020-10-29 19:03:06.238996
1449	2	1	5	2	\N	2016-06-30	-19.50	6cf	2020-10-29 19:03:06.240165	2020-10-29 19:03:06.240165
1450	5	1	5	2	\N	2016-06-30	-29.80	9c9	2020-10-29 19:03:06.241403	2020-10-29 19:03:06.241403
1451	2	1	5	1	\N	2016-06-30	29.80	9c9	2020-10-29 19:03:06.242615	2020-10-29 19:03:06.242615
1452	2	9	-1	2	\N	2016-06-30	-31.00	ba5	2020-10-29 19:03:06.24427	2020-10-29 19:03:06.24427
1453	1	1	-1	2	\N	2016-06-30	-16.76	f50	2020-10-29 19:03:06.245826	2020-10-29 19:03:06.245826
1454	2	1	5	2	\N	2016-07-01	-60.00	236	2020-10-29 19:03:06.247447	2020-10-29 19:03:06.247447
1455	5	1	5	2	\N	2016-07-01	-34.51	6ee	2020-10-29 19:03:06.248958	2020-10-29 19:03:06.248958
1456	2	1	5	2	\N	2016-07-01	-14.49	12b	2020-10-29 19:03:06.250695	2020-10-29 19:03:06.250695
1457	1	10	51	3	\N	2016-07-02	-300.00	60c	2020-10-29 19:03:06.252325	2020-10-29 19:03:06.252325
1458	5	10	51	4	\N	2016-07-02	300.00	60c	2020-10-29 19:03:06.254036	2020-10-29 19:03:06.254036
1459	5	5	22	2	\N	2016-07-02	-35.00	e60	2020-10-29 19:03:06.255744	2020-10-29 19:03:06.255744
1460	5	1	5	2	\N	2016-07-02	-270.11	20c	2020-10-29 19:03:06.257508	2020-10-29 19:03:06.257508
1461	5	1	5	2	\N	2016-07-02	-6.00	473	2020-10-29 19:03:06.259057	2020-10-29 19:03:06.259057
1462	5	9	-1	3	\N	2016-07-02	-160.00	1e8	2020-10-29 19:03:06.260777	2020-10-29 19:03:06.260777
1463	1	9	-1	4	\N	2016-07-02	160.00	1e8	2020-10-29 19:03:06.262487	2020-10-29 19:03:06.262487
1464	6	2	1	1	\N	2016-06-30	35.73	15b	2020-10-29 19:03:06.264033	2020-10-29 19:03:06.264033
1465	5	5	20	2	\N	2016-07-02	-20.66	560	2020-10-29 19:03:06.265682	2020-10-29 19:03:06.265682
1466	2	6	24	2	\N	2016-07-03	-69.98	115	2020-10-29 19:03:06.267314	2020-10-29 19:03:06.267314
1467	5	9	44	2	\N	2016-07-03	-20.00	511	2020-10-29 19:03:06.268981	2020-10-29 19:03:06.268981
1468	2	1	5	2	\N	2016-07-04	-16.82	e7f	2020-10-29 19:03:06.270747	2020-10-29 19:03:06.270747
1469	2	1	5	2	\N	2016-07-04	-27.72	7e9	2020-10-29 19:03:06.272408	2020-10-29 19:03:06.272408
1470	2	8	42	2	\N	2016-07-04	-30.80	879	2020-10-29 19:03:06.273996	2020-10-29 19:03:06.273996
1471	5	1	5	2	\N	2016-07-05	-40.56	cc9	2020-10-29 19:03:06.275716	2020-10-29 19:03:06.275716
1472	5	1	5	2	\N	2016-07-05	-27.72	38e	2020-10-29 19:03:06.277488	2020-10-29 19:03:06.277488
1473	2	1	5	1	\N	2016-07-05	27.72	38e	2020-10-29 19:03:06.279201	2020-10-29 19:03:06.279201
1474	2	6	24	2	\N	2016-07-09	-4.98	593	2020-10-29 19:03:06.28081	2020-10-29 19:03:06.28081
1475	2	1	6	2	\N	2016-07-08	-34.80	4ff	2020-10-29 19:03:06.282505	2020-10-29 19:03:06.282505
1476	2	1	5	2	\N	2016-07-08	-9.53	e07	2020-10-29 19:03:06.284041	2020-10-29 19:03:06.284041
1477	2	1	6	2	\N	2016-07-07	-15.00	28b	2020-10-29 19:03:06.285881	2020-10-29 19:03:06.285881
1478	2	9	45	2	\N	2016-07-09	-100.00	b57	2020-10-29 19:03:06.287616	2020-10-29 19:03:06.287616
1479	2	7	30	1	\N	2016-07-07	188.20	29d	2020-10-29 19:03:06.289685	2020-10-29 19:03:06.289685
1480	5	1	6	2	\N	2016-07-11	-44.33	aee	2020-10-29 19:03:06.291953	2020-10-29 19:03:06.291953
1481	2	1	6	1	\N	2016-07-11	44.33	aee	2020-10-29 19:03:06.294308	2020-10-29 19:03:06.294308
1482	1	1	7	2	\N	2016-07-11	-2.45	0e8	2020-10-29 19:03:06.296785	2020-10-29 19:03:06.296785
1483	1	1	7	2	\N	2016-07-11	-15.00	0d1	2020-10-29 19:03:06.298963	2020-10-29 19:03:06.298963
1484	5	8	40	2	\N	2016-07-10	-175.60	9e2	2020-10-29 19:03:06.301204	2020-10-29 19:03:06.301204
1485	1	1	4	2	\N	2016-07-10	-9.58	4ce	2020-10-29 19:03:06.302959	2020-10-29 19:03:06.302959
1486	5	1	-1	2	\N	2016-07-07	-33.56	f35	2020-10-29 19:03:06.304111	2020-10-29 19:03:06.304111
1487	1	1	5	2	\N	2016-07-11	-1.50	473	2020-10-29 19:03:06.30538	2020-10-29 19:03:06.30538
1488	1	8	42	2	\N	2016-07-07	-12.00	550	2020-10-29 19:03:06.306637	2020-10-29 19:03:06.306637
1489	1	1	6	2	\N	2016-07-07	-25.00	000	2020-10-29 19:03:06.307775	2020-10-29 19:03:06.307775
1490	1	1	5	2	\N	2016-07-03	-21.46	6b9	2020-10-29 19:03:06.308798	2020-10-29 19:03:06.308798
1491	5	9	45	2	\N	2016-07-07	-500.00	1e0	2020-10-29 19:03:06.309803	2020-10-29 19:03:06.309803
1492	1	1	4	2	\N	2016-07-05	-4.00	546	2020-10-29 19:03:06.310756	2020-10-29 19:03:06.310756
1493	1	1	5	2	\N	2016-07-05	-2.50	3df	2020-10-29 19:03:06.311791	2020-10-29 19:03:06.311791
1494	1	1	5	2	\N	2016-07-05	-4.00	3fe	2020-10-29 19:03:06.312807	2020-10-29 19:03:06.312807
1495	5	5	20	2	\N	2016-07-07	-7.46	18d	2020-10-29 19:03:06.313916	2020-10-29 19:03:06.313916
1496	5	1	4	2	\N	2016-07-06	-16.00	534	2020-10-29 19:03:06.315066	2020-10-29 19:03:06.315066
1497	1	1	5	2	\N	2016-07-05	-41.10	eed	2020-10-29 19:03:06.316181	2020-10-29 19:03:06.316181
1498	1	5	20	2	\N	2016-07-11	-35.59	fa1	2020-10-29 19:03:06.317301	2020-10-29 19:03:06.317301
1499	1	2	1	1	\N	2016-07-04	696.60	7f8	2020-10-29 19:03:06.318469	2020-10-29 19:03:06.318469
1500	5	8	40	2	\N	2016-07-08	-169.12	1e9	2020-10-29 19:03:06.319755	2020-10-29 19:03:06.319755
1501	5	1	5	2	\N	2016-07-09	-19.76	317	2020-10-29 19:03:06.320799	2020-10-29 19:03:06.320799
1502	5	1	5	2	\N	2016-07-09	-23.72	0d9	2020-10-29 19:03:06.321883	2020-10-29 19:03:06.321883
1503	5	9	45	2	\N	2016-07-08	-12.99	e86	2020-10-29 19:03:06.322986	2020-10-29 19:03:06.322986
1504	1	7	27	2	\N	2016-07-07	-24.00	5e2	2020-10-29 19:03:06.324043	2020-10-29 19:03:06.324043
1505	1	1	-1	2	\N	2016-07-04	-21.00	7ee	2020-10-29 19:03:06.325173	2020-10-29 19:03:06.325173
1506	1	1	6	2	\N	2016-07-06	-25.00	f7d	2020-10-29 19:03:06.326253	2020-10-29 19:03:06.326253
1507	1	1	-1	2	\N	2016-07-06	-16.00	43e	2020-10-29 19:03:06.327499	2020-10-29 19:03:06.327499
1508	1	9	-1	2	\N	2016-07-11	-30.00	47a	2020-10-29 19:03:06.328758	2020-10-29 19:03:06.328758
1509	1	1	4	2	\N	2016-07-12	-5.98	5d0	2020-10-29 19:03:06.33033	2020-10-29 19:03:06.33033
1510	1	1	4	2	\N	2016-07-12	-4.56	f9c	2020-10-29 19:03:06.331431	2020-10-29 19:03:06.331431
1511	5	9	-1	2	\N	2016-07-12	-26.89	2fc	2020-10-29 19:03:06.332512	2020-10-29 19:03:06.332512
1512	2	4	13	2	\N	2016-07-12	-19.99	f2b	2020-10-29 19:03:06.333623	2020-10-29 19:03:06.333623
1513	1	1	-1	2	\N	2016-07-13	-50.00	71d	2020-10-29 19:03:06.334958	2020-10-29 19:03:06.334958
1514	1	1	7	2	\N	2016-07-14	-2.45	0e8	2020-10-29 19:03:06.336025	2020-10-29 19:03:06.336025
1515	1	1	7	2	\N	2016-07-14	-13.43	b98	2020-10-29 19:03:06.337043	2020-10-29 19:03:06.337043
1516	1	1	4	2	\N	2016-07-14	-2.00	916	2020-10-29 19:03:06.338055	2020-10-29 19:03:06.338055
1517	1	1	5	2	\N	2016-07-13	-5.19	1eb	2020-10-29 19:03:06.339129	2020-10-29 19:03:06.339129
1518	2	6	24	2	\N	2016-07-14	-50.00	36b	2020-10-29 19:03:06.340173	2020-10-29 19:03:06.340173
1519	5	6	24	2	\N	2016-07-14	-30.00	654	2020-10-29 19:03:06.341231	2020-10-29 19:03:06.341231
1520	2	6	24	2	\N	2016-07-14	-169.98	8c0	2020-10-29 19:03:06.342271	2020-10-29 19:03:06.342271
1521	2	6	24	2	\N	2016-07-14	-29.90	055	2020-10-29 19:03:06.343494	2020-10-29 19:03:06.343494
1522	1	8	40	2	\N	2016-07-15	-6.00	475	2020-10-29 19:03:06.344779	2020-10-29 19:03:06.344779
1523	1	1	-1	2	\N	2016-07-15	-46.00	f79	2020-10-29 19:03:06.345978	2020-10-29 19:03:06.345978
1524	1	10	51	1	\N	2016-07-17	200.00	7d2	2020-10-29 19:03:06.347073	2020-10-29 19:03:06.347073
1525	1	10	51	3	\N	2016-07-17	-200.00	7d2	2020-10-29 19:03:06.348125	2020-10-29 19:03:06.348125
1526	1	1	5	2	\N	2016-07-17	-3.36	473	2020-10-29 19:03:06.349154	2020-10-29 19:03:06.349154
1527	5	8	40	2	\N	2016-07-17	-149.31	3d6	2020-10-29 19:03:06.3502	2020-10-29 19:03:06.3502
1528	1	1	5	2	\N	2016-07-16	-12.99	c79	2020-10-29 19:03:06.351351	2020-10-29 19:03:06.351351
1529	2	8	42	2	\N	2016-07-15	-54.00	84f	2020-10-29 19:03:06.352508	2020-10-29 19:03:06.352508
1530	2	1	5	2	\N	2016-07-18	-92.15	87f	2020-10-29 19:03:06.354018	2020-10-29 19:03:06.354018
1531	2	6	24	2	\N	2016-07-18	-39.90	d5f	2020-10-29 19:03:06.355336	2020-10-29 19:03:06.355336
1532	2	8	38	2	\N	2016-07-18	-30.80	f38	2020-10-29 19:03:06.356626	2020-10-29 19:03:06.356626
1533	1	2	3	1	\N	2016-07-19	180.00	9ac	2020-10-29 19:03:06.358508	2020-10-29 19:03:06.358508
1534	5	2	3	4	\N	2016-07-19	180.00	9ac	2020-10-29 19:03:06.359642	2020-10-29 19:03:06.359642
1535	1	9	45	3	\N	2016-07-19	-180.00	9ac	2020-10-29 19:03:06.360942	2020-10-29 19:03:06.360942
1536	1	1	7	2	\N	2016-07-19	-14.00	820	2020-10-29 19:03:06.362206	2020-10-29 19:03:06.362206
1537	1	1	5	2	\N	2016-07-19	-2.50	473	2020-10-29 19:03:06.363486	2020-10-29 19:03:06.363486
1538	2	1	5	2	\N	2016-07-19	-20.04	8b9	2020-10-29 19:03:06.36463	2020-10-29 19:03:06.36463
1539	2	6	24	2	\N	2016-07-19	-79.90	5ce	2020-10-29 19:03:06.365748	2020-10-29 19:03:06.365748
1540	5	4	14	2	\N	2016-07-20	-112.00	670	2020-10-29 19:03:06.366845	2020-10-29 19:03:06.366845
1541	2	6	24	2	\N	2016-07-20	-30.00	b0e	2020-10-29 19:03:06.367995	2020-10-29 19:03:06.367995
1542	2	6	24	2	\N	2016-07-20	-12.50	ed7	2020-10-29 19:03:06.369141	2020-10-29 19:03:06.369141
1543	5	1	5	2	\N	2016-07-20	-17.10	6ee	2020-10-29 19:03:06.370272	2020-10-29 19:03:06.370272
1544	2	7	-1	2	\N	2016-07-20	-12.50	3ed	2020-10-29 19:03:06.371509	2020-10-29 19:03:06.371509
1545	2	7	6	2	\N	2016-07-20	-14.00	c75	2020-10-29 19:03:06.372723	2020-10-29 19:03:06.372723
1546	1	1	5	2	\N	2016-07-21	-7.20	eed	2020-10-29 19:03:06.374114	2020-10-29 19:03:06.374114
1547	1	1	-1	2	\N	2016-07-21	-252.09	ffc	2020-10-29 19:03:06.375327	2020-10-29 19:03:06.375327
1548	1	8	38	2	\N	2016-07-21	-46.00	776	2020-10-29 19:03:06.376458	2020-10-29 19:03:06.376458
1549	1	1	7	2	\N	2016-07-21	-3.82	f9c	2020-10-29 19:03:06.377522	2020-10-29 19:03:06.377522
1550	1	2	2	1	\N	2016-07-22	22.00	88e	2020-10-29 19:03:06.378714	2020-10-29 19:03:06.378714
1551	1	1	6	2	\N	2016-07-23	-20.00	5b7	2020-10-29 19:03:06.37997	2020-10-29 19:03:06.37997
1552	1	1	5	2	\N	2016-07-23	-5.00	d9a	2020-10-29 19:03:06.38111	2020-10-29 19:03:06.38111
1553	1	1	5	2	\N	2016-07-23	-2.00	473	2020-10-29 19:03:06.382163	2020-10-29 19:03:06.382163
1554	1	1	5	2	\N	2016-07-23	-6.80	473	2020-10-29 19:03:06.383254	2020-10-29 19:03:06.383254
1555	1	9	-1	2	\N	2016-07-22	-40.00	881	2020-10-29 19:03:06.384423	2020-10-29 19:03:06.384423
1556	2	2	3	1	\N	2016-07-22	40.00	881	2020-10-29 19:03:06.385679	2020-10-29 19:03:06.385679
1557	1	1	6	2	\N	2016-07-24	-10.00	834	2020-10-29 19:03:06.38683	2020-10-29 19:03:06.38683
1558	1	1	5	2	\N	2016-07-23	-17.20	b46	2020-10-29 19:03:06.38799	2020-10-29 19:03:06.38799
1559	1	1	4	2	\N	2016-07-22	-12.37	5d0	2020-10-29 19:03:06.389194	2020-10-29 19:03:06.389194
1560	5	1	5	2	\N	2016-07-22	-9.23	862	2020-10-29 19:03:06.390433	2020-10-29 19:03:06.390433
1561	2	1	6	2	\N	2016-07-23	-3.20	e7f	2020-10-29 19:03:06.391576	2020-10-29 19:03:06.391576
1562	2	6	24	1	\N	2016-07-22	60.00	04b	2020-10-29 19:03:06.392727	2020-10-29 19:03:06.392727
1563	2	1	6	2	\N	2016-07-25	-10.00	834	2020-10-29 19:03:06.393883	2020-10-29 19:03:06.393883
1564	2	2	3	1	\N	2016-07-25	5137.95	2f3	2020-10-29 19:03:06.395255	2020-10-29 19:03:06.395255
1565	2	10	51	3	\N	2016-07-25	-1500.00	d0f	2020-10-29 19:03:06.396625	2020-10-29 19:03:06.396625
1566	5	10	51	4	\N	2016-07-25	1500.00	d0f	2020-10-29 19:03:06.397732	2020-10-29 19:03:06.397732
1567	2	10	51	3	\N	2016-07-25	-1500.00	e63	2020-10-29 19:03:06.398846	2020-10-29 19:03:06.398846
1568	6	10	51	4	\N	2016-07-25	1500.00	e63	2020-10-29 19:03:06.400053	2020-10-29 19:03:06.400053
1569	5	4	13	2	\N	2016-07-25	-49.90	478	2020-10-29 19:03:06.401283	2020-10-29 19:03:06.401283
1570	5	4	10	2	\N	2016-07-25	-361.89	0a6	2020-10-29 19:03:06.40257	2020-10-29 19:03:06.40257
1571	2	9	45	2	\N	2016-07-25	-100.00	360	2020-10-29 19:03:06.403735	2020-10-29 19:03:06.403735
1572	5	8	42	2	\N	2016-07-25	-54.00	033	2020-10-29 19:03:06.404859	2020-10-29 19:03:06.404859
1573	2	8	42	1	\N	2016-07-25	54.00	033	2020-10-29 19:03:06.406003	2020-10-29 19:03:06.406003
1574	5	1	5	2	\N	2016-07-25	-92.15	367	2020-10-29 19:03:06.40715	2020-10-29 19:03:06.40715
1575	2	1	5	1	\N	2016-07-25	92.15	709	2020-10-29 19:03:06.40822	2020-10-29 19:03:06.40822
1576	5	1	5	2	\N	2016-07-25	-20.04	07d	2020-10-29 19:03:06.409391	2020-10-29 19:03:06.409391
1577	2	1	5	1	\N	2016-07-25	20.04	07d	2020-10-29 19:03:06.410753	2020-10-29 19:03:06.410753
1578	5	6	24	2	\N	2016-07-25	-30.00	0ad	2020-10-29 19:03:06.412002	2020-10-29 19:03:06.412002
1579	2	6	24	1	\N	2016-07-25	30.00	0ad	2020-10-29 19:03:06.413317	2020-10-29 19:03:06.413317
1580	2	2	3	2	\N	2016-07-25	-40.00	242	2020-10-29 19:03:06.414402	2020-10-29 19:03:06.414402
1581	1	2	3	1	\N	2016-07-25	40.00	242	2020-10-29 19:03:06.415484	2020-10-29 19:03:06.415484
1582	5	5	18	2	\N	2016-07-25	-76.81	c45	2020-10-29 19:03:06.416581	2020-10-29 19:03:06.416581
1583	2	5	18	2	\N	2016-07-25	-25.96	ad4	2020-10-29 19:03:06.417614	2020-10-29 19:03:06.417614
1584	5	5	18	1	\N	2016-07-25	25.96	ad4	2020-10-29 19:03:06.418657	2020-10-29 19:03:06.418657
1585	2	1	5	2	\N	2016-07-25	-17.14	427	2020-10-29 19:03:06.419797	2020-10-29 19:03:06.419797
1586	1	1	4	2	\N	2016-07-25	-1.30	533	2020-10-29 19:03:06.421049	2020-10-29 19:03:06.421049
1587	1	1	4	2	\N	2016-07-26	-2.00	a4a	2020-10-29 19:03:06.422299	2020-10-29 19:03:06.422299
1588	1	9	45	2	\N	2016-07-26	-13.00	779	2020-10-29 19:03:06.423429	2020-10-29 19:03:06.423429
1589	1	1	5	2	\N	2016-07-25	-31.20	3f0	2020-10-29 19:03:06.424482	2020-10-29 19:03:06.424482
1590	1	1	7	2	\N	2016-07-26	-16.37	b98	2020-10-29 19:03:06.425557	2020-10-29 19:03:06.425557
1591	5	9	-1	3	\N	2016-07-26	-60.00	323	2020-10-29 19:03:06.42671	2020-10-29 19:03:06.42671
1592	1	2	3	4	\N	2016-07-26	60.00	974	2020-10-29 19:03:06.428674	2020-10-29 19:03:06.428674
1593	1	1	4	2	\N	2016-07-26	-10.30	6dc	2020-10-29 19:03:06.429886	2020-10-29 19:03:06.429886
1594	1	1	7	2	\N	2016-07-27	-13.63	b98	2020-10-29 19:03:06.430996	2020-10-29 19:03:06.430996
1595	1	1	4	2	\N	2016-07-27	-4.63	f9c	2020-10-29 19:03:06.432075	2020-10-29 19:03:06.432075
1596	5	1	5	2	\N	2016-07-27	-87.48	b73	2020-10-29 19:03:06.43318	2020-10-29 19:03:06.43318
1597	5	1	5	2	\N	2016-07-27	-10.65	c20	2020-10-29 19:03:06.434225	2020-10-29 19:03:06.434225
1598	1	9	-1	2	\N	2016-07-28	-60.00	301	2020-10-29 19:03:06.435379	2020-10-29 19:03:06.435379
1599	5	2	2	4	\N	2016-07-28	60.00	301	2020-10-29 19:03:06.436713	2020-10-29 19:03:06.436713
1600	1	2	2	1	\N	2016-07-28	16.00	c81	2020-10-29 19:03:06.437776	2020-10-29 19:03:06.437776
1601	1	2	1	4	\N	2016-07-28	10012.32	8e4	2020-10-29 19:03:06.438794	2020-10-29 19:03:06.438794
1602	1	10	51	3	\N	2016-07-28	-500.00	bd1	2020-10-29 19:03:06.439803	2020-10-29 19:03:06.439803
1603	1	10	51	3	\N	2016-07-28	-1500.00	e76	2020-10-29 19:03:06.440799	2020-10-29 19:03:06.440799
1604	6	10	51	4	\N	2016-07-28	1500.00	e76	2020-10-29 19:03:06.441846	2020-10-29 19:03:06.441846
1605	1	10	51	2	\N	2016-07-28	-1500.00	98b	2020-10-29 19:03:06.442909	2020-10-29 19:03:06.442909
1606	1	10	51	3	\N	2016-07-28	-5000.00	d68	2020-10-29 19:03:06.444011	2020-10-29 19:03:06.444011
1607	5	10	51	4	\N	2016-07-28	5000.00	d68	2020-10-29 19:03:06.4451	2020-10-29 19:03:06.4451
1608	1	8	40	2	\N	2016-07-28	-403.50	fb0	2020-10-29 19:03:06.44632	2020-10-29 19:03:06.44632
1609	2	4	13	2	\N	2016-07-28	-19.99	f2b	2020-10-29 19:03:06.44745	2020-10-29 19:03:06.44745
1610	2	4	15	2	\N	2016-07-28	-40.22	efa	2020-10-29 19:03:06.448553	2020-10-29 19:03:06.448553
1611	5	8	40	2	\N	2016-07-30	-29.69	90b	2020-10-29 19:03:06.449673	2020-10-29 19:03:06.449673
1612	1	1	5	2	\N	2016-07-30	-9.86	254	2020-10-29 19:03:06.45072	2020-10-29 19:03:06.45072
1613	1	6	25	2	\N	2016-07-30	-194.00	b63	2020-10-29 19:03:06.451762	2020-10-29 19:03:06.451762
1614	5	8	40	2	\N	2016-07-29	-176.67	faf	2020-10-29 19:03:06.452774	2020-10-29 19:03:06.452774
1615	5	8	40	2	\N	2016-07-29	-111.74	91e	2020-10-29 19:03:06.453858	2020-10-29 19:03:06.453858
1616	1	7	33	2	\N	2016-07-31	-56.56	be5	2020-10-29 19:03:06.455032	2020-10-29 19:03:06.455032
1617	1	7	30	2	\N	2016-07-31	-29.99	822	2020-10-29 19:03:06.456097	2020-10-29 19:03:06.456097
1618	1	7	32	2	\N	2016-07-31	-40.00	45e	2020-10-29 19:03:06.457232	2020-10-29 19:03:06.457232
1619	1	1	8	2	\N	2016-07-31	-10.30	6dc	2020-10-29 19:03:06.458435	2020-10-29 19:03:06.458435
1620	1	1	4	2	\N	2016-07-31	-5.29	916	2020-10-29 19:03:06.459608	2020-10-29 19:03:06.459608
1621	1	2	2	1	\N	2016-08-01	115.00	42a	2020-10-29 19:03:06.460785	2020-10-29 19:03:06.460785
1622	1	2	2	1	\N	2016-08-01	131.50	d7a	2020-10-29 19:03:06.462195	2020-10-29 19:03:06.462195
1623	1	1	8	2	\N	2016-08-02	-3.50	f9c	2020-10-29 19:03:06.463753	2020-10-29 19:03:06.463753
1624	1	1	8	2	\N	2016-08-02	-1.80	f15	2020-10-29 19:03:06.464833	2020-10-29 19:03:06.464833
1625	1	1	5	2	\N	2016-08-01	-2.00	473	2020-10-29 19:03:06.465881	2020-10-29 19:03:06.465881
1626	5	1	5	2	\N	2016-08-03	-15.74	67d	2020-10-29 19:03:06.467095	2020-10-29 19:03:06.467095
1627	1	1	-1	2	\N	2016-08-02	-22.00	d99	2020-10-29 19:03:06.468156	2020-10-29 19:03:06.468156
1628	6	2	2	1	\N	2016-08-01	43.44	6ad	2020-10-29 19:03:06.469274	2020-10-29 19:03:06.469274
1629	5	1	5	2	\N	2016-08-03	-35.10	a4a	2020-10-29 19:03:06.470344	2020-10-29 19:03:06.470344
1630	5	2	3	1	\N	2016-08-01	1500.00	16d	2020-10-29 19:03:06.471434	2020-10-29 19:03:06.471434
1631	2	9	-1	2	\N	2016-08-04	-135.00	922	2020-10-29 19:03:06.472518	2020-10-29 19:03:06.472518
1632	1	9	-1	1	\N	2016-08-04	135.00	922	2020-10-29 19:03:06.47359	2020-10-29 19:03:06.47359
1633	2	9	-1	1	\N	2016-08-04	135.00	922	2020-10-29 19:03:06.474613	2020-10-29 19:03:06.474613
1634	2	4	13	1	\N	2016-08-04	60.00	c44	2020-10-29 19:03:06.475624	2020-10-29 19:03:06.475624
1635	2	8	39	2	\N	2016-08-04	-88.20	098	2020-10-29 19:03:06.476682	2020-10-29 19:03:06.476682
1636	2	8	41	2	\N	2016-08-04	-16.00	466	2020-10-29 19:03:06.477753	2020-10-29 19:03:06.477753
1637	2	8	38	2	\N	2016-08-04	-8.40	c7e	2020-10-29 19:03:06.478976	2020-10-29 19:03:06.478976
1638	2	1	6	2	\N	2016-08-04	-14.00	e83	2020-10-29 19:03:06.480164	2020-10-29 19:03:06.480164
1639	2	1	6	2	\N	2016-08-04	-27.98	426	2020-10-29 19:03:06.481274	2020-10-29 19:03:06.481274
1640	2	6	24	2	\N	2016-08-04	-9.90	653	2020-10-29 19:03:06.482339	2020-10-29 19:03:06.482339
1641	2	6	24	2	\N	2016-08-04	-25.00	e6b	2020-10-29 19:03:06.483456	2020-10-29 19:03:06.483456
1642	5	8	39	2	\N	2016-08-04	-104.20	c9d	2020-10-29 19:03:06.48461	2020-10-29 19:03:06.48461
1643	2	8	39	1	\N	2016-08-04	104.20	c9d	2020-10-29 19:03:06.485882	2020-10-29 19:03:06.485882
1644	1	1	7	2	\N	2016-08-04	-30.00	f18	2020-10-29 19:03:06.486949	2020-10-29 19:03:06.486949
1645	1	1	6	2	\N	2016-08-05	-31.00	c65	2020-10-29 19:03:06.487965	2020-10-29 19:03:06.487965
1646	1	1	5	2	\N	2016-08-06	-9.00	473	2020-10-29 19:03:06.489087	2020-10-29 19:03:06.489087
1647	1	1	5	2	\N	2016-08-05	-5.47	d9a	2020-10-29 19:03:06.490246	2020-10-29 19:03:06.490246
1648	5	9	-1	3	\N	2016-08-06	-40.00	7b5	2020-10-29 19:03:06.491346	2020-10-29 19:03:06.491346
1649	1	2	2	4	\N	2016-08-06	40.00	7b5	2020-10-29 19:03:06.492393	2020-10-29 19:03:06.492393
1650	2	6	24	2	\N	2016-08-07	-17.00	e6b	2020-10-29 19:03:06.493505	2020-10-29 19:03:06.493505
1651	2	8	38	2	\N	2016-08-07	-14.00	1bf	2020-10-29 19:03:06.494575	2020-10-29 19:03:06.494575
1652	5	7	32	2	\N	2016-08-08	-97.00	a3d	2020-10-29 19:03:06.495829	2020-10-29 19:03:06.495829
1653	5	2	3	1	\N	2016-08-16	1200.00	102	2020-10-29 19:03:06.497027	2020-10-29 19:03:06.497027
1654	2	5	18	2	\N	2016-08-16	-26.46	296	2020-10-29 19:03:06.498082	2020-10-29 19:03:06.498082
1655	2	8	38	2	\N	2016-08-17	-50.00	94a	2020-10-29 19:03:06.499503	2020-10-29 19:03:06.499503
1656	1	7	33	2	\N	2016-08-18	-0.38	b89	2020-10-29 19:03:06.500619	2020-10-29 19:03:06.500619
1657	1	8	40	2	\N	2016-08-15	-175.24	0e8	2020-10-29 19:03:06.502031	2020-10-29 19:03:06.502031
1658	5	8	40	3	\N	2016-08-18	-175.24	0e8	2020-10-29 19:03:06.503118	2020-10-29 19:03:06.503118
1659	1	2	2	4	\N	2016-08-18	175.24	0e8	2020-10-29 19:03:06.504147	2020-10-29 19:03:06.504147
1660	1	1	4	2	\N	2016-08-15	-9.29	083	2020-10-29 19:03:06.505178	2020-10-29 19:03:06.505178
1661	1	9	-1	2	\N	2016-08-16	-64.56	be5	2020-10-29 19:03:06.506276	2020-10-29 19:03:06.506276
1662	1	9	-1	2	\N	2016-08-16	-64.56	1b4	2020-10-29 19:03:06.507333	2020-10-29 19:03:06.507333
1663	1	9	-1	2	\N	2016-08-16	-64.56	3f2	2020-10-29 19:03:06.508434	2020-10-29 19:03:06.508434
1664	1	4	47	2	\N	2016-08-16	-20.00	b73	2020-10-29 19:03:06.509694	2020-10-29 19:03:06.509694
1665	1	4	47	2	\N	2016-08-16	-20.00	b73	2020-10-29 19:03:06.510917	2020-10-29 19:03:06.510917
1666	1	4	47	2	\N	2016-08-16	-20.00	b73	2020-10-29 19:03:06.512538	2020-10-29 19:03:06.512538
1667	5	9	-1	3	\N	2016-08-18	-64.56	411	2020-10-29 19:03:06.513753	2020-10-29 19:03:06.513753
1668	1	2	2	4	\N	2016-08-18	64.56	411	2020-10-29 19:03:06.514905	2020-10-29 19:03:06.514905
1669	1	2	2	1	\N	2016-08-15	65.00	823	2020-10-29 19:03:06.516087	2020-10-29 19:03:06.516087
1670	1	9	-1	2	\N	2016-08-18	-1.80	1ed	2020-10-29 19:03:06.517306	2020-10-29 19:03:06.517306
1671	5	1	5	2	\N	2016-08-07	-79.83	a4a	2020-10-29 19:03:06.518546	2020-10-29 19:03:06.518546
1672	5	1	5	2	\N	2016-08-06	-46.92	0c6	2020-10-29 19:03:06.519732	2020-10-29 19:03:06.519732
1673	5	1	5	2	\N	2016-08-16	-69.94	a4a	2020-10-29 19:03:06.521078	2020-10-29 19:03:06.521078
1674	5	8	40	2	\N	2016-08-15	-100.14	01d	2020-10-29 19:03:06.522464	2020-10-29 19:03:06.522464
1675	5	8	40	2	\N	2016-08-10	-157.05	96f	2020-10-29 19:03:06.523733	2020-10-29 19:03:06.523733
1676	5	8	40	2	\N	2016-08-10	-87.69	96f	2020-10-29 19:03:06.524953	2020-10-29 19:03:06.524953
1677	5	7	27	2	\N	2016-08-18	-5906.92	483	2020-10-29 19:03:06.526253	2020-10-29 19:03:06.526253
1678	1	8	38	2	\N	2016-08-18	-46.00	912	2020-10-29 19:03:06.527628	2020-10-29 19:03:06.527628
1679	1	8	38	2	\N	2016-08-18	-27.20	074	2020-10-29 19:03:06.528961	2020-10-29 19:03:06.528961
1680	1	1	7	2	\N	2016-08-19	-14.87	e33	2020-10-29 19:03:06.530251	2020-10-29 19:03:06.530251
1681	1	1	-1	2	\N	2016-08-19	-20.50	d7c	2020-10-29 19:03:06.531894	2020-10-29 19:03:06.531894
1682	1	1	-1	2	\N	2016-08-19	-18.50	d7c	2020-10-29 19:03:06.533256	2020-10-29 19:03:06.533256
1683	1	1	6	2	\N	2016-08-19	-17.00	496	2020-10-29 19:03:06.5347	2020-10-29 19:03:06.5347
1684	1	1	-1	2	\N	2016-08-19	-17.00	d7c	2020-10-29 19:03:06.535816	2020-10-29 19:03:06.535816
1685	1	1	6	2	\N	2016-08-19	-26.00	ba4	2020-10-29 19:03:06.536937	2020-10-29 19:03:06.536937
1686	1	1	-1	2	\N	2016-08-19	-10.00	d7c	2020-10-29 19:03:06.538185	2020-10-29 19:03:06.538185
1687	5	1	5	3	\N	2016-08-19	-30.00	f83	2020-10-29 19:03:06.539666	2020-10-29 19:03:06.539666
1688	5	1	5	2	\N	2016-08-19	-51.06	a4a	2020-10-29 19:03:06.540887	2020-10-29 19:03:06.540887
1689	5	9	44	2	\N	2016-08-20	-50.00	af2	2020-10-29 19:03:06.542109	2020-10-29 19:03:06.542109
1690	5	9	44	2	\N	2016-08-20	-50.00	c78	2020-10-29 19:03:06.54331	2020-10-29 19:03:06.54331
1691	2	1	6	2	\N	2016-08-21	-68.20	1b6	2020-10-29 19:03:06.544553	2020-10-29 19:03:06.544553
1692	5	1	6	1	\N	2016-08-21	68.20	1b6	2020-10-29 19:03:06.545899	2020-10-29 19:03:06.545899
1693	2	1	6	2	\N	2016-08-19	-7.00	945	2020-10-29 19:03:06.547908	2020-10-29 19:03:06.547908
1694	2	1	-1	2	\N	2016-08-19	-9.00	6b0	2020-10-29 19:03:06.549571	2020-10-29 19:03:06.549571
1695	2	1	-1	2	\N	2016-08-19	-10.00	6b0	2020-10-29 19:03:06.551152	2020-10-29 19:03:06.551152
1696	2	1	-1	2	\N	2016-08-19	-11.00	943	2020-10-29 19:03:06.552834	2020-10-29 19:03:06.552834
1697	2	8	41	2	\N	2016-08-19	-13.00	0dc	2020-10-29 19:03:06.554456	2020-10-29 19:03:06.554456
1698	1	9	45	2	\N	2016-08-22	-500.00	06f	2020-10-29 19:03:06.555728	2020-10-29 19:03:06.555728
1699	1	1	7	2	\N	2016-08-22	-2.45	0e8	2020-10-29 19:03:06.556916	2020-10-29 19:03:06.556916
1700	5	1	5	2	\N	2016-08-22	-39.24	e5f	2020-10-29 19:03:06.558567	2020-10-29 19:03:06.558567
1701	1	9	45	2	\N	2016-08-23	-45.00	779	2020-10-29 19:03:06.559691	2020-10-29 19:03:06.559691
1702	2	5	18	2	\N	2016-08-23	-55.93	742	2020-10-29 19:03:06.560893	2020-10-29 19:03:06.560893
1703	2	1	6	2	\N	2016-08-23	-4.00	d93	2020-10-29 19:03:06.562541	2020-10-29 19:03:06.562541
1704	2	1	6	2	\N	2016-08-23	-30.00	b60	2020-10-29 19:03:06.56381	2020-10-29 19:03:06.56381
1705	5	1	5	2	\N	2016-08-24	-52.74	35b	2020-10-29 19:03:06.565054	2020-10-29 19:03:06.565054
1706	2	6	24	2	\N	2016-08-24	-7.00	6e4	2020-10-29 19:03:06.566329	2020-10-29 19:03:06.566329
1707	1	1	4	2	\N	2016-08-20	-5.29	a4a	2020-10-29 19:03:06.567644	2020-10-29 19:03:06.567644
1708	1	1	4	2	\N	2016-08-24	-2.00	a4a	2020-10-29 19:03:06.56882	2020-10-29 19:03:06.56882
1709	1	1	7	2	\N	2016-08-24	-16.16	e33	2020-10-29 19:03:06.57042	2020-10-29 19:03:06.57042
1710	2	1	-1	2	\N	2016-08-25	-24.00	807	2020-10-29 19:03:06.571655	2020-10-29 19:03:06.571655
1711	2	1	-1	2	\N	2016-08-25	-9.00	807	2020-10-29 19:03:06.572902	2020-10-29 19:03:06.572902
1712	2	8	41	2	\N	2016-08-25	-10.00	0dc	2020-10-29 19:03:06.574139	2020-10-29 19:03:06.574139
1713	5	5	20	2	\N	2016-08-26	-27.00	4a7	2020-10-29 19:03:06.575496	2020-10-29 19:03:06.575496
1714	2	4	15	2	\N	2016-08-27	-112.31	efa	2020-10-29 19:03:06.576815	2020-10-29 19:03:06.576815
1715	5	9	44	2	\N	2016-08-27	-50.00	302	2020-10-29 19:03:06.57817	2020-10-29 19:03:06.57817
1716	1	5	22	2	\N	2016-08-27	-35.00	9da	2020-10-29 19:03:06.579853	2020-10-29 19:03:06.579853
1717	5	8	40	2	\N	2016-08-27	-20.00	ea9	2020-10-29 19:03:06.581463	2020-10-29 19:03:06.581463
1718	5	1	5	2	\N	2016-08-27	-50.13	7d2	2020-10-29 19:03:06.582749	2020-10-29 19:03:06.582749
1719	5	1	4	2	\N	2016-08-25	-5.54	587	2020-10-29 19:03:06.584053	2020-10-29 19:03:06.584053
1720	1	1	5	2	\N	2016-08-26	-5.97	d9a	2020-10-29 19:03:06.585524	2020-10-29 19:03:06.585524
1721	1	5	18	2	\N	2016-08-27	-17.78	007	2020-10-29 19:03:06.586786	2020-10-29 19:03:06.586786
1722	1	1	-1	2	\N	2016-08-27	-17.30	3ea	2020-10-29 19:03:06.588135	2020-10-29 19:03:06.588135
1723	5	4	13	2	\N	2016-08-28	-49.90	97a	2020-10-29 19:03:06.589448	2020-10-29 19:03:06.589448
1724	2	1	6	2	\N	2016-08-28	-41.00	490	2020-10-29 19:03:06.591102	2020-10-29 19:03:06.591102
1725	1	9	-1	2	\N	2016-08-30	-100.00	47a	2020-10-29 19:03:06.592425	2020-10-29 19:03:06.592425
1726	1	2	1	1	\N	2016-08-30	9999.52	577	2020-10-29 19:03:06.593742	2020-10-29 19:03:06.593742
1727	5	1	5	2	\N	2016-08-28	-25.52	13c	2020-10-29 19:03:06.595972	2020-10-29 19:03:06.595972
1728	1	1	7	2	\N	2016-08-29	-10.62	e33	2020-10-29 19:03:06.597335	2020-10-29 19:03:06.597335
1729	1	7	30	2	\N	2016-08-31	-29.99	822	2020-10-29 19:03:06.598873	2020-10-29 19:03:06.598873
1730	1	1	4	2	\N	2016-08-27	-5.89	a4a	2020-10-29 19:03:06.600117	2020-10-29 19:03:06.600117
1731	1	9	-1	2	\N	2016-08-27	-10.00	466	2020-10-29 19:03:06.602326	2020-10-29 19:03:06.602326
1732	1	1	4	2	\N	2016-08-28	-4.59	a4a	2020-10-29 19:03:06.603611	2020-10-29 19:03:06.603611
1733	1	4	-1	3	\N	2016-08-30	-1500.00	5dc	2020-10-29 19:03:06.605255	2020-10-29 19:03:06.605255
1734	1	10	51	3	\N	2016-08-30	-5500.00	9e9	2020-10-29 19:03:06.606531	2020-10-29 19:03:06.606531
1735	6	10	51	4	\N	2016-08-30	5500.00	9e9	2020-10-29 19:03:06.607656	2020-10-29 19:03:06.607656
1736	1	10	51	3	\N	2016-08-30	-500.00	1d5	2020-10-29 19:03:06.608747	2020-10-29 19:03:06.608747
1737	1	10	51	3	\N	2016-08-30	-1000.00	ce8	2020-10-29 19:03:06.610381	2020-10-29 19:03:06.610381
1738	3	10	51	4	\N	2016-08-30	1000.00	ce8	2020-10-29 19:03:06.612106	2020-10-29 19:03:06.612106
1739	2	9	44	2	\N	2016-08-26	-50.00	3c9	2020-10-29 19:03:06.613711	2020-10-29 19:03:06.613711
1740	2	2	1	1	\N	2016-08-29	5842.60	ca5	2020-10-29 19:03:06.615046	2020-10-29 19:03:06.615046
1741	2	9	44	2	\N	2016-08-30	-50.00	f21	2020-10-29 19:03:06.616555	2020-10-29 19:03:06.616555
1742	5	5	20	2	\N	2016-08-29	-54.10	377	2020-10-29 19:03:06.617988	2020-10-29 19:03:06.617988
1743	2	10	51	3	\N	2016-08-31	-1500.00	3e6	2020-10-29 19:03:06.619609	2020-10-29 19:03:06.619609
1744	5	10	51	4	\N	2016-08-31	1500.00	3e6	2020-10-29 19:03:06.62093	2020-10-29 19:03:06.62093
1745	2	10	51	3	\N	2016-08-31	-2500.00	01f	2020-10-29 19:03:06.622468	2020-10-29 19:03:06.622468
1746	6	10	51	4	\N	2016-08-31	2500.00	01f	2020-10-29 19:03:06.623689	2020-10-29 19:03:06.623689
1747	5	4	10	2	\N	2016-08-31	-246.82	6cb	2020-10-29 19:03:06.625255	2020-10-29 19:03:06.625255
1748	5	4	11	2	\N	2016-08-31	-96.42	062	2020-10-29 19:03:06.626593	2020-10-29 19:03:06.626593
1749	2	10	51	3	\N	2016-08-31	-1000.00	3e6	2020-10-29 19:03:06.627875	2020-10-29 19:03:06.627875
1750	4	10	51	4	\N	2016-08-31	1000.00	3e6	2020-10-29 19:03:06.629865	2020-10-29 19:03:06.629865
1751	2	10	51	3	\N	2016-08-31	-1000.00	485	2020-10-29 19:03:06.631991	2020-10-29 19:03:06.631991
1752	6	10	51	4	\N	2016-08-31	1000.00	485	2020-10-29 19:03:06.633607	2020-10-29 19:03:06.633607
1753	1	1	4	2	\N	2016-08-31	-2.00	4d2	2020-10-29 19:03:06.635636	2020-10-29 19:03:06.635636
1754	5	1	5	2	\N	2016-09-02	-99.16	a4a	2020-10-29 19:03:06.636914	2020-10-29 19:03:06.636914
1755	2	9	44	2	\N	2016-09-05	-100.00	aea	2020-10-29 19:03:06.638191	2020-10-29 19:03:06.638191
1756	5	5	20	2	\N	2016-09-05	-27.49	09a	2020-10-29 19:03:06.639477	2020-10-29 19:03:06.639477
1757	1	8	41	2	\N	2016-09-02	-25.00	554	2020-10-29 19:03:06.640729	2020-10-29 19:03:06.640729
1758	1	1	-1	2	\N	2016-09-02	-129.00	7b2	2020-10-29 19:03:06.642137	2020-10-29 19:03:06.642137
1759	1	1	4	2	\N	2016-09-02	-13.95	694	2020-10-29 19:03:06.643556	2020-10-29 19:03:06.643556
1760	1	1	4	2	\N	2016-09-02	-15.00	96c	2020-10-29 19:03:06.644749	2020-10-29 19:03:06.644749
1761	1	1	-1	2	\N	2016-09-02	-30.00	c36	2020-10-29 19:03:06.646126	2020-10-29 19:03:06.646126
1762	1	8	42	2	\N	2016-08-30	-24.00	38a	2020-10-29 19:03:06.64742	2020-10-29 19:03:06.64742
1763	1	1	8	2	\N	2016-08-31	-1.80	f15	2020-10-29 19:03:06.648528	2020-10-29 19:03:06.648528
1764	1	1	4	2	\N	2016-09-02	-20.00	4d2	2020-10-29 19:03:06.649657	2020-10-29 19:03:06.649657
1765	1	1	4	2	\N	2016-09-03	-6.68	c22	2020-10-29 19:03:06.65078	2020-10-29 19:03:06.65078
1766	1	9	-1	2	\N	2016-09-03	-2.40	1e5	2020-10-29 19:03:06.651921	2020-10-29 19:03:06.651921
1767	5	1	5	2	\N	2016-09-03	-12.66	7d2	2020-10-29 19:03:06.653061	2020-10-29 19:03:06.653061
1768	1	1	7	2	\N	2016-09-02	-10.69	e33	2020-10-29 19:03:06.65415	2020-10-29 19:03:06.65415
1769	1	1	7	2	\N	2016-09-01	-15.96	e33	2020-10-29 19:03:06.655245	2020-10-29 19:03:06.655245
1770	1	10	51	3	\N	2016-09-05	-700.00	674	2020-10-29 19:03:06.656377	2020-10-29 19:03:06.656377
1771	5	10	51	4	\N	2016-09-05	700.00	674	2020-10-29 19:03:06.65746	2020-10-29 19:03:06.65746
1772	5	4	-1	2	\N	2016-09-05	-590.00	26e	2020-10-29 19:03:06.65858	2020-10-29 19:03:06.65858
1773	1	1	4	2	\N	2016-09-04	-10.92	cf6	2020-10-29 19:03:06.659712	2020-10-29 19:03:06.659712
1774	6	10	51	1	\N	2016-08-31	46.31	6ad	2020-10-29 19:03:06.660785	2020-10-29 19:03:06.660785
1775	1	1	7	2	\N	2016-09-06	-13.00	d47	2020-10-29 19:03:06.662245	2020-10-29 19:03:06.662245
1776	1	1	4	2	\N	2016-09-06	-7.77	6e8	2020-10-29 19:03:06.663502	2020-10-29 19:03:06.663502
1777	2	1	7	2	\N	2016-09-06	-8.00	635	2020-10-29 19:03:06.664567	2020-10-29 19:03:06.664567
1778	2	1	7	2	\N	2016-09-06	-10.14	3a4	2020-10-29 19:03:06.665723	2020-10-29 19:03:06.665723
1779	2	9	44	2	\N	2016-09-06	-50.00	98a	2020-10-29 19:03:06.666931	2020-10-29 19:03:06.666931
1780	5	9	45	2	\N	2016-09-06	-42.00	f2d	2020-10-29 19:03:06.668076	2020-10-29 19:03:06.668076
1781	5	10	51	1	\N	2016-09-06	1500.00	00b	2020-10-29 19:03:06.669167	2020-10-29 19:03:06.669167
1782	5	10	51	3	\N	2016-09-07	-700.00	824	2020-10-29 19:03:06.670413	2020-10-29 19:03:06.670413
1783	1	10	51	4	\N	2016-09-07	700.00	824	2020-10-29 19:03:06.671546	2020-10-29 19:03:06.671546
1784	5	1	5	2	\N	2016-09-07	-51.26	e5f	2020-10-29 19:03:06.672661	2020-10-29 19:03:06.672661
1785	1	1	-1	2	\N	2016-09-07	-95.57	f50	2020-10-29 19:03:06.674427	2020-10-29 19:03:06.674427
1786	5	1	5	2	\N	2016-09-08	-14.28	89e	2020-10-29 19:03:06.675462	2020-10-29 19:03:06.675462
1787	5	5	20	2	\N	2016-09-09	-7.80	ece	2020-10-29 19:03:06.67651	2020-10-29 19:03:06.67651
1788	5	1	5	2	\N	2016-09-09	-5.30	933	2020-10-29 19:03:06.677559	2020-10-29 19:03:06.677559
1789	1	1	-1	2	\N	2016-09-08	-26.00	30a	2020-10-29 19:03:06.678679	2020-10-29 19:03:06.678679
1790	1	1	5	2	\N	2016-09-10	-5.00	7d2	2020-10-29 19:03:06.680152	2020-10-29 19:03:06.680152
1791	5	1	5	2	\N	2016-09-12	-11.94	b9f	2020-10-29 19:03:06.681466	2020-10-29 19:03:06.681466
1792	2	9	-1	2	\N	2016-09-13	-130.00	a39	2020-10-29 19:03:06.682988	2020-10-29 19:03:06.682988
1793	2	1	7	2	\N	2016-09-13	-12.60	4e5	2020-10-29 19:03:06.684296	2020-10-29 19:03:06.684296
1794	2	9	44	2	\N	2016-09-14	-50.00	3a8	2020-10-29 19:03:06.685775	2020-10-29 19:03:06.685775
1795	5	1	5	2	\N	2016-09-15	-68.43	e5f	2020-10-29 19:03:06.686984	2020-10-29 19:03:06.686984
1796	5	1	5	2	\N	2016-09-13	-50.00	9eb	2020-10-29 19:03:06.688227	2020-10-29 19:03:06.688227
1797	5	1	5	2	\N	2016-09-14	-10.91	2f1	2020-10-29 19:03:06.689409	2020-10-29 19:03:06.689409
1798	1	1	7	2	\N	2016-09-15	-10.72	e33	2020-10-29 19:03:06.69048	2020-10-29 19:03:06.69048
1799	1	8	41	2	\N	2016-09-09	-50.00	6e5	2020-10-29 19:03:06.691504	2020-10-29 19:03:06.691504
1800	1	7	33	2	\N	2016-09-15	-144.90	600	2020-10-29 19:03:06.692552	2020-10-29 19:03:06.692552
1801	5	9	-1	2	\N	2016-09-18	-10.00	990	2020-10-29 19:03:06.693625	2020-10-29 19:03:06.693625
1802	1	1	6	2	\N	2016-09-18	-5.00	946	2020-10-29 19:03:06.694851	2020-10-29 19:03:06.694851
1803	1	9	46	2	\N	2016-09-18	-55.99	a71	2020-10-29 19:03:06.69635	2020-10-29 19:03:06.69635
1804	5	1	5	2	\N	2016-09-17	-11.48	225	2020-10-29 19:03:06.697775	2020-10-29 19:03:06.697775
1805	5	1	5	2	\N	2016-09-17	-11.94	d9a	2020-10-29 19:03:06.699207	2020-10-29 19:03:06.699207
1806	5	1	5	2	\N	2016-09-17	-7.18	fdb	2020-10-29 19:03:06.700488	2020-10-29 19:03:06.700488
1807	5	1	5	2	\N	2016-09-17	-6.00	473	2020-10-29 19:03:06.702642	2020-10-29 19:03:06.702642
1808	1	1	7	2	\N	2016-09-16	-19.63	b98	2020-10-29 19:03:06.704063	2020-10-29 19:03:06.704063
1809	1	1	4	2	\N	2016-09-16	-2.00	4d2	2020-10-29 19:03:06.705817	2020-10-29 19:03:06.705817
1810	5	1	5	2	\N	2016-09-17	-98.36	2c6	2020-10-29 19:03:06.708182	2020-10-29 19:03:06.708182
1811	2	4	13	2	\N	2016-09-21	-19.99	be5	2020-10-29 19:03:06.710107	2020-10-29 19:03:06.710107
1812	2	9	45	2	\N	2016-09-24	-220.00	ef6	2020-10-29 19:03:06.711737	2020-10-29 19:03:06.711737
1813	1	9	45	1	\N	2016-09-24	220.00	ef6	2020-10-29 19:03:06.713883	2020-10-29 19:03:06.713883
1814	5	5	20	2	\N	2016-09-24	-77.59	c6f	2020-10-29 19:03:06.715335	2020-10-29 19:03:06.715335
1815	1	1	5	2	\N	2016-09-24	-11.32	7d2	2020-10-29 19:03:06.716657	2020-10-29 19:03:06.716657
1816	1	1	7	2	\N	2016-09-23	-12.79	b98	2020-10-29 19:03:06.717908	2020-10-29 19:03:06.717908
1817	5	1	5	2	\N	2016-09-24	-100.98	a4a	2020-10-29 19:03:06.719228	2020-10-29 19:03:06.719228
1818	1	1	8	2	\N	2016-09-24	-93.53	fbf	2020-10-29 19:03:06.720816	2020-10-29 19:03:06.720816
1819	1	8	38	2	\N	2016-09-23	-19.83	c05	2020-10-29 19:03:06.722047	2020-10-29 19:03:06.722047
1820	1	10	51	1	\N	2016-09-17	200.00	9bf	2020-10-29 19:03:06.723325	2020-10-29 19:03:06.723325
1821	1	10	51	3	\N	2016-09-17	-200.00	9bf	2020-10-29 19:03:06.724708	2020-10-29 19:03:06.724708
1822	1	1	-1	2	\N	2016-09-09	-95.57	a29	2020-10-29 19:03:06.72596	2020-10-29 19:03:06.72596
1823	1	8	38	2	\N	2016-09-24	-46.00	912	2020-10-29 19:03:06.727297	2020-10-29 19:03:06.727297
1824	1	8	38	2	\N	2016-09-24	-27.20	074	2020-10-29 19:03:06.728628	2020-10-29 19:03:06.728628
1825	5	9	45	2	\N	2016-09-25	-38.38	17a	2020-10-29 19:03:06.72998	2020-10-29 19:03:06.72998
1826	5	9	45	2	\N	2016-09-24	-214.50	70b	2020-10-29 19:03:06.731267	2020-10-29 19:03:06.731267
1827	5	4	13	2	\N	2016-09-25	-49.90	f5b	2020-10-29 19:03:06.732532	2020-10-29 19:03:06.732532
1828	5	9	45	2	\N	2016-09-25	-46.42	c70	2020-10-29 19:03:06.733878	2020-10-29 19:03:06.733878
1829	2	4	15	2	\N	2016-09-28	-39.99	55f	2020-10-29 19:03:06.735156	2020-10-29 19:03:06.735156
1830	2	9	44	2	\N	2016-09-25	-150.00	476	2020-10-29 19:03:06.736463	2020-10-29 19:03:06.736463
1831	5	9	44	2	\N	2016-09-28	-100.00	805	2020-10-29 19:03:06.737714	2020-10-29 19:03:06.737714
1832	5	1	5	2	\N	2016-09-28	-39.71	680	2020-10-29 19:03:06.738958	2020-10-29 19:03:06.738958
1833	2	2	1	1	\N	2016-09-29	5653.87	cc3	2020-10-29 19:03:06.740282	2020-10-29 19:03:06.740282
1834	2	10	51	3	\N	2016-09-29	-1500.00	0cb	2020-10-29 19:03:06.741759	2020-10-29 19:03:06.741759
1835	5	10	51	4	\N	2016-09-29	1500.00	3af	2020-10-29 19:03:06.743163	2020-10-29 19:03:06.743163
1836	2	10	51	3	\N	2016-09-29	-1500.00	ff3	2020-10-29 19:03:06.744539	2020-10-29 19:03:06.744539
1837	6	10	51	4	\N	2016-09-29	1500.00	ff3	2020-10-29 19:03:06.746439	2020-10-29 19:03:06.746439
1838	5	4	10	2	\N	2016-09-29	-344.25	6ae	2020-10-29 19:03:06.747998	2020-10-29 19:03:06.747998
1839	5	4	12	2	\N	2016-09-29	-227.90	ac0	2020-10-29 19:03:06.749278	2020-10-29 19:03:06.749278
1840	5	4	-1	2	\N	2016-09-29	-590.00	a2b	2020-10-29 19:03:06.750717	2020-10-29 19:03:06.750717
1841	2	9	-1	2	\N	2016-09-30	-100.00	44a	2020-10-29 19:03:06.751952	2020-10-29 19:03:06.751952
1842	5	9	-1	2	\N	2016-09-28	-99.99	9e6	2020-10-29 19:03:06.753269	2020-10-29 19:03:06.753269
1843	1	1	4	2	\N	2016-09-26	-9.79	c4b	2020-10-29 19:03:06.754575	2020-10-29 19:03:06.754575
1844	1	1	4	2	\N	2016-09-30	-2.00	4cb	2020-10-29 19:03:06.755952	2020-10-29 19:03:06.755952
1845	1	1	5	2	\N	2016-09-27	-2.35	041	2020-10-29 19:03:06.757568	2020-10-29 19:03:06.757568
1846	1	7	30	2	\N	2016-09-30	-29.99	fd5	2020-10-29 19:03:06.759089	2020-10-29 19:03:06.759089
1847	1	1	5	2	\N	2016-09-28	-4.40	473	2020-10-29 19:03:06.760743	2020-10-29 19:03:06.760743
1848	1	1	5	2	\N	2016-09-29	-11.94	b9f	2020-10-29 19:03:06.763024	2020-10-29 19:03:06.763024
1849	5	5	20	2	\N	2016-09-30	-121.40	28e	2020-10-29 19:03:06.764587	2020-10-29 19:03:06.764587
1850	1	10	51	3	\N	2016-09-28	-500.00	eb2	2020-10-29 19:03:06.766674	2020-10-29 19:03:06.766674
1851	1	9	46	2	\N	2016-09-26	-31.80	6d7	2020-10-29 19:03:06.76815	2020-10-29 19:03:06.76815
1852	1	6	24	2	\N	2016-09-26	-218.90	580	2020-10-29 19:03:06.770062	2020-10-29 19:03:06.770062
1853	1	10	51	1	\N	2016-09-28	8183.63	cd7	2020-10-29 19:03:06.772015	2020-10-29 19:03:06.772015
1854	1	10	51	3	\N	2016-09-28	-1500.00	ed3	2020-10-29 19:03:06.773988	2020-10-29 19:03:06.773988
1855	5	10	51	4	\N	2016-09-28	1500.00	ed3	2020-10-29 19:03:06.776032	2020-10-29 19:03:06.776032
1856	1	10	51	3	\N	2016-09-28	-1500.00	244	2020-10-29 19:03:06.777343	2020-10-29 19:03:06.777343
1857	1	10	51	3	\N	2016-09-28	-1000.00	ad1	2020-10-29 19:03:06.779015	2020-10-29 19:03:06.779015
1858	3	10	51	4	\N	2016-09-28	1000.00	ad1	2020-10-29 19:03:06.78073	2020-10-29 19:03:06.78073
1859	1	10	51	3	\N	2016-09-28	-3000.00	609	2020-10-29 19:03:06.782594	2020-10-29 19:03:06.782594
1860	6	10	51	4	\N	2016-09-28	3000.00	609	2020-10-29 19:03:06.783897	2020-10-29 19:03:06.783897
1861	1	9	-1	3	\N	2016-09-28	-378.40	7d0	2020-10-29 19:03:06.78532	2020-10-29 19:03:06.78532
1862	5	2	2	4	\N	2016-09-28	378.40	7d0	2020-10-29 19:03:06.786445	2020-10-29 19:03:06.786445
1863	6	10	51	1	\N	2016-09-30	54.72	6ad	2020-10-29 19:03:06.787669	2020-10-29 19:03:06.787669
1864	5	5	18	2	\N	2016-10-01	18.08	846	2020-10-29 19:03:06.789129	2020-10-29 19:03:06.789129
1865	5	1	5	2	\N	2016-10-01	-162.60	656	2020-10-29 19:03:06.790416	2020-10-29 19:03:06.790416
1866	2	1	-1	2	\N	2016-10-02	-28.15	19e	2020-10-29 19:03:06.791662	2020-10-29 19:03:06.791662
1867	2	1	-1	1	\N	2016-10-02	10.00	984	2020-10-29 19:03:06.792846	2020-10-29 19:03:06.792846
1868	2	8	41	2	\N	2016-10-02	-11.00	0dc	2020-10-29 19:03:06.794082	2020-10-29 19:03:06.794082
1869	2	8	38	2	\N	2016-10-03	-6.60	9ee	2020-10-29 19:03:06.795387	2020-10-29 19:03:06.795387
1870	5	1	5	2	\N	2016-10-02	-11.94	b9f	2020-10-29 19:03:06.796862	2020-10-29 19:03:06.796862
1871	1	1	-1	2	\N	2016-10-01	-23.75	601	2020-10-29 19:03:06.798519	2020-10-29 19:03:06.798519
1872	1	2	2	1	\N	2016-10-02	6.50	edc	2020-10-29 19:03:06.799792	2020-10-29 19:03:06.799792
1873	1	1	5	2	\N	2016-10-03	-4.00	4c7	2020-10-29 19:03:06.801039	2020-10-29 19:03:06.801039
1874	5	5	20	2	\N	2016-10-03	-23.90	70c	2020-10-29 19:03:06.802146	2020-10-29 19:03:06.802146
1875	2	8	38	2	\N	2016-10-03	-50.00	c5b	2020-10-29 19:03:06.803444	2020-10-29 19:03:06.803444
1876	2	1	6	1	\N	2016-10-04	40.00	8d4	2020-10-29 19:03:06.804659	2020-10-29 19:03:06.804659
1877	5	10	51	1	\N	2016-10-04	1500.00	0dc	2020-10-29 19:03:06.805921	2020-10-29 19:03:06.805921
1878	5	10	51	3	\N	2016-10-04	-1500.00	ad1	2020-10-29 19:03:06.807144	2020-10-29 19:03:06.807144
1879	6	10	51	4	\N	2016-10-04	1500.00	ad1	2020-10-29 19:03:06.808401	2020-10-29 19:03:06.808401
1880	1	2	1	1	\N	2016-10-04	615.60	a85	2020-10-29 19:03:06.809672	2020-10-29 19:03:06.809672
1881	1	1	7	2	\N	2016-10-04	-15.00	b98	2020-10-29 19:03:06.810918	2020-10-29 19:03:06.810918
1882	5	5	20	2	\N	2016-10-04	-38.95	28b	2020-10-29 19:03:06.813178	2020-10-29 19:03:06.813178
1883	2	9	45	2	\N	2016-10-04	-154.00	887	2020-10-29 19:03:06.814487	2020-10-29 19:03:06.814487
1884	5	1	7	2	\N	2016-10-04	-42.00	707	2020-10-29 19:03:06.816063	2020-10-29 19:03:06.816063
1885	2	9	-1	2	\N	2016-10-04	-27.00	ae0	2020-10-29 19:03:06.817522	2020-10-29 19:03:06.817522
1886	1	9	-1	2	\N	2016-10-05	-100.00	47a	2020-10-29 19:03:06.819096	2020-10-29 19:03:06.819096
1887	5	1	5	2	\N	2016-10-05	-10.57	213	2020-10-29 19:03:06.82102	2020-10-29 19:03:06.82102
1888	5	9	45	2	\N	2016-10-06	-50.00	cf9	2020-10-29 19:03:06.822285	2020-10-29 19:03:06.822285
1889	5	5	18	2	\N	2016-10-06	-47.25	99e	2020-10-29 19:03:06.823564	2020-10-29 19:03:06.823564
1890	2	6	24	2	\N	2016-10-06	-16.98	04e	2020-10-29 19:03:06.824991	2020-10-29 19:03:06.824991
1891	2	6	24	2	\N	2016-10-06	-39.90	145	2020-10-29 19:03:06.826147	2020-10-29 19:03:06.826147
1892	5	9	45	2	\N	2016-10-06	-66.97	663	2020-10-29 19:03:06.827738	2020-10-29 19:03:06.827738
1893	4	9	-1	3	\N	2016-10-06	-2000.00	331	2020-10-29 19:03:06.829537	2020-10-29 19:03:06.829537
1894	2	9	-1	4	\N	2016-10-06	2000.00	331	2020-10-29 19:03:06.830877	2020-10-29 19:03:06.830877
1895	1	1	4	2	\N	2016-10-06	-2.00	4cb	2020-10-29 19:03:06.83244	2020-10-29 19:03:06.83244
1896	5	1	4	2	\N	2016-10-08	-4.79	23d	2020-10-29 19:03:06.834011	2020-10-29 19:03:06.834011
1897	5	8	40	2	\N	2016-10-07	-189.61	4ca	2020-10-29 19:03:06.835799	2020-10-29 19:03:06.835799
1898	5	8	40	2	\N	2016-10-09	-174.79	ea2	2020-10-29 19:03:06.837185	2020-10-29 19:03:06.837185
1899	1	1	-1	2	\N	2016-10-08	-6.58	874	2020-10-29 19:03:06.838756	2020-10-29 19:03:06.838756
1900	1	1	6	2	\N	2016-10-07	-14.50	da8	2020-10-29 19:03:06.840109	2020-10-29 19:03:06.840109
1901	5	1	5	2	\N	2016-10-09	-78.47	e5f	2020-10-29 19:03:06.841324	2020-10-29 19:03:06.841324
1902	2	4	13	2	\N	2016-10-17	-19.99	fc6	2020-10-29 19:03:06.842856	2020-10-29 19:03:06.842856
1903	5	8	42	2	\N	2016-10-18	-36.00	b99	2020-10-29 19:03:06.844054	2020-10-29 19:03:06.844054
1904	1	1	5	2	\N	2016-10-12	-5.80	4c7	2020-10-29 19:03:06.845635	2020-10-29 19:03:06.845635
1905	5	5	20	2	\N	2016-10-12	-89.64	af5	2020-10-29 19:03:06.846944	2020-10-29 19:03:06.846944
1906	5	1	5	2	\N	2016-10-15	-21.96	67d	2020-10-29 19:03:06.848119	2020-10-29 19:03:06.848119
1907	5	5	20	2	\N	2016-10-13	-8.99	875	2020-10-29 19:03:06.849385	2020-10-29 19:03:06.849385
1908	5	1	5	2	\N	2016-10-12	-13.11	fd4	2020-10-29 19:03:06.85058	2020-10-29 19:03:06.85058
1909	1	5	20	2	\N	2016-10-16	-16.41	18d	2020-10-29 19:03:06.851621	2020-10-29 19:03:06.851621
1910	1	1	5	2	\N	2016-10-17	-2.79	7d2	2020-10-29 19:03:06.852757	2020-10-29 19:03:06.852757
1911	5	1	5	2	\N	2016-10-17	-13.22	1c4	2020-10-29 19:03:06.854405	2020-10-29 19:03:06.854405
1912	1	1	5	2	\N	2016-10-18	-1.00	473	2020-10-29 19:03:06.85595	2020-10-29 19:03:06.85595
1913	1	5	18	2	\N	2016-10-18	-37.75	846	2020-10-29 19:03:06.857746	2020-10-29 19:03:06.857746
1914	5	5	20	2	\N	2016-10-18	-25.00	af5	2020-10-29 19:03:06.859092	2020-10-29 19:03:06.859092
1915	1	1	5	2	\N	2016-10-18	-14.73	7d2	2020-10-29 19:03:06.860351	2020-10-29 19:03:06.860351
1916	1	1	-1	2	\N	2016-10-18	-16.68	075	2020-10-29 19:03:06.862986	2020-10-29 19:03:06.862986
1917	2	8	41	2	\N	2016-10-10	-31.77	96c	2020-10-29 19:03:06.864341	2020-10-29 19:03:06.864341
1918	2	1	5	2	\N	2016-10-10	-6.75	97d	2020-10-29 19:03:06.865477	2020-10-29 19:03:06.865477
1919	2	1	6	2	\N	2016-10-10	-39.43	b28	2020-10-29 19:03:06.866874	2020-10-29 19:03:06.866874
1920	5	1	6	2	\N	2016-10-11	-28.98	b28	2020-10-29 19:03:06.868057	2020-10-29 19:03:06.868057
1921	2	6	24	2	\N	2016-10-11	-75.41	490	2020-10-29 19:03:06.869387	2020-10-29 19:03:06.869387
1922	2	1	6	2	\N	2016-10-12	-37.79	b28	2020-10-29 19:03:06.870621	2020-10-29 19:03:06.870621
1923	2	1	6	2	\N	2016-10-13	-28.93	b28	2020-10-29 19:03:06.871851	2020-10-29 19:03:06.871851
1924	2	1	6	2	\N	2016-10-14	-40.34	96b	2020-10-29 19:03:06.873423	2020-10-29 19:03:06.873423
1925	2	1	6	2	\N	2016-10-14	-29.19	b28	2020-10-29 19:03:06.875405	2020-10-29 19:03:06.875405
1926	2	1	6	2	\N	2016-10-19	-28.98	1b4	2020-10-29 19:03:06.876621	2020-10-29 19:03:06.876621
1927	5	1	6	1	\N	2016-10-19	28.98	1b4	2020-10-29 19:03:06.878197	2020-10-29 19:03:06.878197
1928	2	10	51	3	\N	2016-10-19	-2000.00	887	2020-10-29 19:03:06.879879	2020-10-29 19:03:06.879879
1929	4	10	51	4	\N	2016-10-19	2000.00	887	2020-10-29 19:03:06.881145	2020-10-29 19:03:06.881145
1930	1	2	2	1	\N	2016-10-20	1033.79	64d	2020-10-29 19:03:06.882395	2020-10-29 19:03:06.882395
1931	5	1	5	2	\N	2016-10-22	-7.17	02b	2020-10-29 19:03:06.883608	2020-10-29 19:03:06.883608
1932	1	6	24	2	\N	2016-10-22	-1399.80	e02	2020-10-29 19:03:06.885222	2020-10-29 19:03:06.885222
1933	1	1	5	2	\N	2016-10-22	-17.99	7d2	2020-10-29 19:03:06.886438	2020-10-29 19:03:06.886438
1934	1	1	-1	2	\N	2016-10-22	-37.60	07c	2020-10-29 19:03:06.887668	2020-10-29 19:03:06.887668
1935	5	5	20	2	\N	2016-10-19	-19.99	fa4	2020-10-29 19:03:06.888854	2020-10-29 19:03:06.888854
1936	1	1	4	2	\N	2016-10-18	-2.00	4cb	2020-10-29 19:03:06.890047	2020-10-29 19:03:06.890047
1937	5	1	5	2	\N	2016-10-20	-91.33	6ee	2020-10-29 19:03:06.891328	2020-10-29 19:03:06.891328
1938	2	9	45	2	\N	2016-10-20	-149.98	a4b	2020-10-29 19:03:06.892607	2020-10-29 19:03:06.892607
1939	2	1	6	2	\N	2016-10-23	-20.00	55f	2020-10-29 19:03:06.893864	2020-10-29 19:03:06.893864
1940	2	7	27	2	\N	2016-10-23	-1260.72	849	2020-10-29 19:03:06.895151	2020-10-29 19:03:06.895151
1941	1	8	38	2	\N	2016-10-24	-46.00	1bf	2020-10-29 19:03:06.896586	2020-10-29 19:03:06.896586
1942	1	5	18	2	\N	2016-10-24	-113.90	8e7	2020-10-29 19:03:06.898202	2020-10-29 19:03:06.898202
1943	2	6	24	2	\N	2016-10-24	-35.00	820	2020-10-29 19:03:06.899737	2020-10-29 19:03:06.899737
1944	2	4	15	2	\N	2016-10-27	-338.30	f11	2020-10-29 19:03:06.900963	2020-10-29 19:03:06.900963
1945	2	2	1	1	\N	2016-10-27	5678.34	b5c	2020-10-29 19:03:06.902149	2020-10-29 19:03:06.902149
1946	2	10	51	3	\N	2016-10-27	-1500.00	aab	2020-10-29 19:03:06.90354	2020-10-29 19:03:06.90354
1947	2	10	51	3	\N	2016-10-27	-2500.00	f47	2020-10-29 19:03:06.904653	2020-10-29 19:03:06.904653
1948	5	10	51	4	\N	2016-10-27	1500.00	aab	2020-10-29 19:03:06.905915	2020-10-29 19:03:06.905915
1949	6	10	51	4	\N	2016-10-27	2500.00	f47	2020-10-29 19:03:06.907201	2020-10-29 19:03:06.907201
1950	1	2	1	1	\N	2016-10-26	9133.05	f63	2020-10-29 19:03:06.908554	2020-10-29 19:03:06.908554
1951	1	1	7	2	\N	2016-10-26	-11.98	b98	2020-10-29 19:03:06.910391	2020-10-29 19:03:06.910391
1952	1	9	45	2	\N	2016-10-29	-24.50	779	2020-10-29 19:03:06.912133	2020-10-29 19:03:06.912133
1953	5	1	5	2	\N	2016-10-29	-13.00	1c0	2020-10-29 19:03:06.913573	2020-10-29 19:03:06.913573
1954	1	1	7	2	\N	2016-10-25	-2.45	756	2020-10-29 19:03:06.915218	2020-10-29 19:03:06.915218
1955	5	1	-1	2	\N	2016-10-28	-15.99	efe	2020-10-29 19:03:06.916798	2020-10-29 19:03:06.916798
1956	5	1	5	2	\N	2016-10-28	-4.90	be0	2020-10-29 19:03:06.918019	2020-10-29 19:03:06.918019
1957	1	9	45	2	\N	2016-10-27	-12.00	3c2	2020-10-29 19:03:06.919258	2020-10-29 19:03:06.919258
1958	5	1	5	2	\N	2016-10-29	-5.70	91d	2020-10-29 19:03:06.920593	2020-10-29 19:03:06.920593
1959	5	1	-1	2	\N	2016-10-29	-25.67	3ea	2020-10-29 19:03:06.922004	2020-10-29 19:03:06.922004
1960	1	1	5	2	\N	2016-10-25	-1.79	d36	2020-10-29 19:03:06.923283	2020-10-29 19:03:06.923283
1961	1	1	4	2	\N	2016-10-25	-20.57	dca	2020-10-29 19:03:06.924463	2020-10-29 19:03:06.924463
1962	1	10	51	3	\N	2016-10-29	-500.00	f8c	2020-10-29 19:03:06.92568	2020-10-29 19:03:06.92568
1963	1	10	51	3	\N	2016-10-29	-1500.00	e84	2020-10-29 19:03:06.927567	2020-10-29 19:03:06.927567
1964	6	10	51	4	\N	2016-10-29	1500.00	e84	2020-10-29 19:03:06.928745	2020-10-29 19:03:06.928745
1965	1	10	51	3	\N	2016-10-29	-1000.00	930	2020-10-29 19:03:06.930316	2020-10-29 19:03:06.930316
1966	3	10	51	4	\N	2016-10-29	1000.00	930	2020-10-29 19:03:06.931456	2020-10-29 19:03:06.931456
1967	1	10	51	3	\N	2016-10-29	-4000.00	9ac	2020-10-29 19:03:06.932555	2020-10-29 19:03:06.932555
1968	6	10	51	4	\N	2016-10-29	4000.00	9ac	2020-10-29 19:03:06.933625	2020-10-29 19:03:06.933625
1969	2	2	3	1	\N	2016-10-28	6145.48	7e5	2020-10-29 19:03:06.935208	2020-10-29 19:03:06.935208
1970	2	9	2	2	\N	2016-10-28	-4932.87	657	2020-10-29 19:03:06.936363	2020-10-29 19:03:06.936363
1971	5	1	5	2	\N	2016-10-29	-248.75	e33	2020-10-29 19:03:06.937426	2020-10-29 19:03:06.937426
1972	5	1	5	2	\N	2016-10-29	-191.97	f87	2020-10-29 19:03:06.938497	2020-10-29 19:03:06.938497
1973	5	6	24	2	\N	2016-10-28	-82.00	d79	2020-10-29 19:03:06.939547	2020-10-29 19:03:06.939547
1974	2	6	24	2	\N	2016-10-29	-82.00	d79	2020-10-29 19:03:06.940586	2020-10-29 19:03:06.940586
1975	5	6	24	1	\N	2016-10-29	82.00	d79	2020-10-29 19:03:06.941598	2020-10-29 19:03:06.941598
1976	2	10	51	3	\N	2016-10-30	-1000.00	41d	2020-10-29 19:03:06.942637	2020-10-29 19:03:06.942637
1977	6	10	51	4	\N	2016-10-30	1000.00	41d	2020-10-29 19:03:06.943812	2020-10-29 19:03:06.943812
1978	2	10	51	3	\N	2016-10-30	-1000.00	41d	2020-10-29 19:03:06.944984	2020-10-29 19:03:06.944984
1979	4	10	51	4	\N	2016-10-30	1000.00	41d	2020-10-29 19:03:06.946196	2020-10-29 19:03:06.946196
1980	5	9	45	2	\N	2016-10-31	-19.92	187	2020-10-29 19:03:06.947551	2020-10-29 19:03:06.947551
1981	5	4	10	2	\N	2016-10-31	-344.25	64e	2020-10-29 19:03:06.948963	2020-10-29 19:03:06.948963
1982	5	4	12	2	\N	2016-10-31	-114.48	d96	2020-10-29 19:03:06.950521	2020-10-29 19:03:06.950521
1983	5	4	13	2	\N	2016-10-31	-49.90	97a	2020-10-29 19:03:06.951819	2020-10-29 19:03:06.951819
1984	5	4	-1	2	\N	2016-10-31	-590.00	c70	2020-10-29 19:03:06.9531	2020-10-29 19:03:06.9531
1985	1	9	-1	2	\N	2016-11-01	-10.00	446	2020-10-29 19:03:06.954387	2020-10-29 19:03:06.954387
1986	1	1	5	2	\N	2016-10-31	-44.72	7d2	2020-10-29 19:03:06.955831	2020-10-29 19:03:06.955831
1987	1	5	22	2	\N	2016-10-31	-35.00	9da	2020-10-29 19:03:06.957797	2020-10-29 19:03:06.957797
1988	5	5	20	2	\N	2016-10-31	-9.89	ceb	2020-10-29 19:03:06.959747	2020-10-29 19:03:06.959747
1989	1	7	30	2	\N	2016-11-02	-29.99	928	2020-10-29 19:03:06.961722	2020-10-29 19:03:06.961722
1990	6	10	52	1	\N	2016-10-31	63.38	eab	2020-10-29 19:03:06.964011	2020-10-29 19:03:06.964011
1991	5	1	5	2	\N	2016-11-02	-61.46	cf1	2020-10-29 19:03:06.965531	2020-10-29 19:03:06.965531
1992	5	5	18	2	\N	2016-11-02	-91.53	846	2020-10-29 19:03:06.966966	2020-10-29 19:03:06.966966
1993	5	10	51	1	\N	2016-11-02	1500.00	f11	2020-10-29 19:03:06.968956	2020-10-29 19:03:06.968956
1994	5	5	20	2	\N	2016-11-02	-31.98	7db	2020-10-29 19:03:06.970976	2020-10-29 19:03:06.970976
1995	5	5	20	2	\N	2016-11-02	-18.99	1f2	2020-10-29 19:03:06.973129	2020-10-29 19:03:06.973129
1996	1	1	7	2	\N	2016-11-04	-2.45	402	2020-10-29 19:03:06.974456	2020-10-29 19:03:06.974456
1997	5	5	20	2	\N	2016-11-03	-26.99	4b0	2020-10-29 19:03:06.976514	2020-10-29 19:03:06.976514
1998	1	1	5	2	\N	2016-11-02	-3.55	4c7	2020-10-29 19:03:06.977869	2020-10-29 19:03:06.977869
1999	1	1	4	2	\N	2016-11-04	-4.99	4d2	2020-10-29 19:03:06.979541	2020-10-29 19:03:06.979541
2000	5	1	5	2	\N	2016-11-04	-19.53	e5f	2020-10-29 19:03:06.980712	2020-10-29 19:03:06.980712
2001	1	9	-1	2	\N	2016-11-04	-1.00	882	2020-10-29 19:03:06.981847	2020-10-29 19:03:06.981847
2002	5	1	5	2	\N	2016-11-05	-5.19	d35	2020-10-29 19:03:06.983092	2020-10-29 19:03:06.983092
2003	5	1	5	2	\N	2016-11-05	-8.80	4c7	2020-10-29 19:03:06.984414	2020-10-29 19:03:06.984414
2004	5	1	5	2	\N	2016-11-05	-14.55	085	2020-10-29 19:03:06.986381	2020-10-29 19:03:06.986381
2005	1	3	-1	2	\N	2016-11-05	-5.48	fac	2020-10-29 19:03:06.987859	2020-10-29 19:03:06.987859
2006	1	3	-1	2	\N	2016-11-05	-25.30	7c1	2020-10-29 19:03:06.989106	2020-10-29 19:03:06.989106
2007	5	1	5	2	\N	2016-11-05	-11.94	646	2020-10-29 19:03:06.990464	2020-10-29 19:03:06.990464
2008	1	1	5	2	\N	2016-11-06	-7.57	a6b	2020-10-29 19:03:06.991592	2020-10-29 19:03:06.991592
2009	5	1	5	2	\N	2016-11-06	-60.00	4a7	2020-10-29 19:03:06.992639	2020-10-29 19:03:06.992639
2010	2	9	45	2	\N	2016-11-07	-109.82	892	2020-10-29 19:03:06.993674	2020-10-29 19:03:06.993674
2011	2	9	45	2	\N	2016-11-07	-44.50	892	2020-10-29 19:03:06.99478	2020-10-29 19:03:06.99478
2012	2	9	45	2	\N	2016-11-07	-36.94	892	2020-10-29 19:03:06.996063	2020-10-29 19:03:06.996063
2013	2	5	18	2	\N	2016-11-07	-13.38	2b0	2020-10-29 19:03:06.997297	2020-10-29 19:03:06.997297
2014	2	9	46	2	\N	2016-11-07	-16.35	650	2020-10-29 19:03:06.998467	2020-10-29 19:03:06.998467
2015	5	4	11	2	\N	2016-11-08	-133.95	6ac	2020-10-29 19:03:06.999779	2020-10-29 19:03:06.999779
2016	1	1	7	2	\N	2016-11-08	-15.40	b98	2020-10-29 19:03:07.000876	2020-10-29 19:03:07.000876
2017	5	1	5	2	\N	2016-11-08	-10.29	b59	2020-10-29 19:03:07.002024	2020-10-29 19:03:07.002024
2018	5	1	5	2	\N	2016-11-08	-7.78	757	2020-10-29 19:03:07.003196	2020-10-29 19:03:07.003196
2019	5	3	-1	2	\N	2016-11-08	-15.99	efe	2020-10-29 19:03:07.00487	2020-10-29 19:03:07.00487
2020	5	1	5	2	\N	2016-11-08	-38.33	165	2020-10-29 19:03:07.006158	2020-10-29 19:03:07.006158
2021	5	8	40	2	\N	2016-11-09	-29.99	87b	2020-10-29 19:03:07.007392	2020-10-29 19:03:07.007392
2022	5	8	40	2	\N	2016-11-13	-5.00	8dd	2020-10-29 19:03:07.008531	2020-10-29 19:03:07.008531
2023	1	8	40	2	\N	2016-11-13	-1.00	8dd	2020-10-29 19:03:07.009594	2020-10-29 19:03:07.009594
2024	5	8	40	2	\N	2016-11-11	-177.80	656	2020-10-29 19:03:07.011199	2020-10-29 19:03:07.011199
2025	5	9	-1	2	\N	2016-11-12	-13.70	a9e	2020-10-29 19:03:07.012838	2020-10-29 19:03:07.012838
2026	5	3	-1	2	\N	2016-11-12	-44.10	57a	2020-10-29 19:03:07.014329	2020-10-29 19:03:07.014329
2027	5	1	5	2	\N	2016-11-13	-60.27	e5f	2020-10-29 19:03:07.015548	2020-10-29 19:03:07.015548
2028	5	8	40	2	\N	2016-11-07	-59.00	959	2020-10-29 19:03:07.016803	2020-10-29 19:03:07.016803
2029	2	9	45	2	\N	2016-11-13	-79.49	37b	2020-10-29 19:03:07.018123	2020-10-29 19:03:07.018123
2030	2	4	13	2	\N	2016-11-13	-19.99	f2b	2020-10-29 19:03:07.019342	2020-10-29 19:03:07.019342
2031	5	3	-1	2	\N	2016-11-14	-8.98	ae9	2020-10-29 19:03:07.020562	2020-10-29 19:03:07.020562
2032	5	1	5	2	\N	2016-11-14	-9.80	7d2	2020-10-29 19:03:07.021869	2020-10-29 19:03:07.021869
2033	5	5	20	2	\N	2016-11-14	-10.26	275	2020-10-29 19:03:07.023295	2020-10-29 19:03:07.023295
2034	1	1	7	2	\N	2016-11-18	-12.24	b98	2020-10-29 19:03:07.024981	2020-10-29 19:03:07.024981
2035	5	1	5	2	\N	2016-11-19	-9.00	4c7	2020-10-29 19:03:07.026357	2020-10-29 19:03:07.026357
2036	5	5	20	2	\N	2016-11-19	-9.50	5c2	2020-10-29 19:03:07.027611	2020-10-29 19:03:07.027611
2037	1	1	4	2	\N	2016-11-18	-2.00	4cb	2020-10-29 19:03:07.028909	2020-10-29 19:03:07.028909
2038	5	1	5	2	\N	2016-11-19	-6.44	7d2	2020-10-29 19:03:07.030655	2020-10-29 19:03:07.030655
2039	5	1	5	2	\N	2016-11-19	-48.04	320	2020-10-29 19:03:07.031908	2020-10-29 19:03:07.031908
2040	5	1	5	2	\N	2016-11-17	-6.75	7d2	2020-10-29 19:03:07.033123	2020-10-29 19:03:07.033123
2041	5	1	5	2	\N	2016-11-17	-3.95	07d	2020-10-29 19:03:07.034481	2020-10-29 19:03:07.034481
2042	5	1	5	2	\N	2016-11-17	-47.02	320	2020-10-29 19:03:07.035756	2020-10-29 19:03:07.035756
2043	2	5	18	2	\N	2016-11-07	-13.38	42e	2020-10-29 19:03:07.037038	2020-10-29 19:03:07.037038
2044	5	5	20	2	\N	2016-11-14	-10.26	7ab	2020-10-29 19:03:07.038531	2020-10-29 19:03:07.038531
2045	5	1	5	2	\N	2016-11-21	-16.16	7d2	2020-10-29 19:03:07.03996	2020-10-29 19:03:07.03996
2046	5	5	20	2	\N	2016-11-21	-17.50	dc1	2020-10-29 19:03:07.04153	2020-10-29 19:03:07.04153
2047	1	8	38	2	\N	2016-11-21	-46.00	a3a	2020-10-29 19:03:07.042749	2020-10-29 19:03:07.042749
2048	5	1	5	2	\N	2016-11-22	-10.68	f57	2020-10-29 19:03:07.043956	2020-10-29 19:03:07.043956
2049	5	5	18	2	\N	2016-11-22	-33.46	2a7	2020-10-29 19:03:07.045156	2020-10-29 19:03:07.045156
2050	1	5	18	2	\N	2016-11-22	-30.96	d05	2020-10-29 19:03:07.04759	2020-10-29 19:03:07.04759
2051	1	1	7	2	\N	2016-11-22	-12.50	b98	2020-10-29 19:03:07.048933	2020-10-29 19:03:07.048933
2052	5	1	5	2	\N	2016-11-22	-16.32	301	2020-10-29 19:03:07.050367	2020-10-29 19:03:07.050367
2053	2	1	7	2	\N	2016-11-23	-21.00	944	2020-10-29 19:03:07.051636	2020-10-29 19:03:07.051636
2054	1	9	46	2	\N	2016-11-25	-277.08	c9a	2020-10-29 19:03:07.053551	2020-10-29 19:03:07.053551
2055	5	1	5	2	\N	2016-11-25	-11.94	d9a	2020-10-29 19:03:07.055462	2020-10-29 19:03:07.055462
2056	5	5	19	2	\N	2016-11-26	-200.00	4eb	2020-10-29 19:03:07.056639	2020-10-29 19:03:07.056639
2057	2	5	18	2	\N	2016-11-26	-10.29	b2d	2020-10-29 19:03:07.058292	2020-10-29 19:03:07.058292
2058	2	8	41	2	\N	2016-11-26	-6.00	daa	2020-10-29 19:03:07.059574	2020-10-29 19:03:07.059574
2059	1	1	7	2	\N	2016-11-25	-2.45	73e	2020-10-29 19:03:07.060946	2020-10-29 19:03:07.060946
2060	1	1	4	2	\N	2016-11-25	-2.00	4cb	2020-10-29 19:03:07.062608	2020-10-29 19:03:07.062608
2061	1	9	45	2	\N	2016-11-25	-283.50	d93	2020-10-29 19:03:07.064733	2020-10-29 19:03:07.064733
2062	5	7	35	2	\N	2016-11-26	-9.00	cb4	2020-10-29 19:03:07.066189	2020-10-29 19:03:07.066189
2063	5	1	5	2	\N	2016-11-26	-130.67	6ee	2020-10-29 19:03:07.067621	2020-10-29 19:03:07.067621
2064	2	1	5	2	\N	2016-11-25	-9.89	c7d	2020-10-29 19:03:07.06948	2020-10-29 19:03:07.06948
2065	1	2	1	1	\N	2016-11-25	11509.01	f39	2020-10-29 19:03:07.070625	2020-10-29 19:03:07.070625
2066	1	10	51	3	\N	2016-11-25	-500.00	1d5	2020-10-29 19:03:07.071817	2020-10-29 19:03:07.071817
2067	1	10	51	3	\N	2016-11-25	-1500.00	411	2020-10-29 19:03:07.073801	2020-10-29 19:03:07.073801
2068	5	10	51	4	\N	2016-11-25	1500.00	411	2020-10-29 19:03:07.075033	2020-10-29 19:03:07.075033
2069	1	10	51	3	\N	2016-11-25	-7500.00	5fd	2020-10-29 19:03:07.076255	2020-10-29 19:03:07.076255
2070	3	10	51	4	\N	2016-11-25	7500.00	5fd	2020-10-29 19:03:07.077573	2020-10-29 19:03:07.077573
2071	1	10	51	3	\N	2016-11-25	-1500.00	98b	2020-10-29 19:03:07.079207	2020-10-29 19:03:07.079207
2072	3	10	51	3	\N	2016-11-27	-7500.00	8fa	2020-10-29 19:03:07.081298	2020-10-29 19:03:07.081298
2073	6	10	51	4	\N	2016-11-27	3500.00	467	2020-10-29 19:03:07.082588	2020-10-29 19:03:07.082588
2074	1	10	51	3	\N	2016-11-27	-3500.00	467	2020-10-29 19:03:07.084761	2020-10-29 19:03:07.084761
2075	3	10	51	4	\N	2016-11-27	2200.00	255	2020-10-29 19:03:07.086759	2020-10-29 19:03:07.086759
2076	1	10	51	3	\N	2016-11-27	-2200.00	255	2020-10-29 19:03:07.088556	2020-10-29 19:03:07.088556
2077	1	10	51	3	\N	2016-11-27	-1100.00	3aa	2020-10-29 19:03:07.089676	2020-10-29 19:03:07.089676
2078	1	10	51	4	\N	2016-11-27	7500.00	8fa	2020-10-29 19:03:07.090809	2020-10-29 19:03:07.090809
2079	5	9	-1	2	\N	2016-11-27	-100.00	d41	2020-10-29 19:03:07.092014	2020-10-29 19:03:07.092014
2080	2	9	-1	1	\N	2016-11-27	100.00	d41	2020-10-29 19:03:07.093121	2020-10-29 19:03:07.093121
2081	5	9	45	2	\N	2016-11-27	-146.00	304	2020-10-29 19:03:07.094293	2020-10-29 19:03:07.094293
2082	2	9	45	2	\N	2016-11-27	-44.90	cee	2020-10-29 19:03:07.095478	2020-10-29 19:03:07.095478
2083	5	9	45	2	\N	2016-11-27	-35.00	1e5	2020-10-29 19:03:07.096778	2020-10-29 19:03:07.096778
2084	5	9	45	2	\N	2016-11-27	-56.99	6be	2020-10-29 19:03:07.097902	2020-10-29 19:03:07.097902
2085	5	1	5	2	\N	2016-11-27	-3.64	f5b	2020-10-29 19:03:07.098985	2020-10-29 19:03:07.098985
2086	2	1	6	2	\N	2016-11-27	-20.00	e24	2020-10-29 19:03:07.100061	2020-10-29 19:03:07.100061
2087	2	8	38	2	\N	2016-11-27	-8.40	7b3	2020-10-29 19:03:07.101278	2020-10-29 19:03:07.101278
2088	2	4	15	2	\N	2016-11-27	-40.68	efa	2020-10-29 19:03:07.102374	2020-10-29 19:03:07.102374
2089	5	9	45	2	\N	2016-11-27	-72.00	c50	2020-10-29 19:03:07.103425	2020-10-29 19:03:07.103425
2090	5	9	45	2	\N	2016-11-27	-44.70	9a9	2020-10-29 19:03:07.104433	2020-10-29 19:03:07.104433
2091	5	8	40	2	\N	2016-11-27	-100.90	0cc	2020-10-29 19:03:07.105687	2020-10-29 19:03:07.105687
2092	5	8	40	2	\N	2016-11-27	-83.72	4ba	2020-10-29 19:03:07.107639	2020-10-29 19:03:07.107639
2093	5	4	13	2	\N	2016-11-28	-49.90	97a	2020-10-29 19:03:07.108667	2020-10-29 19:03:07.108667
2094	2	2	1	1	\N	2016-11-28	7000.27	8a3	2020-10-29 19:03:07.109656	2020-10-29 19:03:07.109656
2095	2	10	51	3	\N	2016-11-28	-1500.00	7e7	2020-10-29 19:03:07.110694	2020-10-29 19:03:07.110694
2096	2	10	51	3	\N	2016-11-28	-1500.00	bc4	2020-10-29 19:03:07.11185	2020-10-29 19:03:07.11185
2097	5	10	51	4	\N	2016-11-28	1500.00	7e7	2020-10-29 19:03:07.113268	2020-10-29 19:03:07.113268
2098	6	10	51	4	\N	2016-11-28	1500.00	bc4	2020-10-29 19:03:07.114496	2020-10-29 19:03:07.114496
2099	2	10	51	3	\N	2016-11-28	-1000.00	a36	2020-10-29 19:03:07.11559	2020-10-29 19:03:07.11559
2100	2	10	51	3	\N	2016-11-28	-1500.00	bc4	2020-10-29 19:03:07.117067	2020-10-29 19:03:07.117067
2101	6	10	51	4	\N	2016-11-28	1000.00	a36	2020-10-29 19:03:07.118166	2020-10-29 19:03:07.118166
2102	4	10	51	4	\N	2016-11-28	1500.00	bc4	2020-10-29 19:03:07.119426	2020-10-29 19:03:07.119426
2103	5	9	45	2	\N	2016-11-27	-69.96	a59	2020-10-29 19:03:07.120583	2020-10-29 19:03:07.120583
2104	1	1	4	2	\N	2016-11-27	-1.00	480	2020-10-29 19:03:07.121677	2020-10-29 19:03:07.121677
2105	5	1	5	2	\N	2016-11-27	-4.98	071	2020-10-29 19:03:07.123111	2020-10-29 19:03:07.123111
2106	5	4	10	2	\N	2016-11-29	-344.25	297	2020-10-29 19:03:07.124187	2020-10-29 19:03:07.124187
2107	5	4	12	2	\N	2016-11-29	-114.48	783	2020-10-29 19:03:07.125277	2020-10-29 19:03:07.125277
2108	5	4	-1	2	\N	2016-11-29	-590.00	8f6	2020-10-29 19:03:07.126492	2020-10-29 19:03:07.126492
2109	2	9	-1	2	\N	2016-11-30	-11.50	6e5	2020-10-29 19:03:07.127711	2020-10-29 19:03:07.127711
2110	2	8	38	2	\N	2016-11-30	-50.00	09f	2020-10-29 19:03:07.128861	2020-10-29 19:03:07.128861
2111	6	10	51	4	\N	2016-12-02	1500.00	748	2020-10-29 19:03:07.130348	2020-10-29 19:03:07.130348
2112	6	10	52	1	\N	2016-11-30	70.89	6f9	2020-10-29 19:03:07.131521	2020-10-29 19:03:07.131521
2113	1	1	4	2	\N	2016-12-02	-2.00	4cb	2020-10-29 19:03:07.132898	2020-10-29 19:03:07.132898
2114	1	1	4	2	\N	2016-12-02	-7.14	255	2020-10-29 19:03:07.134457	2020-10-29 19:03:07.134457
2115	1	1	7	2	\N	2016-11-29	-14.70	b98	2020-10-29 19:03:07.135654	2020-10-29 19:03:07.135654
2116	1	1	7	2	\N	2016-11-29	-2.45	756	2020-10-29 19:03:07.136699	2020-10-29 19:03:07.136699
2117	5	1	5	2	\N	2016-12-01	-11.94	c46	2020-10-29 19:03:07.137989	2020-10-29 19:03:07.137989
2118	5	1	5	2	\N	2016-11-30	-58.68	e5f	2020-10-29 19:03:07.139242	2020-10-29 19:03:07.139242
2119	5	5	20	2	\N	2016-11-30	-103.90	f43	2020-10-29 19:03:07.140489	2020-10-29 19:03:07.140489
2120	1	7	30	2	\N	2016-11-30	-29.99	b52	2020-10-29 19:03:07.141686	2020-10-29 19:03:07.141686
2121	1	9	-1	2	\N	2016-12-02	-18.26	8fc	2020-10-29 19:03:07.142798	2020-10-29 19:03:07.142798
2122	5	2	-1	1	\N	2016-12-02	35.93	b95	2020-10-29 19:03:07.143925	2020-10-29 19:03:07.143925
2123	3	10	51	3	\N	2016-12-02	-13200.00	5bf	2020-10-29 19:03:07.145216	2020-10-29 19:03:07.145216
2124	5	1	5	2	\N	2016-12-03	-16.65	496	2020-10-29 19:03:07.146596	2020-10-29 19:03:07.146596
2125	5	5	20	2	\N	2016-12-03	-34.98	f40	2020-10-29 19:03:07.147897	2020-10-29 19:03:07.147897
2126	5	5	23	2	\N	2016-12-03	-14.93	bab	2020-10-29 19:03:07.149107	2020-10-29 19:03:07.149107
2127	5	1	5	2	\N	2016-12-03	-8.10	07d	2020-10-29 19:03:07.15034	2020-10-29 19:03:07.15034
2128	1	9	45	2	\N	2016-12-03	-54.50	d52	2020-10-29 19:03:07.151561	2020-10-29 19:03:07.151561
2129	1	7	33	2	\N	2016-12-03	-22.90	794	2020-10-29 19:03:07.152715	2020-10-29 19:03:07.152715
2130	2	9	-1	2	\N	2016-12-04	-15.85	4bd	2020-10-29 19:03:07.154131	2020-10-29 19:03:07.154131
2131	5	9	-1	1	\N	2016-12-04	15.85	4bd	2020-10-29 19:03:07.155423	2020-10-29 19:03:07.155423
2132	2	7	28	2	\N	2016-12-04	-20.00	476	2020-10-29 19:03:07.156788	2020-10-29 19:03:07.156788
2133	1	9	45	2	\N	2016-12-04	-216.99	f4e	2020-10-29 19:03:07.158542	2020-10-29 19:03:07.158542
2134	5	1	5	2	\N	2016-12-04	-21.55	7d2	2020-10-29 19:03:07.15972	2020-10-29 19:03:07.15972
2135	5	1	5	2	\N	2016-12-04	-11.31	7d2	2020-10-29 19:03:07.161667	2020-10-29 19:03:07.161667
2136	5	1	5	2	\N	2016-12-04	-19.93	7d2	2020-10-29 19:03:07.163188	2020-10-29 19:03:07.163188
2137	1	1	6	2	\N	2016-12-05	-10.00	51a	2020-10-29 19:03:07.165108	2020-10-29 19:03:07.165108
2138	1	9	45	2	\N	2016-12-05	-50.40	37b	2020-10-29 19:03:07.166483	2020-10-29 19:03:07.166483
2139	1	9	45	2	\N	2016-12-05	-23.24	37b	2020-10-29 19:03:07.168356	2020-10-29 19:03:07.168356
2140	1	2	2	1	\N	2016-12-05	550.00	f72	2020-10-29 19:03:07.169536	2020-10-29 19:03:07.169536
2141	1	8	38	2	\N	2016-12-05	-21.96	074	2020-10-29 19:03:07.170595	2020-10-29 19:03:07.170595
2142	1	1	7	2	\N	2016-12-07	-2.45	73e	2020-10-29 19:03:07.17168	2020-10-29 19:03:07.17168
2143	5	1	5	2	\N	2016-12-07	-92.92	60a	2020-10-29 19:03:07.172743	2020-10-29 19:03:07.172743
2144	1	7	34	2	\N	2016-12-08	-4.00	f5d	2020-10-29 19:03:07.173796	2020-10-29 19:03:07.173796
2145	1	3	-1	2	\N	2016-12-08	-14.00	10d	2020-10-29 19:03:07.174801	2020-10-29 19:03:07.174801
2146	1	1	4	2	\N	2016-12-09	-2.00	a4a	2020-10-29 19:03:07.175972	2020-10-29 19:03:07.175972
2147	1	1	7	2	\N	2016-12-09	-16.06	b98	2020-10-29 19:03:07.177227	2020-10-29 19:03:07.177227
2148	1	1	4	2	\N	2016-12-09	-1.80	7a4	2020-10-29 19:03:07.178659	2020-10-29 19:03:07.178659
2149	5	1	5	2	\N	2016-12-10	-33.85	b92	2020-10-29 19:03:07.180055	2020-10-29 19:03:07.180055
2150	5	1	5	2	\N	2016-12-10	-83.96	320	2020-10-29 19:03:07.181356	2020-10-29 19:03:07.181356
2151	1	1	5	2	\N	2016-12-10	-7.98	a61	2020-10-29 19:03:07.182501	2020-10-29 19:03:07.182501
2152	2	1	5	2	\N	2016-12-11	-0.56	32d	2020-10-29 19:03:07.184032	2020-10-29 19:03:07.184032
2153	5	5	20	2	\N	2016-12-12	-6.99	ceb	2020-10-29 19:03:07.185317	2020-10-29 19:03:07.185317
2154	5	5	20	2	\N	2016-12-12	-9.30	ceb	2020-10-29 19:03:07.186981	2020-10-29 19:03:07.186981
2155	5	9	45	2	\N	2016-12-13	-75.00	a07	2020-10-29 19:03:07.188304	2020-10-29 19:03:07.188304
2156	5	9	45	2	\N	2016-12-13	-14.90	1b3	2020-10-29 19:03:07.189496	2020-10-29 19:03:07.189496
2157	2	9	45	2	\N	2016-12-13	-10.00	94d	2020-10-29 19:03:07.190837	2020-10-29 19:03:07.190837
2158	5	3	-1	2	\N	2016-12-12	-17.99	efe	2020-10-29 19:03:07.192165	2020-10-29 19:03:07.192165
2159	2	3	-1	2	\N	2016-12-12	-25.48	52a	2020-10-29 19:03:07.193633	2020-10-29 19:03:07.193633
2160	5	1	5	2	\N	2016-12-07	-11.84	a1f	2020-10-29 19:03:07.194769	2020-10-29 19:03:07.194769
2161	2	1	5	2	\N	2016-12-08	-4.07	a1f	2020-10-29 19:03:07.195979	2020-10-29 19:03:07.195979
2162	1	1	5	2	\N	2016-12-15	-3.40	473	2020-10-29 19:03:07.197441	2020-10-29 19:03:07.197441
2163	1	1	6	2	\N	2016-12-14	-14.50	b98	2020-10-29 19:03:07.198572	2020-10-29 19:03:07.198572
2164	1	5	20	2	\N	2016-12-15	-42.88	ceb	2020-10-29 19:03:07.199667	2020-10-29 19:03:07.199667
2165	5	5	20	2	\N	2016-12-15	-101.00	f40	2020-10-29 19:03:07.200731	2020-10-29 19:03:07.200731
2166	5	5	20	2	\N	2016-12-15	-35.57	ceb	2020-10-29 19:03:07.201842	2020-10-29 19:03:07.201842
2167	1	10	51	3	\N	2016-12-15	-500.00	910	2020-10-29 19:03:07.202896	2020-10-29 19:03:07.202896
2168	5	10	51	4	\N	2016-12-15	500.00	910	2020-10-29 19:03:07.204281	2020-10-29 19:03:07.204281
2169	5	5	20	3	\N	2016-12-15	-42.88	d36	2020-10-29 19:03:07.205424	2020-10-29 19:03:07.205424
2170	1	2	2	4	\N	2016-12-15	42.88	d36	2020-10-29 19:03:07.206709	2020-10-29 19:03:07.206709
2171	1	5	19	2	\N	2016-12-15	-26.00	0ae	2020-10-29 19:03:07.207984	2020-10-29 19:03:07.207984
2172	5	5	19	3	\N	2016-12-15	-26.00	316	2020-10-29 19:03:07.209388	2020-10-29 19:03:07.209388
2173	1	2	2	4	\N	2016-12-15	26.00	316	2020-10-29 19:03:07.210585	2020-10-29 19:03:07.210585
2174	5	9	45	2	\N	2016-12-15	-32.90	b57	2020-10-29 19:03:07.211693	2020-10-29 19:03:07.211693
2175	5	9	45	2	\N	2016-12-15	-209.17	e73	2020-10-29 19:03:07.213549	2020-10-29 19:03:07.213549
2176	5	9	45	2	\N	2016-12-15	-15.00	a3c	2020-10-29 19:03:07.214743	2020-10-29 19:03:07.214743
2177	2	9	45	2	\N	2016-12-15	-16.20	774	2020-10-29 19:03:07.215919	2020-10-29 19:03:07.215919
2178	2	9	45	2	\N	2016-12-15	-129.80	ed7	2020-10-29 19:03:07.217161	2020-10-29 19:03:07.217161
2179	5	5	18	2	\N	2016-12-15	-118.09	846	2020-10-29 19:03:07.218436	2020-10-29 19:03:07.218436
2180	2	5	18	2	\N	2016-12-15	-57.96	8af	2020-10-29 19:03:07.219802	2020-10-29 19:03:07.219802
2181	5	5	18	1	\N	2016-12-15	57.96	82e	2020-10-29 19:03:07.220994	2020-10-29 19:03:07.220994
2182	2	10	51	3	\N	2016-12-15	-26500.00	e06	2020-10-29 19:03:07.22212	2020-10-29 19:03:07.22212
2183	4	10	51	4	\N	2016-12-15	26500.00	faa	2020-10-29 19:03:07.223332	2020-10-29 19:03:07.223332
2184	1	5	18	3	\N	2016-12-15	-26.27	007	2020-10-29 19:03:07.224403	2020-10-29 19:03:07.224403
2185	5	5	18	4	\N	2016-12-15	26.27	5e3	2020-10-29 19:03:07.225505	2020-10-29 19:03:07.225505
2186	1	1	5	2	\N	2016-12-16	-5.00	5ec	2020-10-29 19:03:07.226622	2020-10-29 19:03:07.226622
2187	1	1	4	2	\N	2016-12-16	-5.99	dc1	2020-10-29 19:03:07.227748	2020-10-29 19:03:07.227748
2188	1	9	45	2	\N	2016-12-17	-99.99	28d	2020-10-29 19:03:07.228856	2020-10-29 19:03:07.228856
2189	1	9	45	2	\N	2016-12-17	-85.28	951	2020-10-29 19:03:07.230296	2020-10-29 19:03:07.230296
2190	1	9	46	2	\N	2016-12-17	-17.99	0a8	2020-10-29 19:03:07.231471	2020-10-29 19:03:07.231471
2191	5	1	5	2	\N	2016-12-17	-20.01	7d2	2020-10-29 19:03:07.232555	2020-10-29 19:03:07.232555
2192	1	1	5	2	\N	2016-12-17	-4.00	473	2020-10-29 19:03:07.233657	2020-10-29 19:03:07.233657
2193	5	9	45	3	\N	2016-12-17	-49.99	aad	2020-10-29 19:03:07.234721	2020-10-29 19:03:07.234721
2194	1	2	2	4	\N	2016-12-17	49.99	aad	2020-10-29 19:03:07.235816	2020-10-29 19:03:07.235816
2195	2	1	5	2	\N	2016-12-15	-13.00	f37	2020-10-29 19:03:07.237017	2020-10-29 19:03:07.237017
2196	5	9	45	2	\N	2016-12-17	-39.89	e60	2020-10-29 19:03:07.238699	2020-10-29 19:03:07.238699
2197	5	9	-1	2	\N	2016-12-18	-94.66	87f	2020-10-29 19:03:07.240011	2020-10-29 19:03:07.240011
2198	5	1	5	2	\N	2016-12-18	-19.38	a08	2020-10-29 19:03:07.241337	2020-10-29 19:03:07.241337
2199	5	8	41	2	\N	2016-12-19	-27.20	b65	2020-10-29 19:03:07.242647	2020-10-29 19:03:07.242647
2200	1	7	28	2	\N	2016-12-19	-34.00	642	2020-10-29 19:03:07.243931	2020-10-29 19:03:07.243931
2201	2	2	1	1	\N	2016-12-20	5623.73	159	2020-10-29 19:03:07.245362	2020-10-29 19:03:07.245362
2202	2	10	51	3	\N	2016-12-20	-1500.00	7fc	2020-10-29 19:03:07.246755	2020-10-29 19:03:07.246755
2203	5	10	51	4	\N	2016-12-20	1500.00	7fc	2020-10-29 19:03:07.248056	2020-10-29 19:03:07.248056
2204	2	10	51	3	\N	2016-12-20	-2200.00	7d5	2020-10-29 19:03:07.249342	2020-10-29 19:03:07.249342
2205	6	10	51	4	\N	2016-12-20	2200.00	7d5	2020-10-29 19:03:07.250544	2020-10-29 19:03:07.250544
2206	5	4	10	2	\N	2016-12-20	-344.25	c4a	2020-10-29 19:03:07.25172	2020-10-29 19:03:07.25172
2207	5	4	12	2	\N	2016-12-20	-114.48	9df	2020-10-29 19:03:07.252918	2020-10-29 19:03:07.252918
2208	5	4	11	2	\N	2016-12-20	-114.77	d29	2020-10-29 19:03:07.254309	2020-10-29 19:03:07.254309
2209	5	4	-1	2	\N	2016-12-20	-590.00	c7f	2020-10-29 19:03:07.255441	2020-10-29 19:03:07.255441
2210	5	8	41	2	\N	2016-12-20	-50.00	332	2020-10-29 19:03:07.256632	2020-10-29 19:03:07.256632
2211	5	8	40	2	\N	2016-12-20	-295.00	2a1	2020-10-29 19:03:07.257707	2020-10-29 19:03:07.257707
2212	1	1	7	2	\N	2016-12-20	-2.45	73e	2020-10-29 19:03:07.258888	2020-10-29 19:03:07.258888
2213	1	1	5	2	\N	2016-12-20	-12.00	7d2	2020-10-29 19:03:07.260134	2020-10-29 19:03:07.260134
2214	1	2	1	1	\N	2016-12-20	9345.61	012	2020-10-29 19:03:07.261318	2020-10-29 19:03:07.261318
2215	1	10	51	3	\N	2016-12-20	-1100.00	7f6	2020-10-29 19:03:07.262548	2020-10-29 19:03:07.262548
2216	1	10	51	3	\N	2016-12-20	-500.00	f8c	2020-10-29 19:03:07.263868	2020-10-29 19:03:07.263868
2217	1	10	51	3	\N	2016-12-20	-2200.00	fb1	2020-10-29 19:03:07.265126	2020-10-29 19:03:07.265126
2218	1	10	51	3	\N	2016-12-20	-1500.00	ae4	2020-10-29 19:03:07.266388	2020-10-29 19:03:07.266388
2219	1	10	51	3	\N	2016-12-20	-1500.00	124	2020-10-29 19:03:07.267559	2020-10-29 19:03:07.267559
2220	5	10	51	4	\N	2016-12-20	1500.00	124	2020-10-29 19:03:07.268698	2020-10-29 19:03:07.268698
2221	1	10	51	3	\N	2016-12-20	-1500.00	203	2020-10-29 19:03:07.269921	2020-10-29 19:03:07.269921
2222	6	10	51	4	\N	2016-12-20	1500.00	203	2020-10-29 19:03:07.271279	2020-10-29 19:03:07.271279
2223	1	10	51	3	\N	2016-12-20	-1000.00	124	2020-10-29 19:03:07.272489	2020-10-29 19:03:07.272489
2224	6	10	51	4	\N	2016-12-20	1000.00	124	2020-10-29 19:03:07.273563	2020-10-29 19:03:07.273563
2225	1	1	4	2	\N	2016-12-21	-2.00	4cb	2020-10-29 19:03:07.274641	2020-10-29 19:03:07.274641
2226	1	1	4	2	\N	2016-12-21	-10.50	f04	2020-10-29 19:03:07.275759	2020-10-29 19:03:07.275759
2227	1	1	7	2	\N	2016-12-22	-14.36	b98	2020-10-29 19:03:07.276949	2020-10-29 19:03:07.276949
2228	1	1	5	2	\N	2016-12-22	-12.73	7d2	2020-10-29 19:03:07.278086	2020-10-29 19:03:07.278086
2229	5	1	5	2	\N	2016-12-21	-17.84	7d2	2020-10-29 19:03:07.27925	2020-10-29 19:03:07.27925
2230	2	5	18	2	\N	2016-12-22	-24.99	547	2020-10-29 19:03:07.280578	2020-10-29 19:03:07.280578
2231	2	3	-1	2	\N	2016-12-22	-10.00	ad5	2020-10-29 19:03:07.281984	2020-10-29 19:03:07.281984
2232	5	9	45	2	\N	2016-12-22	-34.90	745	2020-10-29 19:03:07.283126	2020-10-29 19:03:07.283126
2233	5	1	5	2	\N	2016-12-22	-14.73	873	2020-10-29 19:03:07.284185	2020-10-29 19:03:07.284185
2234	2	4	13	2	\N	2016-12-23	-19.99	88a	2020-10-29 19:03:07.285348	2020-10-29 19:03:07.285348
2235	5	4	13	2	\N	2016-12-25	-49.90	6f1	2020-10-29 19:03:07.28643	2020-10-29 19:03:07.28643
2236	2	4	15	2	\N	2016-12-25	-42.07	221	2020-10-29 19:03:07.287507	2020-10-29 19:03:07.287507
2237	2	5	20	2	\N	2016-12-27	-20.58	c74	2020-10-29 19:03:07.288563	2020-10-29 19:03:07.288563
2238	2	6	40	2	\N	2016-12-25	-29.99	13d	2020-10-29 19:03:07.290015	2020-10-29 19:03:07.290015
2239	2	5	45	2	\N	2016-12-24	-13.00	08e	2020-10-29 19:03:07.291425	2020-10-29 19:03:07.291425
2240	5	9	-1	2	\N	2016-12-25	-46.27	1a7	2020-10-29 19:03:07.29397	2020-10-29 19:03:07.29397
2241	1	8	38	2	\N	2016-12-27	-46.00	a3a	2020-10-29 19:03:07.295753	2020-10-29 19:03:07.295753
2242	5	8	40	2	\N	2017-01-01	-183.84	910	2020-10-29 19:03:07.297259	2020-10-29 19:03:07.297259
2243	5	7	28	2	\N	2016-12-28	-37.00	6ce	2020-10-29 19:03:07.298451	2020-10-29 19:03:07.298451
2244	5	1	5	2	\N	2016-12-30	-46.98	d2c	2020-10-29 19:03:07.299655	2020-10-29 19:03:07.299655
2245	1	7	30	2	\N	2016-12-30	-29.99	fd5	2020-10-29 19:03:07.300777	2020-10-29 19:03:07.300777
2246	5	5	18	2	\N	2016-12-28	-31.40	13b	2020-10-29 19:03:07.301966	2020-10-29 19:03:07.301966
2247	1	10	51	4	\N	2017-01-01	100.00	55c	2020-10-29 19:03:07.303212	2020-10-29 19:03:07.303212
2248	1	10	51	3	\N	2017-01-01	-100.00	55c	2020-10-29 19:03:07.304805	2020-10-29 19:03:07.304805
2249	5	1	5	2	\N	2017-01-01	-11.94	0df	2020-10-29 19:03:07.305994	2020-10-29 19:03:07.305994
2250	5	9	45	2	\N	2016-12-30	-10.99	9be	2020-10-29 19:03:07.3072	2020-10-29 19:03:07.3072
2251	1	1	5	2	\N	2016-12-30	-2.00	5fa	2020-10-29 19:03:07.308492	2020-10-29 19:03:07.308492
2252	1	3	-1	2	\N	2016-12-30	-13.96	3ea	2020-10-29 19:03:07.309937	2020-10-29 19:03:07.309937
2253	1	9	-1	2	\N	2016-12-31	-43.64	87c	2020-10-29 19:03:07.311458	2020-10-29 19:03:07.311458
2254	5	2	2	4	\N	2016-12-28	13.00	4fa	2020-10-29 19:03:07.312756	2020-10-29 19:03:07.312756
2255	5	9	-1	2	\N	2016-12-31	-15.18	87c	2020-10-29 19:03:07.31422	2020-10-29 19:03:07.31422
2256	6	10	52	1	\N	2016-12-31	82.88	801	2020-10-29 19:03:07.315673	2020-10-29 19:03:07.315673
2257	1	2	2	4	\N	2017-01-01	0.00	65e	2020-10-29 19:03:07.316806	2020-10-29 19:03:07.316806
2258	5	1	5	2	\N	2017-01-02	-95.37	e5f	2020-10-29 19:03:07.318105	2020-10-29 19:03:07.318105
2259	5	2	-1	4	\N	2017-01-02	1500.00	166	2020-10-29 19:03:07.319334	2020-10-29 19:03:07.319334
2260	5	5	20	2	\N	2017-01-02	-63.97	ceb	2020-10-29 19:03:07.320916	2020-10-29 19:03:07.320916
2261	5	1	5	2	\N	2017-01-02	-5.80	473	2020-10-29 19:03:07.322175	2020-10-29 19:03:07.322175
2262	5	1	4	2	\N	2017-01-02	-1.80	9f1	2020-10-29 19:03:07.323424	2020-10-29 19:03:07.323424
2263	5	8	38	2	\N	2017-01-02	-3.80	a3a	2020-10-29 19:03:07.324802	2020-10-29 19:03:07.324802
2264	5	1	5	2	\N	2017-01-02	-2.79	3e0	2020-10-29 19:03:07.326039	2020-10-29 19:03:07.326039
2265	5	10	51	3	\N	2017-01-02	-1000.00	820	2020-10-29 19:03:07.327279	2020-10-29 19:03:07.327279
2266	6	10	51	4	\N	2017-01-02	1000.00	820	2020-10-29 19:03:07.328518	2020-10-29 19:03:07.328518
2267	1	4	13	2	\N	2017-01-02	-21.50	de2	2020-10-29 19:03:07.329967	2020-10-29 19:03:07.329967
2268	1	2	-1	4	\N	2017-01-02	9800.00	0f3	2020-10-29 19:03:07.331404	2020-10-29 19:03:07.331404
2269	1	2	-1	4	\N	2017-01-02	2000.00	714	2020-10-29 19:03:07.33263	2020-10-29 19:03:07.33263
2270	1	2	1	1	\N	2017-01-02	712.80	42c	2020-10-29 19:03:07.333823	2020-10-29 19:03:07.333823
2271	1	9	46	2	\N	2017-01-02	-30.40	af5	2020-10-29 19:03:07.335043	2020-10-29 19:03:07.335043
2272	1	9	46	2	\N	2017-01-02	-52.94	c3c	2020-10-29 19:03:07.336248	2020-10-29 19:03:07.336248
2273	1	9	46	2	\N	2017-01-04	-2100.00	6ee	2020-10-29 19:03:07.337575	2020-10-29 19:03:07.337575
2274	1	9	46	2	\N	2017-01-05	-17.25	e5b	2020-10-29 19:03:07.338716	2020-10-29 19:03:07.338716
2275	1	9	-1	2	\N	2017-01-03	-5.00	13f	2020-10-29 19:03:07.339853	2020-10-29 19:03:07.339853
2276	1	7	29	2	\N	2017-01-06	-71.00	fad	2020-10-29 19:03:07.341048	2020-10-29 19:03:07.341048
2277	5	9	45	2	\N	2017-01-06	-74.99	808	2020-10-29 19:03:07.342452	2020-10-29 19:03:07.342452
2278	5	1	5	2	\N	2017-01-08	-2.78	071	2020-10-29 19:03:07.343719	2020-10-29 19:03:07.343719
2279	5	1	5	2	\N	2017-01-08	-107.16	e5f	2020-10-29 19:03:07.344818	2020-10-29 19:03:07.344818
2280	5	1	5	2	\N	2017-01-09	-16.24	7d2	2020-10-29 19:03:07.346205	2020-10-29 19:03:07.346205
2281	1	8	39	2	\N	2017-01-09	-40.00	e99	2020-10-29 19:03:07.347505	2020-10-29 19:03:07.347505
2282	5	7	33	2	\N	2017-01-09	-129.99	29a	2020-10-29 19:03:07.348625	2020-10-29 19:03:07.348625
2283	5	5	20	2	\N	2017-01-09	-37.49	ceb	2020-10-29 19:03:07.34967	2020-10-29 19:03:07.34967
2284	5	5	18	2	\N	2017-01-09	-36.96	cb7	2020-10-29 19:03:07.350811	2020-10-29 19:03:07.350811
2285	1	5	18	2	\N	2017-01-09	-66.95	cb7	2020-10-29 19:03:07.351916	2020-10-29 19:03:07.351916
2286	1	1	5	2	\N	2017-01-09	-2.36	473	2020-10-29 19:03:07.353044	2020-10-29 19:03:07.353044
2287	1	1	5	2	\N	2017-01-10	-3.16	473	2020-10-29 19:03:07.354145	2020-10-29 19:03:07.354145
2288	1	3	-1	2	\N	2017-01-11	-30.00	362	2020-10-29 19:03:07.355253	2020-10-29 19:03:07.355253
2289	1	1	5	2	\N	2017-01-11	-3.30	473	2020-10-29 19:03:07.356312	2020-10-29 19:03:07.356312
2290	1	8	38	2	\N	2017-01-12	-9.40	f79	2020-10-29 19:03:07.357492	2020-10-29 19:03:07.357492
2291	1	1	8	2	\N	2017-01-12	-2.65	9f1	2020-10-29 19:03:07.358602	2020-10-29 19:03:07.358602
2292	1	1	5	2	\N	2017-01-11	-4.25	cd7	2020-10-29 19:03:07.359741	2020-10-29 19:03:07.359741
2293	1	1	7	2	\N	2017-01-13	-20.21	e33	2020-10-29 19:03:07.360912	2020-10-29 19:03:07.360912
2294	5	1	5	2	\N	2017-01-14	-26.21	7d2	2020-10-29 19:03:07.362107	2020-10-29 19:03:07.362107
2295	1	1	5	2	\N	2017-01-14	-9.70	850	2020-10-29 19:03:07.363293	2020-10-29 19:03:07.363293
2296	1	9	45	2	\N	2017-01-14	-10.00	779	2020-10-29 19:03:07.36461	2020-10-29 19:03:07.36461
2297	1	1	5	2	\N	2017-01-14	-3.00	473	2020-10-29 19:03:07.365684	2020-10-29 19:03:07.365684
2298	1	9	-1	2	\N	2017-01-15	-10.00	5f5	2020-10-29 19:03:07.366876	2020-10-29 19:03:07.366876
2299	5	9	45	2	\N	2017-01-15	-19.99	9c5	2020-10-29 19:03:07.368063	2020-10-29 19:03:07.368063
2300	5	1	5	2	\N	2017-01-15	-71.90	7d2	2020-10-29 19:03:07.369246	2020-10-29 19:03:07.369246
2301	1	2	2	1	\N	2017-01-12	40.00	af3	2020-10-29 19:03:07.370446	2020-10-29 19:03:07.370446
2302	5	7	33	2	\N	2017-01-15	-39.90	f47	2020-10-29 19:03:07.371684	2020-10-29 19:03:07.371684
2303	5	9	45	2	\N	2017-01-15	-189.90	8f9	2020-10-29 19:03:07.372876	2020-10-29 19:03:07.372876
2304	5	5	20	2	\N	2017-01-15	-27.59	2ea	2020-10-29 19:03:07.374204	2020-10-29 19:03:07.374204
2305	1	7	33	2	\N	2017-01-15	-22.90	36b	2020-10-29 19:03:07.375373	2020-10-29 19:03:07.375373
2306	2	9	-1	2	\N	2017-01-17	-488.21	7af	2020-10-29 19:03:07.376638	2020-10-29 19:03:07.376638
2307	1	1	7	2	\N	2017-01-17	-14.50	e33	2020-10-29 19:03:07.378437	2020-10-29 19:03:07.378437
2308	2	9	45	2	\N	2017-01-17	-79.99	c1c	2020-10-29 19:03:07.380087	2020-10-29 19:03:07.380087
2309	5	5	20	2	\N	2017-01-17	-7.00	ceb	2020-10-29 19:03:07.382037	2020-10-29 19:03:07.382037
2310	5	1	5	2	\N	2017-01-17	-12.96	473	2020-10-29 19:03:07.38381	2020-10-29 19:03:07.38381
2311	2	9	-1	2	\N	2017-01-20	-58.00	bae	2020-10-29 19:03:07.385299	2020-10-29 19:03:07.385299
2312	5	1	5	2	\N	2017-01-19	-14.87	7d2	2020-10-29 19:03:07.386904	2020-10-29 19:03:07.386904
2313	5	9	45	2	\N	2017-01-20	-67.00	8e6	2020-10-29 19:03:07.388314	2020-10-29 19:03:07.388314
2314	5	1	5	2	\N	2017-01-21	-5.00	473	2020-10-29 19:03:07.389635	2020-10-29 19:03:07.389635
2315	5	1	5	2	\N	2017-01-21	-4.60	5b0	2020-10-29 19:03:07.390837	2020-10-29 19:03:07.390837
2316	1	1	4	2	\N	2017-01-20	-14.79	4f5	2020-10-29 19:03:07.392088	2020-10-29 19:03:07.392088
2317	1	8	41	2	\N	2017-01-20	-10.00	0dc	2020-10-29 19:03:07.394397	2020-10-29 19:03:07.394397
2318	5	1	5	2	\N	2017-01-21	-85.67	a4a	2020-10-29 19:03:07.396934	2020-10-29 19:03:07.396934
2319	5	1	5	2	\N	2017-01-20	-13.36	644	2020-10-29 19:03:07.399713	2020-10-29 19:03:07.399713
2320	5	5	20	2	\N	2017-01-20	-50.97	f40	2020-10-29 19:03:07.402523	2020-10-29 19:03:07.402523
2321	1	1	5	2	\N	2017-01-20	-3.00	473	2020-10-29 19:03:07.40537	2020-10-29 19:03:07.40537
2322	2	1	5	2	\N	2017-01-21	-32.84	216	2020-10-29 19:03:07.407912	2020-10-29 19:03:07.407912
2323	2	1	5	2	\N	2017-01-21	-3.17	d41	2020-10-29 19:03:07.410735	2020-10-29 19:03:07.410735
2324	1	5	18	2	\N	2017-01-24	-13.99	846	2020-10-29 19:03:07.414113	2020-10-29 19:03:07.414113
2325	1	1	7	2	\N	2017-01-24	-19.92	e33	2020-10-29 19:03:07.416979	2020-10-29 19:03:07.416979
2326	5	1	5	2	\N	2017-01-24	-16.32	7d2	2020-10-29 19:03:07.419786	2020-10-29 19:03:07.419786
2327	2	5	18	2	\N	2017-01-24	-31.15	846	2020-10-29 19:03:07.421554	2020-10-29 19:03:07.421554
2328	2	4	13	2	\N	2017-01-24	-19.99	fc6	2020-10-29 19:03:07.424292	2020-10-29 19:03:07.424292
2329	1	9	46	2	\N	2017-01-25	-24.60	61a	2020-10-29 19:03:07.426451	2020-10-29 19:03:07.426451
2330	5	1	5	2	\N	2017-01-25	-7.16	7d2	2020-10-29 19:03:07.428961	2020-10-29 19:03:07.428961
2331	1	2	1	1	\N	2017-01-25	10172.62	012	2020-10-29 19:03:07.431456	2020-10-29 19:03:07.431456
2332	1	10	51	3	\N	2017-01-25	-500.00	359	2020-10-29 19:03:07.433502	2020-10-29 19:03:07.433502
2333	1	10	51	3	\N	2017-01-25	-4500.00	7d9	2020-10-29 19:03:07.434915	2020-10-29 19:03:07.434915
2334	6	10	51	4	\N	2017-01-25	4500.00	7d9	2020-10-29 19:03:07.437222	2020-10-29 19:03:07.437222
2335	1	10	51	3	\N	2017-01-25	-2000.00	e49	2020-10-29 19:03:07.439526	2020-10-29 19:03:07.439526
2336	1	10	51	3	\N	2017-01-25	-1100.00	789	2020-10-29 19:03:07.441897	2020-10-29 19:03:07.441897
2337	1	1	7	2	\N	2017-01-26	-14.68	e33	2020-10-29 19:03:07.444335	2020-10-29 19:03:07.444335
2338	5	1	5	2	\N	2017-01-26	-4.00	473	2020-10-29 19:03:07.445904	2020-10-29 19:03:07.445904
2339	5	1	5	2	\N	2017-01-26	-14.42	7d2	2020-10-29 19:03:07.44805	2020-10-29 19:03:07.44805
2340	5	5	20	2	\N	2017-01-26	-36.48	ceb	2020-10-29 19:03:07.449546	2020-10-29 19:03:07.449546
2341	2	2	1	1	\N	2017-01-27	5598.89	bf9	2020-10-29 19:03:07.450856	2020-10-29 19:03:07.450856
2342	2	10	51	3	\N	2017-01-28	-1500.00	e2f	2020-10-29 19:03:07.452156	2020-10-29 19:03:07.452156
2343	5	10	51	4	\N	2017-01-28	1500.00	e2f	2020-10-29 19:03:07.453542	2020-10-29 19:03:07.453542
2344	2	10	51	3	\N	2017-01-28	-2000.00	eea	2020-10-29 19:03:07.454698	2020-10-29 19:03:07.454698
2345	6	10	51	4	\N	2017-01-28	2000.00	eea	2020-10-29 19:03:07.455806	2020-10-29 19:03:07.455806
2346	2	10	51	3	\N	2017-01-28	-3000.00	0dc	2020-10-29 19:03:07.456861	2020-10-29 19:03:07.456861
2347	4	10	51	4	\N	2017-01-28	3000.00	0dc	2020-10-29 19:03:07.458217	2020-10-29 19:03:07.458217
2348	1	6	24	2	\N	2017-01-28	-29.97	49f	2020-10-29 19:03:07.459722	2020-10-29 19:03:07.459722
2349	1	9	-1	2	\N	2017-01-27	-30.00	982	2020-10-29 19:03:07.461704	2020-10-29 19:03:07.461704
2350	1	1	8	2	\N	2017-01-27	-7.08	8e6	2020-10-29 19:03:07.463165	2020-10-29 19:03:07.463165
2351	1	1	8	2	\N	2017-01-27	-14.16	395	2020-10-29 19:03:07.464693	2020-10-29 19:03:07.464693
2352	1	5	22	2	\N	2017-01-28	-35.00	09f	2020-10-29 19:03:07.465872	2020-10-29 19:03:07.465872
2353	5	1	5	2	\N	2017-01-28	-28.85	0bb	2020-10-29 19:03:07.467119	2020-10-29 19:03:07.467119
2354	5	5	20	2	\N	2017-01-27	-121.49	849	2020-10-29 19:03:07.468256	2020-10-29 19:03:07.468256
2355	5	1	5	2	\N	2017-01-28	-12.00	1d1	2020-10-29 19:03:07.469538	2020-10-29 19:03:07.469538
2356	5	1	5	2	\N	2017-01-18	-103.18	e5f	2020-10-29 19:03:07.470756	2020-10-29 19:03:07.470756
2357	5	4	10	2	\N	2017-01-28	-89.00	c6d	2020-10-29 19:03:07.472037	2020-10-29 19:03:07.472037
2358	5	4	10	2	\N	2017-01-28	-344.25	365	2020-10-29 19:03:07.473312	2020-10-29 19:03:07.473312
2359	2	7	31	2	\N	2017-01-26	-25.00	cee	2020-10-29 19:03:07.474531	2020-10-29 19:03:07.474531
2360	2	1	7	2	\N	2017-01-27	-25.00	346	2020-10-29 19:03:07.475705	2020-10-29 19:03:07.475705
2361	2	3	-1	2	\N	2017-01-27	-21.50	f23	2020-10-29 19:03:07.47691	2020-10-29 19:03:07.47691
2362	5	4	12	2	\N	2017-01-28	-114.48	d82	2020-10-29 19:03:07.478004	2020-10-29 19:03:07.478004
2363	5	4	-1	2	\N	2017-01-28	-590.00	cd8	2020-10-29 19:03:07.479129	2020-10-29 19:03:07.479129
2364	2	8	37	2	\N	2017-01-28	-4.00	e33	2020-10-29 19:03:07.480374	2020-10-29 19:03:07.480374
2365	5	9	45	2	\N	2017-01-28	-72.70	042	2020-10-29 19:03:07.481616	2020-10-29 19:03:07.481616
2366	2	4	15	2	\N	2017-01-28	-58.01	8bf	2020-10-29 19:03:07.483112	2020-10-29 19:03:07.483112
2367	1	1	8	2	\N	2017-01-29	-14.00	a00	2020-10-29 19:03:07.484337	2020-10-29 19:03:07.484337
2368	1	1	8	2	\N	2017-01-29	-28.00	2b8	2020-10-29 19:03:07.485452	2020-10-29 19:03:07.485452
2369	5	1	5	2	\N	2017-01-29	-11.70	d9a	2020-10-29 19:03:07.486638	2020-10-29 19:03:07.486638
2370	1	3	-1	2	\N	2017-01-28	-15.08	4d8	2020-10-29 19:03:07.488101	2020-10-29 19:03:07.488101
2371	1	8	38	2	\N	2017-01-29	-46.00	a3a	2020-10-29 19:03:07.489343	2020-10-29 19:03:07.489343
2372	1	9	-1	2	\N	2017-01-29	-228.97	935	2020-10-29 19:03:07.49059	2020-10-29 19:03:07.49059
2373	1	8	38	2	\N	2017-01-29	-1.28	074	2020-10-29 19:03:07.491981	2020-10-29 19:03:07.491981
2374	1	7	30	2	\N	2017-01-31	-29.99	fd5	2020-10-29 19:03:07.493154	2020-10-29 19:03:07.493154
2375	1	10	51	3	\N	2017-01-31	-1500.00	203	2020-10-29 19:03:07.49433	2020-10-29 19:03:07.49433
2376	5	10	51	4	\N	2017-01-31	1500.00	203	2020-10-29 19:03:07.495688	2020-10-29 19:03:07.495688
2377	5	4	13	2	\N	2017-01-31	-49.90	97a	2020-10-29 19:03:07.497032	2020-10-29 19:03:07.497032
2378	5	10	51	3	\N	2017-02-01	-1100.00	dd2	2020-10-29 19:03:07.498235	2020-10-29 19:03:07.498235
2379	1	2	2	4	\N	2017-02-01	64.05	c3e	2020-10-29 19:03:07.499488	2020-10-29 19:03:07.499488
2380	5	1	5	2	\N	2017-02-01	-89.42	d61	2020-10-29 19:03:07.50067	2020-10-29 19:03:07.50067
2381	6	10	52	1	\N	2017-01-31	88.51	15b	2020-10-29 19:03:07.501843	2020-10-29 19:03:07.501843
2382	6	10	2	4	\N	2017-01-31	42.16	d72	2020-10-29 19:03:07.503035	2020-10-29 19:03:07.503035
2383	1	9	-1	3	\N	2017-02-01	-13.80	ec1	2020-10-29 19:03:07.504136	2020-10-29 19:03:07.504136
2384	5	2	2	4	\N	2017-02-01	144.22	ec1	2020-10-29 19:03:07.505377	2020-10-29 19:03:07.505377
2385	2	9	-1	2	\N	2017-02-04	-82.00	40d	2020-10-29 19:03:07.506626	2020-10-29 19:03:07.506626
2386	5	9	-1	1	\N	2017-02-04	82.00	40d	2020-10-29 19:03:07.507831	2020-10-29 19:03:07.507831
2387	2	1	6	2	\N	2017-02-04	-10.90	3e6	2020-10-29 19:03:07.508982	2020-10-29 19:03:07.508982
2388	5	2	2	4	\N	2017-02-03	1100.00	785	2020-10-29 19:03:07.510132	2020-10-29 19:03:07.510132
2389	5	5	18	2	\N	2017-02-04	-82.92	846	2020-10-29 19:03:07.511331	2020-10-29 19:03:07.511331
2390	5	1	5	2	\N	2017-02-04	-188.28	e7e	2020-10-29 19:03:07.512434	2020-10-29 19:03:07.512434
2391	5	1	5	2	\N	2017-02-04	-16.00	3e9	2020-10-29 19:03:07.514006	2020-10-29 19:03:07.514006
2392	1	2	2	1	\N	2017-02-04	16.00	3e9	2020-10-29 19:03:07.515363	2020-10-29 19:03:07.515363
2393	5	1	5	2	\N	2017-02-02	-8.76	7d2	2020-10-29 19:03:07.516514	2020-10-29 19:03:07.516514
2394	1	3	-1	2	\N	2017-02-03	-23.90	f50	2020-10-29 19:03:07.517571	2020-10-29 19:03:07.517571
2395	5	5	20	2	\N	2017-02-03	-6.40	ceb	2020-10-29 19:03:07.518628	2020-10-29 19:03:07.518628
2396	5	5	23	3	\N	2017-02-05	-228.97	7f2	2020-10-29 19:03:07.519782	2020-10-29 19:03:07.519782
2397	1	2	2	4	\N	2017-02-05	228.97	7f2	2020-10-29 19:03:07.52094	2020-10-29 19:03:07.52094
2398	1	2	2	4	\N	2017-02-05	8.76	87f	2020-10-29 19:03:07.522147	2020-10-29 19:03:07.522147
2399	1	4	15	2	\N	2017-02-05	-19.00	89c	2020-10-29 19:03:07.523405	2020-10-29 19:03:07.523405
2400	5	1	5	2	\N	2017-02-05	-12.08	7d2	2020-10-29 19:03:07.524968	2020-10-29 19:03:07.524968
2401	5	9	45	2	\N	2017-02-06	-31.80	556	2020-10-29 19:03:07.526266	2020-10-29 19:03:07.526266
2402	5	5	20	2	\N	2017-02-06	-31.80	b13	2020-10-29 19:03:07.527525	2020-10-29 19:03:07.527525
2403	2	9	45	2	\N	2017-02-06	-4.00	6db	2020-10-29 19:03:07.528727	2020-10-29 19:03:07.528727
2404	2	10	51	2	\N	2017-02-06	-100.00	ca4	2020-10-29 19:03:07.530482	2020-10-29 19:03:07.530482
2405	5	1	5	2	\N	2017-02-06	-12.08	7d2	2020-10-29 19:03:07.531755	2020-10-29 19:03:07.531755
2406	5	1	5	2	\N	2017-02-06	-13.54	7d2	2020-10-29 19:03:07.533047	2020-10-29 19:03:07.533047
2407	1	1	5	2	\N	2017-02-06	-3.69	7d2	2020-10-29 19:03:07.534405	2020-10-29 19:03:07.534405
2408	2	2	1	1	\N	2017-02-07	1619.16	d29	2020-10-29 19:03:07.53569	2020-10-29 19:03:07.53569
2409	2	1	7	2	\N	2017-02-08	-10.00	7cf	2020-10-29 19:03:07.537005	2020-10-29 19:03:07.537005
2410	1	1	5	2	\N	2017-02-09	-11.63	058	2020-10-29 19:03:07.538267	2020-10-29 19:03:07.538267
2411	5	1	5	2	\N	2017-02-08	-115.41	749	2020-10-29 19:03:07.539504	2020-10-29 19:03:07.539504
2412	1	9	45	2	\N	2017-02-08	-49.33	941	2020-10-29 19:03:07.540661	2020-10-29 19:03:07.540661
2413	5	9	45	2	\N	2017-02-11	-200.00	f17	2020-10-29 19:03:07.541757	2020-10-29 19:03:07.541757
2414	5	1	5	2	\N	2017-02-11	-30.00	7d2	2020-10-29 19:03:07.542978	2020-10-29 19:03:07.542978
2415	1	1	7	2	\N	2017-02-11	-10.65	2cf	2020-10-29 19:03:07.544186	2020-10-29 19:03:07.544186
2416	1	1	4	2	\N	2017-02-11	-3.99	916	2020-10-29 19:03:07.545756	2020-10-29 19:03:07.545756
2417	1	3	-1	2	\N	2017-02-11	-4.70	362	2020-10-29 19:03:07.547785	2020-10-29 19:03:07.547785
2418	2	3	-1	2	\N	2017-02-11	-30.00	2df	2020-10-29 19:03:07.549226	2020-10-29 19:03:07.549226
2419	5	1	5	2	\N	2017-02-11	-21.00	2c4	2020-10-29 19:03:07.550579	2020-10-29 19:03:07.550579
2420	1	1	7	2	\N	2017-02-14	-10.00	597	2020-10-29 19:03:07.551741	2020-10-29 19:03:07.551741
2421	1	9	45	2	\N	2017-02-14	-39.90	c86	2020-10-29 19:03:07.552916	2020-10-29 19:03:07.552916
2422	5	1	5	2	\N	2017-02-12	-14.15	7d2	2020-10-29 19:03:07.55408	2020-10-29 19:03:07.55408
2423	1	9	45	2	\N	2017-02-14	-9.98	85b	2020-10-29 19:03:07.555263	2020-10-29 19:03:07.555263
2424	5	5	20	2	\N	2017-02-13	-67.49	3c9	2020-10-29 19:03:07.556407	2020-10-29 19:03:07.556407
2425	1	9	45	2	\N	2017-02-14	-59.90	eaa	2020-10-29 19:03:07.557494	2020-10-29 19:03:07.557494
2426	1	9	45	2	\N	2017-02-14	-20.00	057	2020-10-29 19:03:07.558687	2020-10-29 19:03:07.558687
2427	2	1	5	2	\N	2017-02-14	-29.78	304	2020-10-29 19:03:07.559839	2020-10-29 19:03:07.559839
2428	2	5	20	2	\N	2017-02-14	-50.00	5dc	2020-10-29 19:03:07.561044	2020-10-29 19:03:07.561044
2429	5	5	20	1	\N	2017-02-14	50.00	5dc	2020-10-29 19:03:07.56236	2020-10-29 19:03:07.56236
2430	2	4	13	2	\N	2017-02-15	-19.99	f2b	2020-10-29 19:03:07.563766	2020-10-29 19:03:07.563766
2431	1	1	5	2	\N	2017-02-17	-3.16	85c	2020-10-29 19:03:07.564997	2020-10-29 19:03:07.564997
2432	1	1	7	2	\N	2017-02-17	-2.80	73e	2020-10-29 19:03:07.566158	2020-10-29 19:03:07.566158
2433	1	1	5	2	\N	2017-02-17	-18.84	7d2	2020-10-29 19:03:07.567282	2020-10-29 19:03:07.567282
2434	1	1	7	2	\N	2017-02-16	-17.51	b98	2020-10-29 19:03:07.568422	2020-10-29 19:03:07.568422
2435	1	5	20	2	\N	2017-02-16	-18.99	01d	2020-10-29 19:03:07.569608	2020-10-29 19:03:07.569608
2436	5	5	20	2	\N	2017-02-16	-59.76	f40	2020-10-29 19:03:07.570763	2020-10-29 19:03:07.570763
2437	1	10	51	4	\N	2017-02-16	8900.00	91a	2020-10-29 19:03:07.572	2020-10-29 19:03:07.572
2438	1	10	51	3	\N	2017-02-16	-8500.00	91a	2020-10-29 19:03:07.573358	2020-10-29 19:03:07.573358
2439	5	5	18	2	\N	2017-02-16	-97.75	dd9	2020-10-29 19:03:07.574595	2020-10-29 19:03:07.574595
2440	2	6	24	2	\N	2017-02-16	-59.90	cae	2020-10-29 19:03:07.575783	2020-10-29 19:03:07.575783
2441	5	1	5	2	\N	2017-02-18	-87.86	e5f	2020-10-29 19:03:07.576998	2020-10-29 19:03:07.576998
2442	5	1	5	2	\N	2017-02-18	-42.75	a77	2020-10-29 19:03:07.578207	2020-10-29 19:03:07.578207
2443	5	1	5	2	\N	2017-02-18	-11.00	473	2020-10-29 19:03:07.579388	2020-10-29 19:03:07.579388
2444	5	1	5	2	\N	2017-02-18	-4.00	65c	2020-10-29 19:03:07.580787	2020-10-29 19:03:07.580787
2445	1	9	45	2	\N	2017-02-08	-20.00	779	2020-10-29 19:03:07.582146	2020-10-29 19:03:07.582146
2446	2	9	-1	2	\N	2017-02-08	-10.99	cb6	2020-10-29 19:03:07.583225	2020-10-29 19:03:07.583225
2447	5	1	5	2	\N	2017-02-19	-10.50	56e	2020-10-29 19:03:07.584296	2020-10-29 19:03:07.584296
2448	1	8	40	2	\N	2017-02-19	-51.21	c0e	2020-10-29 19:03:07.585361	2020-10-29 19:03:07.585361
2449	1	9	-1	2	\N	2017-02-18	-24.99	e60	2020-10-29 19:03:07.586391	2020-10-29 19:03:07.586391
2450	2	4	16	2	\N	2017-02-19	-478.00	1ae	2020-10-29 19:03:07.58748	2020-10-29 19:03:07.58748
2451	2	9	45	2	\N	2017-02-22	-10.00	f21	2020-10-29 19:03:07.588504	2020-10-29 19:03:07.588504
2452	2	1	5	2	\N	2017-02-22	-17.20	649	2020-10-29 19:03:07.58954	2020-10-29 19:03:07.58954
2453	1	1	5	2	\N	2017-02-25	-14.07	7d2	2020-10-29 19:03:07.590597	2020-10-29 19:03:07.590597
2454	1	1	5	2	\N	2017-02-25	-12.08	473	2020-10-29 19:03:07.591594	2020-10-29 19:03:07.591594
2455	1	3	-1	2	\N	2017-02-24	-35.20	362	2020-10-29 19:03:07.592572	2020-10-29 19:03:07.592572
2456	1	1	5	2	\N	2017-02-25	-10.53	436	2020-10-29 19:03:07.593593	2020-10-29 19:03:07.593593
2457	1	1	5	2	\N	2017-02-25	-263.52	20c	2020-10-29 19:03:07.595506	2020-10-29 19:03:07.595506
2458	1	2	1	1	\N	2017-02-24	9825.75	d00	2020-10-29 19:03:07.596913	2020-10-29 19:03:07.596913
2459	2	3	-1	2	\N	2017-02-24	-20.00	cd5	2020-10-29 19:03:07.598171	2020-10-29 19:03:07.598171
2460	2	5	22	2	\N	2017-02-25	-40.00	9da	2020-10-29 19:03:07.599301	2020-10-29 19:03:07.599301
2461	2	5	20	2	\N	2017-02-25	-23.19	310	2020-10-29 19:03:07.600521	2020-10-29 19:03:07.600521
2462	2	1	5	2	\N	2017-02-25	-16.96	cd7	2020-10-29 19:03:07.601907	2020-10-29 19:03:07.601907
2463	1	10	51	3	\N	2017-02-25	-2355.00	de7	2020-10-29 19:03:07.603081	2020-10-29 19:03:07.603081
2464	6	10	51	4	\N	2017-02-25	2355.00	de7	2020-10-29 19:03:07.604236	2020-10-29 19:03:07.604236
2465	1	10	51	3	\N	2017-02-25	-1500.00	f6b	2020-10-29 19:03:07.605639	2020-10-29 19:03:07.605639
2466	5	10	51	4	\N	2017-02-25	1500.00	f6b	2020-10-29 19:03:07.606883	2020-10-29 19:03:07.606883
2467	1	10	51	3	\N	2017-02-25	-1500.00	808	2020-10-29 19:03:07.608088	2020-10-29 19:03:07.608088
2468	1	10	51	3	\N	2017-02-25	-2200.00	cd2	2020-10-29 19:03:07.609296	2020-10-29 19:03:07.609296
2469	1	10	51	3	\N	2017-02-25	-500.00	648	2020-10-29 19:03:07.610441	2020-10-29 19:03:07.610441
2470	1	2	2	4	\N	2017-02-25	387.91	2fd	2020-10-29 19:03:07.611521	2020-10-29 19:03:07.611521
2471	5	9	-1	3	\N	2017-02-25	-387.91	2fd	2020-10-29 19:03:07.612782	2020-10-29 19:03:07.612782
2472	1	10	51	3	\N	2017-02-25	-850.00	3aa	2020-10-29 19:03:07.614335	2020-10-29 19:03:07.614335
2473	1	10	51	3	\N	2017-02-25	-1000.00	9cc	2020-10-29 19:03:07.615651	2020-10-29 19:03:07.615651
2474	2	2	1	1	\N	2017-02-25	6792.81	50d	2020-10-29 19:03:07.616791	2020-10-29 19:03:07.616791
2475	2	10	51	3	\N	2017-02-26	-1500.00	b27	2020-10-29 19:03:07.61786	2020-10-29 19:03:07.61786
2476	5	10	51	4	\N	2017-02-26	1500.00	b27	2020-10-29 19:03:07.619073	2020-10-29 19:03:07.619073
2477	2	10	51	3	\N	2017-02-26	-2500.00	64b	2020-10-29 19:03:07.620252	2020-10-29 19:03:07.620252
2478	6	10	51	4	\N	2017-02-26	2500.00	64b	2020-10-29 19:03:07.621468	2020-10-29 19:03:07.621468
2479	2	10	51	3	\N	2017-02-26	-3900.00	898	2020-10-29 19:03:07.622535	2020-10-29 19:03:07.622535
2480	4	10	51	4	\N	2017-02-26	3900.00	898	2020-10-29 19:03:07.623551	2020-10-29 19:03:07.623551
2481	5	4	10	2	\N	2017-02-26	-344.25	e69	2020-10-29 19:03:07.624606	2020-10-29 19:03:07.624606
2482	5	4	11	2	\N	2017-02-26	-99.18	d51	2020-10-29 19:03:07.625644	2020-10-29 19:03:07.625644
2483	5	4	-1	2	\N	2017-02-26	-590.00	f29	2020-10-29 19:03:07.626688	2020-10-29 19:03:07.626688
2484	5	1	5	2	\N	2017-02-26	-57.35	b88	2020-10-29 19:03:07.627728	2020-10-29 19:03:07.627728
2485	2	1	5	3	\N	2017-02-26	-57.35	b88	2020-10-29 19:03:07.628899	2020-10-29 19:03:07.628899
2486	1	8	38	2	\N	2017-02-27	-28.00	074	2020-10-29 19:03:07.630251	2020-10-29 19:03:07.630251
2487	2	4	15	2	\N	2017-02-28	-40.00	221	2020-10-29 19:03:07.631518	2020-10-29 19:03:07.631518
2488	2	5	18	2	\N	2017-02-28	-13.29	0de	2020-10-29 19:03:07.632731	2020-10-29 19:03:07.632731
2489	5	4	13	2	\N	2017-03-02	-49.90	97a	2020-10-29 19:03:07.633889	2020-10-29 19:03:07.633889
2490	2	1	5	2	\N	2017-03-02	-10.67	35b	2020-10-29 19:03:07.635184	2020-10-29 19:03:07.635184
2491	5	2	2	2	\N	2017-03-02	-46.67	5f5	2020-10-29 19:03:07.636547	2020-10-29 19:03:07.636547
2492	2	2	2	1	\N	2017-03-02	46.67	5f5	2020-10-29 19:03:07.637963	2020-10-29 19:03:07.637963
2493	5	1	5	2	\N	2017-03-03	-52.20	dfd	2020-10-29 19:03:07.639295	2020-10-29 19:03:07.639295
2494	1	10	51	4	\N	2017-03-05	1000.00	3fd	2020-10-29 19:03:07.640662	2020-10-29 19:03:07.640662
2495	1	7	30	2	\N	2017-03-05	-29.99	bcf	2020-10-29 19:03:07.641804	2020-10-29 19:03:07.641804
2496	1	8	38	2	\N	2017-03-05	-46.00	62f	2020-10-29 19:03:07.642983	2020-10-29 19:03:07.642983
2497	1	1	4	2	\N	2017-03-03	-2.00	e1c	2020-10-29 19:03:07.644178	2020-10-29 19:03:07.644178
2498	5	8	40	2	\N	2017-02-28	-101.51	862	2020-10-29 19:03:07.645496	2020-10-29 19:03:07.645496
2499	5	8	40	2	\N	2017-02-27	-27.00	bc8	2020-10-29 19:03:07.646766	2020-10-29 19:03:07.646766
2500	5	8	40	2	\N	2017-03-04	-11.00	c56	2020-10-29 19:03:07.648058	2020-10-29 19:03:07.648058
2501	1	8	37	2	\N	2017-03-04	-10.00	bb8	2020-10-29 19:03:07.649455	2020-10-29 19:03:07.649455
2502	1	1	7	2	\N	2017-03-03	-2.80	9e4	2020-10-29 19:03:07.651092	2020-10-29 19:03:07.651092
2503	5	1	5	2	\N	2017-03-04	-9.89	bbd	2020-10-29 19:03:07.652439	2020-10-29 19:03:07.652439
2504	5	1	5	2	\N	2017-03-04	-24.99	f9d	2020-10-29 19:03:07.653774	2020-10-29 19:03:07.653774
2505	1	1	4	2	\N	2017-03-01	-2.19	b1a	2020-10-29 19:03:07.655041	2020-10-29 19:03:07.655041
2506	1	1	5	2	\N	2017-03-01	-5.99	7d2	2020-10-29 19:03:07.656557	2020-10-29 19:03:07.656557
2507	5	10	51	4	\N	2017-03-04	1500.00	88d	2020-10-29 19:03:07.657848	2020-10-29 19:03:07.657848
2508	5	1	5	2	\N	2017-03-04	-90.30	e5f	2020-10-29 19:03:07.659155	2020-10-29 19:03:07.659155
2509	1	1	5	2	\N	2017-02-28	-3.55	7b6	2020-10-29 19:03:07.66064	2020-10-29 19:03:07.66064
2510	1	1	5	2	\N	2017-03-04	-13.20	473	2020-10-29 19:03:07.661899	2020-10-29 19:03:07.661899
2511	1	1	5	2	\N	2017-03-04	-10.00	644	2020-10-29 19:03:07.663594	2020-10-29 19:03:07.663594
2512	5	1	5	2	\N	2017-03-04	-17.78	7d2	2020-10-29 19:03:07.664838	2020-10-29 19:03:07.664838
2513	1	3	-1	2	\N	2017-03-02	-24.00	63d	2020-10-29 19:03:07.66608	2020-10-29 19:03:07.66608
2514	1	7	29	2	\N	2017-03-03	-56.00	c70	2020-10-29 19:03:07.667328	2020-10-29 19:03:07.667328
2515	1	8	38	2	\N	2017-03-02	-28.00	14e	2020-10-29 19:03:07.668509	2020-10-29 19:03:07.668509
2516	6	10	52	1	\N	2017-02-28	85.89	15b	2020-10-29 19:03:07.669648	2020-10-29 19:03:07.669648
2517	5	9	-1	2	\N	2017-03-05	-17.55	290	2020-10-29 19:03:07.670741	2020-10-29 19:03:07.670741
2518	1	2	2	1	\N	2017-02-01	0.00	809	2020-10-29 19:03:07.671824	2020-10-29 19:03:07.671824
2519	5	4	-1	2	\N	2017-02-07	-21.00	c4b	2020-10-29 19:03:07.672957	2020-10-29 19:03:07.672957
2520	5	9	44	2	\N	2017-02-05	-39.00	476	2020-10-29 19:03:07.6742	2020-10-29 19:03:07.6742
2521	1	1	7	2	\N	2017-03-06	-15.00	e33	2020-10-29 19:03:07.675536	2020-10-29 19:03:07.675536
2522	1	9	45	2	\N	2017-03-08	-9.00	779	2020-10-29 19:03:07.67675	2020-10-29 19:03:07.67675
2523	5	1	5	2	\N	2017-03-08	-23.35	7d2	2020-10-29 19:03:07.67793	2020-10-29 19:03:07.67793
2524	2	1	6	2	\N	2017-03-09	-7.21	1bc	2020-10-29 19:03:07.679259	2020-10-29 19:03:07.679259
2525	2	9	45	2	\N	2017-03-10	-5.00	acb	2020-10-29 19:03:07.680701	2020-10-29 19:03:07.680701
2526	1	1	8	2	\N	2017-03-12	-10.80	efb	2020-10-29 19:03:07.681933	2020-10-29 19:03:07.681933
2527	1	1	5	2	\N	2017-03-12	-3.79	9c1	2020-10-29 19:03:07.683275	2020-10-29 19:03:07.683275
2528	1	1	5	2	\N	2017-03-11	-3.28	5fd	2020-10-29 19:03:07.684674	2020-10-29 19:03:07.684674
2529	1	1	4	2	\N	2017-03-11	-2.49	a4a	2020-10-29 19:03:07.686034	2020-10-29 19:03:07.686034
2530	5	1	5	2	\N	2017-03-11	-277.46	7d2	2020-10-29 19:03:07.687469	2020-10-29 19:03:07.687469
2531	1	7	28	2	\N	2017-03-09	-40.00	f69	2020-10-29 19:03:07.68916	2020-10-29 19:03:07.68916
2532	5	1	5	2	\N	2017-03-11	-27.32	7d2	2020-10-29 19:03:07.690619	2020-10-29 19:03:07.690619
2533	1	4	15	2	\N	2017-03-12	-19.00	de2	2020-10-29 19:03:07.692053	2020-10-29 19:03:07.692053
2534	2	3	-1	2	\N	2017-03-13	-23.80	8de	2020-10-29 19:03:07.693564	2020-10-29 19:03:07.693564
2535	5	7	27	2	\N	2017-03-14	-220.25	65b	2020-10-29 19:03:07.695099	2020-10-29 19:03:07.695099
2536	2	7	30	2	\N	2017-03-15	-90.00	fa8	2020-10-29 19:03:07.696458	2020-10-29 19:03:07.696458
2537	2	1	6	2	\N	2017-03-15	-78.00	4cc	2020-10-29 19:03:07.698077	2020-10-29 19:03:07.698077
2538	2	9	44	2	\N	2017-03-17	-100.00	f00	2020-10-29 19:03:07.699743	2020-10-29 19:03:07.699743
2539	5	5	23	2	\N	2017-03-17	-52.91	f99	2020-10-29 19:03:07.702514	2020-10-29 19:03:07.702514
2540	2	6	24	2	\N	2017-03-17	-79.90	8c9	2020-10-29 19:03:07.703848	2020-10-29 19:03:07.703848
2541	2	6	24	2	\N	2017-03-17	-79.90	f06	2020-10-29 19:03:07.70575	2020-10-29 19:03:07.70575
2542	2	7	28	2	\N	2017-03-18	-22.00	5d4	2020-10-29 19:03:07.707244	2020-10-29 19:03:07.707244
2543	2	3	-1	2	\N	2017-03-18	-15.00	898	2020-10-29 19:03:07.708634	2020-10-29 19:03:07.708634
2544	1	1	5	2	\N	2017-03-11	-9.90	473	2020-10-29 19:03:07.709944	2020-10-29 19:03:07.709944
2545	5	1	5	2	\N	2017-03-17	-22.36	7d2	2020-10-29 19:03:07.711279	2020-10-29 19:03:07.711279
2546	1	1	8	2	\N	2017-03-16	-2.20	f15	2020-10-29 19:03:07.712673	2020-10-29 19:03:07.712673
2547	1	1	7	2	\N	2017-03-17	-2.80	756	2020-10-29 19:03:07.714058	2020-10-29 19:03:07.714058
2548	1	1	7	2	\N	2017-03-17	-10.83	b98	2020-10-29 19:03:07.715307	2020-10-29 19:03:07.715307
2549	5	9	45	2	\N	2017-03-13	-12.99	677	2020-10-29 19:03:07.716606	2020-10-29 19:03:07.716606
2550	5	1	5	2	\N	2017-03-18	-130.69	7d2	2020-10-29 19:03:07.717937	2020-10-29 19:03:07.717937
2551	5	1	5	2	\N	2017-03-18	-12.30	473	2020-10-29 19:03:07.719226	2020-10-29 19:03:07.719226
2552	5	1	5	2	\N	2017-03-18	-3.10	1b3	2020-10-29 19:03:07.721033	2020-10-29 19:03:07.721033
2553	1	9	48	2	\N	2017-03-19	-100.00	ddf	2020-10-29 19:03:07.722327	2020-10-29 19:03:07.722327
2554	5	5	20	2	\N	2017-03-20	-30.40	ceb	2020-10-29 19:03:07.723489	2020-10-29 19:03:07.723489
2555	2	4	13	2	\N	2017-03-21	-19.99	f2b	2020-10-29 19:03:07.724617	2020-10-29 19:03:07.724617
2556	5	5	23	2	\N	2017-03-23	-104.62	ff5	2020-10-29 19:03:07.726126	2020-10-29 19:03:07.726126
2557	2	6	24	2	\N	2017-03-23	-45.80	ab6	2020-10-29 19:03:07.727529	2020-10-29 19:03:07.727529
2558	5	6	24	2	\N	2017-03-23	-93.42	1b8	2020-10-29 19:03:07.728922	2020-10-29 19:03:07.728922
2559	2	6	24	3	\N	2017-03-23	-57.86	d69	2020-10-29 19:03:07.730464	2020-10-29 19:03:07.730464
2560	5	1	5	2	\N	2017-03-24	-16.39	8a9	2020-10-29 19:03:07.731839	2020-10-29 19:03:07.731839
2561	5	6	24	2	\N	2017-03-24	-11.90	942	2020-10-29 19:03:07.733452	2020-10-29 19:03:07.733452
2562	5	1	7	2	\N	2017-03-25	-2.20	81f	2020-10-29 19:03:07.734866	2020-10-29 19:03:07.734866
2563	5	1	5	2	\N	2017-03-25	-13.50	473	2020-10-29 19:03:07.736114	2020-10-29 19:03:07.736114
2564	5	3	-1	2	\N	2017-03-24	-4.99	3ea	2020-10-29 19:03:07.737672	2020-10-29 19:03:07.737672
2565	5	1	5	2	\N	2017-03-25	-125.06	7d2	2020-10-29 19:03:07.73907	2020-10-29 19:03:07.73907
2566	5	1	4	2	\N	2017-03-24	-5.69	dc1	2020-10-29 19:03:07.741569	2020-10-29 19:03:07.741569
2567	5	1	5	2	\N	2017-03-24	-6.64	f62	2020-10-29 19:03:07.742989	2020-10-29 19:03:07.742989
2568	5	1	5	2	\N	2017-03-25	-7.28	1a7	2020-10-29 19:03:07.744402	2020-10-29 19:03:07.744402
2569	5	4	13	2	\N	2017-03-28	-49.90	23f	2020-10-29 19:03:07.746058	2020-10-29 19:03:07.746058
2570	2	2	1	1	\N	2017-03-28	5659.74	461	2020-10-29 19:03:07.747542	2020-10-29 19:03:07.747542
2571	2	4	15	2	\N	2017-03-28	-40.22	efa	2020-10-29 19:03:07.749013	2020-10-29 19:03:07.749013
2572	2	1	6	2	\N	2017-03-28	-59.90	4b3	2020-10-29 19:03:07.750691	2020-10-29 19:03:07.750691
2573	2	6	24	2	\N	2017-03-28	-128.59	47b	2020-10-29 19:03:07.751951	2020-10-29 19:03:07.751951
2574	5	6	24	1	\N	2017-03-28	128.59	47b	2020-10-29 19:03:07.753365	2020-10-29 19:03:07.753365
2575	2	10	51	3	\N	2017-03-28	-1500.00	0e3	2020-10-29 19:03:07.754635	2020-10-29 19:03:07.754635
2576	5	10	51	4	\N	2017-03-28	1500.00	0e3	2020-10-29 19:03:07.756157	2020-10-29 19:03:07.756157
2577	2	10	51	3	\N	2017-03-28	-1500.00	912	2020-10-29 19:03:07.757901	2020-10-29 19:03:07.757901
2578	6	10	51	4	\N	2017-03-28	1500.00	912	2020-10-29 19:03:07.759275	2020-10-29 19:03:07.759275
2579	2	10	51	3	\N	2017-03-28	-1500.00	912	2020-10-29 19:03:07.76062	2020-10-29 19:03:07.76062
2580	4	10	51	4	\N	2017-03-28	1500.00	912	2020-10-29 19:03:07.762163	2020-10-29 19:03:07.762163
2581	1	8	38	2	\N	2017-03-30	-46.00	a3a	2020-10-29 19:03:07.763751	2020-10-29 19:03:07.763751
2582	1	1	4	2	\N	2017-03-30	-2.00	e1c	2020-10-29 19:03:07.765274	2020-10-29 19:03:07.765274
2583	1	7	30	2	\N	2017-03-31	-29.99	acc	2020-10-29 19:03:07.76657	2020-10-29 19:03:07.76657
2584	1	1	7	2	\N	2017-03-29	-15.00	763	2020-10-29 19:03:07.76821	2020-10-29 19:03:07.76821
2585	1	7	28	2	\N	2017-03-27	-25.00	6dc	2020-10-29 19:03:07.769621	2020-10-29 19:03:07.769621
2586	1	1	4	2	\N	2017-03-27	-7.50	bd8	2020-10-29 19:03:07.771122	2020-10-29 19:03:07.771122
2587	5	5	20	2	\N	2017-03-31	-19.89	f40	2020-10-29 19:03:07.772514	2020-10-29 19:03:07.772514
2588	5	1	5	2	\N	2017-03-31	-41.80	7d2	2020-10-29 19:03:07.774463	2020-10-29 19:03:07.774463
2589	1	1	8	2	\N	2017-03-26	-12.46	a00	2020-10-29 19:03:07.776339	2020-10-29 19:03:07.776339
2590	5	1	5	2	\N	2017-03-28	-20.04	7d2	2020-10-29 19:03:07.777944	2020-10-29 19:03:07.777944
2591	5	1	5	2	\N	2017-03-27	-3.98	d9a	2020-10-29 19:03:07.779881	2020-10-29 19:03:07.779881
2592	5	5	20	2	\N	2017-03-28	-95.83	c29	2020-10-29 19:03:07.781543	2020-10-29 19:03:07.781543
2593	1	5	18	2	\N	2017-03-28	-37.26	4a9	2020-10-29 19:03:07.783203	2020-10-29 19:03:07.783203
2594	1	1	7	2	\N	2017-03-29	-15.33	b98	2020-10-29 19:03:07.784669	2020-10-29 19:03:07.784669
2595	1	2	1	1	\N	2017-03-28	10294.89	96d	2020-10-29 19:03:07.786319	2020-10-29 19:03:07.786319
2596	1	1	7	2	\N	2017-03-24	-15.50	559	2020-10-29 19:03:07.787795	2020-10-29 19:03:07.787795
2597	1	10	51	3	\N	2017-03-30	-500.00	e81	2020-10-29 19:03:07.789208	2020-10-29 19:03:07.789208
2598	1	10	51	3	\N	2017-03-30	-1500.00	520	2020-10-29 19:03:07.790767	2020-10-29 19:03:07.790767
2599	6	10	51	4	\N	2017-03-30	1500.00	520	2020-10-29 19:03:07.792031	2020-10-29 19:03:07.792031
2600	1	10	51	3	\N	2017-03-30	-1500.00	f3d	2020-10-29 19:03:07.793302	2020-10-29 19:03:07.793302
2601	1	10	51	3	\N	2017-03-30	-1100.00	789	2020-10-29 19:03:07.794708	2020-10-29 19:03:07.794708
2602	1	10	51	3	\N	2017-03-30	-2200.00	e49	2020-10-29 19:03:07.796116	2020-10-29 19:03:07.796116
2603	5	4	10	2	\N	2017-03-30	-225.07	28a	2020-10-29 19:03:07.797538	2020-10-29 19:03:07.797538
2604	5	4	12	2	\N	2017-03-30	-246.83	fde	2020-10-29 19:03:07.799076	2020-10-29 19:03:07.799076
2605	5	4	-1	2	\N	2017-03-30	-590.00	e12	2020-10-29 19:03:07.800606	2020-10-29 19:03:07.800606
2606	1	10	51	3	\N	2017-03-30	-3075.00	a64	2020-10-29 19:03:07.801969	2020-10-29 19:03:07.801969
2607	6	10	51	4	\N	2017-03-30	3075.00	a64	2020-10-29 19:03:07.803324	2020-10-29 19:03:07.803324
2608	2	4	15	2	\N	2017-03-30	-29.00	b2c	2020-10-29 19:03:07.80477	2020-10-29 19:03:07.80477
2609	1	9	-1	2	\N	2017-03-31	-29.00	534	2020-10-29 19:03:07.806372	2020-10-29 19:03:07.806372
2610	1	1	4	2	\N	2017-03-31	-2.00	25e	2020-10-29 19:03:07.808003	2020-10-29 19:03:07.808003
2611	1	1	4	2	\N	2017-03-31	-5.19	de5	2020-10-29 19:03:07.8094	2020-10-29 19:03:07.8094
2612	5	1	5	2	\N	2017-03-31	-13.96	7d2	2020-10-29 19:03:07.810605	2020-10-29 19:03:07.810605
2613	5	9	46	3	\N	2017-04-02	-15.00	1c5	2020-10-29 19:03:07.811746	2020-10-29 19:03:07.811746
2614	6	10	52	4	\N	2017-04-02	15.00	1c5	2020-10-29 19:03:07.813052	2020-10-29 19:03:07.813052
2615	6	10	52	1	\N	2017-03-31	100.50	15b	2020-10-29 19:03:07.814486	2020-10-29 19:03:07.814486
2616	1	1	8	2	\N	2017-04-01	-2.99	404	2020-10-29 19:03:07.81583	2020-10-29 19:03:07.81583
2617	5	1	5	2	\N	2017-04-01	-230.19	641	2020-10-29 19:03:07.81714	2020-10-29 19:03:07.81714
2618	1	1	4	2	\N	2017-04-01	-3.99	a4a	2020-10-29 19:03:07.818531	2020-10-29 19:03:07.818531
2619	5	9	45	2	\N	2017-04-01	-269.97	0a0	2020-10-29 19:03:07.820174	2020-10-29 19:03:07.820174
2620	5	1	5	2	\N	2017-04-01	-17.20	473	2020-10-29 19:03:07.821646	2020-10-29 19:03:07.821646
2621	2	3	-1	2	\N	2017-04-01	-18.00	3f5	2020-10-29 19:03:07.823175	2020-10-29 19:03:07.823175
2622	2	8	41	2	\N	2017-04-01	-14.00	0dc	2020-10-29 19:03:07.82449	2020-10-29 19:03:07.82449
2623	1	8	38	2	\N	2017-04-02	-27.00	074	2020-10-29 19:03:07.825746	2020-10-29 19:03:07.825746
2624	1	9	46	2	\N	2017-04-02	-25.41	93d	2020-10-29 19:03:07.827167	2020-10-29 19:03:07.827167
2625	2	8	38	2	\N	2017-04-01	-11.40	072	2020-10-29 19:03:07.828688	2020-10-29 19:03:07.828688
2626	1	1	8	2	\N	2017-04-02	-13.00	cfc	2020-10-29 19:03:07.830861	2020-10-29 19:03:07.830861
2627	1	2	2	1	\N	2017-04-02	0.00	809	2020-10-29 19:03:07.83216	2020-10-29 19:03:07.83216
2628	1	9	-1	2	\N	2017-04-02	-18.03	8af	2020-10-29 19:03:07.833433	2020-10-29 19:03:07.833433
2629	5	10	51	1	\N	2017-04-02	34.68	8af	2020-10-29 19:03:07.835027	2020-10-29 19:03:07.835027
2630	5	10	51	4	\N	2017-04-03	1500.00	b51	2020-10-29 19:03:07.836826	2020-10-29 19:03:07.836826
2631	1	10	52	1	\N	2017-04-03	59.91	ea6	2020-10-29 19:03:07.838105	2020-10-29 19:03:07.838105
2632	1	1	4	2	\N	2017-04-03	-1.49	a4a	2020-10-29 19:03:07.83957	2020-10-29 19:03:07.83957
2633	5	5	23	2	\N	2017-04-03	-4.99	2c2	2020-10-29 19:03:07.840709	2020-10-29 19:03:07.840709
2634	1	1	5	2	\N	2017-04-04	-1.68	9c1	2020-10-29 19:03:07.841871	2020-10-29 19:03:07.841871
2635	1	5	20	2	\N	2017-04-04	-23.40	b75	2020-10-29 19:03:07.843098	2020-10-29 19:03:07.843098
2636	1	5	20	2	\N	2017-04-04	-61.99	b0c	2020-10-29 19:03:07.844592	2020-10-29 19:03:07.844592
2637	5	5	22	2	\N	2017-04-04	-20.00	a8b	2020-10-29 19:03:07.845961	2020-10-29 19:03:07.845961
2638	5	1	5	2	\N	2017-04-04	-18.23	cdc	2020-10-29 19:03:07.847586	2020-10-29 19:03:07.847586
2639	2	8	38	2	\N	2017-04-05	-50.00	074	2020-10-29 19:03:07.84901	2020-10-29 19:03:07.84901
2640	5	9	-1	1	\N	2017-04-05	11.77	90c	2020-10-29 19:03:07.850306	2020-10-29 19:03:07.850306
2641	2	8	38	2	\N	2017-04-05	-5.80	373	2020-10-29 19:03:07.851481	2020-10-29 19:03:07.851481
2642	2	10	52	1	\N	2017-04-05	59.91	ac6	2020-10-29 19:03:07.852751	2020-10-29 19:03:07.852751
2643	5	8	40	2	\N	2017-04-05	-112.00	b78	2020-10-29 19:03:07.853908	2020-10-29 19:03:07.853908
2644	5	1	-1	2	\N	2017-04-05	-126.00	015	2020-10-29 19:03:07.85507	2020-10-29 19:03:07.85507
2645	5	8	40	2	\N	2017-04-05	-69.00	084	2020-10-29 19:03:07.856335	2020-10-29 19:03:07.856335
2646	5	8	40	2	\N	2017-04-05	-442.00	e16	2020-10-29 19:03:07.857567	2020-10-29 19:03:07.857567
2647	1	1	5	2	\N	2017-04-06	-5.65	01d	2020-10-29 19:03:07.858819	2020-10-29 19:03:07.858819
2648	1	3	-1	2	\N	2017-04-06	-168.00	f19	2020-10-29 19:03:07.860451	2020-10-29 19:03:07.860451
2649	1	1	7	2	\N	2017-04-07	-13.88	b98	2020-10-29 19:03:07.861921	2020-10-29 19:03:07.861921
2650	5	1	5	2	\N	2017-04-07	-14.32	7d2	2020-10-29 19:03:07.863323	2020-10-29 19:03:07.863323
2651	5	1	5	2	\N	2017-04-08	-27.97	f86	2020-10-29 19:03:07.864736	2020-10-29 19:03:07.864736
2652	5	1	5	2	\N	2017-04-08	-120.44	a4a	2020-10-29 19:03:07.866144	2020-10-29 19:03:07.866144
2653	1	9	45	2	\N	2017-04-08	-8.00	779	2020-10-29 19:03:07.86734	2020-10-29 19:03:07.86734
2654	2	3	-1	2	\N	2017-04-09	-34.50	0b6	2020-10-29 19:03:07.868472	2020-10-29 19:03:07.868472
2655	1	1	6	2	\N	2017-04-08	-24.80	416	2020-10-29 19:03:07.869772	2020-10-29 19:03:07.869772
2656	1	1	4	2	\N	2017-04-08	-21.97	6d2	2020-10-29 19:03:07.871139	2020-10-29 19:03:07.871139
2657	1	10	51	4	\N	2017-04-09	2500.00	c05	2020-10-29 19:03:07.872403	2020-10-29 19:03:07.872403
2658	1	1	6	2	\N	2017-04-09	-80.00	5d7	2020-10-29 19:03:07.873729	2020-10-29 19:03:07.873729
2659	5	1	5	2	\N	2017-04-09	-12.23	7d2	2020-10-29 19:03:07.875029	2020-10-29 19:03:07.875029
2660	1	4	16	2	\N	2017-04-09	-601.00	ab2	2020-10-29 19:03:07.876259	2020-10-29 19:03:07.876259
2661	5	7	27	2	\N	2017-04-10	-705.46	920	2020-10-29 19:03:07.877411	2020-10-29 19:03:07.877411
2662	2	6	24	1	\N	2017-04-10	65.70	a79	2020-10-29 19:03:07.8788	2020-10-29 19:03:07.8788
2663	1	7	33	2	\N	2017-04-11	-68.80	f3b	2020-10-29 19:03:07.880572	2020-10-29 19:03:07.880572
2664	5	8	40	2	\N	2017-04-11	-17.90	824	2020-10-29 19:03:07.881846	2020-10-29 19:03:07.881846
2665	5	7	33	2	\N	2017-04-11	-7.99	9bb	2020-10-29 19:03:07.883185	2020-10-29 19:03:07.883185
2666	1	2	2	4	\N	2017-04-11	43.00	911	2020-10-29 19:03:07.884474	2020-10-29 19:03:07.884474
2667	5	1	6	3	\N	2017-04-11	-43.00	5d7	2020-10-29 19:03:07.885638	2020-10-29 19:03:07.885638
2668	5	2	2	1	\N	2017-04-12	8.00	3cc	2020-10-29 19:03:07.887168	2020-10-29 19:03:07.887168
2669	1	2	2	1	\N	2017-04-12	21.00	3cc	2020-10-29 19:03:07.888829	2020-10-29 19:03:07.888829
2670	1	1	8	2	\N	2017-04-13	-2.00	d56	2020-10-29 19:03:07.890557	2020-10-29 19:03:07.890557
2671	1	1	5	2	\N	2017-04-13	-3.15	473	2020-10-29 19:03:07.891934	2020-10-29 19:03:07.891934
2672	1	1	7	2	\N	2017-04-12	-13.98	b98	2020-10-29 19:03:07.893314	2020-10-29 19:03:07.893314
2673	5	1	5	2	\N	2017-04-12	-11.45	7d2	2020-10-29 19:03:07.895233	2020-10-29 19:03:07.895233
2674	6	10	51	3	\N	2017-04-13	-3250.00	abd	2020-10-29 19:03:07.896611	2020-10-29 19:03:07.896611
2675	5	10	51	4	\N	2017-04-13	3250.00	abd	2020-10-29 19:03:07.898477	2020-10-29 19:03:07.898477
2676	2	4	13	2	\N	2017-04-13	-19.99	fc6	2020-10-29 19:03:07.899991	2020-10-29 19:03:07.899991
2677	5	1	5	2	\N	2017-04-14	-10.86	014	2020-10-29 19:03:07.901391	2020-10-29 19:03:07.901391
2678	5	8	40	2	\N	2017-04-14	-172.26	e63	2020-10-29 19:03:07.902744	2020-10-29 19:03:07.902744
2679	1	1	7	2	\N	2017-04-19	-11.14	b98	2020-10-29 19:03:07.904157	2020-10-29 19:03:07.904157
2680	1	1	4	2	\N	2017-04-19	-2.00	a4a	2020-10-29 19:03:07.905714	2020-10-29 19:03:07.905714
2681	1	1	5	2	\N	2017-04-19	-2.07	473	2020-10-29 19:03:07.907137	2020-10-29 19:03:07.907137
2682	5	8	40	2	\N	2017-04-17	-124.71	191	2020-10-29 19:03:07.908668	2020-10-29 19:03:07.908668
2683	1	5	18	2	\N	2017-04-19	-12.99	d5c	2020-10-29 19:03:07.910318	2020-10-29 19:03:07.910318
2684	5	8	40	2	\N	2017-04-19	-887.73	bd8	2020-10-29 19:03:07.911722	2020-10-29 19:03:07.911722
2685	1	1	5	2	\N	2017-04-19	-2.55	473	2020-10-29 19:03:07.913244	2020-10-29 19:03:07.913244
2686	1	6	24	2	\N	2017-04-19	-279.99	076	2020-10-29 19:03:07.915224	2020-10-29 19:03:07.915224
2687	1	9	45	2	\N	2017-04-19	-69.00	37b	2020-10-29 19:03:07.916498	2020-10-29 19:03:07.916498
2688	1	9	48	2	\N	2017-04-19	-100.00	bbb	2020-10-29 19:03:07.918315	2020-10-29 19:03:07.918315
2689	1	1	8	2	\N	2017-04-20	-4.00	885	2020-10-29 19:03:07.919982	2020-10-29 19:03:07.919982
2690	1	8	41	2	\N	2017-04-21	-14.85	af0	2020-10-29 19:03:07.921241	2020-10-29 19:03:07.921241
2691	1	1	8	2	\N	2017-04-20	-10.27	a00	2020-10-29 19:03:07.922535	2020-10-29 19:03:07.922535
2692	1	5	18	2	\N	2017-04-20	-12.99	481	2020-10-29 19:03:07.923812	2020-10-29 19:03:07.923812
2693	1	5	22	2	\N	2017-04-22	-40.00	9da	2020-10-29 19:03:07.925114	2020-10-29 19:03:07.925114
2694	5	1	5	2	\N	2017-04-22	-114.68	a4a	2020-10-29 19:03:07.926613	2020-10-29 19:03:07.926613
2695	5	1	5	2	\N	2017-04-22	-15.50	473	2020-10-29 19:03:07.927813	2020-10-29 19:03:07.927813
2696	5	1	5	2	\N	2017-04-22	-10.74	d9a	2020-10-29 19:03:07.929143	2020-10-29 19:03:07.929143
2697	5	8	40	2	\N	2017-04-22	-1057.91	bd9	2020-10-29 19:03:07.930811	2020-10-29 19:03:07.930811
2698	1	6	24	2	\N	2017-04-23	-159.80	27a	2020-10-29 19:03:07.932177	2020-10-29 19:03:07.932177
2699	5	5	20	2	\N	2017-04-23	-63.97	f40	2020-10-29 19:03:07.933368	2020-10-29 19:03:07.933368
2700	2	10	51	3	\N	2017-04-24	-10450.00	e57	2020-10-29 19:03:07.934831	2020-10-29 19:03:07.934831
2701	4	10	51	4	\N	2017-04-24	10450.00	e57	2020-10-29 19:03:07.93628	2020-10-29 19:03:07.93628
2702	5	8	39	2	\N	2017-04-24	-44.10	8d8	2020-10-29 19:03:07.937835	2020-10-29 19:03:07.937835
2703	5	5	20	2	\N	2017-04-24	-50.16	ea3	2020-10-29 19:03:07.939422	2020-10-29 19:03:07.939422
2704	2	4	13	1	\N	2017-04-24	100.00	5df	2020-10-29 19:03:07.940938	2020-10-29 19:03:07.940938
2705	1	1	6	2	\N	2017-04-24	-51.00	7bf	2020-10-29 19:03:07.942324	2020-10-29 19:03:07.942324
2706	5	1	6	2	\N	2017-04-24	-53.00	676	2020-10-29 19:03:07.943532	2020-10-29 19:03:07.943532
2707	2	9	45	2	\N	2017-04-25	-10.00	a7a	2020-10-29 19:03:07.94512	2020-10-29 19:03:07.94512
2708	2	1	5	2	\N	2017-04-25	-2.74	936	2020-10-29 19:03:07.946299	2020-10-29 19:03:07.946299
2709	5	5	20	2	\N	2017-04-25	-8.04	361	2020-10-29 19:03:07.94802	2020-10-29 19:03:07.94802
2710	1	1	7	2	\N	2017-04-27	-2.80	78a	2020-10-29 19:03:07.949752	2020-10-29 19:03:07.949752
2711	1	1	8	2	\N	2017-04-25	-2.20	a00	2020-10-29 19:03:07.95117	2020-10-29 19:03:07.95117
2712	5	1	5	2	\N	2017-04-28	-7.50	473	2020-10-29 19:03:07.952613	2020-10-29 19:03:07.952613
2713	1	1	6	2	\N	2017-04-26	-36.00	a2e	2020-10-29 19:03:07.953983	2020-10-29 19:03:07.953983
2714	1	1	8	2	\N	2017-04-26	-35.48	b59	2020-10-29 19:03:07.955204	2020-10-29 19:03:07.955204
2715	1	2	1	1	\N	2017-04-26	12423.45	602	2020-10-29 19:03:07.956448	2020-10-29 19:03:07.956448
2716	1	10	51	3	\N	2017-04-28	-6300.00	7d9	2020-10-29 19:03:07.957637	2020-10-29 19:03:07.957637
2717	1	10	51	3	\N	2017-04-28	-1500.00	7e2	2020-10-29 19:03:07.958793	2020-10-29 19:03:07.958793
2718	1	10	51	3	\N	2017-04-28	-2700.00	dc9	2020-10-29 19:03:07.960094	2020-10-29 19:03:07.960094
2719	1	10	51	3	\N	2017-04-28	-500.00	f8c	2020-10-29 19:03:07.961418	2020-10-29 19:03:07.961418
2720	1	10	51	3	\N	2017-04-28	-2200.00	cd2	2020-10-29 19:03:07.96283	2020-10-29 19:03:07.96283
2721	6	10	51	4	\N	2017-04-28	6300.00	7d9	2020-10-29 19:03:07.964606	2020-10-29 19:03:07.964606
2722	2	7	34	2	\N	2017-04-28	-25.00	08c	2020-10-29 19:03:07.965823	2020-10-29 19:03:07.965823
2723	2	3	-1	2	\N	2017-04-28	-24.00	9a0	2020-10-29 19:03:07.966949	2020-10-29 19:03:07.966949
2724	2	1	6	2	\N	2017-04-28	-7.00	27b	2020-10-29 19:03:07.968311	2020-10-29 19:03:07.968311
2725	2	8	38	2	\N	2017-04-28	-2.80	bb4	2020-10-29 19:03:07.969489	2020-10-29 19:03:07.969489
2726	5	1	5	2	\N	2017-04-29	-258.29	463	2020-10-29 19:03:07.970638	2020-10-29 19:03:07.970638
2727	5	5	20	2	\N	2017-04-29	-33.49	e67	2020-10-29 19:03:07.971793	2020-10-29 19:03:07.971793
2728	2	1	6	2	\N	2017-04-28	-31.00	35a	2020-10-29 19:03:07.972975	2020-10-29 19:03:07.972975
2729	2	9	45	2	\N	2017-04-28	-16.00	0f1	2020-10-29 19:03:07.974183	2020-10-29 19:03:07.974183
2730	2	9	45	2	\N	2017-04-28	-20.17	c8e	2020-10-29 19:03:07.975838	2020-10-29 19:03:07.975838
2731	2	8	41	2	\N	2017-04-28	-6.00	35e	2020-10-29 19:03:07.976997	2020-10-29 19:03:07.976997
2732	2	1	6	2	\N	2017-04-28	-5.00	b8d	2020-10-29 19:03:07.978237	2020-10-29 19:03:07.978237
2733	5	1	5	2	\N	2017-04-29	-5.69	e48	2020-10-29 19:03:07.979305	2020-10-29 19:03:07.979305
2734	5	9	45	2	\N	2017-04-29	-65.80	bfe	2020-10-29 19:03:07.980504	2020-10-29 19:03:07.980504
2735	2	6	24	2	\N	2017-04-29	-89.97	87d	2020-10-29 19:03:07.981683	2020-10-29 19:03:07.981683
2736	2	2	1	1	\N	2017-04-26	5720.58	029	2020-10-29 19:03:07.98278	2020-10-29 19:03:07.98278
2737	2	10	51	3	\N	2017-04-29	-1500.00	c99	2020-10-29 19:03:07.984016	2020-10-29 19:03:07.984016
2738	5	10	51	4	\N	2017-04-29	1500.00	c99	2020-10-29 19:03:07.985116	2020-10-29 19:03:07.985116
2739	2	10	51	3	\N	2017-04-29	-2600.00	68d	2020-10-29 19:03:07.986168	2020-10-29 19:03:07.986168
2740	6	10	51	4	\N	2017-04-29	2600.00	68d	2020-10-29 19:03:07.987246	2020-10-29 19:03:07.987246
2741	2	10	51	3	\N	2017-04-29	-1000.00	68d	2020-10-29 19:03:07.988613	2020-10-29 19:03:07.988613
2742	4	10	51	4	\N	2017-04-29	1000.00	68d	2020-10-29 19:03:07.989679	2020-10-29 19:03:07.989679
2743	5	4	12	2	\N	2017-04-29	-117.59	783	2020-10-29 19:03:07.990715	2020-10-29 19:03:07.990715
2744	5	4	10	2	\N	2017-04-29	-567.45	297	2020-10-29 19:03:07.99182	2020-10-29 19:03:07.99182
2745	5	4	11	2	\N	2017-04-29	-94.49	aae	2020-10-29 19:03:07.993029	2020-10-29 19:03:07.993029
2746	5	4	-1	2	\N	2017-04-29	-590.00	597	2020-10-29 19:03:07.994144	2020-10-29 19:03:07.994144
2747	5	4	13	2	\N	2017-04-29	-49.90	97a	2020-10-29 19:03:07.995213	2020-10-29 19:03:07.995213
2748	2	4	15	2	\N	2017-04-29	-44.81	b0f	2020-10-29 19:03:07.996245	2020-10-29 19:03:07.996245
2749	2	2	-1	1	\N	2017-04-29	246.92	355	2020-10-29 19:03:07.997575	2020-10-29 19:03:07.997575
2750	5	1	5	2	\N	2017-04-29	-10.50	473	2020-10-29 19:03:07.998746	2020-10-29 19:03:07.998746
2751	5	1	5	2	\N	2017-04-29	-107.34	b5c	2020-10-29 19:03:08.000016	2020-10-29 19:03:08.000016
2752	1	7	33	2	\N	2017-04-28	-30.32	879	2020-10-29 19:03:08.001375	2020-10-29 19:03:08.001375
2753	5	5	20	2	\N	2017-04-28	-17.90	171	2020-10-29 19:03:08.002455	2020-10-29 19:03:08.002455
2754	5	5	20	2	\N	2017-04-28	-25.49	b2f	2020-10-29 19:03:08.003532	2020-10-29 19:03:08.003532
2755	1	5	18	2	\N	2017-04-28	-45.97	4a9	2020-10-29 19:03:08.004613	2020-10-29 19:03:08.004613
2756	1	1	5	2	\N	2017-04-28	-2.20	593	2020-10-29 19:03:08.005667	2020-10-29 19:03:08.005667
2757	1	7	30	2	\N	2017-04-30	-14.99	fd5	2020-10-29 19:03:08.006707	2020-10-29 19:03:08.006707
2758	5	7	30	2	\N	2017-04-30	-15.00	fd5	2020-10-29 19:03:08.007785	2020-10-29 19:03:08.007785
2759	6	10	52	1	\N	2017-04-30	102.39	15b	2020-10-29 19:03:08.00895	2020-10-29 19:03:08.00895
2760	1	2	1	1	\N	2017-05-01	23.28	381	2020-10-29 19:03:08.010122	2020-10-29 19:03:08.010122
2761	5	9	-1	2	\N	2017-05-01	-11.77	381	2020-10-29 19:03:08.011231	2020-10-29 19:03:08.011231
2762	5	10	51	4	\N	2017-05-02	1500.00	587	2020-10-29 19:03:08.012317	2020-10-29 19:03:08.012317
2763	5	3	-1	2	\N	2017-05-01	-35.96	291	2020-10-29 19:03:08.013483	2020-10-29 19:03:08.013483
2764	1	1	6	2	\N	2017-05-01	-10.00	946	2020-10-29 19:03:08.015291	2020-10-29 19:03:08.015291
2765	5	1	5	2	\N	2017-05-01	-24.60	7d2	2020-10-29 19:03:08.016702	2020-10-29 19:03:08.016702
2766	2	6	24	2	\N	2017-05-02	-116.76	62a	2020-10-29 19:03:08.017872	2020-10-29 19:03:08.017872
2767	2	6	24	2	\N	2017-05-02	-67.42	08c	2020-10-29 19:03:08.018965	2020-10-29 19:03:08.018965
2768	2	6	24	2	\N	2017-05-02	-101.22	3fa	2020-10-29 19:03:08.020055	2020-10-29 19:03:08.020055
2769	5	7	27	2	\N	2017-05-03	-240.00	4ac	2020-10-29 19:03:08.021188	2020-10-29 19:03:08.021188
2770	1	8	38	2	\N	2017-05-03	-46.00	ceb	2020-10-29 19:03:08.022498	2020-10-29 19:03:08.022498
2771	5	1	5	2	\N	2017-05-02	-6.99	7d2	2020-10-29 19:03:08.023726	2020-10-29 19:03:08.023726
2772	5	1	5	2	\N	2017-05-02	-16.48	7d2	2020-10-29 19:03:08.025126	2020-10-29 19:03:08.025126
2773	5	1	5	2	\N	2017-05-02	-18.26	7d2	2020-10-29 19:03:08.026411	2020-10-29 19:03:08.026411
2774	1	1	8	2	\N	2017-05-03	-5.47	a00	2020-10-29 19:03:08.027629	2020-10-29 19:03:08.027629
2775	5	1	5	2	\N	2017-05-04	-10.50	473	2020-10-29 19:03:08.029282	2020-10-29 19:03:08.029282
2776	1	9	45	2	\N	2017-05-04	-20.00	779	2020-10-29 19:03:08.031146	2020-10-29 19:03:08.031146
2777	1	9	-1	2	\N	2017-05-05	-25.00	b21	2020-10-29 19:03:08.032549	2020-10-29 19:03:08.032549
2778	5	1	5	2	\N	2017-05-05	-94.00	a4a	2020-10-29 19:03:08.033768	2020-10-29 19:03:08.033768
2779	1	1	5	2	\N	2017-05-05	-6.08	532	2020-10-29 19:03:08.035019	2020-10-29 19:03:08.035019
2780	5	1	5	2	\N	2017-05-07	-7.76	fb6	2020-10-29 19:03:08.036212	2020-10-29 19:03:08.036212
2781	2	1	6	2	\N	2017-05-07	-16.50	496	2020-10-29 19:03:08.037439	2020-10-29 19:03:08.037439
2782	2	1	6	2	\N	2017-05-06	-6.90	059	2020-10-29 19:03:08.039496	2020-10-29 19:03:08.039496
2783	5	5	23	2	\N	2017-05-06	-58.09	b53	2020-10-29 19:03:08.040978	2020-10-29 19:03:08.040978
2784	2	7	33	2	\N	2017-05-06	-10.00	3b9	2020-10-29 19:03:08.042277	2020-10-29 19:03:08.042277
2785	2	8	38	2	\N	2017-05-07	-2.80	441	2020-10-29 19:03:08.043657	2020-10-29 19:03:08.043657
2786	5	4	-1	2	\N	2017-05-08	-98.00	6e6	2020-10-29 19:03:08.045198	2020-10-29 19:03:08.045198
2787	2	6	24	2	\N	2017-05-08	-15.00	e47	2020-10-29 19:03:08.047367	2020-10-29 19:03:08.047367
2788	5	5	20	2	\N	2017-05-08	-25.89	78a	2020-10-29 19:03:08.049003	2020-10-29 19:03:08.049003
2789	1	9	46	2	\N	2017-05-08	-29.99	bd0	2020-10-29 19:03:08.050466	2020-10-29 19:03:08.050466
2790	1	1	6	2	\N	2017-05-07	-65.00	54d	2020-10-29 19:03:08.051937	2020-10-29 19:03:08.051937
2791	1	9	45	2	\N	2017-05-08	-115.00	720	2020-10-29 19:03:08.053578	2020-10-29 19:03:08.053578
2792	5	9	45	2	\N	2017-05-08	-100.00	720	2020-10-29 19:03:08.055033	2020-10-29 19:03:08.055033
2793	1	9	46	2	\N	2017-05-06	-119.00	8c2	2020-10-29 19:03:08.056444	2020-10-29 19:03:08.056444
2794	5	1	5	2	\N	2017-05-07	-13.19	3e9	2020-10-29 19:03:08.057816	2020-10-29 19:03:08.057816
2795	5	5	20	2	\N	2017-05-06	-14.99	f0c	2020-10-29 19:03:08.059316	2020-10-29 19:03:08.059316
2796	5	5	20	2	\N	2017-05-09	-34.89	ff4	2020-10-29 19:03:08.060675	2020-10-29 19:03:08.060675
2797	5	7	27	2	\N	2017-05-09	-300.00	89d	2020-10-29 19:03:08.062344	2020-10-29 19:03:08.062344
2798	1	10	51	4	\N	2017-05-12	12000.00	5e2	2020-10-29 19:03:08.06411	2020-10-29 19:03:08.06411
2799	1	1	6	2	\N	2017-05-13	-19.90	999	2020-10-29 19:03:08.065809	2020-10-29 19:03:08.065809
2800	1	1	4	2	\N	2017-05-12	-4.00	f60	2020-10-29 19:03:08.067133	2020-10-29 19:03:08.067133
2801	1	1	7	2	\N	2017-05-12	-11.44	b98	2020-10-29 19:03:08.068359	2020-10-29 19:03:08.068359
2802	1	1	7	2	\N	2017-05-11	-12.90	b98	2020-10-29 19:03:08.069765	2020-10-29 19:03:08.069765
2803	1	4	15	2	\N	2017-05-12	-29.00	de2	2020-10-29 19:03:08.071276	2020-10-29 19:03:08.071276
2804	1	4	15	2	\N	2017-05-14	-29.00	de2	2020-10-29 19:03:08.07261	2020-10-29 19:03:08.07261
2805	1	8	38	2	\N	2017-05-14	-23.33	074	2020-10-29 19:03:08.073956	2020-10-29 19:03:08.073956
2806	5	1	5	2	\N	2017-05-10	-10.50	473	2020-10-29 19:03:08.075453	2020-10-29 19:03:08.075453
2807	1	8	38	2	\N	2017-05-11	-2.80	a3a	2020-10-29 19:03:08.076788	2020-10-29 19:03:08.076788
2808	1	1	5	2	\N	2017-05-10	-14.50	a93	2020-10-29 19:03:08.078283	2020-10-29 19:03:08.078283
2809	5	1	5	2	\N	2017-05-10	-16.78	7d2	2020-10-29 19:03:08.079884	2020-10-29 19:03:08.079884
2810	5	5	20	2	\N	2017-05-10	-103.90	f43	2020-10-29 19:03:08.082282	2020-10-29 19:03:08.082282
2811	5	1	5	2	\N	2017-05-12	-75.56	e5f	2020-10-29 19:03:08.083907	2020-10-29 19:03:08.083907
2812	5	1	5	2	\N	2017-05-13	-10.00	473	2020-10-29 19:03:08.085186	2020-10-29 19:03:08.085186
2813	2	6	24	1	\N	2017-05-16	116.76	b42	2020-10-29 19:03:08.086758	2020-10-29 19:03:08.086758
2814	2	8	38	2	\N	2017-05-15	-2.80	9ee	2020-10-29 19:03:08.088599	2020-10-29 19:03:08.088599
2815	5	8	40	2	\N	2017-05-16	-101.11	e90	2020-10-29 19:03:08.090069	2020-10-29 19:03:08.090069
2816	2	1	6	2	\N	2017-05-15	-5.00	b3e	2020-10-29 19:03:08.091614	2020-10-29 19:03:08.091614
2817	2	9	45	2	\N	2017-05-16	-5.00	fb9	2020-10-29 19:03:08.093026	2020-10-29 19:03:08.093026
2818	2	1	7	2	\N	2017-05-14	-13.30	ebb	2020-10-29 19:03:08.094729	2020-10-29 19:03:08.094729
2819	2	1	5	2	\N	2017-05-15	-17.93	eaa	2020-10-29 19:03:08.09612	2020-10-29 19:03:08.09612
2820	5	1	5	2	\N	2017-05-14	-8.65	ecd	2020-10-29 19:03:08.098021	2020-10-29 19:03:08.098021
2821	5	1	5	2	\N	2017-05-14	-13.50	14b	2020-10-29 19:03:08.099413	2020-10-29 19:03:08.099413
2822	2	7	27	1	\N	2017-05-15	352.73	32f	2020-10-29 19:03:08.100675	2020-10-29 19:03:08.100675
2823	5	7	35	2	\N	2017-05-17	-39.00	b9d	2020-10-29 19:03:08.101898	2020-10-29 19:03:08.101898
2824	2	1	7	2	\N	2017-05-17	-3.70	f26	2020-10-29 19:03:08.103182	2020-10-29 19:03:08.103182
2825	2	8	38	2	\N	2017-05-18	-18.00	1c9	2020-10-29 19:03:08.10432	2020-10-29 19:03:08.10432
2826	2	1	5	2	\N	2017-05-19	-19.85	f54	2020-10-29 19:03:08.105554	2020-10-29 19:03:08.105554
2827	2	1	5	2	\N	2017-05-19	-6.85	ecd	2020-10-29 19:03:08.106975	2020-10-29 19:03:08.106975
2828	2	1	5	2	\N	2017-05-19	-13.60	14b	2020-10-29 19:03:08.108188	2020-10-29 19:03:08.108188
2829	2	8	38	2	\N	2017-05-19	-50.00	f6a	2020-10-29 19:03:08.109274	2020-10-29 19:03:08.109274
2830	2	4	13	2	\N	2017-05-19	-19.99	fc6	2020-10-29 19:03:08.110322	2020-10-29 19:03:08.110322
2831	2	9	45	1	\N	2017-05-20	100.00	afe	2020-10-29 19:03:08.112396	2020-10-29 19:03:08.112396
2832	2	8	38	2	\N	2017-05-20	-8.40	776	2020-10-29 19:03:08.11365	2020-10-29 19:03:08.11365
2833	2	1	6	2	\N	2017-05-20	-14.00	0bb	2020-10-29 19:03:08.115307	2020-10-29 19:03:08.115307
2834	2	1	6	2	\N	2017-05-20	-18.00	8fc	2020-10-29 19:03:08.116558	2020-10-29 19:03:08.116558
2835	5	3	-1	2	\N	2017-05-20	-22.00	efe	2020-10-29 19:03:08.117765	2020-10-29 19:03:08.117765
2836	2	1	6	2	\N	2017-05-21	-15.60	a07	2020-10-29 19:03:08.118948	2020-10-29 19:03:08.118948
2837	2	1	6	1	\N	2017-05-21	10.00	282	2020-10-29 19:03:08.120134	2020-10-29 19:03:08.120134
2838	5	1	5	2	\N	2017-05-23	-7.50	ecd	2020-10-29 19:03:08.121304	2020-10-29 19:03:08.121304
2839	5	1	5	2	\N	2017-05-23	-15.19	10a	2020-10-29 19:03:08.122415	2020-10-29 19:03:08.122415
2840	5	4	10	2	\N	2017-05-24	-137.98	ff8	2020-10-29 19:03:08.123598	2020-10-29 19:03:08.123598
2841	1	9	46	3	\N	2017-05-23	-150.00	af1	2020-10-29 19:03:08.124988	2020-10-29 19:03:08.124988
2842	1	10	51	3	\N	2017-05-23	-2000.00	cd2	2020-10-29 19:03:08.12617	2020-10-29 19:03:08.12617
2843	1	10	51	3	\N	2017-05-23	-12960.48	3aa	2020-10-29 19:03:08.127385	2020-10-29 19:03:08.127385
2844	1	10	51	3	\N	2017-05-23	-1500.00	3a1	2020-10-29 19:03:08.128854	2020-10-29 19:03:08.128854
2845	5	10	51	4	\N	2017-05-23	1500.00	3a1	2020-10-29 19:03:08.130131	2020-10-29 19:03:08.130131
2846	5	5	20	2	\N	2017-05-25	-11.00	f40	2020-10-29 19:03:08.13171	2020-10-29 19:03:08.13171
2847	5	5	19	2	\N	2017-05-25	-190.00	174	2020-10-29 19:03:08.133186	2020-10-29 19:03:08.133186
2848	5	1	5	2	\N	2017-05-25	-10.74	d9a	2020-10-29 19:03:08.134476	2020-10-29 19:03:08.134476
2849	5	1	5	2	\N	2017-05-24	-92.04	6ee	2020-10-29 19:03:08.135792	2020-10-29 19:03:08.135792
2850	5	5	23	2	\N	2017-05-27	-28.30	798	2020-10-29 19:03:08.137159	2020-10-29 19:03:08.137159
2851	2	5	23	2	\N	2017-05-27	-17.27	f0a	2020-10-29 19:03:08.138343	2020-10-29 19:03:08.138343
2852	2	5	18	2	\N	2017-05-27	-84.90	3bb	2020-10-29 19:03:08.139492	2020-10-29 19:03:08.139492
2853	2	5	18	2	\N	2017-05-27	-41.97	6da	2020-10-29 19:03:08.140822	2020-10-29 19:03:08.140822
2854	5	5	20	2	\N	2017-05-27	-12.13	a6f	2020-10-29 19:03:08.142269	2020-10-29 19:03:08.142269
2855	5	1	5	2	\N	2017-05-27	-36.63	721	2020-10-29 19:03:08.143503	2020-10-29 19:03:08.143503
2856	5	1	5	2	\N	2017-05-27	-102.08	a4a	2020-10-29 19:03:08.144872	2020-10-29 19:03:08.144872
2857	1	3	-1	2	\N	2017-05-26	-21.98	adb	2020-10-29 19:03:08.146676	2020-10-29 19:03:08.146676
2858	1	3	-1	2	\N	2017-05-26	-12.00	105	2020-10-29 19:03:08.1483	2020-10-29 19:03:08.1483
2859	1	3	-1	2	\N	2017-05-26	-23.00	d99	2020-10-29 19:03:08.149611	2020-10-29 19:03:08.149611
2860	1	9	45	2	\N	2017-05-26	-50.00	779	2020-10-29 19:03:08.150882	2020-10-29 19:03:08.150882
2861	1	3	-1	2	\N	2017-05-26	-23.00	d99	2020-10-29 19:03:08.152082	2020-10-29 19:03:08.152082
2862	1	7	33	2	\N	2017-05-25	-112.97	f06	2020-10-29 19:03:08.153248	2020-10-29 19:03:08.153248
2863	1	1	7	2	\N	2017-05-26	-15.17	b98	2020-10-29 19:03:08.154328	2020-10-29 19:03:08.154328
2864	1	1	7	2	\N	2017-05-25	-11.55	b98	2020-10-29 19:03:08.155665	2020-10-29 19:03:08.155665
2865	2	5	20	2	\N	2017-05-26	-120.70	414	2020-10-29 19:03:08.157322	2020-10-29 19:03:08.157322
2866	1	7	27	2	\N	2017-05-26	-2972.51	f75	2020-10-29 19:03:08.158654	2020-10-29 19:03:08.158654
2867	1	1	8	2	\N	2017-05-28	-22.18	6f8	2020-10-29 19:03:08.159931	2020-10-29 19:03:08.159931
2868	5	1	5	2	\N	2017-05-29	-14.66	7d2	2020-10-29 19:03:08.161684	2020-10-29 19:03:08.161684
2869	5	1	5	2	\N	2017-05-30	-59.68	6ee	2020-10-29 19:03:08.163096	2020-10-29 19:03:08.163096
2870	2	2	1	1	\N	2017-05-30	11538.62	19a	2020-10-29 19:03:08.164734	2020-10-29 19:03:08.164734
2871	2	10	51	3	\N	2017-05-30	-1500.00	502	2020-10-29 19:03:08.166041	2020-10-29 19:03:08.166041
2872	5	10	51	4	\N	2017-05-30	1500.00	502	2020-10-29 19:03:08.167193	2020-10-29 19:03:08.167193
2873	2	10	51	3	\N	2017-05-30	-2000.00	5bd	2020-10-29 19:03:08.168346	2020-10-29 19:03:08.168346
2874	6	10	51	4	\N	2017-05-30	2000.00	5bd	2020-10-29 19:03:08.16964	2020-10-29 19:03:08.16964
2875	2	10	51	3	\N	2017-05-30	-7500.00	172	2020-10-29 19:03:08.170915	2020-10-29 19:03:08.170915
2876	4	10	51	4	\N	2017-05-30	7500.00	172	2020-10-29 19:03:08.172299	2020-10-29 19:03:08.172299
2877	5	5	20	2	\N	2017-05-30	-29.98	b34	2020-10-29 19:03:08.173488	2020-10-29 19:03:08.173488
2878	1	1	8	2	\N	2017-05-30	-3.87	b3e	2020-10-29 19:03:08.174636	2020-10-29 19:03:08.174636
2879	1	2	1	1	\N	2017-05-30	10012.52	b11	2020-10-29 19:03:08.175795	2020-10-29 19:03:08.175795
2880	5	4	10	2	\N	2017-05-30	-341.20	71c	2020-10-29 19:03:08.176954	2020-10-29 19:03:08.176954
2881	5	4	12	2	\N	2017-05-30	-117.59	314	2020-10-29 19:03:08.178034	2020-10-29 19:03:08.178034
2882	5	4	11	2	\N	2017-05-30	-98.83	f71	2020-10-29 19:03:08.179075	2020-10-29 19:03:08.179075
2883	5	4	-1	2	\N	2017-05-30	-590.00	d41	2020-10-29 19:03:08.180157	2020-10-29 19:03:08.180157
2884	1	9	48	2	\N	2017-05-30	-110.00	bbb	2020-10-29 19:03:08.181478	2020-10-29 19:03:08.181478
2885	1	10	51	3	\N	2017-05-30	-500.00	6ed	2020-10-29 19:03:08.182711	2020-10-29 19:03:08.182711
2886	1	10	51	3	\N	2017-05-30	-1500.00	7d9	2020-10-29 19:03:08.183789	2020-10-29 19:03:08.183789
2887	1	10	51	3	\N	2017-05-30	-5600.00	697	2020-10-29 19:03:08.185025	2020-10-29 19:03:08.185025
2888	6	10	51	4	\N	2017-05-30	5600.00	697	2020-10-29 19:03:08.186246	2020-10-29 19:03:08.186246
2889	1	10	51	3	\N	2017-05-30	-2200.00	e49	2020-10-29 19:03:08.187378	2020-10-29 19:03:08.187378
2890	2	9	-1	2	\N	2017-05-31	-150.00	64c	2020-10-29 19:03:08.189191	2020-10-29 19:03:08.189191
2891	1	1	7	2	\N	2017-05-31	-14.86	b98	2020-10-29 19:03:08.190259	2020-10-29 19:03:08.190259
2892	5	1	5	2	\N	2017-05-31	-12.16	7d2	2020-10-29 19:03:08.191286	2020-10-29 19:03:08.191286
2893	2	5	18	2	\N	2017-06-01	-32.00	755	2020-10-29 19:03:08.192398	2020-10-29 19:03:08.192398
2894	2	5	23	2	\N	2017-06-01	-12.90	486	2020-10-29 19:03:08.19401	2020-10-29 19:03:08.19401
2895	5	5	20	2	\N	2017-06-01	-18.95	6b7	2020-10-29 19:03:08.195364	2020-10-29 19:03:08.195364
2896	5	1	5	2	\N	2017-06-01	-10.35	ecd	2020-10-29 19:03:08.196591	2020-10-29 19:03:08.196591
2897	5	4	13	2	\N	2017-06-01	-49.90	5cf	2020-10-29 19:03:08.19862	2020-10-29 19:03:08.19862
2898	2	4	15	2	\N	2017-05-31	-10.02	4fc	2020-10-29 19:03:08.199763	2020-10-29 19:03:08.199763
2899	5	4	10	2	\N	2017-06-02	-40.43	5e6	2020-10-29 19:03:08.201068	2020-10-29 19:03:08.201068
2900	2	9	-1	2	\N	2017-06-02	-178.00	ce0	2020-10-29 19:03:08.202304	2020-10-29 19:03:08.202304
2901	2	8	41	2	\N	2017-06-02	-17.00	d5a	2020-10-29 19:03:08.203437	2020-10-29 19:03:08.203437
2902	2	9	44	2	\N	2017-06-03	-20.00	b49	2020-10-29 19:03:08.204669	2020-10-29 19:03:08.204669
2903	5	9	45	2	\N	2017-06-03	-22.99	c40	2020-10-29 19:03:08.205874	2020-10-29 19:03:08.205874
2904	5	1	5	2	\N	2017-06-03	-10.74	d9a	2020-10-29 19:03:08.207157	2020-10-29 19:03:08.207157
2905	1	5	18	2	\N	2017-06-02	-36.45	4ea	2020-10-29 19:03:08.208669	2020-10-29 19:03:08.208669
2906	5	1	5	2	\N	2017-06-03	-89.40	e5f	2020-10-29 19:03:08.210147	2020-10-29 19:03:08.210147
2907	1	9	46	2	\N	2017-06-01	-14.99	fd5	2020-10-29 19:03:08.211338	2020-10-29 19:03:08.211338
2908	5	9	46	2	\N	2017-06-01	-15.00	fd5	2020-10-29 19:03:08.212568	2020-10-29 19:03:08.212568
2909	5	10	51	4	\N	2017-06-03	1500.00	697	2020-10-29 19:03:08.214	2020-10-29 19:03:08.214
2910	5	1	5	2	\N	2017-06-03	-12.00	473	2020-10-29 19:03:08.215546	2020-10-29 19:03:08.215546
2911	1	1	8	2	\N	2017-06-01	-35.67	a00	2020-10-29 19:03:08.216787	2020-10-29 19:03:08.216787
2912	1	3	-1	2	\N	2017-06-01	-47.68	f50	2020-10-29 19:03:08.21792	2020-10-29 19:03:08.21792
2913	5	5	20	2	\N	2017-06-01	-13.80	ceb	2020-10-29 19:03:08.219196	2020-10-29 19:03:08.219196
2914	1	1	7	2	\N	2017-06-02	-36.30	683	2020-10-29 19:03:08.22032	2020-10-29 19:03:08.22032
2915	5	9	45	2	\N	2017-06-03	-44.00	c9a	2020-10-29 19:03:08.221607	2020-10-29 19:03:08.221607
2916	6	10	52	1	\N	2017-06-01	113.76	15b	2020-10-29 19:03:08.223144	2020-10-29 19:03:08.223144
2917	1	2	2	1	\N	2017-06-03	8.57	503	2020-10-29 19:03:08.22477	2020-10-29 19:03:08.22477
2918	5	9	-1	2	\N	2017-06-03	-50.87	503	2020-10-29 19:03:08.226305	2020-10-29 19:03:08.226305
2919	5	4	-1	2	\N	2017-06-04	-112.00	b71	2020-10-29 19:03:08.227531	2020-10-29 19:03:08.227531
2920	2	1	6	2	\N	2017-06-03	-14.00	fe4	2020-10-29 19:03:08.228955	2020-10-29 19:03:08.228955
2921	2	9	-1	1	\N	2017-06-04	274.00	a94	2020-10-29 19:03:08.230958	2020-10-29 19:03:08.230958
2922	5	8	39	2	\N	2017-06-03	-63.00	8ba	2020-10-29 19:03:08.232404	2020-10-29 19:03:08.232404
2923	2	4	15	2	\N	2017-06-04	-29.00	cf0	2020-10-29 19:03:08.233527	2020-10-29 19:03:08.233527
2924	5	1	5	2	\N	2017-06-07	-10.74	d9a	2020-10-29 19:03:08.234715	2020-10-29 19:03:08.234715
2925	1	1	5	2	\N	2017-06-07	-5.38	70d	2020-10-29 19:03:08.236075	2020-10-29 19:03:08.236075
2926	1	8	41	2	\N	2017-06-03	-10.00	c5c	2020-10-29 19:03:08.237393	2020-10-29 19:03:08.237393
2927	1	3	-1	2	\N	2017-06-03	-13.90	3cb	2020-10-29 19:03:08.238749	2020-10-29 19:03:08.238749
2928	1	9	-1	2	\N	2017-06-06	-25.00	1c1	2020-10-29 19:03:08.240823	2020-10-29 19:03:08.240823
2929	1	3	-1	2	\N	2017-06-06	-18.20	3ea	2020-10-29 19:03:08.24222	2020-10-29 19:03:08.24222
2930	5	1	5	2	\N	2017-06-06	-35.72	ff5	2020-10-29 19:03:08.243448	2020-10-29 19:03:08.243448
2931	1	3	-1	2	\N	2017-06-04	-12.69	d90	2020-10-29 19:03:08.244734	2020-10-29 19:03:08.244734
2932	1	1	5	2	\N	2017-06-04	-2.19	c90	2020-10-29 19:03:08.245954	2020-10-29 19:03:08.245954
2933	1	8	38	2	\N	2017-06-05	-46.00	a3a	2020-10-29 19:03:08.247571	2020-10-29 19:03:08.247571
2934	6	10	51	3	\N	2017-06-07	-65000.00	84e	2020-10-29 19:03:08.249122	2020-10-29 19:03:08.249122
2935	5	10	51	4	\N	2017-06-07	65000.00	84e	2020-10-29 19:03:08.250435	2020-10-29 19:03:08.250435
2936	1	10	51	4	\N	2017-06-08	10800.00	cd2	2020-10-29 19:03:08.251688	2020-10-29 19:03:08.251688
2937	1	10	51	4	\N	2017-06-08	13200.00	3aa	2020-10-29 19:03:08.252897	2020-10-29 19:03:08.252897
2938	1	10	51	3	\N	2017-06-08	-22000.00	84e	2020-10-29 19:03:08.254188	2020-10-29 19:03:08.254188
2939	6	10	51	4	\N	2017-06-08	22000.00	84e	2020-10-29 19:03:08.255617	2020-10-29 19:03:08.255617
2940	2	8	38	2	\N	2017-06-08	-50.00	398	2020-10-29 19:03:08.256936	2020-10-29 19:03:08.256936
2941	2	3	-1	2	\N	2017-06-09	-10.00	adf	2020-10-29 19:03:08.25821	2020-10-29 19:03:08.25821
2942	2	9	45	2	\N	2017-06-09	-5.00	b96	2020-10-29 19:03:08.259459	2020-10-29 19:03:08.259459
2943	4	10	51	3	\N	2017-06-09	-58500.00	fc3	2020-10-29 19:03:08.260716	2020-10-29 19:03:08.260716
2944	2	10	51	4	\N	2017-06-09	58500.00	fc3	2020-10-29 19:03:08.262032	2020-10-29 19:03:08.262032
2945	2	10	51	3	\N	2017-06-09	-59000.00	fc3	2020-10-29 19:03:08.263428	2020-10-29 19:03:08.263428
2946	5	10	51	4	\N	2017-06-09	59000.00	fc3	2020-10-29 19:03:08.26526	2020-10-29 19:03:08.26526
2947	2	9	45	2	\N	2017-06-09	-33.70	1e4	2020-10-29 19:03:08.266743	2020-10-29 19:03:08.266743
2948	5	1	5	2	\N	2017-06-10	-21.50	473	2020-10-29 19:03:08.268144	2020-10-29 19:03:08.268144
2949	5	1	5	2	\N	2017-06-10	-160.48	6ee	2020-10-29 19:03:08.26955	2020-10-29 19:03:08.26955
2950	5	1	5	2	\N	2017-06-09	-11.61	ff5	2020-10-29 19:03:08.270974	2020-10-29 19:03:08.270974
2951	5	1	7	2	\N	2017-06-09	-14.57	e33	2020-10-29 19:03:08.272081	2020-10-29 19:03:08.272081
2952	5	1	7	2	\N	2017-06-09	-2.80	756	2020-10-29 19:03:08.27319	2020-10-29 19:03:08.27319
2953	5	10	51	3	\N	2017-06-11	-68000.00	3cc	2020-10-29 19:03:08.27425	2020-10-29 19:03:08.27425
2954	6	10	51	4	\N	2017-06-11	68000.00	3cc	2020-10-29 19:03:08.275293	2020-10-29 19:03:08.275293
2955	1	1	8	2	\N	2017-06-12	-2.20	885	2020-10-29 19:03:08.276347	2020-10-29 19:03:08.276347
2956	5	3	-1	2	\N	2017-06-10	-25.99	2b9	2020-10-29 19:03:08.277656	2020-10-29 19:03:08.277656
2957	1	9	48	2	\N	2017-06-12	-100.00	bbb	2020-10-29 19:03:08.279075	2020-10-29 19:03:08.279075
2958	2	1	5	2	\N	2017-06-12	-16.57	1e3	2020-10-29 19:03:08.280704	2020-10-29 19:03:08.280704
2959	1	8	38	2	\N	2017-06-18	-50.00	074	2020-10-29 19:03:08.282109	2020-10-29 19:03:08.282109
2960	5	9	45	2	\N	2017-06-17	-25.00	dd0	2020-10-29 19:03:08.283666	2020-10-29 19:03:08.283666
2961	5	9	45	2	\N	2017-06-17	-730.00	964	2020-10-29 19:03:08.28487	2020-10-29 19:03:08.28487
2962	1	1	4	2	\N	2017-06-17	-17.90	bd8	2020-10-29 19:03:08.286322	2020-10-29 19:03:08.286322
2963	1	7	33	2	\N	2017-06-17	-56.79	bb9	2020-10-29 19:03:08.287459	2020-10-29 19:03:08.287459
2964	1	5	18	2	\N	2017-06-17	-14.05	4ea	2020-10-29 19:03:08.288539	2020-10-29 19:03:08.288539
2965	1	5	18	2	\N	2017-06-16	-65.00	667	2020-10-29 19:03:08.289723	2020-10-29 19:03:08.289723
2966	1	2	2	1	\N	2017-06-18	12.99	87c	2020-10-29 19:03:08.291034	2020-10-29 19:03:08.291034
2967	5	9	45	2	\N	2017-06-18	-12.99	cec	2020-10-29 19:03:08.292196	2020-10-29 19:03:08.292196
2968	1	7	32	2	\N	2017-06-18	-60.00	b0e	2020-10-29 19:03:08.293451	2020-10-29 19:03:08.293451
2969	5	8	40	2	\N	2017-06-16	-115.37	673	2020-10-29 19:03:08.29483	2020-10-29 19:03:08.29483
2970	5	8	40	2	\N	2017-06-15	-156.85	0ba	2020-10-29 19:03:08.296109	2020-10-29 19:03:08.296109
2971	1	1	4	2	\N	2017-06-14	-2.00	1a7	2020-10-29 19:03:08.298037	2020-10-29 19:03:08.298037
2972	1	1	7	2	\N	2017-06-14	-20.18	e33	2020-10-29 19:03:08.2995	2020-10-29 19:03:08.2995
2973	1	1	7	2	\N	2017-06-14	-2.80	756	2020-10-29 19:03:08.300765	2020-10-29 19:03:08.300765
2974	1	1	7	2	\N	2017-06-13	-9.66	b98	2020-10-29 19:03:08.302395	2020-10-29 19:03:08.302395
2975	1	1	5	2	\N	2017-06-13	-3.99	6a7	2020-10-29 19:03:08.303694	2020-10-29 19:03:08.303694
2976	5	5	20	2	\N	2017-06-14	-7.00	ceb	2020-10-29 19:03:08.304998	2020-10-29 19:03:08.304998
2977	5	1	5	2	\N	2017-06-18	-10.96	7d2	2020-10-29 19:03:08.306275	2020-10-29 19:03:08.306275
2978	5	1	5	2	\N	2017-06-14	-17.60	7d2	2020-10-29 19:03:08.307487	2020-10-29 19:03:08.307487
2979	5	1	5	2	\N	2017-06-18	-10.96	d83	2020-10-29 19:03:08.308681	2020-10-29 19:03:08.308681
2980	5	1	5	2	\N	2017-06-18	-10.17	217	2020-10-29 19:03:08.31024	2020-10-29 19:03:08.31024
2981	5	4	13	2	\N	2017-06-28	-49.90	97a	2020-10-29 19:03:08.311488	2020-10-29 19:03:08.311488
2982	2	4	13	2	\N	2017-06-29	-19.99	f2b	2020-10-29 19:03:08.312769	2020-10-29 19:03:08.312769
2983	2	2	1	1	\N	2017-06-29	5720.58	273	2020-10-29 19:03:08.314299	2020-10-29 19:03:08.314299
2984	2	10	51	3	\N	2017-06-29	-1500.00	b13	2020-10-29 19:03:08.315626	2020-10-29 19:03:08.315626
2985	5	10	51	4	\N	2017-06-29	1500.00	b13	2020-10-29 19:03:08.316937	2020-10-29 19:03:08.316937
2986	2	4	15	2	\N	2017-06-29	-29.90	68e	2020-10-29 19:03:08.318483	2020-10-29 19:03:08.318483
2987	2	10	51	3	\N	2017-06-29	-4000.00	701	2020-10-29 19:03:08.31979	2020-10-29 19:03:08.31979
2988	6	10	51	4	\N	2017-06-29	4000.00	567	2020-10-29 19:03:08.321222	2020-10-29 19:03:08.321222
2989	5	4	-1	2	\N	2017-06-29	-590.00	265	2020-10-29 19:03:08.322456	2020-10-29 19:03:08.322456
2990	5	4	10	2	\N	2017-06-29	-381.63	9eb	2020-10-29 19:03:08.323908	2020-10-29 19:03:08.323908
2991	5	4	12	2	\N	2017-06-29	-117.59	b16	2020-10-29 19:03:08.325167	2020-10-29 19:03:08.325167
2992	2	9	-1	1	\N	2017-06-29	44.90	923	2020-10-29 19:03:08.326266	2020-10-29 19:03:08.326266
2993	2	1	7	2	\N	2017-06-29	-14.00	b5d	2020-10-29 19:03:08.327366	2020-10-29 19:03:08.327366
2994	1	1	8	2	\N	2017-06-30	-4.40	8be	2020-10-29 19:03:08.328582	2020-10-29 19:03:08.328582
2995	5	1	8	2	\N	2017-06-30	-3.38	d93	2020-10-29 19:03:08.329762	2020-10-29 19:03:08.329762
2996	5	1	4	2	\N	2017-06-30	-5.49	dc1	2020-10-29 19:03:08.331589	2020-10-29 19:03:08.331589
2997	5	1	5	2	\N	2017-06-30	-10.74	d9a	2020-10-29 19:03:08.333898	2020-10-29 19:03:08.333898
2998	5	1	5	2	\N	2017-06-28	-145.30	6ee	2020-10-29 19:03:08.335218	2020-10-29 19:03:08.335218
2999	5	1	5	2	\N	2017-06-27	-11.70	d9a	2020-10-29 19:03:08.336482	2020-10-29 19:03:08.336482
3000	5	5	19	2	\N	2017-06-29	-280.00	8b4	2020-10-29 19:03:08.337747	2020-10-29 19:03:08.337747
3001	5	1	5	2	\N	2017-06-27	-72.00	f6b	2020-10-29 19:03:08.339384	2020-10-29 19:03:08.339384
3002	1	1	5	2	\N	2017-06-26	-7.40	473	2020-10-29 19:03:08.340739	2020-10-29 19:03:08.340739
3003	1	7	30	2	\N	2017-06-30	-14.99	34e	2020-10-29 19:03:08.341975	2020-10-29 19:03:08.341975
3004	5	7	30	2	\N	2017-06-30	-15.00	34e	2020-10-29 19:03:08.343954	2020-10-29 19:03:08.343954
3005	5	7	27	2	\N	2017-06-26	-120.94	1d6	2020-10-29 19:03:08.345436	2020-10-29 19:03:08.345436
3006	5	7	27	2	\N	2017-06-26	-623.04	ce4	2020-10-29 19:03:08.34684	2020-10-29 19:03:08.34684
3007	5	7	27	2	\N	2017-06-23	-75.97	bb4	2020-10-29 19:03:08.34862	2020-10-29 19:03:08.34862
3008	5	7	27	2	\N	2017-06-23	-94.42	3ae	2020-10-29 19:03:08.350036	2020-10-29 19:03:08.350036
3009	5	7	27	2	\N	2017-06-17	-1688.00	4d5	2020-10-29 19:03:08.351306	2020-10-29 19:03:08.351306
3010	6	10	52	1	\N	2017-06-30	125.75	15b	2020-10-29 19:03:08.35271	2020-10-29 19:03:08.35271
3011	6	10	51	4	\N	2017-06-30	5500.00	e82	2020-10-29 19:03:08.353957	2020-10-29 19:03:08.353957
3012	1	2	1	1	\N	2017-06-28	10005.52	bf3	2020-10-29 19:03:08.355212	2020-10-29 19:03:08.355212
3013	1	10	51	3	\N	2017-06-30	-5500.00	7d9	2020-10-29 19:03:08.356899	2020-10-29 19:03:08.356899
3014	1	10	51	3	\N	2017-06-30	-500.00	7e6	2020-10-29 19:03:08.358474	2020-10-29 19:03:08.358474
3015	1	10	51	3	\N	2017-06-30	-2000.00	7f6	2020-10-29 19:03:08.360194	2020-10-29 19:03:08.360194
3016	1	10	51	3	\N	2017-06-30	-1000.00	fb1	2020-10-29 19:03:08.36167	2020-10-29 19:03:08.36167
3017	1	10	51	3	\N	2017-06-30	-2000.00	fb9	2020-10-29 19:03:08.363316	2020-10-29 19:03:08.363316
3018	1	7	27	2	\N	2017-06-28	-42.98	af0	2020-10-29 19:03:08.365307	2020-10-29 19:03:08.365307
3019	1	7	27	2	\N	2017-06-28	-22.02	af0	2020-10-29 19:03:08.366846	2020-10-29 19:03:08.366846
3020	1	9	45	2	\N	2017-06-27	-12.00	7a5	2020-10-29 19:03:08.368434	2020-10-29 19:03:08.368434
3021	1	7	27	2	\N	2017-06-27	-41.29	d1d	2020-10-29 19:03:08.369795	2020-10-29 19:03:08.369795
3022	1	7	27	2	\N	2017-06-27	-34.46	af0	2020-10-29 19:03:08.371097	2020-10-29 19:03:08.371097
3023	1	7	27	2	\N	2017-06-26	-27.75	af0	2020-10-29 19:03:08.372568	2020-10-29 19:03:08.372568
3024	1	7	27	2	\N	2017-06-26	-36.78	af0	2020-10-29 19:03:08.373962	2020-10-29 19:03:08.373962
3025	1	7	27	2	\N	2017-06-26	-30.28	af0	2020-10-29 19:03:08.375762	2020-10-29 19:03:08.375762
3026	1	7	27	2	\N	2017-06-26	-26.22	af0	2020-10-29 19:03:08.377341	2020-10-29 19:03:08.377341
3027	1	7	27	2	\N	2017-06-24	-33.46	af0	2020-10-29 19:03:08.378855	2020-10-29 19:03:08.378855
3028	1	7	27	2	\N	2017-06-24	-49.52	af0	2020-10-29 19:03:08.380513	2020-10-29 19:03:08.380513
3029	1	7	33	2	\N	2017-06-23	-68.73	d8c	2020-10-29 19:03:08.381991	2020-10-29 19:03:08.381991
3030	1	7	33	2	\N	2017-06-21	-35.84	2fd	2020-10-29 19:03:08.383868	2020-10-29 19:03:08.383868
3031	5	2	-1	1	\N	2017-06-23	200.00	968	2020-10-29 19:03:08.385525	2020-10-29 19:03:08.385525
3032	2	8	41	2	\N	2017-07-02	-25.00	4c8	2020-10-29 19:03:08.387009	2020-10-29 19:03:08.387009
3033	2	8	38	2	\N	2017-07-02	-2.80	0a6	2020-10-29 19:03:08.388558	2020-10-29 19:03:08.388558
3034	2	1	6	2	\N	2017-07-02	-10.00	803	2020-10-29 19:03:08.38981	2020-10-29 19:03:08.38981
3035	2	3	-1	2	\N	2017-07-02	-20.00	1e7	2020-10-29 19:03:08.391196	2020-10-29 19:03:08.391196
3036	5	1	5	2	\N	2017-07-02	-18.22	7d2	2020-10-29 19:03:08.392514	2020-10-29 19:03:08.392514
3037	5	1	8	2	\N	2017-07-02	-3.99	fd9	2020-10-29 19:03:08.39402	2020-10-29 19:03:08.39402
3038	1	7	32	2	\N	2017-07-01	-40.00	45e	2020-10-29 19:03:08.395542	2020-10-29 19:03:08.395542
3039	1	9	46	2	\N	2017-07-03	-12.30	941	2020-10-29 19:03:08.397	2020-10-29 19:03:08.397
3040	1	8	38	2	\N	2017-07-03	-46.00	a3a	2020-10-29 19:03:08.398699	2020-10-29 19:03:08.398699
3041	1	9	45	2	\N	2017-07-03	-117.90	74e	2020-10-29 19:03:08.400337	2020-10-29 19:03:08.400337
3042	5	10	51	4	\N	2017-07-03	2000.00	336	2020-10-29 19:03:08.401923	2020-10-29 19:03:08.401923
3043	5	9	-1	2	\N	2017-07-03	-10.02	fd0	2020-10-29 19:03:08.403641	2020-10-29 19:03:08.403641
3044	4	2	-1	4	\N	2017-07-01	3850.00	260	2020-10-29 19:03:08.404855	2020-10-29 19:03:08.404855
3045	5	7	27	3	\N	2017-07-03	-150.00	9e0	2020-10-29 19:03:08.406337	2020-10-29 19:03:08.406337
3046	1	7	27	4	\N	2017-07-03	150.00	9e0	2020-10-29 19:03:08.40782	2020-10-29 19:03:08.40782
3047	5	9	45	3	\N	2017-07-03	-200.00	569	2020-10-29 19:03:08.409514	2020-10-29 19:03:08.409514
3048	5	4	-1	2	\N	2017-07-03	-98.00	457	2020-10-29 19:03:08.438124	2020-10-29 19:03:08.438124
3049	5	1	5	2	\N	2017-07-03	-10.74	d9a	2020-10-29 19:03:08.440597	2020-10-29 19:03:08.440597
3050	5	5	20	2	\N	2017-07-03	-51.95	dc6	2020-10-29 19:03:08.442818	2020-10-29 19:03:08.442818
3051	5	9	45	2	\N	2017-07-04	-18.40	e5f	2020-10-29 19:03:08.444908	2020-10-29 19:03:08.444908
3052	2	6	24	2	\N	2017-07-04	-104.50	16c	2020-10-29 19:03:08.446837	2020-10-29 19:03:08.446837
3053	5	1	5	2	\N	2017-07-05	-25.51	048	2020-10-29 19:03:08.449082	2020-10-29 19:03:08.449082
3054	5	5	20	2	\N	2017-07-05	-52.97	5a9	2020-10-29 19:03:08.45108	2020-10-29 19:03:08.45108
3055	5	1	5	2	\N	2017-07-05	-118.14	e7e	2020-10-29 19:03:08.452836	2020-10-29 19:03:08.452836
3056	5	9	45	2	\N	2017-07-05	-66.50	df2	2020-10-29 19:03:08.454694	2020-10-29 19:03:08.454694
3057	5	9	45	2	\N	2017-07-05	-47.89	694	2020-10-29 19:03:08.456844	2020-10-29 19:03:08.456844
3058	5	5	20	2	\N	2017-07-06	-10.48	75d	2020-10-29 19:03:08.458863	2020-10-29 19:03:08.458863
3059	2	1	5	2	\N	2017-07-06	-3.30	f5b	2020-10-29 19:03:08.460888	2020-10-29 19:03:08.460888
3060	2	6	24	2	\N	2017-07-06	-293.30	fe4	2020-10-29 19:03:08.462609	2020-10-29 19:03:08.462609
3061	2	6	25	2	\N	2017-07-07	-20.00	358	2020-10-29 19:03:08.464853	2020-10-29 19:03:08.464853
3062	5	5	20	2	\N	2017-07-07	-23.98	e21	2020-10-29 19:03:08.466736	2020-10-29 19:03:08.466736
3063	5	8	40	2	\N	2017-07-08	-165.38	8a1	2020-10-29 19:03:08.468731	2020-10-29 19:03:08.468731
3064	1	1	8	2	\N	2017-07-07	-4.20	8be	2020-10-29 19:03:08.470384	2020-10-29 19:03:08.470384
3065	1	7	32	2	\N	2017-07-04	-99.98	b33	2020-10-29 19:03:08.472475	2020-10-29 19:03:08.472475
3066	5	2	2	1	\N	2017-07-08	550.00	df6	2020-10-29 19:03:08.474142	2020-10-29 19:03:08.474142
3067	1	1	5	2	\N	2017-07-09	-5.88	7d2	2020-10-29 19:03:08.476185	2020-10-29 19:03:08.476185
3068	1	1	5	2	\N	2017-07-09	-9.50	473	2020-10-29 19:03:08.477575	2020-10-29 19:03:08.477575
3069	1	1	5	2	\N	2017-07-09	-3.20	f62	2020-10-29 19:03:08.479223	2020-10-29 19:03:08.479223
3070	5	5	20	2	\N	2017-07-06	-6.06	8ac	2020-10-29 19:03:08.481383	2020-10-29 19:03:08.481383
3071	5	5	20	2	\N	2017-07-06	-35.98	f40	2020-10-29 19:03:08.482897	2020-10-29 19:03:08.482897
3072	5	1	5	2	\N	2017-07-07	-82.18	6ee	2020-10-29 19:03:08.485029	2020-10-29 19:03:08.485029
3073	5	5	20	2	\N	2017-07-08	-16.99	ceb	2020-10-29 19:03:08.487083	2020-10-29 19:03:08.487083
3074	5	1	5	2	\N	2017-07-04	-22.21	7d2	2020-10-29 19:03:08.489088	2020-10-29 19:03:08.489088
3075	1	1	7	2	\N	2017-07-05	-2.80	756	2020-10-29 19:03:08.490638	2020-10-29 19:03:08.490638
3076	1	1	7	2	\N	2017-07-06	-10.90	b98	2020-10-29 19:03:08.492679	2020-10-29 19:03:08.492679
3077	1	1	7	2	\N	2017-07-07	-15.22	b98	2020-10-29 19:03:08.494281	2020-10-29 19:03:08.494281
3078	5	9	45	2	\N	2017-07-11	-55.00	c7f	2020-10-29 19:03:08.49623	2020-10-29 19:03:08.49623
3079	5	1	5	2	\N	2017-07-10	-9.90	d9a	2020-10-29 19:03:08.498234	2020-10-29 19:03:08.498234
3080	2	1	6	2	\N	2017-07-10	-10.00	d7c	2020-10-29 19:03:08.499647	2020-10-29 19:03:08.499647
3081	2	9	45	2	\N	2017-07-11	-20.00	730	2020-10-29 19:03:08.501612	2020-10-29 19:03:08.501612
3082	5	9	45	1	\N	2017-07-11	20.00	374	2020-10-29 19:03:08.503541	2020-10-29 19:03:08.503541
3083	5	6	24	2	\N	2017-07-10	-104.50	f7b	2020-10-29 19:03:08.505186	2020-10-29 19:03:08.505186
3084	5	9	-1	3	\N	2017-07-11	-400.00	a6b	2020-10-29 19:03:08.506858	2020-10-29 19:03:08.506858
3085	2	9	-1	4	\N	2017-07-11	400.00	a6b	2020-10-29 19:03:08.508756	2020-10-29 19:03:08.508756
3086	2	8	38	2	\N	2017-07-11	-50.00	074	2020-10-29 19:03:08.510496	2020-10-29 19:03:08.510496
3087	5	5	20	2	\N	2017-07-11	-2.18	5e8	2020-10-29 19:03:08.51238	2020-10-29 19:03:08.51238
3088	2	5	22	2	\N	2017-07-12	-35.00	978	2020-10-29 19:03:08.514508	2020-10-29 19:03:08.514508
3089	2	1	7	2	\N	2017-07-12	-10.00	6a7	2020-10-29 19:03:08.516483	2020-10-29 19:03:08.516483
3090	2	8	38	2	\N	2017-07-12	-3.80	a3a	2020-10-29 19:03:08.51817	2020-10-29 19:03:08.51817
3091	2	4	13	2	\N	2017-07-12	-19.99	fc6	2020-10-29 19:03:08.520163	2020-10-29 19:03:08.520163
3092	1	4	15	2	\N	2017-07-14	-19.00	de2	2020-10-29 19:03:08.521979	2020-10-29 19:03:08.521979
3093	5	1	5	2	\N	2017-07-12	-41.42	8c3	2020-10-29 19:03:08.523635	2020-10-29 19:03:08.523635
3094	5	1	5	2	\N	2017-07-14	-11.94	7d2	2020-10-29 19:03:08.524996	2020-10-29 19:03:08.524996
3095	1	7	32	2	\N	2017-07-14	-279.99	31c	2020-10-29 19:03:08.527324	2020-10-29 19:03:08.527324
3096	5	1	5	2	\N	2017-07-15	-153.87	320	2020-10-29 19:03:08.529311	2020-10-29 19:03:08.529311
3097	5	1	5	2	\N	2017-07-15	-14.30	473	2020-10-29 19:03:08.531261	2020-10-29 19:03:08.531261
3098	2	3	-1	2	\N	2017-07-16	-18.00	0fe	2020-10-29 19:03:08.532854	2020-10-29 19:03:08.532854
3099	5	1	5	2	\N	2017-07-16	-103.98	6ee	2020-10-29 19:03:08.535083	2020-10-29 19:03:08.535083
3100	1	9	46	2	\N	2017-07-17	-51.00	358	2020-10-29 19:03:08.536791	2020-10-29 19:03:08.536791
3101	5	7	27	2	\N	2017-07-18	-50.00	f4c	2020-10-29 19:03:08.538716	2020-10-29 19:03:08.538716
3102	5	3	-1	2	\N	2017-07-17	-17.99	a85	2020-10-29 19:03:08.547925	2020-10-29 19:03:08.547925
3103	1	1	4	2	\N	2017-07-19	-2.00	4d2	2020-10-29 19:03:08.550241	2020-10-29 19:03:08.550241
3104	5	5	20	2	\N	2017-07-18	-13.83	18d	2020-10-29 19:03:08.551792	2020-10-29 19:03:08.551792
3105	5	1	5	2	\N	2017-07-19	-54.78	e5f	2020-10-29 19:03:08.553512	2020-10-29 19:03:08.553512
3106	5	5	20	2	\N	2017-07-19	-50.94	e54	2020-10-29 19:03:08.555539	2020-10-29 19:03:08.555539
3107	2	1	5	2	\N	2017-07-19	-4.80	ecd	2020-10-29 19:03:08.556905	2020-10-29 19:03:08.556905
3108	5	5	23	2	\N	2017-07-19	-21.17	d2d	2020-10-29 19:03:08.558743	2020-10-29 19:03:08.558743
3109	2	5	23	2	\N	2017-07-19	-25.17	931	2020-10-29 19:03:08.560028	2020-10-29 19:03:08.560028
3110	2	2	1	1	\N	2017-07-20	556.49	11e	2020-10-29 19:03:08.561367	2020-10-29 19:03:08.561367
3111	2	9	-1	3	\N	2017-07-21	-400.00	d76	2020-10-29 19:03:08.563057	2020-10-29 19:03:08.563057
3112	5	9	-1	4	\N	2017-07-21	400.00	d76	2020-10-29 19:03:08.56496	2020-10-29 19:03:08.56496
3113	2	4	15	2	\N	2017-07-21	-10.00	b6f	2020-10-29 19:03:08.56634	2020-10-29 19:03:08.56634
3114	1	2	2	1	\N	2017-07-21	0.00	6a5	2020-10-29 19:03:08.567877	2020-10-29 19:03:08.567877
3115	1	7	33	2	\N	2017-07-21	-65.23	ac7	2020-10-29 19:03:08.569543	2020-10-29 19:03:08.569543
3116	5	1	5	2	\N	2017-07-20	-9.90	d9a	2020-10-29 19:03:08.570762	2020-10-29 19:03:08.570762
3117	5	1	5	2	\N	2017-07-22	-11.90	f13	2020-10-29 19:03:08.57213	2020-10-29 19:03:08.57213
3118	5	1	5	2	\N	2017-07-22	-83.20	bee	2020-10-29 19:03:08.573607	2020-10-29 19:03:08.573607
3119	1	9	45	2	\N	2017-07-22	-27.00	3f2	2020-10-29 19:03:08.574898	2020-10-29 19:03:08.574898
3120	1	1	6	2	\N	2017-07-22	-30.00	0e9	2020-10-29 19:03:08.576199	2020-10-29 19:03:08.576199
3121	5	1	5	2	\N	2017-07-22	-16.38	a93	2020-10-29 19:03:08.577808	2020-10-29 19:03:08.577808
3122	2	6	24	2	\N	2017-07-22	-9.80	643	2020-10-29 19:03:08.579179	2020-10-29 19:03:08.579179
3123	2	9	-1	2	\N	2017-07-22	-99.00	bed	2020-10-29 19:03:08.581279	2020-10-29 19:03:08.581279
3124	5	9	45	2	\N	2017-07-22	-45.40	ee1	2020-10-29 19:03:08.583082	2020-10-29 19:03:08.583082
3125	2	9	-1	2	\N	2017-07-22	-22.80	bed	2020-10-29 19:03:08.584571	2020-10-29 19:03:08.584571
3126	5	1	5	2	\N	2017-07-21	-41.73	65d	2020-10-29 19:03:08.586036	2020-10-29 19:03:08.586036
3127	2	6	24	2	\N	2017-07-22	-75.46	942	2020-10-29 19:03:08.587401	2020-10-29 19:03:08.587401
3128	5	1	4	2	\N	2017-07-23	-17.38	60d	2020-10-29 19:03:08.588603	2020-10-29 19:03:08.588603
3129	5	3	-1	2	\N	2017-07-23	-19.98	b49	2020-10-29 19:03:08.589958	2020-10-29 19:03:08.589958
3130	5	7	27	2	\N	2017-07-24	-135.72	2c3	2020-10-29 19:03:08.591367	2020-10-29 19:03:08.591367
3131	1	5	22	2	\N	2017-07-22	-40.00	09f	2020-10-29 19:03:08.59237	2020-10-29 19:03:08.59237
3132	2	6	24	1	\N	2017-07-24	104.50	85a	2020-10-29 19:03:08.59426	2020-10-29 19:03:08.59426
3133	2	7	28	2	\N	2017-07-24	-22.00	c6e	2020-10-29 19:03:08.595846	2020-10-29 19:03:08.595846
3134	2	9	45	2	\N	2017-07-24	-10.00	229	2020-10-29 19:03:08.597298	2020-10-29 19:03:08.597298
3135	5	7	27	2	\N	2017-07-25	-120.00	05d	2020-10-29 19:03:08.598646	2020-10-29 19:03:08.598646
3136	5	8	40	2	\N	2017-07-25	-31.50	d97	2020-10-29 19:03:08.599807	2020-10-29 19:03:08.599807
3137	5	5	20	2	\N	2017-07-25	-55.48	e5b	2020-10-29 19:03:08.600798	2020-10-29 19:03:08.600798
3138	5	1	5	2	\N	2017-07-25	-23.13	7d2	2020-10-29 19:03:08.60196	2020-10-29 19:03:08.60196
3139	1	5	18	2	\N	2017-07-26	-46.25	0f2	2020-10-29 19:03:08.602937	2020-10-29 19:03:08.602937
3140	1	2	1	1	\N	2017-07-26	12257.09	8a8	2020-10-29 19:03:08.604144	2020-10-29 19:03:08.604144
3141	5	1	6	2	\N	2017-07-26	-10.82	783	2020-10-29 19:03:08.605291	2020-10-29 19:03:08.605291
3142	5	3	-1	2	\N	2017-07-26	-17.99	096	2020-10-29 19:03:08.606304	2020-10-29 19:03:08.606304
3143	5	1	5	2	\N	2017-07-26	-92.80	320	2020-10-29 19:03:08.607441	2020-10-29 19:03:08.607441
3144	5	1	5	2	\N	2017-07-27	-13.14	7d5	2020-10-29 19:03:08.608468	2020-10-29 19:03:08.608468
3145	1	3	-1	2	\N	2017-07-27	-36.72	6ad	2020-10-29 19:03:08.609522	2020-10-29 19:03:08.609522
3146	2	5	18	2	\N	2017-07-27	-43.55	f36	2020-10-29 19:03:08.610558	2020-10-29 19:03:08.610558
3147	2	6	24	3	\N	2017-07-28	-104.50	330	2020-10-29 19:03:08.611995	2020-10-29 19:03:08.611995
3148	5	6	24	4	\N	2017-07-28	104.50	330	2020-10-29 19:03:08.613215	2020-10-29 19:03:08.613215
3149	2	2	1	1	\N	2017-07-28	5652.93	8d3	2020-10-29 19:03:08.614517	2020-10-29 19:03:08.614517
3150	2	10	51	3	\N	2017-07-28	-1500.00	654	2020-10-29 19:03:08.615801	2020-10-29 19:03:08.615801
3151	5	10	51	4	\N	2017-07-28	1500.00	654	2020-10-29 19:03:08.616831	2020-10-29 19:03:08.616831
3152	2	10	51	3	\N	2017-07-28	-3000.00	a41	2020-10-29 19:03:08.617943	2020-10-29 19:03:08.617943
3153	6	10	51	4	\N	2017-07-28	3000.00	a41	2020-10-29 19:03:08.619005	2020-10-29 19:03:08.619005
3154	2	10	51	3	\N	2017-07-28	-500.00	12b	2020-10-29 19:03:08.620217	2020-10-29 19:03:08.620217
3155	4	10	51	4	\N	2017-07-28	500.00	12b	2020-10-29 19:03:08.621368	2020-10-29 19:03:08.621368
3156	5	4	10	2	\N	2017-07-28	-56.89	752	2020-10-29 19:03:08.622321	2020-10-29 19:03:08.622321
3157	1	1	8	2	\N	2017-07-28	-2.49	533	2020-10-29 19:03:08.623503	2020-10-29 19:03:08.623503
3158	5	1	5	2	\N	2017-07-29	-20.00	ecd	2020-10-29 19:03:08.624501	2020-10-29 19:03:08.624501
3159	5	1	5	2	\N	2017-07-29	-116.08	621	2020-10-29 19:03:08.625534	2020-10-29 19:03:08.625534
3160	2	6	24	2	\N	2017-07-29	-19.47	18c	2020-10-29 19:03:08.62658	2020-10-29 19:03:08.62658
3161	2	8	38	2	\N	2017-07-29	-52.80	dd7	2020-10-29 19:03:08.627692	2020-10-29 19:03:08.627692
3162	5	4	10	2	\N	2017-07-29	-381.63	0a6	2020-10-29 19:03:08.62881	2020-10-29 19:03:08.62881
3163	5	4	-1	2	\N	2017-07-29	-590.00	8f6	2020-10-29 19:03:08.630049	2020-10-29 19:03:08.630049
3164	5	4	12	2	\N	2017-07-29	-117.59	783	2020-10-29 19:03:08.63155	2020-10-29 19:03:08.63155
3165	5	8	40	2	\N	2017-07-29	-191.08	a6f	2020-10-29 19:03:08.63273	2020-10-29 19:03:08.63273
3166	5	1	8	2	\N	2017-07-30	-34.10	a00	2020-10-29 19:03:08.633918	2020-10-29 19:03:08.633918
3167	1	9	-1	2	\N	2017-07-30	-81.50	576	2020-10-29 19:03:08.634901	2020-10-29 19:03:08.634901
3168	1	10	51	3	\N	2017-07-30	-12000.00	38a	2020-10-29 19:03:08.636147	2020-10-29 19:03:08.636147
3169	5	7	30	3	\N	2017-07-31	-15.00	8b6	2020-10-29 19:03:08.637364	2020-10-29 19:03:08.637364
3170	1	2	2	4	\N	2017-07-03	15.00	8b6	2020-10-29 19:03:08.638424	2020-10-29 19:03:08.638424
3171	5	4	13	2	\N	2017-07-30	-49.90	5cf	2020-10-29 19:03:08.639654	2020-10-29 19:03:08.639654
3172	1	8	38	2	\N	2017-07-31	-46.00	a3a	2020-10-29 19:03:08.640691	2020-10-29 19:03:08.640691
3173	1	9	-1	2	\N	2017-08-01	-3.00	760	2020-10-29 19:03:08.641923	2020-10-29 19:03:08.641923
3174	5	1	5	2	\N	2017-08-01	-16.82	7d2	2020-10-29 19:03:08.643043	2020-10-29 19:03:08.643043
3175	1	9	46	2	\N	2017-08-01	-100.00	5ae	2020-10-29 19:03:08.644287	2020-10-29 19:03:08.644287
3176	6	10	52	1	\N	2017-08-01	160.41	15b	2020-10-29 19:03:08.645414	2020-10-29 19:03:08.645414
3177	1	10	51	4	\N	2017-08-01	12000.00	5bc	2020-10-29 19:03:08.646395	2020-10-29 19:03:08.646395
3178	1	10	51	3	\N	2017-08-01	-7000.00	58a	2020-10-29 19:03:08.647848	2020-10-29 19:03:08.647848
3179	1	10	51	3	\N	2017-08-01	-500.00	1d5	2020-10-29 19:03:08.649068	2020-10-29 19:03:08.649068
3180	1	10	51	3	\N	2017-08-01	-1000.00	33e	2020-10-29 19:03:08.650277	2020-10-29 19:03:08.650277
3181	1	10	51	3	\N	2017-08-01	-1000.00	7e8	2020-10-29 19:03:08.651361	2020-10-29 19:03:08.651361
3182	1	10	51	3	\N	2017-08-01	-2000.00	7d9	2020-10-29 19:03:08.652403	2020-10-29 19:03:08.652403
3183	6	10	51	4	\N	2017-08-01	2000.00	7d9	2020-10-29 19:03:08.653457	2020-10-29 19:03:08.653457
3184	2	9	45	2	\N	2017-08-02	-10.00	e35	2020-10-29 19:03:08.654488	2020-10-29 19:03:08.654488
3185	5	1	5	2	\N	2017-08-02	-12.98	cb5	2020-10-29 19:03:08.655525	2020-10-29 19:03:08.655525
3186	1	1	5	2	\N	2017-08-02	-2.99	c90	2020-10-29 19:03:08.656562	2020-10-29 19:03:08.656562
3187	5	1	5	2	\N	2017-08-03	-8.51	be3	2020-10-29 19:03:08.657777	2020-10-29 19:03:08.657777
3188	1	1	8	2	\N	2017-08-03	-4.20	a00	2020-10-29 19:03:08.6589	2020-10-29 19:03:08.6589
3189	1	9	48	2	\N	2017-08-03	-100.00	bbb	2020-10-29 19:03:08.659933	2020-10-29 19:03:08.659933
3190	1	7	32	2	\N	2017-08-04	-29.98	49f	2020-10-29 19:03:08.660905	2020-10-29 19:03:08.660905
3191	5	10	51	3	\N	2017-08-04	-1000.00	039	2020-10-29 19:03:08.661865	2020-10-29 19:03:08.661865
3192	6	10	51	4	\N	2017-08-04	1000.00	039	2020-10-29 19:03:08.662902	2020-10-29 19:03:08.662902
3193	5	10	51	4	\N	2017-08-04	5500.00	039	2020-10-29 19:03:08.663986	2020-10-29 19:03:08.663986
3194	5	10	51	3	\N	2017-08-04	-500.00	039	2020-10-29 19:03:08.665319	2020-10-29 19:03:08.665319
3195	1	10	51	4	\N	2017-08-04	500.00	039	2020-10-29 19:03:08.666442	2020-10-29 19:03:08.666442
3196	5	8	40	2	\N	2017-08-04	-33.70	2dd	2020-10-29 19:03:08.667461	2020-10-29 19:03:08.667461
3197	5	1	6	2	\N	2017-08-04	-19.80	8fc	2020-10-29 19:03:08.66848	2020-10-29 19:03:08.66848
3198	5	1	5	2	\N	2017-08-04	-3.19	d9a	2020-10-29 19:03:08.669442	2020-10-29 19:03:08.669442
3199	5	1	5	2	\N	2017-08-04	-65.82	7d2	2020-10-29 19:03:08.670417	2020-10-29 19:03:08.670417
3200	5	1	6	2	\N	2017-08-05	-34.50	a93	2020-10-29 19:03:08.671425	2020-10-29 19:03:08.671425
3201	5	7	27	2	\N	2017-08-05	-32.00	7f3	2020-10-29 19:03:08.67249	2020-10-29 19:03:08.67249
3202	5	1	5	2	\N	2017-08-05	-34.13	7d2	2020-10-29 19:03:08.67355	2020-10-29 19:03:08.67355
3203	5	8	40	2	\N	2017-08-06	-33.70	2dd	2020-10-29 19:03:08.674751	2020-10-29 19:03:08.674751
3204	5	8	40	2	\N	2017-08-06	-208.12	a6f	2020-10-29 19:03:08.67576	2020-10-29 19:03:08.67576
3205	5	9	-1	2	\N	2017-08-06	-6.30	760	2020-10-29 19:03:08.676833	2020-10-29 19:03:08.676833
3206	5	10	51	3	\N	2017-08-07	-2500.00	039	2020-10-29 19:03:08.677807	2020-10-29 19:03:08.677807
3207	1	1	7	2	\N	2017-08-07	-11.24	e33	2020-10-29 19:03:08.67886	2020-10-29 19:03:08.67886
3208	5	5	20	2	\N	2017-08-07	-14.99	203	2020-10-29 19:03:08.67995	2020-10-29 19:03:08.67995
3209	5	1	5	2	\N	2017-08-07	-22.68	7d2	2020-10-29 19:03:08.681566	2020-10-29 19:03:08.681566
3210	1	7	27	1	\N	2017-08-07	280.00	f3a	2020-10-29 19:03:08.682901	2020-10-29 19:03:08.682901
3211	1	7	27	2	\N	2017-08-07	-360.00	f3a	2020-10-29 19:03:08.684046	2020-10-29 19:03:08.684046
3212	1	8	42	2	\N	2017-08-07	-37.00	4a8	2020-10-29 19:03:08.685134	2020-10-29 19:03:08.685134
3213	1	1	8	2	\N	2017-08-07	-2.20	d70	2020-10-29 19:03:08.68621	2020-10-29 19:03:08.68621
3214	2	1	6	2	\N	2017-08-07	-16.50	7d4	2020-10-29 19:03:08.688088	2020-10-29 19:03:08.688088
3215	2	1	7	2	\N	2017-08-07	-11.00	d2d	2020-10-29 19:03:08.689427	2020-10-29 19:03:08.689427
3216	5	4	-1	2	\N	2017-08-07	-126.00	666	2020-10-29 19:03:08.690661	2020-10-29 19:03:08.690661
3217	2	9	45	2	\N	2017-08-04	-11.99	c1f	2020-10-29 19:03:08.691775	2020-10-29 19:03:08.691775
3218	2	1	6	2	\N	2017-08-04	-43.50	dfb	2020-10-29 19:03:08.692932	2020-10-29 19:03:08.692932
3219	1	8	41	2	\N	2017-08-08	-20.59	af0	2020-10-29 19:03:08.694351	2020-10-29 19:03:08.694351
3220	5	1	5	2	\N	2017-08-08	-17.73	7d2	2020-10-29 19:03:08.695675	2020-10-29 19:03:08.695675
3221	5	1	5	2	\N	2017-08-08	-87.42	320	2020-10-29 19:03:08.696801	2020-10-29 19:03:08.696801
3222	5	1	5	2	\N	2017-08-09	-10.57	7d2	2020-10-29 19:03:08.698563	2020-10-29 19:03:08.698563
3223	6	10	51	4	\N	2017-08-10	2500.00	725	2020-10-29 19:03:08.700119	2020-10-29 19:03:08.700119
3224	5	1	5	2	\N	2017-08-10	-27.21	8c3	2020-10-29 19:03:08.701393	2020-10-29 19:03:08.701393
3225	5	1	5	2	\N	2017-08-11	-6.99	7d2	2020-10-29 19:03:08.702544	2020-10-29 19:03:08.702544
3226	1	1	5	2	\N	2017-08-12	-14.96	7d2	2020-10-29 19:03:08.703724	2020-10-29 19:03:08.703724
3227	5	1	5	2	\N	2017-08-12	-20.37	7d2	2020-10-29 19:03:08.704785	2020-10-29 19:03:08.704785
3228	5	8	40	2	\N	2017-08-12	-203.35	a6f	2020-10-29 19:03:08.705979	2020-10-29 19:03:08.705979
3229	5	1	5	2	\N	2017-08-14	-16.25	7d2	2020-10-29 19:03:08.707433	2020-10-29 19:03:08.707433
3230	1	9	45	2	\N	2017-08-15	-66.90	bc9	2020-10-29 19:03:08.70875	2020-10-29 19:03:08.70875
3231	1	9	45	2	\N	2017-08-15	-150.00	bc9	2020-10-29 19:03:08.709908	2020-10-29 19:03:08.709908
3232	1	1	5	2	\N	2017-08-15	-10.19	7d2	2020-10-29 19:03:08.710979	2020-10-29 19:03:08.710979
3233	1	1	5	2	\N	2017-08-16	-8.00	473	2020-10-29 19:03:08.712167	2020-10-29 19:03:08.712167
3234	5	5	20	2	\N	2017-08-16	-108.89	ceb	2020-10-29 19:03:08.713294	2020-10-29 19:03:08.713294
3235	1	9	48	2	\N	2017-08-16	-100.00	bbb	2020-10-29 19:03:08.714775	2020-10-29 19:03:08.714775
3236	5	1	5	2	\N	2017-08-16	-100.86	7d2	2020-10-29 19:03:08.716111	2020-10-29 19:03:08.716111
3237	1	1	4	2	\N	2017-08-17	-8.00	bd8	2020-10-29 19:03:08.717329	2020-10-29 19:03:08.717329
3238	1	1	7	2	\N	2017-08-17	-13.92	e33	2020-10-29 19:03:08.718617	2020-10-29 19:03:08.718617
3239	1	1	5	2	\N	2017-08-17	-12.93	9ca	2020-10-29 19:03:08.719776	2020-10-29 19:03:08.719776
3240	5	1	5	2	\N	2017-08-19	-81.66	320	2020-10-29 19:03:08.721079	2020-10-29 19:03:08.721079
3241	5	1	5	2	\N	2017-08-19	-6.90	473	2020-10-29 19:03:08.722375	2020-10-29 19:03:08.722375
3242	5	1	5	2	\N	2017-08-19	-15.48	564	2020-10-29 19:03:08.723549	2020-10-29 19:03:08.723549
3243	1	1	6	2	\N	2017-08-20	-20.00	d7e	2020-10-29 19:03:08.724734	2020-10-29 19:03:08.724734
3244	2	9	-1	2	\N	2017-08-21	-59.85	149	2020-10-29 19:03:08.725912	2020-10-29 19:03:08.725912
3245	2	9	-1	2	\N	2017-08-21	-59.85	392	2020-10-29 19:03:08.727039	2020-10-29 19:03:08.727039
3246	2	9	-1	1	\N	2017-08-21	47.88	146	2020-10-29 19:03:08.728656	2020-10-29 19:03:08.728656
3247	5	1	5	2	\N	2017-08-20	-18.42	aec	2020-10-29 19:03:08.729846	2020-10-29 19:03:08.729846
3248	2	6	24	2	\N	2017-08-14	-69.98	656	2020-10-29 19:03:08.731265	2020-10-29 19:03:08.731265
3249	5	1	5	2	\N	2017-08-14	-18.63	aec	2020-10-29 19:03:08.732527	2020-10-29 19:03:08.732527
3250	2	4	15	2	\N	2017-08-18	-29.00	b5f	2020-10-29 19:03:08.733666	2020-10-29 19:03:08.733666
3251	1	9	45	2	\N	2017-08-23	-31.98	a00	2020-10-29 19:03:08.734826	2020-10-29 19:03:08.734826
3252	1	8	38	2	\N	2017-08-22	-7.60	f79	2020-10-29 19:03:08.736072	2020-10-29 19:03:08.736072
3253	5	5	20	2	\N	2017-08-24	-24.59	c94	2020-10-29 19:03:08.737491	2020-10-29 19:03:08.737491
3254	2	1	6	2	\N	2017-08-24	-25.50	ecb	2020-10-29 19:03:08.738778	2020-10-29 19:03:08.738778
3255	2	1	6	2	\N	2017-08-25	-7.00	e7f	2020-10-29 19:03:08.739905	2020-10-29 19:03:08.739905
3256	1	1	6	2	\N	2017-08-25	-15.00	398	2020-10-29 19:03:08.741076	2020-10-29 19:03:08.741076
3257	1	3	-1	2	\N	2017-08-25	-36.00	3ea	2020-10-29 19:03:08.742175	2020-10-29 19:03:08.742175
3258	5	1	5	2	\N	2017-08-24	-7.40	473	2020-10-29 19:03:08.743263	2020-10-29 19:03:08.743263
3259	5	1	5	2	\N	2017-08-26	-5.40	473	2020-10-29 19:03:08.744419	2020-10-29 19:03:08.744419
3260	5	1	-1	2	\N	2017-08-24	-7.18	0fc	2020-10-29 19:03:08.745524	2020-10-29 19:03:08.745524
3261	5	1	5	2	\N	2017-08-26	-10.24	6cc	2020-10-29 19:03:08.74674	2020-10-29 19:03:08.74674
3262	5	1	5	2	\N	2017-08-26	-110.51	6ee	2020-10-29 19:03:08.748064	2020-10-29 19:03:08.748064
3263	1	9	46	2	\N	2017-08-27	-93.49	90e	2020-10-29 19:03:08.749249	2020-10-29 19:03:08.749249
3264	5	1	5	2	\N	2017-08-27	-35.93	227	2020-10-29 19:03:08.750325	2020-10-29 19:03:08.750325
3265	2	5	23	2	\N	2017-08-27	-8.30	a07	2020-10-29 19:03:08.751397	2020-10-29 19:03:08.751397
3266	1	4	15	2	\N	2017-08-27	-29.00	de2	2020-10-29 19:03:08.752534	2020-10-29 19:03:08.752534
3267	1	1	4	2	\N	2017-08-28	-7.94	f2e	2020-10-29 19:03:08.753677	2020-10-29 19:03:08.753677
3268	5	9	-1	3	\N	2017-08-29	-50.00	769	2020-10-29 19:03:08.754817	2020-10-29 19:03:08.754817
3269	2	9	-1	4	\N	2017-08-29	50.00	769	2020-10-29 19:03:08.755877	2020-10-29 19:03:08.755877
3270	2	4	15	2	\N	2017-08-29	-29.00	f80	2020-10-29 19:03:08.757035	2020-10-29 19:03:08.757035
3271	5	1	5	2	\N	2017-08-29	-10.26	057	2020-10-29 19:03:08.758242	2020-10-29 19:03:08.758242
3272	2	2	1	1	\N	2017-08-29	7006.61	8e6	2020-10-29 19:03:08.759527	2020-10-29 19:03:08.759527
3273	2	10	51	3	\N	2017-08-30	-1500.00	61b	2020-10-29 19:03:08.760718	2020-10-29 19:03:08.760718
3274	5	10	51	4	\N	2017-08-30	1500.00	61b	2020-10-29 19:03:08.761851	2020-10-29 19:03:08.761851
3275	2	10	51	3	\N	2017-08-30	-2000.00	61b	2020-10-29 19:03:08.763059	2020-10-29 19:03:08.763059
3276	6	10	51	4	\N	2017-08-30	2000.00	61b	2020-10-29 19:03:08.76483	2020-10-29 19:03:08.76483
3277	5	4	10	2	\N	2017-08-30	-381.63	370	2020-10-29 19:03:08.766435	2020-10-29 19:03:08.766435
3278	5	4	-1	2	\N	2017-08-30	-590.00	dcf	2020-10-29 19:03:08.767867	2020-10-29 19:03:08.767867
3279	5	4	13	2	\N	2017-08-30	-49.90	b88	2020-10-29 19:03:08.769057	2020-10-29 19:03:08.769057
3280	5	4	11	2	\N	2017-08-30	-96.67	7e1	2020-10-29 19:03:08.770255	2020-10-29 19:03:08.770255
3281	1	1	8	2	\N	2017-08-31	-2.20	a00	2020-10-29 19:03:08.771456	2020-10-29 19:03:08.771456
3282	1	2	1	1	\N	2017-08-28	8214.52	798	2020-10-29 19:03:08.77275	2020-10-29 19:03:08.77275
3283	1	2	2	4	\N	2017-08-31	15.00	fd5	2020-10-29 19:03:08.774606	2020-10-29 19:03:08.774606
3284	5	7	30	3	\N	2017-08-31	-15.00	fd5	2020-10-29 19:03:08.776754	2020-10-29 19:03:08.776754
3285	1	10	51	3	\N	2017-08-31	-500.00	359	2020-10-29 19:03:08.77878	2020-10-29 19:03:08.77878
3286	1	9	-1	3	\N	2017-08-31	-84.99	576	2020-10-29 19:03:08.780055	2020-10-29 19:03:08.780055
3287	1	8	38	2	\N	2017-08-31	-24.29	074	2020-10-29 19:03:08.781725	2020-10-29 19:03:08.781725
3288	1	8	38	2	\N	2017-08-31	-46.00	1bf	2020-10-29 19:03:08.783125	2020-10-29 19:03:08.783125
3289	6	10	52	1	\N	2017-09-01	136.71	15b	2020-10-29 19:03:08.78444	2020-10-29 19:03:08.78444
3290	1	10	51	3	\N	2017-09-01	-7000.00	fca	2020-10-29 19:03:08.785609	2020-10-29 19:03:08.785609
3291	1	2	2	1	\N	2017-09-01	31.53	294	2020-10-29 19:03:08.786787	2020-10-29 19:03:08.786787
3292	5	4	10	2	\N	2017-09-01	-10.16	d8e	2020-10-29 19:03:08.788113	2020-10-29 19:03:08.788113
3293	2	1	7	2	\N	2017-09-01	-5.78	889	2020-10-29 19:03:08.78947	2020-10-29 19:03:08.78947
3294	2	1	7	2	\N	2017-09-01	-6.85	e87	2020-10-29 19:03:08.790773	2020-10-29 19:03:08.790773
3295	5	1	5	2	\N	2017-09-01	-18.44	4a3	2020-10-29 19:03:08.792108	2020-10-29 19:03:08.792108
3296	2	10	51	3	\N	2017-09-01	-1000.00	e7e	2020-10-29 19:03:08.793227	2020-10-29 19:03:08.793227
3297	6	10	51	4	\N	2017-09-01	1000.00	e7e	2020-10-29 19:03:08.794542	2020-10-29 19:03:08.794542
3298	5	1	5	2	\N	2017-09-01	-17.55	7d2	2020-10-29 19:03:08.795713	2020-10-29 19:03:08.795713
3299	5	1	5	2	\N	2017-09-02	-11.80	473	2020-10-29 19:03:08.796963	2020-10-29 19:03:08.796963
3300	5	2	2	4	\N	2017-09-01	27.70	ece	2020-10-29 19:03:08.798266	2020-10-29 19:03:08.798266
3301	5	1	5	2	\N	2017-09-02	-139.02	a71	2020-10-29 19:03:08.799539	2020-10-29 19:03:08.799539
3302	5	1	5	2	\N	2017-09-02	-17.40	7d2	2020-10-29 19:03:08.800748	2020-10-29 19:03:08.800748
3303	5	4	-1	2	\N	2017-09-02	-112.00	de5	2020-10-29 19:03:08.801927	2020-10-29 19:03:08.801927
3304	5	1	4	2	\N	2017-09-04	-4.59	dc1	2020-10-29 19:03:08.803145	2020-10-29 19:03:08.803145
3305	5	3	-1	2	\N	2017-09-04	-9.34	3ea	2020-10-29 19:03:08.804346	2020-10-29 19:03:08.804346
3306	1	1	8	2	\N	2017-09-06	-2.20	d56	2020-10-29 19:03:08.805561	2020-10-29 19:03:08.805561
3307	5	1	5	2	\N	2017-09-06	-6.84	e48	2020-10-29 19:03:08.806905	2020-10-29 19:03:08.806905
3308	5	10	51	4	\N	2017-09-06	5500.00	d9d	2020-10-29 19:03:08.808012	2020-10-29 19:03:08.808012
3309	5	10	51	3	\N	2017-09-07	-2500.00	3c9	2020-10-29 19:03:08.809105	2020-10-29 19:03:08.809105
3310	5	10	51	3	\N	2017-09-06	-1000.00	cd2	2020-10-29 19:03:08.810152	2020-10-29 19:03:08.810152
3311	5	10	51	3	\N	2017-09-06	-500.00	3aa	2020-10-29 19:03:08.811171	2020-10-29 19:03:08.811171
3312	2	9	-1	2	\N	2017-09-06	-300.00	7e1	2020-10-29 19:03:08.812349	2020-10-29 19:03:08.812349
3313	2	9	45	2	\N	2017-09-06	-89.90	80f	2020-10-29 19:03:08.81355	2020-10-29 19:03:08.81355
3314	2	9	45	2	\N	2017-09-06	-20.00	67f	2020-10-29 19:03:08.814965	2020-10-29 19:03:08.814965
3315	2	9	45	2	\N	2017-09-06	-129.92	fb0	2020-10-29 19:03:08.81644	2020-10-29 19:03:08.81644
3316	1	1	7	2	\N	2017-09-06	-12.79	b98	2020-10-29 19:03:08.817534	2020-10-29 19:03:08.817534
3317	1	7	33	2	\N	2017-09-07	-48.50	2ec	2020-10-29 19:03:08.818619	2020-10-29 19:03:08.818619
3318	1	1	7	2	\N	2017-09-07	-11.08	b98	2020-10-29 19:03:08.819658	2020-10-29 19:03:08.819658
3319	1	1	7	2	\N	2017-09-08	-16.40	b98	2020-10-29 19:03:08.82073	2020-10-29 19:03:08.82073
3320	2	9	45	2	\N	2017-09-08	-14.99	173	2020-10-29 19:03:08.821771	2020-10-29 19:03:08.821771
3321	5	9	45	2	\N	2017-09-08	-156.30	ffa	2020-10-29 19:03:08.822776	2020-10-29 19:03:08.822776
3322	5	1	5	2	\N	2017-09-08	-39.89	621	2020-10-29 19:03:08.823794	2020-10-29 19:03:08.823794
3323	5	8	40	2	\N	2017-09-09	-217.71	d7e	2020-10-29 19:03:08.825293	2020-10-29 19:03:08.825293
3324	5	8	40	2	\N	2017-09-10	-222.66	ecc	2020-10-29 19:03:08.826369	2020-10-29 19:03:08.826369
3325	5	8	40	2	\N	2017-09-09	-36.20	843	2020-10-29 19:03:08.827422	2020-10-29 19:03:08.827422
3326	1	1	6	2	\N	2017-09-10	-17.60	8fc	2020-10-29 19:03:08.828523	2020-10-29 19:03:08.828523
3327	1	1	4	2	\N	2017-09-09	-5.99	dc1	2020-10-29 19:03:08.829698	2020-10-29 19:03:08.829698
3328	5	1	6	2	\N	2017-09-10	-7.90	e25	2020-10-29 19:03:08.831091	2020-10-29 19:03:08.831091
3329	5	3	-1	2	\N	2017-09-10	-22.10	362	2020-10-29 19:03:08.832694	2020-10-29 19:03:08.832694
3330	5	1	5	2	\N	2017-09-10	-58.84	7d2	2020-10-29 19:03:08.833896	2020-10-29 19:03:08.833896
3331	5	7	27	2	\N	2017-09-10	-857.80	869	2020-10-29 19:03:08.835132	2020-10-29 19:03:08.835132
3332	5	10	51	4	\N	2017-09-11	2500.00	d9d	2020-10-29 19:03:08.836314	2020-10-29 19:03:08.836314
3333	5	10	51	4	\N	2017-09-11	2500.00	58b	2020-10-29 19:03:08.837668	2020-10-29 19:03:08.837668
3334	6	10	51	3	\N	2017-09-11	-2500.00	58b	2020-10-29 19:03:08.839079	2020-10-29 19:03:08.839079
3335	1	10	51	4	\N	2017-09-11	200.00	1ad	2020-10-29 19:03:08.840607	2020-10-29 19:03:08.840607
3336	5	10	51	3	\N	2017-09-11	-700.00	9a5	2020-10-29 19:03:08.841849	2020-10-29 19:03:08.841849
3337	5	7	27	2	\N	2017-09-12	-14.00	be1	2020-10-29 19:03:08.843173	2020-10-29 19:03:08.843173
3338	5	7	27	2	\N	2017-09-12	-41.40	7b1	2020-10-29 19:03:08.844557	2020-10-29 19:03:08.844557
3339	5	1	5	2	\N	2017-09-12	-28.01	332	2020-10-29 19:03:08.845747	2020-10-29 19:03:08.845747
3340	5	7	27	2	\N	2017-09-12	-32.00	45a	2020-10-29 19:03:08.846983	2020-10-29 19:03:08.846983
3341	5	7	27	2	\N	2017-09-12	-30.00	bac	2020-10-29 19:03:08.848212	2020-10-29 19:03:08.848212
3342	5	1	5	2	\N	2017-09-11	-119.53	c20	2020-10-29 19:03:08.849411	2020-10-29 19:03:08.849411
3343	1	7	33	2	\N	2017-09-13	-59.80	4b4	2020-10-29 19:03:08.850708	2020-10-29 19:03:08.850708
3344	5	7	27	2	\N	2017-09-13	-13.00	99d	2020-10-29 19:03:08.852081	2020-10-29 19:03:08.852081
3345	5	7	27	2	\N	2017-09-13	-25.44	f5e	2020-10-29 19:03:08.853258	2020-10-29 19:03:08.853258
3346	5	7	27	2	\N	2017-09-13	-5.50	baa	2020-10-29 19:03:08.854535	2020-10-29 19:03:08.854535
3347	1	9	46	2	\N	2017-09-13	-288.00	627	2020-10-29 19:03:08.855723	2020-10-29 19:03:08.855723
3348	5	7	27	2	\N	2017-09-15	-75.00	a8c	2020-10-29 19:03:08.857316	2020-10-29 19:03:08.857316
3349	5	1	5	2	\N	2017-09-15	-51.75	332	2020-10-29 19:03:08.858582	2020-10-29 19:03:08.858582
3350	5	1	5	2	\N	2017-09-14	-95.49	876	2020-10-29 19:03:08.859828	2020-10-29 19:03:08.859828
3351	5	1	5	2	\N	2017-09-14	-8.20	91a	2020-10-29 19:03:08.861063	2020-10-29 19:03:08.861063
3352	5	7	27	2	\N	2017-09-14	-12.00	1e2	2020-10-29 19:03:08.862365	2020-10-29 19:03:08.862365
3353	5	7	27	2	\N	2017-09-14	-13.50	c25	2020-10-29 19:03:08.863574	2020-10-29 19:03:08.863574
3354	5	8	40	2	\N	2017-09-16	-225.53	a2a	2020-10-29 19:03:08.865256	2020-10-29 19:03:08.865256
3355	5	1	5	2	\N	2017-09-16	-7.28	bef	2020-10-29 19:03:08.866634	2020-10-29 19:03:08.866634
3356	5	8	40	2	\N	2017-09-16	-36.20	961	2020-10-29 19:03:08.868164	2020-10-29 19:03:08.868164
3357	5	1	8	2	\N	2017-09-17	-17.60	a00	2020-10-29 19:03:08.869473	2020-10-29 19:03:08.869473
3358	5	1	5	2	\N	2017-09-17	-16.08	e5a	2020-10-29 19:03:08.87117	2020-10-29 19:03:08.87117
3359	5	1	5	2	\N	2017-09-17	-10.74	d9a	2020-10-29 19:03:08.87227	2020-10-29 19:03:08.87227
3360	5	1	5	2	\N	2017-09-17	-80.16	7d2	2020-10-29 19:03:08.873298	2020-10-29 19:03:08.873298
3361	1	5	18	2	\N	2017-09-18	-44.96	846	2020-10-29 19:03:08.87431	2020-10-29 19:03:08.87431
3362	5	4	15	2	\N	2017-09-18	-29.00	de2	2020-10-29 19:03:08.875681	2020-10-29 19:03:08.875681
3363	5	8	40	2	\N	2017-09-18	-38.99	85c	2020-10-29 19:03:08.876859	2020-10-29 19:03:08.876859
3364	1	3	-1	2	\N	2017-09-19	-35.00	e73	2020-10-29 19:03:08.877946	2020-10-29 19:03:08.877946
3365	5	4	15	2	\N	2017-09-19	-29.00	d3b	2020-10-29 19:03:08.879006	2020-10-29 19:03:08.879006
3366	2	4	13	2	\N	2017-09-20	-29.90	fc6	2020-10-29 19:03:08.880098	2020-10-29 19:03:08.880098
3367	5	9	45	2	\N	2017-09-19	-79.00	a9d	2020-10-29 19:03:08.881243	2020-10-29 19:03:08.881243
3368	5	9	45	2	\N	2017-09-19	-156.30	b66	2020-10-29 19:03:08.882444	2020-10-29 19:03:08.882444
3369	2	4	15	2	\N	2017-09-20	-58.00	cd6	2020-10-29 19:03:08.883599	2020-10-29 19:03:08.883599
3370	5	4	15	1	\N	2017-09-20	58.00	cd6	2020-10-29 19:03:08.884771	2020-10-29 19:03:08.884771
3371	1	9	48	2	\N	2017-09-20	-20.00	ca1	2020-10-29 19:03:08.885974	2020-10-29 19:03:08.885974
3372	1	1	4	2	\N	2017-09-20	-7.37	496	2020-10-29 19:03:08.887087	2020-10-29 19:03:08.887087
3373	1	7	28	2	\N	2017-09-21	-45.00	077	2020-10-29 19:03:08.888275	2020-10-29 19:03:08.888275
3374	5	5	20	2	\N	2017-09-21	-21.99	ceb	2020-10-29 19:03:08.889432	2020-10-29 19:03:08.889432
3375	1	1	8	2	\N	2017-09-22	-2.20	a00	2020-10-29 19:03:08.890587	2020-10-29 19:03:08.890587
3376	1	1	4	2	\N	2017-09-22	-23.00	23d	2020-10-29 19:03:08.891919	2020-10-29 19:03:08.891919
3377	5	1	5	2	\N	2017-09-23	-360.13	7d2	2020-10-29 19:03:08.893099	2020-10-29 19:03:08.893099
3378	5	4	13	2	\N	2017-09-26	-49.90	d3c	2020-10-29 19:03:08.894769	2020-10-29 19:03:08.894769
3379	5	7	27	2	\N	2017-09-27	-150.00	d6a	2020-10-29 19:03:08.896171	2020-10-29 19:03:08.896171
3380	1	4	15	2	\N	2017-09-27	-19.00	de2	2020-10-29 19:03:08.897592	2020-10-29 19:03:08.897592
3381	5	4	12	2	\N	2017-09-28	-115.96	15f	2020-10-29 19:03:08.899118	2020-10-29 19:03:08.899118
3382	5	1	5	2	\N	2017-09-28	-13.90	473	2020-10-29 19:03:08.900637	2020-10-29 19:03:08.900637
3383	1	2	1	1	\N	2017-09-28	8048.73	b49	2020-10-29 19:03:08.901921	2020-10-29 19:03:08.901921
3384	1	10	51	3	\N	2017-09-29	-500.00	39d	2020-10-29 19:03:08.903159	2020-10-29 19:03:08.903159
3385	5	1	5	2	\N	2017-09-29	-93.99	7d2	2020-10-29 19:03:08.90434	2020-10-29 19:03:08.90434
3386	1	1	8	2	\N	2017-09-30	-20.50	cfc	2020-10-29 19:03:08.90597	2020-10-29 19:03:08.90597
3387	1	2	2	4	\N	2017-10-01	15.00	1c5	2020-10-29 19:03:08.907382	2020-10-29 19:03:08.907382
3388	1	9	48	2	\N	2017-10-01	-100.00	bbb	2020-10-29 19:03:08.908721	2020-10-29 19:03:08.908721
3389	6	10	52	1	\N	2017-09-30	97.60	15b	2020-10-29 19:03:08.910236	2020-10-29 19:03:08.910236
3390	1	9	-1	2	\N	2017-10-01	-7.10	072	2020-10-29 19:03:08.911384	2020-10-29 19:03:08.911384
3391	5	2	2	1	\N	2017-10-01	70.90	072	2020-10-29 19:03:08.912536	2020-10-29 19:03:08.912536
3392	1	9	46	2	\N	2017-10-01	-150.00	ee3	2020-10-29 19:03:08.914085	2020-10-29 19:03:08.914085
3393	1	10	51	3	\N	2017-10-02	-7000.00	f80	2020-10-29 19:03:08.915557	2020-10-29 19:03:08.915557
3394	2	2	1	1	\N	2017-10-01	5720.58	214	2020-10-29 19:03:08.917324	2020-10-29 19:03:08.917324
3395	2	9	45	2	\N	2017-10-02	-10.00	76a	2020-10-29 19:03:08.918534	2020-10-29 19:03:08.918534
3396	2	9	45	2	\N	2017-10-02	-33.69	a87	2020-10-29 19:03:08.919789	2020-10-29 19:03:08.919789
3397	2	6	24	2	\N	2017-10-02	-126.89	350	2020-10-29 19:03:08.921059	2020-10-29 19:03:08.921059
3398	2	9	45	2	\N	2017-10-02	-37.14	a87	2020-10-29 19:03:08.922326	2020-10-29 19:03:08.922326
3399	2	9	45	2	\N	2017-10-02	-20.81	a87	2020-10-29 19:03:08.923506	2020-10-29 19:03:08.923506
3400	2	9	45	2	\N	2017-10-02	-83.66	258	2020-10-29 19:03:08.924741	2020-10-29 19:03:08.924741
3401	2	10	51	3	\N	2017-10-02	-1500.00	4b3	2020-10-29 19:03:08.925903	2020-10-29 19:03:08.925903
3402	5	10	51	4	\N	2017-10-02	1500.00	4b3	2020-10-29 19:03:08.927006	2020-10-29 19:03:08.927006
3403	2	10	51	3	\N	2017-10-02	-2000.00	68d	2020-10-29 19:03:08.92824	2020-10-29 19:03:08.92824
3404	6	10	51	4	\N	2017-10-02	2000.00	68d	2020-10-29 19:03:08.929459	2020-10-29 19:03:08.929459
3405	2	9	44	2	\N	2017-10-02	-60.00	37d	2020-10-29 19:03:08.93085	2020-10-29 19:03:08.93085
3406	2	5	22	2	\N	2017-10-02	-40.00	237	2020-10-29 19:03:08.932321	2020-10-29 19:03:08.932321
3407	2	10	51	3	\N	2017-10-08	-300.00	68d	2020-10-29 19:03:08.933426	2020-10-29 19:03:08.933426
3408	4	10	51	4	\N	2017-10-08	300.00	68d	2020-10-29 19:03:08.934497	2020-10-29 19:03:08.934497
3409	5	4	-1	2	\N	2017-10-02	-590.00	de0	2020-10-29 19:03:08.935624	2020-10-29 19:03:08.935624
3410	5	4	10	2	\N	2017-10-02	-391.79	e70	2020-10-29 19:03:08.936741	2020-10-29 19:03:08.936741
3411	5	4	12	2	\N	2017-10-02	-122.89	c5a	2020-10-29 19:03:08.938029	2020-10-29 19:03:08.938029
3412	2	9	-1	2	\N	2017-10-03	-148.90	fd2	2020-10-29 19:03:08.939251	2020-10-29 19:03:08.939251
3413	5	1	5	2	\N	2017-10-03	-11.48	a1f	2020-10-29 19:03:08.940485	2020-10-29 19:03:08.940485
3414	1	8	38	2	\N	2017-10-03	-46.00	a3a	2020-10-29 19:03:08.941767	2020-10-29 19:03:08.941767
3415	5	7	27	2	\N	2017-10-04	-200.00	1e9	2020-10-29 19:03:08.943007	2020-10-29 19:03:08.943007
3416	2	9	-1	2	\N	2017-10-04	-72.00	250	2020-10-29 19:03:08.944183	2020-10-29 19:03:08.944183
3417	6	10	51	3	\N	2017-10-04	-10000.00	dcf	2020-10-29 19:03:08.945417	2020-10-29 19:03:08.945417
3418	5	10	51	4	\N	2017-10-04	10000.00	dcf	2020-10-29 19:03:08.946862	2020-10-29 19:03:08.946862
3419	5	10	51	3	\N	2017-10-04	-500.00	3aa	2020-10-29 19:03:08.948459	2020-10-29 19:03:08.948459
3420	5	10	51	3	\N	2017-10-04	-1000.00	cd2	2020-10-29 19:03:08.949631	2020-10-29 19:03:08.949631
3421	5	1	-1	2	\N	2017-10-04	-99.00	95c	2020-10-29 19:03:08.950751	2020-10-29 19:03:08.950751
3422	5	10	51	4	\N	2017-10-04	5500.00	c82	2020-10-29 19:03:08.951957	2020-10-29 19:03:08.951957
3423	1	5	22	2	\N	2017-10-07	-40.00	09f	2020-10-29 19:03:08.953236	2020-10-29 19:03:08.953236
3424	5	1	5	2	\N	2017-10-07	-8.10	473	2020-10-29 19:03:08.954582	2020-10-29 19:03:08.954582
3425	5	1	5	2	\N	2017-10-07	-10.16	ecf	2020-10-29 19:03:08.955914	2020-10-29 19:03:08.955914
3426	5	1	5	2	\N	2017-10-07	-67.34	e5f	2020-10-29 19:03:08.957081	2020-10-29 19:03:08.957081
3427	5	10	51	3	\N	2017-10-09	-2500.00	355	2020-10-29 19:03:08.958176	2020-10-29 19:03:08.958176
3428	5	1	5	2	\N	2017-10-08	-59.02	440	2020-10-29 19:03:08.959301	2020-10-29 19:03:08.959301
3429	2	1	5	1	\N	2017-10-08	59.02	9bc	2020-10-29 19:03:08.960433	2020-10-29 19:03:08.960433
3430	2	9	44	2	\N	2017-10-08	-50.00	f99	2020-10-29 19:03:08.962295	2020-10-29 19:03:08.962295
3431	5	1	5	2	\N	2017-10-09	-68.62	a4a	2020-10-29 19:03:08.963577	2020-10-29 19:03:08.963577
3432	1	1	7	2	\N	2017-10-10	-2.80	73e	2020-10-29 19:03:08.96538	2020-10-29 19:03:08.96538
3433	1	7	33	2	\N	2017-10-10	-58.03	96a	2020-10-29 19:03:08.966708	2020-10-29 19:03:08.966708
3434	5	10	51	4	\N	2017-10-11	2500.00	ad3	2020-10-29 19:03:08.968497	2020-10-29 19:03:08.968497
3435	1	1	7	2	\N	2017-10-11	-16.15	732	2020-10-29 19:03:08.969761	2020-10-29 19:03:08.969761
3436	6	10	51	4	\N	2017-10-11	1800.00	f19	2020-10-29 19:03:08.971035	2020-10-29 19:03:08.971035
3437	1	10	51	4	\N	2017-10-11	200.00	f89	2020-10-29 19:03:08.972226	2020-10-29 19:03:08.972226
3438	5	10	51	3	\N	2017-10-11	-2500.00	725	2020-10-29 19:03:08.97332	2020-10-29 19:03:08.97332
3439	1	1	8	2	\N	2017-10-13	-2.20	533	2020-10-29 19:03:08.974559	2020-10-29 19:03:08.974559
3440	1	7	28	2	\N	2017-10-12	-27.00	acb	2020-10-29 19:03:08.975796	2020-10-29 19:03:08.975796
3441	1	1	7	2	\N	2017-10-13	-17.64	e33	2020-10-29 19:03:08.977004	2020-10-29 19:03:08.977004
3442	1	8	41	2	\N	2017-10-12	-20.96	af0	2020-10-29 19:03:08.978296	2020-10-29 19:03:08.978296
3443	1	1	4	2	\N	2017-10-12	-12.00	bd8	2020-10-29 19:03:08.979384	2020-10-29 19:03:08.979384
3444	5	1	5	2	\N	2017-10-13	-3.90	c22	2020-10-29 19:03:08.980574	2020-10-29 19:03:08.980574
3445	1	9	45	2	\N	2017-10-13	-15.00	3f2	2020-10-29 19:03:08.982304	2020-10-29 19:03:08.982304
3446	5	5	20	2	\N	2017-10-14	-19.99	e2b	2020-10-29 19:03:08.983814	2020-10-29 19:03:08.983814
3447	5	1	5	2	\N	2017-10-14	-30.68	7f1	2020-10-29 19:03:08.985275	2020-10-29 19:03:08.985275
3448	5	1	8	2	\N	2017-10-15	-0.59	613	2020-10-29 19:03:08.986908	2020-10-29 19:03:08.986908
3449	5	1	5	2	\N	2017-10-14	-79.92	e5f	2020-10-29 19:03:08.988555	2020-10-29 19:03:08.988555
3450	5	1	5	2	\N	2017-10-14	-12.30	473	2020-10-29 19:03:08.989778	2020-10-29 19:03:08.989778
3451	1	2	2	3	\N	2017-10-14	-19.70	f2e	2020-10-29 19:03:08.99101	2020-10-29 19:03:08.99101
3452	1	2	2	4	\N	2017-10-14	19.70	b6c	2020-10-29 19:03:08.99238	2020-10-29 19:03:08.99238
3453	5	2	2	4	\N	2017-10-14	19.70	b6c	2020-10-29 19:03:08.993625	2020-10-29 19:03:08.993625
3454	2	5	18	2	\N	2017-10-14	-80.80	2b4	2020-10-29 19:03:08.994777	2020-10-29 19:03:08.994777
3455	2	5	23	2	\N	2017-10-14	-8.58	e48	2020-10-29 19:03:08.995931	2020-10-29 19:03:08.995931
3456	2	3	-1	2	\N	2017-10-14	-16.00	9ef	2020-10-29 19:03:08.997275	2020-10-29 19:03:08.997275
3457	2	8	38	2	\N	2017-10-14	-5.60	99e	2020-10-29 19:03:08.998523	2020-10-29 19:03:08.998523
3458	2	8	38	2	\N	2017-10-14	-50.00	9f9	2020-10-29 19:03:08.999815	2020-10-29 19:03:08.999815
3459	2	9	-1	2	\N	2017-10-14	-200.00	e96	2020-10-29 19:03:09.001065	2020-10-29 19:03:09.001065
3460	2	9	-1	2	\N	2017-10-14	-200.00	897	2020-10-29 19:03:09.002339	2020-10-29 19:03:09.002339
3461	2	9	-1	1	\N	2017-10-15	12669.74	36a	2020-10-29 19:03:09.003626	2020-10-29 19:03:09.003626
3462	2	9	-1	2	\N	2017-10-15	-10000.00	813	2020-10-29 19:03:09.004808	2020-10-29 19:03:09.004808
3463	2	9	-1	2	\N	2017-10-16	-688.63	813	2020-10-29 19:03:09.005903	2020-10-29 19:03:09.005903
3464	5	5	23	2	\N	2017-10-17	-18.55	fe7	2020-10-29 19:03:09.007037	2020-10-29 19:03:09.007037
3465	1	1	4	2	\N	2017-10-19	-6.35	dc1	2020-10-29 19:03:09.008502	2020-10-29 19:03:09.008502
3466	1	1	8	2	\N	2017-10-19	-4.40	a24	2020-10-29 19:03:09.009766	2020-10-29 19:03:09.009766
3467	5	1	5	2	\N	2017-10-21	-6.50	caf	2020-10-29 19:03:09.010919	2020-10-29 19:03:09.010919
3468	5	1	5	2	\N	2017-10-21	-17.80	473	2020-10-29 19:03:09.012384	2020-10-29 19:03:09.012384
3469	5	1	5	2	\N	2017-10-21	-9.90	d9a	2020-10-29 19:03:09.01357	2020-10-29 19:03:09.01357
3470	5	1	5	2	\N	2017-10-21	-159.18	e5f	2020-10-29 19:03:09.015099	2020-10-29 19:03:09.015099
3471	5	8	40	2	\N	2017-10-21	-226.26	225	2020-10-29 19:03:09.016493	2020-10-29 19:03:09.016493
3472	2	4	13	2	\N	2017-10-23	-19.99	f2b	2020-10-29 19:03:09.017725	2020-10-29 19:03:09.017725
3473	5	1	4	2	\N	2017-10-25	-7.59	935	2020-10-29 19:03:09.018909	2020-10-29 19:03:09.018909
3474	5	5	20	2	\N	2017-10-25	-22.98	f40	2020-10-29 19:03:09.020242	2020-10-29 19:03:09.020242
3475	5	8	40	2	\N	2017-10-25	-69.00	138	2020-10-29 19:03:09.021316	2020-10-29 19:03:09.021316
3476	1	1	4	2	\N	2017-10-27	-2.00	a4a	2020-10-29 19:03:09.022379	2020-10-29 19:03:09.022379
3477	5	1	5	2	\N	2017-10-28	-19.59	63a	2020-10-29 19:03:09.02358	2020-10-29 19:03:09.02358
3478	5	1	5	2	\N	2017-10-26	-15.26	63a	2020-10-29 19:03:09.024976	2020-10-29 19:03:09.024976
3479	5	8	40	2	\N	2017-10-29	-87.60	129	2020-10-29 19:03:09.026339	2020-10-29 19:03:09.026339
3480	1	1	7	2	\N	2017-10-30	-9.69	732	2020-10-29 19:03:09.027523	2020-10-29 19:03:09.027523
3481	5	1	5	2	\N	2017-10-30	-18.23	7d2	2020-10-29 19:03:09.028738	2020-10-29 19:03:09.028738
3482	5	1	5	2	\N	2017-10-30	-76.88	6ee	2020-10-29 19:03:09.029963	2020-10-29 19:03:09.029963
3483	1	1	4	2	\N	2017-10-31	-2.00	a4a	2020-10-29 19:03:09.031626	2020-10-29 19:03:09.031626
3484	1	1	7	2	\N	2017-10-31	-15.49	b98	2020-10-29 19:03:09.032895	2020-10-29 19:03:09.032895
3485	1	1	7	2	\N	2017-10-30	-13.97	b98	2020-10-29 19:03:09.034012	2020-10-29 19:03:09.034012
3486	1	2	1	1	\N	2017-10-30	8722.94	cd7	2020-10-29 19:03:09.035168	2020-10-29 19:03:09.035168
3487	5	1	5	2	\N	2017-10-31	-16.49	7d2	2020-10-29 19:03:09.036322	2020-10-29 19:03:09.036322
3488	5	7	30	3	\N	2017-10-31	-15.00	1c5	2020-10-29 19:03:09.038056	2020-10-29 19:03:09.038056
3489	1	2	2	4	\N	2017-10-31	15.00	1c5	2020-10-29 19:03:09.039167	2020-10-29 19:03:09.039167
3490	1	10	51	3	\N	2017-10-31	-500.00	f8c	2020-10-29 19:03:09.040302	2020-10-29 19:03:09.040302
3491	2	9	44	2	\N	2017-10-23	-100.00	e15	2020-10-29 19:03:09.041559	2020-10-29 19:03:09.041559
3492	2	2	1	1	\N	2017-10-31	5720.58	b6d	2020-10-29 19:03:09.042713	2020-10-29 19:03:09.042713
3493	2	10	51	2	\N	2017-10-31	-1500.00	df9	2020-10-29 19:03:09.043767	2020-10-29 19:03:09.043767
3494	5	10	51	1	\N	2017-10-31	1500.00	df9	2020-10-29 19:03:09.044826	2020-10-29 19:03:09.044826
3495	2	10	51	2	\N	2017-10-31	-2000.00	8ad	2020-10-29 19:03:09.046106	2020-10-29 19:03:09.046106
3496	5	10	51	1	\N	2017-10-31	2000.00	8ad	2020-10-29 19:03:09.047318	2020-10-29 19:03:09.047318
3497	2	4	15	2	\N	2017-10-31	-29.00	c3d	2020-10-29 19:03:09.048817	2020-10-29 19:03:09.048817
3498	5	4	13	2	\N	2017-10-31	-49.90	c82	2020-10-29 19:03:09.050068	2020-10-29 19:03:09.050068
3499	5	1	5	2	\N	2017-10-31	-8.24	762	2020-10-29 19:03:09.051244	2020-10-29 19:03:09.051244
3500	5	4	10	2	\N	2017-10-31	-391.79	acf	2020-10-29 19:03:09.052769	2020-10-29 19:03:09.052769
3501	5	4	-1	2	\N	2017-10-31	-590.00	fb8	2020-10-29 19:03:09.054007	2020-10-29 19:03:09.054007
3502	5	4	12	2	\N	2017-10-31	-133.16	8a4	2020-10-29 19:03:09.055245	2020-10-29 19:03:09.055245
3503	5	4	11	2	\N	2017-10-31	-170.49	bca	2020-10-29 19:03:09.05631	2020-10-29 19:03:09.05631
3504	5	10	52	1	\N	2017-10-31	93.74	b40	2020-10-29 19:03:09.057433	2020-10-29 19:03:09.057433
3505	5	9	-1	2	\N	2017-11-01	-15.80	8c7	2020-10-29 19:03:09.058766	2020-10-29 19:03:09.058766
3506	1	2	2	1	\N	2017-11-01	21.47	8c7	2020-10-29 19:03:09.059785	2020-10-29 19:03:09.059785
3507	1	9	46	3	\N	2017-11-01	-102.00	ee3	2020-10-29 19:03:09.06102	2020-10-29 19:03:09.06102
3508	1	8	38	2	\N	2017-11-01	-46.00	912	2020-10-29 19:03:09.062697	2020-10-29 19:03:09.062697
3509	1	10	51	3	\N	2017-11-02	-7000.00	ef9	2020-10-29 19:03:09.063909	2020-10-29 19:03:09.063909
3510	2	10	51	3	\N	2017-11-01	-700.00	dc6	2020-10-29 19:03:09.065263	2020-10-29 19:03:09.065263
3511	4	10	51	4	\N	2017-11-01	700.00	dc6	2020-10-29 19:03:09.066588	2020-10-29 19:03:09.066588
3512	2	2	2	1	\N	2017-11-01	350.00	09c	2020-10-29 19:03:09.067668	2020-10-29 19:03:09.067668
3513	5	4	-1	2	\N	2017-11-02	-198.00	0f3	2020-10-29 19:03:09.069068	2020-10-29 19:03:09.069068
3514	1	9	45	2	\N	2017-11-02	-32.00	29a	2020-10-29 19:03:09.070244	2020-10-29 19:03:09.070244
3515	1	4	15	2	\N	2017-11-02	-29.00	17c	2020-10-29 19:03:09.071276	2020-10-29 19:03:09.071276
3516	5	1	8	2	\N	2017-11-02	-3.97	d8e	2020-10-29 19:03:09.072347	2020-10-29 19:03:09.072347
3517	5	1	5	2	\N	2017-11-02	-56.67	8c3	2020-10-29 19:03:09.073416	2020-10-29 19:03:09.073416
3518	5	1	-1	2	\N	2017-11-02	-109.40	f43	2020-10-29 19:03:09.074495	2020-10-29 19:03:09.074495
3519	1	3	-1	2	\N	2017-11-03	-79.99	498	2020-10-29 19:03:09.075539	2020-10-29 19:03:09.075539
3520	5	1	8	2	\N	2017-11-04	-15.68	c4b	2020-10-29 19:03:09.07661	2020-10-29 19:03:09.07661
3521	5	1	5	2	\N	2017-11-04	-83.71	bee	2020-10-29 19:03:09.07766	2020-10-29 19:03:09.07766
3522	1	9	45	2	\N	2017-11-04	-25.00	3f2	2020-10-29 19:03:09.078779	2020-10-29 19:03:09.078779
3523	5	1	5	2	\N	2017-11-04	-10.70	473	2020-10-29 19:03:09.079966	2020-10-29 19:03:09.079966
3524	5	1	5	2	\N	2017-11-04	-6.00	caf	2020-10-29 19:03:09.081481	2020-10-29 19:03:09.081481
3525	5	1	5	2	\N	2017-11-03	-21.02	576	2020-10-29 19:03:09.083413	2020-10-29 19:03:09.083413
3526	2	3	-1	2	\N	2017-11-03	-21.48	645	2020-10-29 19:03:09.084798	2020-10-29 19:03:09.084798
3527	5	1	5	2	\N	2017-11-04	-10.80	08f	2020-10-29 19:03:09.086124	2020-10-29 19:03:09.086124
3528	5	1	-1	2	\N	2017-11-04	-21.98	744	2020-10-29 19:03:09.087399	2020-10-29 19:03:09.087399
3529	2	5	18	2	\N	2017-11-08	-29.99	bbe	2020-10-29 19:03:09.088737	2020-10-29 19:03:09.088737
3530	2	9	45	2	\N	2017-11-08	-89.94	b4e	2020-10-29 19:03:09.090175	2020-10-29 19:03:09.090175
3531	2	6	24	2	\N	2017-11-08	-139.00	4f9	2020-10-29 19:03:09.091524	2020-10-29 19:03:09.091524
3532	2	2	1	1	\N	2017-11-09	1005.40	41c	2020-10-29 19:03:09.092776	2020-10-29 19:03:09.092776
3533	5	1	5	2	\N	2017-11-09	-14.90	4c9	2020-10-29 19:03:09.094116	2020-10-29 19:03:09.094116
3534	2	10	51	3	\N	2017-11-09	-500.00	375	2020-10-29 19:03:09.095254	2020-10-29 19:03:09.095254
3535	4	10	51	4	\N	2017-11-09	500.00	375	2020-10-29 19:03:09.096948	2020-10-29 19:03:09.096948
3536	2	10	51	3	\N	2017-11-09	-1500.00	210	2020-10-29 19:03:09.098464	2020-10-29 19:03:09.098464
3537	6	10	51	4	\N	2017-11-09	1500.00	210	2020-10-29 19:03:09.100057	2020-10-29 19:03:09.100057
3538	5	10	51	4	\N	2017-11-10	5500.00	039	2020-10-29 19:03:09.1014	2020-10-29 19:03:09.1014
3539	5	10	51	3	\N	2017-11-10	-2500.00	039	2020-10-29 19:03:09.103232	2020-10-29 19:03:09.103232
3540	5	10	51	4	\N	2017-11-13	2500.00	ed6	2020-10-29 19:03:09.104722	2020-10-29 19:03:09.104722
3541	5	10	51	3	\N	2017-11-10	-1000.00	cd2	2020-10-29 19:03:09.106366	2020-10-29 19:03:09.106366
3542	5	10	51	3	\N	2017-11-10	-500.00	3aa	2020-10-29 19:03:09.107908	2020-10-29 19:03:09.107908
3543	5	1	5	2	\N	2017-11-10	-108.29	6ee	2020-10-29 19:03:09.109106	2020-10-29 19:03:09.109106
3544	5	1	5	2	\N	2017-11-10	-14.49	564	2020-10-29 19:03:09.110348	2020-10-29 19:03:09.110348
3545	5	1	5	2	\N	2017-11-10	-16.20	473	2020-10-29 19:03:09.111436	2020-10-29 19:03:09.111436
3546	5	1	6	2	\N	2017-11-10	-65.00	79e	2020-10-29 19:03:09.112528	2020-10-29 19:03:09.112528
3547	5	1	5	2	\N	2017-11-13	-60.00	236	2020-10-29 19:03:09.113594	2020-10-29 19:03:09.113594
3548	2	1	5	1	\N	2017-11-13	120.00	7a5	2020-10-29 19:03:09.114859	2020-10-29 19:03:09.114859
3549	5	5	19	2	\N	2017-11-10	-210.00	fac	2020-10-29 19:03:09.116485	2020-10-29 19:03:09.116485
3550	1	1	8	2	\N	2017-11-08	-4.79	2a1	2020-10-29 19:03:09.117804	2020-10-29 19:03:09.117804
3551	1	1	7	2	\N	2017-11-07	-15.00	bd5	2020-10-29 19:03:09.119036	2020-10-29 19:03:09.119036
3552	1	1	4	2	\N	2017-11-07	-2.00	fad	2020-10-29 19:03:09.120443	2020-10-29 19:03:09.120443
3553	1	3	-1	2	\N	2017-11-11	-11.67	e73	2020-10-29 19:03:09.121728	2020-10-29 19:03:09.121728
3554	5	1	5	2	\N	2017-11-12	-62.23	8c3	2020-10-29 19:03:09.123043	2020-10-29 19:03:09.123043
3555	5	8	40	2	\N	2017-11-12	-10.00	50d	2020-10-29 19:03:09.12422	2020-10-29 19:03:09.12422
3556	2	4	13	2	\N	2017-11-13	-19.99	54d	2020-10-29 19:03:09.125281	2020-10-29 19:03:09.125281
3557	5	10	51	3	\N	2017-11-18	-500.00	3aa	2020-10-29 19:03:09.126322	2020-10-29 19:03:09.126322
3558	5	10	51	3	\N	2017-11-18	-200.00	5bc	2020-10-29 19:03:09.127482	2020-10-29 19:03:09.127482
3559	1	10	51	4	\N	2017-11-18	200.00	5bc	2020-10-29 19:03:09.128807	2020-10-29 19:03:09.128807
3560	1	10	51	3	\N	2017-11-18	-500.00	3ee	2020-10-29 19:03:09.130174	2020-10-29 19:03:09.130174
3561	6	10	51	4	\N	2017-11-18	500.00	3ee	2020-10-29 19:03:09.131485	2020-10-29 19:03:09.131485
3562	1	5	19	2	\N	2017-11-13	-90.00	a7a	2020-10-29 19:03:09.132848	2020-10-29 19:03:09.132848
3563	1	1	4	2	\N	2017-11-13	-11.67	4a2	2020-10-29 19:03:09.134077	2020-10-29 19:03:09.134077
3564	1	1	7	2	\N	2017-11-17	-13.51	b98	2020-10-29 19:03:09.135255	2020-10-29 19:03:09.135255
3565	5	1	5	2	\N	2017-11-18	-114.66	bee	2020-10-29 19:03:09.136337	2020-10-29 19:03:09.136337
3566	5	1	5	2	\N	2017-11-18	-10.90	f13	2020-10-29 19:03:09.137417	2020-10-29 19:03:09.137417
3567	5	1	5	2	\N	2017-11-18	-24.05	2c6	2020-10-29 19:03:09.138582	2020-10-29 19:03:09.138582
3568	5	1	5	2	\N	2017-11-16	-4.74	8c3	2020-10-29 19:03:09.139934	2020-10-29 19:03:09.139934
3569	5	1	5	2	\N	2017-11-13	-22.96	8c3	2020-10-29 19:03:09.141095	2020-10-29 19:03:09.141095
3570	5	5	20	2	\N	2017-11-14	-2.99	b1f	2020-10-29 19:03:09.14226	2020-10-29 19:03:09.14226
3571	5	1	5	2	\N	2017-11-17	-10.74	c22	2020-10-29 19:03:09.143379	2020-10-29 19:03:09.143379
3572	5	1	4	2	\N	2017-11-17	-4.79	3f5	2020-10-29 19:03:09.144521	2020-10-29 19:03:09.144521
3573	5	1	5	2	\N	2017-11-17	-1.18	f13	2020-10-29 19:03:09.145553	2020-10-29 19:03:09.145553
3574	5	1	8	2	\N	2017-11-14	-3.99	45b	2020-10-29 19:03:09.146741	2020-10-29 19:03:09.146741
3575	5	9	-1	2	\N	2017-11-16	-52.84	6e5	2020-10-29 19:03:09.148424	2020-10-29 19:03:09.148424
3576	5	1	5	2	\N	2017-11-17	-8.79	8c3	2020-10-29 19:03:09.14971	2020-10-29 19:03:09.14971
3577	1	3	-1	2	\N	2017-11-18	-88.00	8ce	2020-10-29 19:03:09.150772	2020-10-29 19:03:09.150772
3578	5	1	5	2	\N	2017-11-18	-204.22	e1e	2020-10-29 19:03:09.151844	2020-10-29 19:03:09.151844
3579	5	9	45	2	\N	2017-11-18	-35.20	0a6	2020-10-29 19:03:09.153101	2020-10-29 19:03:09.153101
3580	2	1	6	2	\N	2017-11-18	-17.58	03b	2020-10-29 19:03:09.154653	2020-10-29 19:03:09.154653
3581	2	9	-1	2	\N	2017-11-18	-400.00	f6e	2020-10-29 19:03:09.156026	2020-10-29 19:03:09.156026
3582	5	5	20	2	\N	2017-11-20	-19.99	b63	2020-10-29 19:03:09.157329	2020-10-29 19:03:09.157329
3583	5	5	20	2	\N	2017-11-22	-24.55	b1f	2020-10-29 19:03:09.158563	2020-10-29 19:03:09.158563
3584	5	1	5	2	\N	2017-11-22	-6.77	7d2	2020-10-29 19:03:09.160076	2020-10-29 19:03:09.160076
3585	5	2	2	1	\N	2017-11-22	150.00	c4a	2020-10-29 19:03:09.161355	2020-10-29 19:03:09.161355
3586	1	9	48	2	\N	2017-11-23	-100.00	bbb	2020-10-29 19:03:09.162624	2020-10-29 19:03:09.162624
3587	1	1	7	2	\N	2017-11-25	-2.80	7b3	2020-10-29 19:03:09.163786	2020-10-29 19:03:09.163786
3588	1	1	8	2	\N	2017-11-25	-2.20	d70	2020-10-29 19:03:09.165267	2020-10-29 19:03:09.165267
3589	5	1	4	2	\N	2017-11-25	-11.88	23d	2020-10-29 19:03:09.166729	2020-10-29 19:03:09.166729
3590	5	1	5	2	\N	2017-11-25	-179.93	7d2	2020-10-29 19:03:09.167983	2020-10-29 19:03:09.167983
3591	1	1	5	2	\N	2017-11-25	-79.93	7d2	2020-10-29 19:03:09.169152	2020-10-29 19:03:09.169152
3592	1	1	5	2	\N	2017-11-25	-14.60	f13	2020-10-29 19:03:09.170341	2020-10-29 19:03:09.170341
3593	1	1	8	2	\N	2017-11-25	-19.04	c30	2020-10-29 19:03:09.171546	2020-10-29 19:03:09.171546
3594	5	1	5	2	\N	2017-11-25	-18.69	564	2020-10-29 19:03:09.172713	2020-10-29 19:03:09.172713
3595	5	1	5	2	\N	2017-11-25	-8.00	e13	2020-10-29 19:03:09.173874	2020-10-29 19:03:09.173874
3596	5	1	5	2	\N	2017-11-25	-11.47	8c3	2020-10-29 19:03:09.175077	2020-10-29 19:03:09.175077
3597	1	3	-1	2	\N	2017-11-25	-20.00	ed3	2020-10-29 19:03:09.176201	2020-10-29 19:03:09.176201
3598	5	4	13	2	\N	2017-11-27	-49.90	97a	2020-10-29 19:03:09.17739	2020-10-29 19:03:09.17739
3599	2	4	13	2	\N	2017-11-27	-19.99	54d	2020-10-29 19:03:09.178701	2020-10-29 19:03:09.178701
3600	2	6	24	1	\N	2017-11-25	139.00	3de	2020-10-29 19:03:09.180035	2020-10-29 19:03:09.180035
3601	2	3	-1	1	\N	2017-11-26	20.00	522	2020-10-29 19:03:09.181262	2020-10-29 19:03:09.181262
3602	2	3	-1	2	\N	2017-11-24	-10.00	487	2020-10-29 19:03:09.182653	2020-10-29 19:03:09.182653
3603	2	3	-1	2	\N	2017-11-26	-20.00	e90	2020-10-29 19:03:09.183902	2020-10-29 19:03:09.183902
3604	2	1	5	2	\N	2017-11-24	-5.00	962	2020-10-29 19:03:09.184997	2020-10-29 19:03:09.184997
3605	2	1	5	2	\N	2017-11-24	-34.00	5f0	2020-10-29 19:03:09.186313	2020-10-29 19:03:09.186313
3606	5	9	45	2	\N	2017-11-24	-20.00	ac9	2020-10-29 19:03:09.187424	2020-10-29 19:03:09.187424
3607	2	8	41	2	\N	2017-11-24	-13.00	b97	2020-10-29 19:03:09.188484	2020-10-29 19:03:09.188484
3608	2	9	-1	2	\N	2017-11-24	-480.00	da3	2020-10-29 19:03:09.189492	2020-10-29 19:03:09.189492
3609	2	9	-1	2	\N	2017-11-24	-509.30	867	2020-10-29 19:03:09.190555	2020-10-29 19:03:09.190555
3610	5	5	18	2	\N	2017-11-27	-12.27	0f2	2020-10-29 19:03:09.191652	2020-10-29 19:03:09.191652
3611	1	5	18	2	\N	2017-11-27	-11.98	4a9	2020-10-29 19:03:09.192709	2020-10-29 19:03:09.192709
3612	1	9	45	2	\N	2017-11-27	-374.80	74b	2020-10-29 19:03:09.193814	2020-10-29 19:03:09.193814
3613	1	2	1	1	\N	2017-11-28	10242.17	9f8	2020-10-29 19:03:09.194869	2020-10-29 19:03:09.194869
3614	1	10	51	3	\N	2017-11-29	-500.00	506	2020-10-29 19:03:09.196011	2020-10-29 19:03:09.196011
3615	1	1	8	2	\N	2017-11-28	-2.20	a00	2020-10-29 19:03:09.1971	2020-10-29 19:03:09.1971
3616	2	2	1	1	\N	2017-11-29	5598.60	8c1	2020-10-29 19:03:09.198537	2020-10-29 19:03:09.198537
3617	2	2	2	1	\N	2017-11-29	300.00	bdf	2020-10-29 19:03:09.19968	2020-10-29 19:03:09.19968
3618	2	6	24	2	\N	2017-11-29	-25.00	520	2020-10-29 19:03:09.20074	2020-10-29 19:03:09.20074
3619	2	8	41	2	\N	2017-12-01	-30.00	121	2020-10-29 19:03:09.202061	2020-10-29 19:03:09.202061
3620	2	1	6	2	\N	2017-12-01	-10.40	793	2020-10-29 19:03:09.203208	2020-10-29 19:03:09.203208
3621	5	1	5	2	\N	2017-12-01	-10.98	c22	2020-10-29 19:03:09.204298	2020-10-29 19:03:09.204298
3622	2	1	5	2	\N	2017-12-01	-9.70	f13	2020-10-29 19:03:09.205495	2020-10-29 19:03:09.205495
3623	2	1	5	2	\N	2017-12-01	-24.60	cf2	2020-10-29 19:03:09.206763	2020-10-29 19:03:09.206763
3624	2	9	45	2	\N	2017-12-01	-54.99	237	2020-10-29 19:03:09.207886	2020-10-29 19:03:09.207886
3625	2	1	5	2	\N	2017-12-01	-7.56	54f	2020-10-29 19:03:09.209188	2020-10-29 19:03:09.209188
3626	5	1	5	2	\N	2017-12-01	-13.41	ed8	2020-10-29 19:03:09.210365	2020-10-29 19:03:09.210365
3627	2	4	15	2	\N	2017-12-01	-29.00	805	2020-10-29 19:03:09.211562	2020-10-29 19:03:09.211562
3628	2	10	51	3	\N	2017-12-01	-1500.00	e09	2020-10-29 19:03:09.212663	2020-10-29 19:03:09.212663
3629	5	10	51	4	\N	2017-12-01	1500.00	e09	2020-10-29 19:03:09.214026	2020-10-29 19:03:09.214026
3630	2	10	51	3	\N	2017-12-01	-2000.00	cfd	2020-10-29 19:03:09.215412	2020-10-29 19:03:09.215412
3631	6	10	51	4	\N	2017-12-01	2000.00	cfd	2020-10-29 19:03:09.216697	2020-10-29 19:03:09.216697
3632	5	4	10	2	\N	2017-12-01	-391.79	297	2020-10-29 19:03:09.217894	2020-10-29 19:03:09.217894
3633	5	4	12	2	\N	2017-12-01	-133.16	02c	2020-10-29 19:03:09.219594	2020-10-29 19:03:09.219594
3634	5	4	-1	2	\N	2017-12-01	-590.00	597	2020-10-29 19:03:09.220865	2020-10-29 19:03:09.220865
3635	2	9	46	2	\N	2017-12-01	-11.00	276	2020-10-29 19:03:09.222023	2020-10-29 19:03:09.222023
3636	5	9	46	2	\N	2017-12-03	-15.00	1c5	2020-10-29 19:03:09.223113	2020-10-29 19:03:09.223113
3637	1	2	2	4	\N	2017-11-30	15.00	1c5	2020-10-29 19:03:09.224243	2020-10-29 19:03:09.224243
3638	1	9	48	2	\N	2017-11-30	-100.00	bbb	2020-10-29 19:03:09.225325	2020-10-29 19:03:09.225325
3639	5	5	20	2	\N	2017-11-29	-37.46	f40	2020-10-29 19:03:09.226356	2020-10-29 19:03:09.226356
3640	1	3	-1	2	\N	2017-12-02	-35.06	8ea	2020-10-29 19:03:09.227432	2020-10-29 19:03:09.227432
3641	1	1	4	2	\N	2017-12-02	-5.99	5a2	2020-10-29 19:03:09.22855	2020-10-29 19:03:09.22855
3642	5	1	5	2	\N	2017-12-03	-99.76	a4a	2020-10-29 19:03:09.229714	2020-10-29 19:03:09.229714
3643	1	10	51	3	\N	2017-12-01	-7000.00	4d1	2020-10-29 19:03:09.23087	2020-10-29 19:03:09.23087
3644	1	8	41	2	\N	2017-12-02	-15.47	1b6	2020-10-29 19:03:09.232289	2020-10-29 19:03:09.232289
3645	1	1	7	2	\N	2017-12-04	-5.60	73e	2020-10-29 19:03:09.233477	2020-10-29 19:03:09.233477
3646	1	1	7	2	\N	2017-12-04	-13.73	e33	2020-10-29 19:03:09.234581	2020-10-29 19:03:09.234581
3647	1	3	-1	2	\N	2017-12-04	-271.00	f89	2020-10-29 19:03:09.236156	2020-10-29 19:03:09.236156
3648	1	4	15	2	\N	2017-12-03	-19.00	de2	2020-10-29 19:03:09.23726	2020-10-29 19:03:09.23726
3649	5	1	5	2	\N	2017-12-03	-10.74	d9a	2020-10-29 19:03:09.238295	2020-10-29 19:03:09.238295
3650	1	9	-1	3	\N	2017-12-03	-230.86	746	2020-10-29 19:03:09.23964	2020-10-29 19:03:09.23964
3651	5	2	2	4	\N	2017-12-03	230.86	746	2020-10-29 19:03:09.24088	2020-10-29 19:03:09.24088
3652	1	9	-1	2	\N	2017-12-03	-11.13	937	2020-10-29 19:03:09.242021	2020-10-29 19:03:09.242021
3653	1	9	-1	3	\N	2017-12-03	-88.08	746	2020-10-29 19:03:09.243057	2020-10-29 19:03:09.243057
3654	6	10	52	1	\N	2017-12-03	91.59	c5a	2020-10-29 19:03:09.244122	2020-10-29 19:03:09.244122
3655	1	9	45	2	\N	2017-12-04	-30.00	913	2020-10-29 19:03:09.245186	2020-10-29 19:03:09.245186
3656	5	10	51	4	\N	2017-12-04	5500.00	c86	2020-10-29 19:03:09.246328	2020-10-29 19:03:09.246328
3657	6	10	51	4	\N	2017-12-04	30000.00	28d	2020-10-29 19:03:09.24771	2020-10-29 19:03:09.24771
3658	5	10	51	3	\N	2017-12-04	-1000.00	b4f	2020-10-29 19:03:09.249056	2020-10-29 19:03:09.249056
3659	5	10	51	3	\N	2017-12-04	-500.00	782	2020-10-29 19:03:09.250187	2020-10-29 19:03:09.250187
3660	1	8	38	2	\N	2017-12-07	-46.00	a3a	2020-10-29 19:03:09.251279	2020-10-29 19:03:09.251279
3661	1	4	15	2	\N	2017-12-05	-19.00	de2	2020-10-29 19:03:09.252631	2020-10-29 19:03:09.252631
3662	1	9	45	2	\N	2017-12-05	-45.76	4d2	2020-10-29 19:03:09.253814	2020-10-29 19:03:09.253814
3663	5	5	23	2	\N	2017-12-04	-9.99	fb9	2020-10-29 19:03:09.255101	2020-10-29 19:03:09.255101
3664	5	4	-1	2	\N	2017-12-07	-189.00	45a	2020-10-29 19:03:09.256556	2020-10-29 19:03:09.256556
3665	1	3	-1	2	\N	2017-12-07	-13.67	e73	2020-10-29 19:03:09.257679	2020-10-29 19:03:09.257679
3666	1	1	5	2	\N	2017-12-07	-14.46	2a5	2020-10-29 19:03:09.258728	2020-10-29 19:03:09.258728
3667	1	9	-1	3	\N	2017-12-07	-140.00	272	2020-10-29 19:03:09.259818	2020-10-29 19:03:09.259818
3668	5	1	5	2	\N	2017-12-11	-18.63	564	2020-10-29 19:03:09.260925	2020-10-29 19:03:09.260925
3669	5	1	5	2	\N	2017-12-11	-10.00	473	2020-10-29 19:03:09.262006	2020-10-29 19:03:09.262006
3670	5	1	5	2	\N	2017-12-11	-103.83	320	2020-10-29 19:03:09.263096	2020-10-29 19:03:09.263096
3671	5	9	45	2	\N	2017-12-11	-74.80	b7c	2020-10-29 19:03:09.264347	2020-10-29 19:03:09.264347
3672	5	9	45	2	\N	2017-12-11	-107.67	3ba	2020-10-29 19:03:09.266133	2020-10-29 19:03:09.266133
3673	1	1	8	2	\N	2017-12-11	-4.40	8be	2020-10-29 19:03:09.267335	2020-10-29 19:03:09.267335
3674	5	10	51	3	\N	2017-12-11	-500.00	7de	2020-10-29 19:03:09.268625	2020-10-29 19:03:09.268625
3675	5	10	51	3	\N	2017-12-11	-200.00	c9f	2020-10-29 19:03:09.270022	2020-10-29 19:03:09.270022
3676	1	10	51	4	\N	2017-12-11	200.00	c9f	2020-10-29 19:03:09.271399	2020-10-29 19:03:09.271399
3677	5	10	51	3	\N	2017-12-11	-1800.00	7d9	2020-10-29 19:03:09.272578	2020-10-29 19:03:09.272578
3678	6	10	51	4	\N	2017-12-11	1800.00	7d9	2020-10-29 19:03:09.273712	2020-10-29 19:03:09.273712
3679	1	10	51	3	\N	2017-12-11	-1368.64	3ee	2020-10-29 19:03:09.274827	2020-10-29 19:03:09.274827
3680	6	10	51	4	\N	2017-12-11	1368.64	3ee	2020-10-29 19:03:09.275904	2020-10-29 19:03:09.275904
3681	1	9	48	2	\N	2017-12-12	-20.00	a35	2020-10-29 19:03:09.276933	2020-10-29 19:03:09.276933
3682	5	1	5	2	\N	2017-12-12	-39.71	7d2	2020-10-29 19:03:09.278148	2020-10-29 19:03:09.278148
3683	2	1	7	2	\N	2017-12-15	-14.00	54f	2020-10-29 19:03:09.279213	2020-10-29 19:03:09.279213
3684	2	7	34	2	\N	2017-12-15	-10.67	9bd	2020-10-29 19:03:09.280323	2020-10-29 19:03:09.280323
3685	2	1	5	2	\N	2017-12-15	-12.76	244	2020-10-29 19:03:09.281642	2020-10-29 19:03:09.281642
3686	5	9	45	1	\N	2017-12-15	74.80	b7c	2020-10-29 19:03:09.282885	2020-10-29 19:03:09.282885
3687	1	1	4	2	\N	2017-12-14	-2.00	f60	2020-10-29 19:03:09.284041	2020-10-29 19:03:09.284041
3688	1	1	5	2	\N	2017-12-13	-5.37	85c	2020-10-29 19:03:09.285101	2020-10-29 19:03:09.285101
3689	1	5	18	2	\N	2017-12-16	-13.99	964	2020-10-29 19:03:09.286188	2020-10-29 19:03:09.286188
3690	1	1	7	2	\N	2017-12-14	-12.23	b98	2020-10-29 19:03:09.287254	2020-10-29 19:03:09.287254
3691	1	1	7	2	\N	2017-12-13	-16.82	b98	2020-10-29 19:03:09.28843	2020-10-29 19:03:09.28843
3692	5	1	5	2	\N	2017-12-16	-10.35	473	2020-10-29 19:03:09.289564	2020-10-29 19:03:09.289564
3693	5	1	5	2	\N	2017-12-16	-98.69	e5f	2020-10-29 19:03:09.290719	2020-10-29 19:03:09.290719
3694	5	1	4	2	\N	2017-12-15	-9.58	999	2020-10-29 19:03:09.291827	2020-10-29 19:03:09.291827
3695	1	7	32	2	\N	2017-12-17	-55.00	e93	2020-10-29 19:03:09.292902	2020-10-29 19:03:09.292902
3696	1	7	32	2	\N	2017-12-17	-70.00	8f8	2020-10-29 19:03:09.29396	2020-10-29 19:03:09.29396
3697	5	9	45	2	\N	2017-12-18	-63.89	36c	2020-10-29 19:03:09.294981	2020-10-29 19:03:09.294981
3698	5	9	45	2	\N	2017-12-18	-39.99	725	2020-10-29 19:03:09.29614	2020-10-29 19:03:09.29614
3699	5	5	20	2	\N	2017-12-18	-18.99	40e	2020-10-29 19:03:09.29724	2020-10-29 19:03:09.29724
3700	5	9	45	2	\N	2017-12-18	-32.99	98f	2020-10-29 19:03:09.298448	2020-10-29 19:03:09.298448
3701	1	5	20	2	\N	2017-12-18	-86.97	18d	2020-10-29 19:03:09.299639	2020-10-29 19:03:09.299639
3702	5	9	45	2	\N	2017-12-19	-65.93	f9b	2020-10-29 19:03:09.300748	2020-10-29 19:03:09.300748
3703	2	9	45	2	\N	2017-12-17	-26.98	e16	2020-10-29 19:03:09.302221	2020-10-29 19:03:09.302221
3704	2	9	45	2	\N	2017-12-17	-8.26	bd3	2020-10-29 19:03:09.303538	2020-10-29 19:03:09.303538
3705	2	1	6	2	\N	2017-12-17	-41.00	124	2020-10-29 19:03:09.304772	2020-10-29 19:03:09.304772
3706	2	1	7	2	\N	2017-12-15	-4.50	c00	2020-10-29 19:03:09.305912	2020-10-29 19:03:09.305912
3707	5	9	45	2	\N	2017-12-20	-94.99	54f	2020-10-29 19:03:09.307234	2020-10-29 19:03:09.307234
3708	2	3	-1	2	\N	2017-12-19	-10.00	d4e	2020-10-29 19:03:09.308453	2020-10-29 19:03:09.308453
3709	2	5	18	2	\N	2017-12-20	-12.98	11a	2020-10-29 19:03:09.309619	2020-10-29 19:03:09.309619
3710	5	1	5	2	\N	2017-12-20	-20.26	7b4	2020-10-29 19:03:09.310756	2020-10-29 19:03:09.310756
3711	5	1	5	2	\N	2017-12-20	-5.37	c22	2020-10-29 19:03:09.311772	2020-10-29 19:03:09.311772
3712	1	2	1	4	\N	2017-12-21	8722.94	e86	2020-10-29 19:03:09.312917	2020-10-29 19:03:09.312917
3713	1	10	51	3	\N	2017-12-21	-500.00	03c	2020-10-29 19:03:09.314079	2020-10-29 19:03:09.314079
3714	2	2	1	1	\N	2017-12-22	4645.08	ce1	2020-10-29 19:03:09.315784	2020-10-29 19:03:09.315784
3715	2	10	51	3	\N	2017-12-22	-1500.00	027	2020-10-29 19:03:09.31713	2020-10-29 19:03:09.31713
3716	5	10	51	4	\N	2017-12-22	1500.00	027	2020-10-29 19:03:09.318334	2020-10-29 19:03:09.318334
3717	2	9	-1	2	\N	2017-12-22	-2697.40	e72	2020-10-29 19:03:09.319415	2020-10-29 19:03:09.319415
3718	5	5	20	2	\N	2017-12-22	-9.50	ceb	2020-10-29 19:03:09.320662	2020-10-29 19:03:09.320662
3719	1	9	48	2	\N	2017-12-22	-100.00	bbb	2020-10-29 19:03:09.321803	2020-10-29 19:03:09.321803
3720	5	1	5	2	\N	2017-12-21	-8.14	473	2020-10-29 19:03:09.322934	2020-10-29 19:03:09.322934
3721	5	1	5	2	\N	2017-12-22	-35.48	7d2	2020-10-29 19:03:09.32402	2020-10-29 19:03:09.32402
3722	1	9	45	2	\N	2017-12-22	-79.99	d66	2020-10-29 19:03:09.325279	2020-10-29 19:03:09.325279
3723	6	10	51	3	\N	2017-12-23	-500.00	be7	2020-10-29 19:03:09.32656	2020-10-29 19:03:09.32656
3724	1	10	51	4	\N	2017-12-23	500.00	be7	2020-10-29 19:03:09.327798	2020-10-29 19:03:09.327798
3725	1	8	40	2	\N	2017-12-23	-143.33	abb	2020-10-29 19:03:09.329037	2020-10-29 19:03:09.329037
3726	1	9	-1	2	\N	2017-12-24	-53.50	daa	2020-10-29 19:03:09.330372	2020-10-29 19:03:09.330372
3727	1	9	-1	2	\N	2017-12-26	-20.00	13f	2020-10-29 19:03:09.33161	2020-10-29 19:03:09.33161
3728	1	9	-1	2	\N	2017-12-27	-50.00	769	2020-10-29 19:03:09.333021	2020-10-29 19:03:09.333021
3729	1	8	40	2	\N	2017-12-27	-126.59	62b	2020-10-29 19:03:09.334196	2020-10-29 19:03:09.334196
3730	5	1	5	2	\N	2017-12-27	-3.90	d9a	2020-10-29 19:03:09.335289	2020-10-29 19:03:09.335289
3731	5	9	45	2	\N	2017-12-27	-96.89	ab6	2020-10-29 19:03:09.336342	2020-10-29 19:03:09.336342
3732	5	4	13	2	\N	2017-12-27	-49.90	97a	2020-10-29 19:03:09.337388	2020-10-29 19:03:09.337388
3733	2	1	7	2	\N	2017-12-27	-18.66	258	2020-10-29 19:03:09.338499	2020-10-29 19:03:09.338499
3734	5	4	10	2	\N	2017-12-27	-391.79	297	2020-10-29 19:03:09.339768	2020-10-29 19:03:09.339768
3735	5	4	-1	2	\N	2017-12-27	-590.00	597	2020-10-29 19:03:09.341038	2020-10-29 19:03:09.341038
3736	5	4	12	2	\N	2017-12-27	-133.16	783	2020-10-29 19:03:09.342227	2020-10-29 19:03:09.342227
3737	1	1	5	2	\N	2017-12-28	-25.39	7d2	2020-10-29 19:03:09.34352	2020-10-29 19:03:09.34352
3738	1	1	5	2	\N	2017-12-28	-7.50	473	2020-10-29 19:03:09.344731	2020-10-29 19:03:09.344731
3739	1	1	6	2	\N	2017-12-28	-12.00	9dd	2020-10-29 19:03:09.345863	2020-10-29 19:03:09.345863
3740	1	5	22	2	\N	2017-12-29	-40.00	9da	2020-10-29 19:03:09.347164	2020-10-29 19:03:09.347164
3741	1	9	-1	2	\N	2017-12-29	-129.00	051	2020-10-29 19:03:09.348537	2020-10-29 19:03:09.348537
3742	1	9	-1	2	\N	2017-12-29	-238.00	c38	2020-10-29 19:03:09.349746	2020-10-29 19:03:09.349746
3743	2	1	7	2	\N	2017-12-29	-12.60	e97	2020-10-29 19:03:09.350908	2020-10-29 19:03:09.350908
3744	1	1	6	2	\N	2017-12-29	-39.00	1fa	2020-10-29 19:03:09.352156	2020-10-29 19:03:09.352156
3745	5	7	27	2	\N	2017-12-29	-240.00	b27	2020-10-29 19:03:09.353404	2020-10-29 19:03:09.353404
3746	1	1	5	2	\N	2017-12-30	-13.00	473	2020-10-29 19:03:09.354682	2020-10-29 19:03:09.354682
3747	5	1	5	2	\N	2017-12-30	-9.78	e48	2020-10-29 19:03:09.355939	2020-10-29 19:03:09.355939
3748	5	1	5	2	\N	2017-12-30	-144.34	e5f	2020-10-29 19:03:09.357177	2020-10-29 19:03:09.357177
3749	1	9	46	2	\N	2017-12-30	-30.00	5b7	2020-10-29 19:03:09.358363	2020-10-29 19:03:09.358363
3750	5	1	5	2	\N	2017-12-31	-3.98	b20	2020-10-29 19:03:09.359559	2020-10-29 19:03:09.359559
3751	1	2	2	4	\N	2017-12-31	15.00	1c5	2020-10-29 19:03:09.360903	2020-10-29 19:03:09.360903
3752	5	7	30	3	\N	2017-12-31	-15.00	1c5	2020-10-29 19:03:09.36208	2020-10-29 19:03:09.36208
3753	6	10	52	1	\N	2017-12-31	99.95	c5a	2020-10-29 19:03:09.36339	2020-10-29 19:03:09.36339
3754	1	10	51	3	\N	2017-12-31	-17.44	937	2020-10-29 19:03:09.365997	2020-10-29 19:03:09.365997
3755	5	1	5	2	\N	2017-12-31	-12.62	f30	2020-10-29 19:03:09.367277	2020-10-29 19:03:09.367277
3756	5	10	51	4	\N	2018-01-01	6052.02	18a	2020-10-29 19:03:09.368472	2020-10-29 19:03:09.368472
3757	5	10	51	3	\N	2018-01-01	-5000.05	773	2020-10-29 19:03:09.369644	2020-10-29 19:03:09.369644
3758	6	10	51	4	\N	2018-01-01	5000.05	773	2020-10-29 19:03:09.370992	2020-10-29 19:03:09.370992
3759	6	10	51	4	\N	2017-12-25	10000.00	89d	2020-10-29 19:03:09.372145	2020-10-29 19:03:09.372145
3760	5	9	-1	2	\N	2017-12-31	-86.41	c27	2020-10-29 19:03:09.373233	2020-10-29 19:03:09.373233
3761	1	10	51	1	\N	2018-01-01	0.00	809	2020-10-29 19:03:09.374288	2020-10-29 19:03:09.374288
3762	1	9	46	3	\N	2018-01-01	-150.00	d17	2020-10-29 19:03:09.375336	2020-10-29 19:03:09.375336
3763	1	8	38	2	\N	2018-01-01	-46.00	1bf	2020-10-29 19:03:09.376475	2020-10-29 19:03:09.376475
3764	5	1	5	2	\N	2018-01-02	-11.26	7d2	2020-10-29 19:03:09.377701	2020-10-29 19:03:09.377701
3765	5	5	20	2	\N	2018-01-02	-5.00	ceb	2020-10-29 19:03:09.378905	2020-10-29 19:03:09.378905
3766	5	5	20	2	\N	2018-01-02	-29.66	ceb	2020-10-29 19:03:09.380107	2020-10-29 19:03:09.380107
3767	5	8	40	2	\N	2018-01-03	-141.54	3b2	2020-10-29 19:03:09.381359	2020-10-29 19:03:09.381359
3768	5	5	20	2	\N	2018-01-02	-6.99	ceb	2020-10-29 19:03:09.382697	2020-10-29 19:03:09.382697
3769	1	1	5	2	\N	2018-01-04	-68.18	7d2	2020-10-29 19:03:09.383829	2020-10-29 19:03:09.383829
3770	1	4	15	2	\N	2018-01-04	-19.00	de2	2020-10-29 19:03:09.384949	2020-10-29 19:03:09.384949
3771	1	9	-1	3	\N	2018-01-04	-500.00	b19	2020-10-29 19:03:09.38603	2020-10-29 19:03:09.38603
3772	5	9	-1	4	\N	2018-01-04	500.00	b19	2020-10-29 19:03:09.387111	2020-10-29 19:03:09.387111
3773	1	10	51	3	\N	2018-01-02	-7000.00	039	2020-10-29 19:03:09.388576	2020-10-29 19:03:09.388576
3774	5	10	51	4	\N	2018-01-04	5500.00	039	2020-10-29 19:03:09.389846	2020-10-29 19:03:09.389846
3775	5	9	48	2	\N	2018-01-02	-30.00	94b	2020-10-29 19:03:09.391036	2020-10-29 19:03:09.391036
3776	1	9	48	2	\N	2018-01-02	-8.00	13f	2020-10-29 19:03:09.392249	2020-10-29 19:03:09.392249
3777	5	9	44	2	\N	2018-01-02	-250.00	462	2020-10-29 19:03:09.393332	2020-10-29 19:03:09.393332
3778	1	2	-1	4	\N	2018-01-02	220.00	a38	2020-10-29 19:03:09.394544	2020-10-29 19:03:09.394544
3779	1	9	45	2	\N	2018-01-02	-179.00	e6f	2020-10-29 19:03:09.395658	2020-10-29 19:03:09.395658
3780	5	10	51	3	\N	2018-01-04	-1000.00	cd2	2020-10-29 19:03:09.397045	2020-10-29 19:03:09.397045
3781	6	10	51	4	\N	2018-01-04	1000.00	cd2	2020-10-29 19:03:09.398517	2020-10-29 19:03:09.398517
3782	5	10	51	3	\N	2018-01-04	-500.00	3aa	2020-10-29 19:03:09.39979	2020-10-29 19:03:09.39979
3783	1	9	46	2	\N	2018-01-05	-124.23	8c4	2020-10-29 19:03:09.401531	2020-10-29 19:03:09.401531
3784	5	1	5	2	\N	2018-01-05	-121.80	7d2	2020-10-29 19:03:09.403085	2020-10-29 19:03:09.403085
3785	5	5	23	2	\N	2018-01-06	-28.99	30b	2020-10-29 19:03:09.404315	2020-10-29 19:03:09.404315
3786	5	1	5	2	\N	2018-01-05	-6.40	473	2020-10-29 19:03:09.405442	2020-10-29 19:03:09.405442
3787	5	5	20	2	\N	2018-01-05	-21.99	ceb	2020-10-29 19:03:09.406552	2020-10-29 19:03:09.406552
3788	5	5	20	2	\N	2018-01-05	-52.97	ceb	2020-10-29 19:03:09.407701	2020-10-29 19:03:09.407701
3789	5	1	5	2	\N	2018-01-02	-3.99	7d2	2020-10-29 19:03:09.408908	2020-10-29 19:03:09.408908
3790	2	6	24	2	\N	2018-01-02	-69.98	b88	2020-10-29 19:03:09.410133	2020-10-29 19:03:09.410133
3791	2	6	24	2	\N	2018-01-02	-59.96	87d	2020-10-29 19:03:09.411545	2020-10-29 19:03:09.411545
3792	2	6	24	2	\N	2018-01-02	-69.99	942	2020-10-29 19:03:09.412932	2020-10-29 19:03:09.412932
3793	2	4	15	2	\N	2018-01-03	-29.00	d34	2020-10-29 19:03:09.414578	2020-10-29 19:03:09.414578
3794	2	6	24	2	\N	2018-01-04	-49.98	87d	2020-10-29 19:03:09.41608	2020-10-29 19:03:09.41608
3795	5	9	-1	2	\N	2018-01-06	-1000.00	831	2020-10-29 19:03:09.417287	2020-10-29 19:03:09.417287
3796	2	9	-1	1	\N	2018-01-06	1000.00	831	2020-10-29 19:03:09.418488	2020-10-29 19:03:09.418488
3797	2	9	-1	1	\N	2018-01-02	532.52	26e	2020-10-29 19:03:09.419959	2020-10-29 19:03:09.419959
3798	2	9	48	2	\N	2018-01-06	-100.00	b9e	2020-10-29 19:03:09.421448	2020-10-29 19:03:09.421448
3799	1	10	51	4	\N	2018-01-07	4500.00	1f2	2020-10-29 19:03:09.422872	2020-10-29 19:03:09.422872
3800	2	7	30	2	\N	2018-01-08	-20.00	681	2020-10-29 19:03:09.424511	2020-10-29 19:03:09.424511
3801	2	8	38	2	\N	2018-01-08	-50.00	f6a	2020-10-29 19:03:09.427011	2020-10-29 19:03:09.427011
3802	5	4	11	2	\N	2018-01-09	-136.59	aae	2020-10-29 19:03:09.428822	2020-10-29 19:03:09.428822
3803	5	1	5	2	\N	2018-01-08	-2.70	ff5	2020-10-29 19:03:09.430716	2020-10-29 19:03:09.430716
3804	5	1	5	2	\N	2018-01-08	-9.65	ff5	2020-10-29 19:03:09.4324	2020-10-29 19:03:09.4324
3805	1	1	5	2	\N	2018-01-08	-49.00	5bc	2020-10-29 19:03:09.433831	2020-10-29 19:03:09.433831
3806	1	5	18	2	\N	2018-01-08	-32.28	0f2	2020-10-29 19:03:09.435142	2020-10-29 19:03:09.435142
3807	5	5	18	2	\N	2018-01-08	-49.45	0f2	2020-10-29 19:03:09.436384	2020-10-29 19:03:09.436384
3808	1	5	19	2	\N	2018-01-08	-2702.50	1f2	2020-10-29 19:03:09.437807	2020-10-29 19:03:09.437807
3809	1	1	7	2	\N	2018-01-08	-14.55	e33	2020-10-29 19:03:09.439235	2020-10-29 19:03:09.439235
3810	1	2	2	1	\N	2018-01-09	80.00	a80	2020-10-29 19:03:09.440347	2020-10-29 19:03:09.440347
3811	6	9	-1	2	\N	2018-01-09	-300.00	12b	2020-10-29 19:03:09.441559	2020-10-29 19:03:09.441559
3812	2	1	5	2	\N	2018-01-10	-12.75	ff5	2020-10-29 19:03:09.442727	2020-10-29 19:03:09.442727
3813	5	1	5	2	\N	2018-01-10	-5.98	5f3	2020-10-29 19:03:09.444048	2020-10-29 19:03:09.444048
3814	5	5	20	2	\N	2018-01-10	-24.99	001	2020-10-29 19:03:09.445643	2020-10-29 19:03:09.445643
3815	2	6	24	2	\N	2018-01-10	-7.00	e4a	2020-10-29 19:03:09.447003	2020-10-29 19:03:09.447003
3816	5	10	51	3	\N	2018-01-11	-1900.00	725	2020-10-29 19:03:09.448386	2020-10-29 19:03:09.448386
3817	6	10	51	4	\N	2018-01-11	1900.00	725	2020-10-29 19:03:09.449793	2020-10-29 19:03:09.449793
3818	5	10	51	3	\N	2018-01-11	-500.00	725	2020-10-29 19:03:09.451095	2020-10-29 19:03:09.451095
3819	5	10	51	3	\N	2018-01-11	-100.00	f89	2020-10-29 19:03:09.452252	2020-10-29 19:03:09.452252
3820	1	10	51	4	\N	2018-01-11	100.00	f89	2020-10-29 19:03:09.45333	2020-10-29 19:03:09.45333
3821	5	1	-1	2	\N	2018-01-11	-135.00	f3d	2020-10-29 19:03:09.454545	2020-10-29 19:03:09.454545
3822	5	1	5	2	\N	2018-01-13	-23.00	6be	2020-10-29 19:03:09.455828	2020-10-29 19:03:09.455828
3823	5	1	5	2	\N	2018-01-13	-171.32	320	2020-10-29 19:03:09.457222	2020-10-29 19:03:09.457222
3824	1	2	2	1	\N	2018-01-13	79.60	c22	2020-10-29 19:03:09.458446	2020-10-29 19:03:09.458446
3825	1	9	48	2	\N	2018-01-13	-100.00	bbb	2020-10-29 19:03:09.459631	2020-10-29 19:03:09.459631
3826	5	1	5	2	\N	2018-01-13	-10.74	d9a	2020-10-29 19:03:09.460802	2020-10-29 19:03:09.460802
3827	5	1	5	2	\N	2018-01-12	-16.07	a8c	2020-10-29 19:03:09.462081	2020-10-29 19:03:09.462081
3828	5	1	5	2	\N	2018-01-14	-7.28	1a8	2020-10-29 19:03:09.463422	2020-10-29 19:03:09.463422
3829	1	7	29	2	\N	2018-01-14	-336.50	c10	2020-10-29 19:03:09.464704	2020-10-29 19:03:09.464704
3830	1	2	-1	1	\N	2018-01-04	468.78	37b	2020-10-29 19:03:09.466057	2020-10-29 19:03:09.466057
3831	1	10	51	3	\N	2018-01-14	-1459.15	15c	2020-10-29 19:03:09.467257	2020-10-29 19:03:09.467257
3832	2	9	48	2	\N	2018-01-14	-10.00	5f5	2020-10-29 19:03:09.468423	2020-10-29 19:03:09.468423
3833	1	9	48	2	\N	2018-01-14	-12.00	5f5	2020-10-29 19:03:09.469748	2020-10-29 19:03:09.469748
3834	2	2	1	1	\N	2018-01-16	1627.82	fcd	2020-10-29 19:03:09.471008	2020-10-29 19:03:09.471008
3835	2	9	45	2	\N	2018-01-15	-19.90	798	2020-10-29 19:03:09.472225	2020-10-29 19:03:09.472225
3836	2	9	45	2	\N	2018-01-16	-50.00	a81	2020-10-29 19:03:09.47355	2020-10-29 19:03:09.47355
3837	2	6	24	2	\N	2018-01-16	-175.96	b88	2020-10-29 19:03:09.474912	2020-10-29 19:03:09.474912
3838	2	6	24	2	\N	2018-01-16	-44.98	1ee	2020-10-29 19:03:09.476006	2020-10-29 19:03:09.476006
3839	2	5	18	2	\N	2018-01-16	-32.96	677	2020-10-29 19:03:09.477211	2020-10-29 19:03:09.477211
3840	5	5	20	2	\N	2018-01-16	-19.99	07e	2020-10-29 19:03:09.478591	2020-10-29 19:03:09.478591
3841	2	5	20	2	\N	2018-01-16	-15.65	c32	2020-10-29 19:03:09.479699	2020-10-29 19:03:09.479699
3842	5	9	45	2	\N	2018-01-17	-247.00	257	2020-10-29 19:03:09.480882	2020-10-29 19:03:09.480882
3843	5	4	16	2	\N	2018-01-17	-91.00	32f	2020-10-29 19:03:09.481987	2020-10-29 19:03:09.481987
3844	1	1	7	2	\N	2018-01-17	-16.96	3b9	2020-10-29 19:03:09.483082	2020-10-29 19:03:09.483082
3845	1	1	5	2	\N	2018-01-17	-3.96	7d2	2020-10-29 19:03:09.484171	2020-10-29 19:03:09.484171
3846	1	9	45	2	\N	2018-01-18	-149.99	8e6	2020-10-29 19:03:09.485136	2020-10-29 19:03:09.485136
3847	1	9	45	2	\N	2018-01-18	-54.14	8e6	2020-10-29 19:03:09.486185	2020-10-29 19:03:09.486185
3848	2	6	24	1	\N	2018-01-18	49.99	f0f	2020-10-29 19:03:09.487238	2020-10-29 19:03:09.487238
3849	2	6	24	2	\N	2018-01-18	-79.98	a2b	2020-10-29 19:03:09.48827	2020-10-29 19:03:09.48827
3850	2	5	18	2	\N	2018-01-18	-45.27	d86	2020-10-29 19:03:09.489306	2020-10-29 19:03:09.489306
3851	1	3	-1	2	\N	2018-01-19	-60.00	e32	2020-10-29 19:03:09.490447	2020-10-29 19:03:09.490447
3852	5	5	20	2	\N	2018-01-20	-22.90	e0a	2020-10-29 19:03:09.49157	2020-10-29 19:03:09.49157
3853	5	1	5	2	\N	2018-01-20	-4.80	473	2020-10-29 19:03:09.492742	2020-10-29 19:03:09.492742
3854	5	1	5	2	\N	2018-01-20	-146.70	e5f	2020-10-29 19:03:09.493995	2020-10-29 19:03:09.493995
3855	5	1	5	2	\N	2018-01-20	-14.78	7d2	2020-10-29 19:03:09.495226	2020-10-29 19:03:09.495226
3856	2	9	45	2	\N	2018-01-20	-51.00	a0f	2020-10-29 19:03:09.497732	2020-10-29 19:03:09.497732
3857	5	8	40	2	\N	2018-01-21	-249.88	710	2020-10-29 19:03:09.500681	2020-10-29 19:03:09.500681
3858	1	2	2	1	\N	2018-01-20	51.00	935	2020-10-29 19:03:09.502642	2020-10-29 19:03:09.502642
3859	1	1	7	2	\N	2018-01-23	-16.50	9e4	2020-10-29 19:03:09.504658	2020-10-29 19:03:09.504658
3860	1	3	-1	2	\N	2018-01-26	-39.00	4aa	2020-10-29 19:03:09.506831	2020-10-29 19:03:09.506831
3861	1	1	7	2	\N	2018-01-25	-28.40	573	2020-10-29 19:03:09.509154	2020-10-29 19:03:09.509154
3862	1	2	2	1	\N	2018-01-24	51.00	bf5	2020-10-29 19:03:09.511192	2020-10-29 19:03:09.511192
3863	1	2	1	1	\N	2018-01-25	9500.41	d0c	2020-10-29 19:03:09.513302	2020-10-29 19:03:09.513302
3864	5	5	20	2	\N	2018-01-24	-72.48	d21	2020-10-29 19:03:09.515763	2020-10-29 19:03:09.515763
3865	5	1	5	2	\N	2018-01-24	-21.42	8c3	2020-10-29 19:03:09.519505	2020-10-29 19:03:09.519505
3866	1	10	51	3	\N	2018-01-26	-500.00	bdc	2020-10-29 19:03:09.522052	2020-10-29 19:03:09.522052
3867	1	10	51	3	\N	2018-01-26	-1000.00	216	2020-10-29 19:03:09.524573	2020-10-29 19:03:09.524573
3868	1	10	51	3	\N	2018-01-26	-1000.00	76b	2020-10-29 19:03:09.527066	2020-10-29 19:03:09.527066
3869	5	10	51	4	\N	2018-01-26	1000.00	76b	2020-10-29 19:03:09.529175	2020-10-29 19:03:09.529175
3870	5	1	5	2	\N	2018-01-27	-8.50	473	2020-10-29 19:03:09.530774	2020-10-29 19:03:09.530774
3871	5	1	5	2	\N	2018-01-27	-143.80	e5f	2020-10-29 19:03:09.532988	2020-10-29 19:03:09.532988
3872	5	1	5	2	\N	2018-01-27	-18.12	644	2020-10-29 19:03:09.535143	2020-10-29 19:03:09.535143
3873	2	2	1	1	\N	2018-01-27	1720.20	d05	2020-10-29 19:03:09.536681	2020-10-29 19:03:09.536681
3874	2	2	1	1	\N	2018-01-27	6368.42	e75	2020-10-29 19:03:09.539163	2020-10-29 19:03:09.539163
3875	2	10	51	3	\N	2018-01-27	-1500.00	efb	2020-10-29 19:03:09.541483	2020-10-29 19:03:09.541483
3876	5	10	51	4	\N	2018-01-27	1500.00	efb	2020-10-29 19:03:09.543234	2020-10-29 19:03:09.543234
3877	2	10	51	3	\N	2018-01-27	-5000.00	490	2020-10-29 19:03:09.545896	2020-10-29 19:03:09.545896
3878	6	10	51	4	\N	2018-01-27	5000.00	490	2020-10-29 19:03:09.548732	2020-10-29 19:03:09.548732
3879	2	10	51	3	\N	2018-01-27	-800.00	375	2020-10-29 19:03:09.551347	2020-10-29 19:03:09.551347
3880	4	10	51	4	\N	2018-01-27	800.00	375	2020-10-29 19:03:09.552749	2020-10-29 19:03:09.552749
3881	2	9	45	2	\N	2018-01-27	-30.00	5fa	2020-10-29 19:03:09.554099	2020-10-29 19:03:09.554099
3882	2	9	45	2	\N	2018-01-27	-39.92	5fa	2020-10-29 19:03:09.555519	2020-10-29 19:03:09.555519
3883	2	5	20	2	\N	2018-01-27	-34.98	1a6	2020-10-29 19:03:09.556812	2020-10-29 19:03:09.556812
3884	2	6	24	2	\N	2018-01-27	-38.50	e4a	2020-10-29 19:03:09.558628	2020-10-29 19:03:09.558628
3885	5	4	-1	2	\N	2018-01-27	-590.00	597	2020-10-29 19:03:09.559844	2020-10-29 19:03:09.559844
3886	5	4	10	2	\N	2018-01-27	-391.79	365	2020-10-29 19:03:09.561097	2020-10-29 19:03:09.561097
3887	5	4	12	2	\N	2018-01-27	-133.16	d82	2020-10-29 19:03:09.562477	2020-10-29 19:03:09.562477
3888	5	4	13	2	\N	2018-01-27	-49.90	5cf	2020-10-29 19:03:09.56378	2020-10-29 19:03:09.56378
3889	5	1	5	2	\N	2018-01-28	-18.70	417	2020-10-29 19:03:09.565951	2020-10-29 19:03:09.565951
3890	5	4	10	2	\N	2018-01-29	-27.43	213	2020-10-29 19:03:09.568208	2020-10-29 19:03:09.568208
3891	5	1	5	2	\N	2018-01-30	-20.71	d3a	2020-10-29 19:03:09.56949	2020-10-29 19:03:09.56949
3892	2	4	15	2	\N	2018-01-31	-29.00	1f4	2020-10-29 19:03:09.57085	2020-10-29 19:03:09.57085
3893	2	9	45	2	\N	2018-02-01	-10.00	ad4	2020-10-29 19:03:09.572569	2020-10-29 19:03:09.572569
3894	2	5	18	2	\N	2018-02-01	-43.12	b33	2020-10-29 19:03:09.573926	2020-10-29 19:03:09.573926
3895	5	5	23	2	\N	2018-02-01	-30.44	8a9	2020-10-29 19:03:09.575173	2020-10-29 19:03:09.575173
3896	5	5	20	2	\N	2018-02-01	-31.48	f7f	2020-10-29 19:03:09.576699	2020-10-29 19:03:09.576699
3897	2	3	-1	2	\N	2018-02-02	-14.00	ef8	2020-10-29 19:03:09.577999	2020-10-29 19:03:09.577999
3898	2	1	5	2	\N	2018-02-02	-8.80	ecd	2020-10-29 19:03:09.579189	2020-10-29 19:03:09.579189
3899	2	6	24	1	\N	2018-02-02	79.98	3a8	2020-10-29 19:03:09.580799	2020-10-29 19:03:09.580799
3900	2	9	-1	1	\N	2018-02-02	64.30	9db	2020-10-29 19:03:09.582518	2020-10-29 19:03:09.582518
3901	1	10	51	3	\N	2018-02-01	-7000.00	dbc	2020-10-29 19:03:09.584131	2020-10-29 19:03:09.584131
3902	1	1	5	2	\N	2018-02-01	-11.56	7d2	2020-10-29 19:03:09.585688	2020-10-29 19:03:09.585688
3903	1	1	7	2	\N	2018-02-01	-19.57	e33	2020-10-29 19:03:09.587536	2020-10-29 19:03:09.587536
3904	1	1	7	2	\N	2018-02-01	-2.80	73e	2020-10-29 19:03:09.589042	2020-10-29 19:03:09.589042
3905	1	2	2	1	\N	2018-02-02	15.00	1c5	2020-10-29 19:03:09.590507	2020-10-29 19:03:09.590507
3906	1	2	2	1	\N	2018-01-29	51.00	bf5	2020-10-29 19:03:09.591967	2020-10-29 19:03:09.591967
3907	1	1	7	2	\N	2018-01-31	-12.95	e33	2020-10-29 19:03:09.593196	2020-10-29 19:03:09.593196
3908	5	7	30	2	\N	2018-02-02	-15.00	c30	2020-10-29 19:03:09.5952	2020-10-29 19:03:09.5952
3909	1	9	-1	2	\N	2018-02-02	-64.95	a54	2020-10-29 19:03:09.596755	2020-10-29 19:03:09.596755
3910	6	10	52	1	\N	2018-01-31	109.53	15b	2020-10-29 19:03:09.598302	2020-10-29 19:03:09.598302
3911	1	1	5	2	\N	2018-02-02	-23.04	7d2	2020-10-29 19:03:09.59968	2020-10-29 19:03:09.59968
3912	5	1	5	2	\N	2018-02-03	-10.30	473	2020-10-29 19:03:09.600981	2020-10-29 19:03:09.600981
3913	1	9	45	2	\N	2018-02-03	-14.99	779	2020-10-29 19:03:09.60235	2020-10-29 19:03:09.60235
3914	5	1	5	2	\N	2018-02-03	-116.95	bee	2020-10-29 19:03:09.603674	2020-10-29 19:03:09.603674
3915	2	1	7	2	\N	2018-02-02	-14.48	258	2020-10-29 19:03:09.604971	2020-10-29 19:03:09.604971
3916	2	1	6	2	\N	2018-02-02	-21.60	2c8	2020-10-29 19:03:09.606373	2020-10-29 19:03:09.606373
3917	5	10	51	4	\N	2018-02-04	5500.00	68d	2020-10-29 19:03:09.607732	2020-10-29 19:03:09.607732
3918	1	4	15	2	\N	2018-02-03	-19.00	38b	2020-10-29 19:03:09.60957	2020-10-29 19:03:09.60957
3919	1	2	-1	4	\N	2018-02-04	200.00	1fd	2020-10-29 19:03:09.610853	2020-10-29 19:03:09.610853
3920	5	9	45	3	\N	2018-02-04	-200.00	1fd	2020-10-29 19:03:09.612089	2020-10-29 19:03:09.612089
3921	1	9	45	2	\N	2018-02-04	-200.00	941	2020-10-29 19:03:09.613381	2020-10-29 19:03:09.613381
3922	1	8	38	2	\N	2018-02-04	-46.00	912	2020-10-29 19:03:09.614661	2020-10-29 19:03:09.614661
3923	5	1	5	2	\N	2018-02-04	-88.64	463	2020-10-29 19:03:09.616222	2020-10-29 19:03:09.616222
3924	5	5	20	2	\N	2018-02-04	-37.48	ff6	2020-10-29 19:03:09.61837	2020-10-29 19:03:09.61837
3925	5	5	18	2	\N	2018-02-04	-8.30	419	2020-10-29 19:03:09.619599	2020-10-29 19:03:09.619599
3926	2	5	18	2	\N	2018-02-04	-14.90	f54	2020-10-29 19:03:09.620797	2020-10-29 19:03:09.620797
3927	5	10	51	3	\N	2018-02-05	-1500.00	e68	2020-10-29 19:03:09.622303	2020-10-29 19:03:09.622303
3928	6	10	51	4	\N	2018-02-05	1500.00	e68	2020-10-29 19:03:09.62359	2020-10-29 19:03:09.62359
3929	1	10	51	4	\N	2018-02-05	300.00	797	2020-10-29 19:03:09.625134	2020-10-29 19:03:09.625134
3930	5	10	51	3	\N	2018-02-05	-300.00	797	2020-10-29 19:03:09.626481	2020-10-29 19:03:09.626481
3931	5	10	51	3	\N	2018-02-07	-2500.00	c82	2020-10-29 19:03:09.62799	2020-10-29 19:03:09.62799
3932	5	1	-1	2	\N	2018-02-05	-144.00	0de	2020-10-29 19:03:09.629315	2020-10-29 19:03:09.629315
3933	1	9	46	2	\N	2018-02-05	-57.96	c84	2020-10-29 19:03:09.631636	2020-10-29 19:03:09.631636
3934	2	1	7	2	\N	2018-02-05	-13.05	41d	2020-10-29 19:03:09.633706	2020-10-29 19:03:09.633706
3935	5	10	51	3	\N	2018-02-06	-2390.47	bc0	2020-10-29 19:03:09.635354	2020-10-29 19:03:09.635354
3936	6	10	51	4	\N	2018-02-06	2390.47	bc0	2020-10-29 19:03:09.636719	2020-10-29 19:03:09.636719
3937	4	10	51	3	\N	2018-02-06	-2341.35	bc0	2020-10-29 19:03:09.638246	2020-10-29 19:03:09.638246
3938	2	10	51	4	\N	2018-02-06	2341.35	bc0	2020-10-29 19:03:09.63953	2020-10-29 19:03:09.63953
3939	2	10	51	3	\N	2018-02-06	-2300.00	bc0	2020-10-29 19:03:09.640958	2020-10-29 19:03:09.640958
3940	5	10	51	4	\N	2018-02-06	2300.00	bc0	2020-10-29 19:03:09.642733	2020-10-29 19:03:09.642733
3941	2	1	7	2	\N	2018-02-07	-12.49	73c	2020-10-29 19:03:09.644237	2020-10-29 19:03:09.644237
3942	2	4	13	2	\N	2018-02-08	-19.99	fc6	2020-10-29 19:03:09.645545	2020-10-29 19:03:09.645545
3943	5	8	40	2	\N	2018-02-10	-182.02	971	2020-10-29 19:03:09.646793	2020-10-29 19:03:09.646793
3944	1	7	30	2	\N	2018-02-12	-208.00	f1b	2020-10-29 19:03:09.64829	2020-10-29 19:03:09.64829
3945	1	1	7	2	\N	2018-02-12	-9.46	e33	2020-10-29 19:03:09.649639	2020-10-29 19:03:09.649639
3946	1	2	2	1	\N	2018-02-07	25.00	16f	2020-10-29 19:03:09.650927	2020-10-29 19:03:09.650927
3947	1	7	33	2	\N	2018-02-07	-59.80	7d6	2020-10-29 19:03:09.652406	2020-10-29 19:03:09.652406
3948	1	3	-1	2	\N	2018-02-10	-12.07	3ea	2020-10-29 19:03:09.654122	2020-10-29 19:03:09.654122
3949	1	10	51	4	\N	2018-02-11	500.00	7d4	2020-10-29 19:03:09.656213	2020-10-29 19:03:09.656213
3950	5	5	20	2	\N	2018-02-09	-34.34	e12	2020-10-29 19:03:09.657784	2020-10-29 19:03:09.657784
3951	5	5	20	2	\N	2018-02-09	-114.00	f43	2020-10-29 19:03:09.659271	2020-10-29 19:03:09.659271
3952	5	5	20	2	\N	2018-02-10	-25.85	e12	2020-10-29 19:03:09.66045	2020-10-29 19:03:09.66045
3953	5	1	5	2	\N	2018-02-11	-68.69	8c3	2020-10-29 19:03:09.661703	2020-10-29 19:03:09.661703
3954	1	8	40	2	\N	2018-02-11	-6.00	353	2020-10-29 19:03:09.662934	2020-10-29 19:03:09.662934
3955	1	9	46	3	\N	2018-02-11	-100.00	abf	2020-10-29 19:03:09.664378	2020-10-29 19:03:09.664378
3956	5	10	51	4	\N	2018-02-12	2500.00	039	2020-10-29 19:03:09.666057	2020-10-29 19:03:09.666057
3957	1	1	6	2	\N	2018-02-12	-56.00	9c7	2020-10-29 19:03:09.667432	2020-10-29 19:03:09.667432
3958	1	2	2	1	\N	2018-02-12	50.00	16f	2020-10-29 19:03:09.669359	2020-10-29 19:03:09.669359
3959	1	8	41	2	\N	2018-02-12	-24.74	4ab	2020-10-29 19:03:09.670573	2020-10-29 19:03:09.670573
3960	5	1	5	2	\N	2018-02-12	-6.59	7d2	2020-10-29 19:03:09.671798	2020-10-29 19:03:09.671798
3961	1	2	2	1	\N	2018-02-14	25.00	acb	2020-10-29 19:03:09.67314	2020-10-29 19:03:09.67314
3962	1	2	2	1	\N	2018-02-14	28.00	4ec	2020-10-29 19:03:09.674279	2020-10-29 19:03:09.674279
3963	5	1	5	2	\N	2018-02-14	-4.80	f13	2020-10-29 19:03:09.675351	2020-10-29 19:03:09.675351
3964	2	2	2	1	\N	2018-02-15	3077.42	c77	2020-10-29 19:03:09.676451	2020-10-29 19:03:09.676451
3965	5	10	51	3	\N	2018-02-16	-1000.00	4de	2020-10-29 19:03:09.677525	2020-10-29 19:03:09.677525
3966	6	10	51	4	\N	2018-02-16	1000.00	4de	2020-10-29 19:03:09.678617	2020-10-29 19:03:09.678617
3967	5	10	51	3	\N	2018-02-16	-1100.00	e00	2020-10-29 19:03:09.679785	2020-10-29 19:03:09.679785
3968	2	10	51	4	\N	2018-02-16	1100.00	e00	2020-10-29 19:03:09.680973	2020-10-29 19:03:09.680973
3969	1	3	-1	2	\N	2018-02-16	-31.56	8af	2020-10-29 19:03:09.682663	2020-10-29 19:03:09.682663
3970	1	1	6	2	\N	2018-02-17	-24.00	3ff	2020-10-29 19:03:09.683988	2020-10-29 19:03:09.683988
3971	1	8	41	2	\N	2018-02-17	-14.15	e36	2020-10-29 19:03:09.685659	2020-10-29 19:03:09.685659
3972	1	8	38	2	\N	2018-02-17	-27.80	076	2020-10-29 19:03:09.686758	2020-10-29 19:03:09.686758
3973	1	9	48	2	\N	2018-02-16	-100.00	bbb	2020-10-29 19:03:09.687834	2020-10-29 19:03:09.687834
3974	1	2	2	1	\N	2018-02-16	25.00	881	2020-10-29 19:03:09.688913	2020-10-29 19:03:09.688913
3975	1	3	-1	2	\N	2018-02-16	-30.78	d7b	2020-10-29 19:03:09.690027	2020-10-29 19:03:09.690027
3976	5	1	5	2	\N	2018-02-16	-113.38	7d2	2020-10-29 19:03:09.691093	2020-10-29 19:03:09.691093
3977	5	1	5	2	\N	2018-02-18	-8.26	7d2	2020-10-29 19:03:09.692185	2020-10-29 19:03:09.692185
3978	1	10	51	3	\N	2018-02-11	-200.00	b0a	2020-10-29 19:03:09.693181	2020-10-29 19:03:09.693181
3979	1	10	51	4	\N	2018-02-11	200.00	b0a	2020-10-29 19:03:09.694179	2020-10-29 19:03:09.694179
3980	5	4	-1	2	\N	2018-02-19	-13.00	bf3	2020-10-29 19:03:09.695275	2020-10-29 19:03:09.695275
3981	5	4	-1	2	\N	2018-02-19	-18.00	f52	2020-10-29 19:03:09.696338	2020-10-29 19:03:09.696338
3982	2	5	20	2	\N	2018-02-19	-44.95	1d9	2020-10-29 19:03:09.697419	2020-10-29 19:03:09.697419
3983	2	1	6	2	\N	2018-02-19	-9.50	a7e	2020-10-29 19:03:09.698756	2020-10-29 19:03:09.698756
3984	2	5	19	2	\N	2018-02-19	-50.00	f01	2020-10-29 19:03:09.700171	2020-10-29 19:03:09.700171
3985	2	4	16	2	\N	2018-02-19	-1340.00	8a4	2020-10-29 19:03:09.70135	2020-10-29 19:03:09.70135
3986	2	10	51	3	\N	2018-02-19	-500.00	b63	2020-10-29 19:03:09.702556	2020-10-29 19:03:09.702556
3987	4	10	51	4	\N	2018-02-19	500.00	b63	2020-10-29 19:03:09.703793	2020-10-29 19:03:09.703793
3988	2	10	51	3	\N	2018-02-19	-2000.00	b63	2020-10-29 19:03:09.704915	2020-10-29 19:03:09.704915
3989	6	10	51	4	\N	2018-02-19	2000.00	b63	2020-10-29 19:03:09.706025	2020-10-29 19:03:09.706025
3990	2	9	45	2	\N	2018-02-19	-25.00	bfc	2020-10-29 19:03:09.707133	2020-10-29 19:03:09.707133
3991	1	9	45	1	\N	2018-02-19	25.00	acb	2020-10-29 19:03:09.708193	2020-10-29 19:03:09.708193
3992	2	4	13	2	\N	2018-02-24	-14.99	fc6	2020-10-29 19:03:09.709412	2020-10-29 19:03:09.709412
3993	1	10	51	3	\N	2018-02-24	-200.00	d1e	2020-10-29 19:03:09.710594	2020-10-29 19:03:09.710594
3994	5	10	51	4	\N	2018-02-24	200.00	d1e	2020-10-29 19:03:09.711824	2020-10-29 19:03:09.711824
3995	5	1	5	2	\N	2018-02-24	-8.10	473	2020-10-29 19:03:09.713023	2020-10-29 19:03:09.713023
3996	5	1	5	2	\N	2018-02-23	-186.88	e5f	2020-10-29 19:03:09.714178	2020-10-29 19:03:09.714178
3997	5	1	5	2	\N	2018-02-22	-10.08	7d2	2020-10-29 19:03:09.715985	2020-10-29 19:03:09.715985
3998	5	1	5	2	\N	2018-02-22	-10.48	7d2	2020-10-29 19:03:09.717225	2020-10-29 19:03:09.717225
3999	1	1	6	2	\N	2018-02-21	-14.00	ab2	2020-10-29 19:03:09.718372	2020-10-29 19:03:09.718372
4000	1	1	6	2	\N	2018-02-21	-100.00	ac7	2020-10-29 19:03:09.719686	2020-10-29 19:03:09.719686
4001	1	2	2	1	\N	2018-02-20	25.00	acb	2020-10-29 19:03:09.721039	2020-10-29 19:03:09.721039
4002	5	1	5	2	\N	2018-02-25	-18.23	8e5	2020-10-29 19:03:09.722187	2020-10-29 19:03:09.722187
4003	5	5	23	2	\N	2018-02-25	-16.79	882	2020-10-29 19:03:09.723339	2020-10-29 19:03:09.723339
4004	2	5	18	2	\N	2018-02-25	-26.99	1dd	2020-10-29 19:03:09.724439	2020-10-29 19:03:09.724439
4005	2	7	30	2	\N	2018-02-26	-55.00	5ff	2020-10-29 19:03:09.725669	2020-10-29 19:03:09.725669
4006	2	7	34	2	\N	2018-02-26	-110.00	e0f	2020-10-29 19:03:09.72691	2020-10-29 19:03:09.72691
4007	1	9	-1	3	\N	2018-02-26	-22.00	ec0	2020-10-29 19:03:09.728158	2020-10-29 19:03:09.728158
4008	1	2	1	1	\N	2018-02-26	9500.41	847	2020-10-29 19:03:09.72929	2020-10-29 19:03:09.72929
4009	1	10	51	3	\N	2018-02-26	-500.00	1d5	2020-10-29 19:03:09.730433	2020-10-29 19:03:09.730433
4010	1	10	51	3	\N	2018-02-26	-1000.00	789	2020-10-29 19:03:09.731676	2020-10-29 19:03:09.731676
4011	1	1	7	2	\N	2018-02-27	-15.00	d14	2020-10-29 19:03:09.733175	2020-10-29 19:03:09.733175
4012	5	1	5	2	\N	2018-02-27	-26.65	7d2	2020-10-29 19:03:09.734487	2020-10-29 19:03:09.734487
4013	1	8	37	2	\N	2018-02-26	-3.00	ec9	2020-10-29 19:03:09.735805	2020-10-29 19:03:09.735805
4014	5	7	30	3	\N	2018-02-28	-15.00	1c5	2020-10-29 19:03:09.737471	2020-10-29 19:03:09.737471
4015	1	2	2	4	\N	2018-02-28	15.00	1c5	2020-10-29 19:03:09.738836	2020-10-29 19:03:09.738836
4016	5	1	5	2	\N	2018-02-28	-8.55	7d2	2020-10-29 19:03:09.740003	2020-10-29 19:03:09.740003
4017	1	9	-1	2	\N	2018-03-01	-21.08	8af	2020-10-29 19:03:09.741117	2020-10-29 19:03:09.741117
4018	5	2	2	1	\N	2018-03-01	14.81	8af	2020-10-29 19:03:09.742224	2020-10-29 19:03:09.742224
4019	1	10	51	3	\N	2018-03-01	-7000.00	b18	2020-10-29 19:03:09.743289	2020-10-29 19:03:09.743289
4020	6	10	52	1	\N	2018-03-01	108.65	15b	2020-10-29 19:03:09.74446	2020-10-29 19:03:09.74446
4021	1	8	38	2	\N	2018-03-01	-46.00	d99	2020-10-29 19:03:09.745687	2020-10-29 19:03:09.745687
4022	1	9	-1	2	\N	2018-03-01	-150.00	a76	2020-10-29 19:03:09.747223	2020-10-29 19:03:09.747223
4023	2	2	1	1	\N	2018-03-01	14781.07	c76	2020-10-29 19:03:09.748809	2020-10-29 19:03:09.748809
4024	2	10	51	3	\N	2018-03-01	-1500.00	f67	2020-10-29 19:03:09.750253	2020-10-29 19:03:09.750253
4025	5	10	51	4	\N	2018-03-01	1500.00	f67	2020-10-29 19:03:09.751489	2020-10-29 19:03:09.751489
4026	2	10	51	3	\N	2018-03-01	-10000.00	fd0	2020-10-29 19:03:09.752806	2020-10-29 19:03:09.752806
4027	6	10	51	4	\N	2018-03-01	10000.00	fd0	2020-10-29 19:03:09.754021	2020-10-29 19:03:09.754021
4028	5	4	-1	2	\N	2018-03-03	-126.00	65c	2020-10-29 19:03:09.755172	2020-10-29 19:03:09.755172
4029	5	4	10	2	\N	2018-03-03	-391.79	297	2020-10-29 19:03:09.75644	2020-10-29 19:03:09.75644
4030	5	4	-1	2	\N	2018-03-03	-590.00	9f7	2020-10-29 19:03:09.757654	2020-10-29 19:03:09.757654
4031	5	4	11	2	\N	2018-03-03	-110.79	aae	2020-10-29 19:03:09.759022	2020-10-29 19:03:09.759022
4032	5	4	13	2	\N	2018-03-03	-49.90	5cf	2020-10-29 19:03:09.760306	2020-10-29 19:03:09.760306
4033	5	5	22	2	\N	2018-03-04	-20.00	123	2020-10-29 19:03:09.761823	2020-10-29 19:03:09.761823
4034	1	9	48	2	\N	2018-03-02	-100.00	bbb	2020-10-29 19:03:09.763181	2020-10-29 19:03:09.763181
4035	5	9	45	2	\N	2018-03-04	-25.60	946	2020-10-29 19:03:09.764645	2020-10-29 19:03:09.764645
4036	5	1	5	2	\N	2018-03-02	-142.72	6ee	2020-10-29 19:03:09.766126	2020-10-29 19:03:09.766126
4037	5	1	5	2	\N	2018-03-01	-18.80	e48	2020-10-29 19:03:09.76726	2020-10-29 19:03:09.76726
4038	5	1	5	2	\N	2018-03-01	-8.50	daf	2020-10-29 19:03:09.768333	2020-10-29 19:03:09.768333
4039	5	1	5	2	\N	2018-03-04	-10.92	e48	2020-10-29 19:03:09.769389	2020-10-29 19:03:09.769389
4040	2	10	51	3	\N	2018-03-02	-1500.00	5c9	2020-10-29 19:03:09.770459	2020-10-29 19:03:09.770459
4041	5	10	51	4	\N	2018-03-05	5500.00	d58	2020-10-29 19:03:09.771584	2020-10-29 19:03:09.771584
4042	1	10	51	4	\N	2018-03-04	4000.00	ec7	2020-10-29 19:03:09.772848	2020-10-29 19:03:09.772848
4043	1	4	-1	2	\N	2018-03-04	-974.00	d1a	2020-10-29 19:03:09.774262	2020-10-29 19:03:09.774262
4044	1	8	40	2	\N	2018-03-04	-241.89	0bd	2020-10-29 19:03:09.775483	2020-10-29 19:03:09.775483
4045	5	1	5	2	\N	2018-03-05	-3.58	476	2020-10-29 19:03:09.777085	2020-10-29 19:03:09.777085
4046	5	9	-1	3	\N	2018-03-06	-608.77	28d	2020-10-29 19:03:09.778663	2020-10-29 19:03:09.778663
4047	6	10	51	4	\N	2018-03-06	608.77	039	2020-10-29 19:03:09.779956	2020-10-29 19:03:09.779956
4048	5	10	51	3	\N	2018-03-06	-500.00	d29	2020-10-29 19:03:09.781267	2020-10-29 19:03:09.781267
4049	1	10	51	4	\N	2018-03-06	500.00	d29	2020-10-29 19:03:09.782683	2020-10-29 19:03:09.782683
4050	1	8	41	2	\N	2018-03-06	-25.44	d6e	2020-10-29 19:03:09.784093	2020-10-29 19:03:09.784093
4051	5	10	51	3	\N	2018-03-07	-2500.00	fc0	2020-10-29 19:03:09.785532	2020-10-29 19:03:09.785532
4052	1	9	45	2	\N	2018-03-08	-40.00	bdd	2020-10-29 19:03:09.786763	2020-10-29 19:03:09.786763
4053	5	8	40	2	\N	2018-03-08	-232.20	a6f	2020-10-29 19:03:09.788114	2020-10-29 19:03:09.788114
4054	5	1	5	2	\N	2018-03-08	-8.50	473	2020-10-29 19:03:09.789332	2020-10-29 19:03:09.789332
4055	5	1	5	2	\N	2018-03-08	-17.92	332	2020-10-29 19:03:09.790489	2020-10-29 19:03:09.790489
4056	5	5	20	2	\N	2018-03-08	-22.49	ceb	2020-10-29 19:03:09.791664	2020-10-29 19:03:09.791664
4057	5	1	5	2	\N	2018-03-09	-139.26	b5c	2020-10-29 19:03:09.792805	2020-10-29 19:03:09.792805
4058	5	3	-1	2	\N	2018-03-09	-13.59	3ea	2020-10-29 19:03:09.794244	2020-10-29 19:03:09.794244
4059	5	1	5	2	\N	2018-03-07	-6.30	332	2020-10-29 19:03:09.795362	2020-10-29 19:03:09.795362
4060	5	5	20	2	\N	2018-03-07	-20.47	ceb	2020-10-29 19:03:09.796442	2020-10-29 19:03:09.796442
4061	5	1	5	2	\N	2018-03-10	-7.92	add	2020-10-29 19:03:09.797877	2020-10-29 19:03:09.797877
4062	5	1	5	2	\N	2018-03-10	-5.40	5d4	2020-10-29 19:03:09.799424	2020-10-29 19:03:09.799424
4063	5	8	40	2	\N	2018-03-11	-94.99	3c5	2020-10-29 19:03:09.80074	2020-10-29 19:03:09.80074
4064	2	9	-1	2	\N	2018-03-12	-106.50	631	2020-10-29 19:03:09.801962	2020-10-29 19:03:09.801962
4065	2	9	44	2	\N	2018-03-12	-50.00	717	2020-10-29 19:03:09.803101	2020-10-29 19:03:09.803101
4066	2	4	15	2	\N	2018-03-12	-29.00	f35	2020-10-29 19:03:09.804321	2020-10-29 19:03:09.804321
4067	2	8	38	2	\N	2018-03-12	-50.00	f6a	2020-10-29 19:03:09.805495	2020-10-29 19:03:09.805495
4068	2	10	51	3	\N	2018-03-12	-500.00	68d	2020-10-29 19:03:09.806579	2020-10-29 19:03:09.806579
4069	4	10	51	4	\N	2018-03-12	500.00	68d	2020-10-29 19:03:09.807729	2020-10-29 19:03:09.807729
4070	2	10	51	3	\N	2018-03-12	-1000.00	659	2020-10-29 19:03:09.808875	2020-10-29 19:03:09.808875
4071	5	10	51	4	\N	2018-03-12	1000.00	659	2020-10-29 19:03:09.810109	2020-10-29 19:03:09.810109
4072	5	10	51	4	\N	2018-03-12	2500.00	4e8	2020-10-29 19:03:09.811353	2020-10-29 19:03:09.811353
4073	5	1	5	2	\N	2018-03-12	-5.37	476	2020-10-29 19:03:09.812527	2020-10-29 19:03:09.812527
4074	1	7	33	2	\N	2018-03-12	-16.99	114	2020-10-29 19:03:09.813719	2020-10-29 19:03:09.813719
4075	2	1	6	2	\N	2018-03-13	-31.00	743	2020-10-29 19:03:09.814895	2020-10-29 19:03:09.814895
4076	2	3	-1	2	\N	2018-03-13	-18.00	de2	2020-10-29 19:03:09.816223	2020-10-29 19:03:09.816223
4077	2	7	34	2	\N	2018-03-13	-19.99	fa2	2020-10-29 19:03:09.817365	2020-10-29 19:03:09.817365
4078	5	5	20	2	\N	2018-03-14	-7.00	ceb	2020-10-29 19:03:09.818966	2020-10-29 19:03:09.818966
4079	5	1	5	2	\N	2018-03-15	-3.00	473	2020-10-29 19:03:09.820115	2020-10-29 19:03:09.820115
4080	5	1	5	2	\N	2018-03-16	-152.13	e5f	2020-10-29 19:03:09.821276	2020-10-29 19:03:09.821276
4081	5	1	5	2	\N	2018-03-15	-9.59	d9a	2020-10-29 19:03:09.822501	2020-10-29 19:03:09.822501
4082	5	1	5	2	\N	2018-03-14	-10.47	7c2	2020-10-29 19:03:09.823706	2020-10-29 19:03:09.823706
4083	1	7	34	2	\N	2018-03-17	-81.76	703	2020-10-29 19:03:09.824849	2020-10-29 19:03:09.824849
4084	5	1	5	2	\N	2018-03-17	-9.80	473	2020-10-29 19:03:09.825947	2020-10-29 19:03:09.825947
4085	5	5	20	2	\N	2018-03-17	-9.95	e0a	2020-10-29 19:03:09.827077	2020-10-29 19:03:09.827077
4086	5	1	5	2	\N	2018-03-17	-3.58	d9a	2020-10-29 19:03:09.82817	2020-10-29 19:03:09.82817
4087	1	4	15	2	\N	2018-03-18	-19.00	de2	2020-10-29 19:03:09.829309	2020-10-29 19:03:09.829309
4088	2	4	13	2	\N	2018-03-18	-14.99	ad7	2020-10-29 19:03:09.8304	2020-10-29 19:03:09.8304
4089	2	1	6	2	\N	2018-03-18	-35.00	629	2020-10-29 19:03:09.831553	2020-10-29 19:03:09.831553
4090	2	1	6	2	\N	2018-03-18	-33.50	925	2020-10-29 19:03:09.833157	2020-10-29 19:03:09.833157
4091	2	1	5	2	\N	2018-03-18	-11.88	f3e	2020-10-29 19:03:09.834388	2020-10-29 19:03:09.834388
4092	5	1	5	2	\N	2018-03-18	-10.97	8a9	2020-10-29 19:03:09.835633	2020-10-29 19:03:09.835633
4093	5	4	-1	2	\N	2018-03-19	-195.00	12c	2020-10-29 19:03:09.837016	2020-10-29 19:03:09.837016
4094	1	5	18	2	\N	2018-03-19	-7.58	092	2020-10-29 19:03:09.838348	2020-10-29 19:03:09.838348
4095	1	9	45	2	\N	2018-03-19	-149.00	aa8	2020-10-29 19:03:09.839581	2020-10-29 19:03:09.839581
4096	5	1	8	2	\N	2018-03-20	-4.99	d5d	2020-10-29 19:03:09.84093	2020-10-29 19:03:09.84093
4097	2	1	5	2	\N	2018-03-21	-3.60	e49	2020-10-29 19:03:09.842085	2020-10-29 19:03:09.842085
4098	5	8	40	2	\N	2018-03-21	-272.00	95f	2020-10-29 19:03:09.843263	2020-10-29 19:03:09.843263
4099	5	5	20	2	\N	2018-03-21	-3.00	f49	2020-10-29 19:03:09.844342	2020-10-29 19:03:09.844342
4100	5	1	5	2	\N	2018-03-21	-9.90	476	2020-10-29 19:03:09.845455	2020-10-29 19:03:09.845455
4101	1	1	7	2	\N	2018-03-21	-15.30	e33	2020-10-29 19:03:09.846779	2020-10-29 19:03:09.846779
4102	5	4	13	2	\N	2018-03-22	-59.80	97a	2020-10-29 19:03:09.848136	2020-10-29 19:03:09.848136
4103	2	5	20	2	\N	2018-03-21	-19.13	681	2020-10-29 19:03:09.849788	2020-10-29 19:03:09.849788
4104	5	1	-1	2	\N	2018-03-22	-11.95	f28	2020-10-29 19:03:09.851215	2020-10-29 19:03:09.851215
4105	1	3	-1	2	\N	2018-03-23	-50.43	3ea	2020-10-29 19:03:09.852681	2020-10-29 19:03:09.852681
4106	5	5	20	2	\N	2018-03-22	-27.61	ceb	2020-10-29 19:03:09.85395	2020-10-29 19:03:09.85395
4107	5	8	40	2	\N	2018-03-23	-98.00	b78	2020-10-29 19:03:09.855068	2020-10-29 19:03:09.855068
4108	5	1	5	2	\N	2018-03-24	-11.86	7d2	2020-10-29 19:03:09.856132	2020-10-29 19:03:09.856132
4109	5	1	5	2	\N	2018-03-22	-11.36	e14	2020-10-29 19:03:09.857142	2020-10-29 19:03:09.857142
4110	5	1	5	2	\N	2018-03-23	-230.00	e5f	2020-10-29 19:03:09.858172	2020-10-29 19:03:09.858172
4111	5	1	5	2	\N	2018-03-23	-16.70	332	2020-10-29 19:03:09.859338	2020-10-29 19:03:09.859338
4112	5	1	5	2	\N	2018-03-22	-16.00	473	2020-10-29 19:03:09.860597	2020-10-29 19:03:09.860597
4113	1	7	27	2	\N	2018-03-25	-25.00	c54	2020-10-29 19:03:09.861876	2020-10-29 19:03:09.861876
4114	1	1	5	2	\N	2018-03-25	-3.99	996	2020-10-29 19:03:09.863088	2020-10-29 19:03:09.863088
4115	2	1	6	2	\N	2018-03-26	-85.50	ecd	2020-10-29 19:03:09.864294	2020-10-29 19:03:09.864294
4116	2	9	44	2	\N	2018-03-26	-50.00	934	2020-10-29 19:03:09.866026	2020-10-29 19:03:09.866026
4117	2	3	-1	2	\N	2018-03-26	-10.50	a4f	2020-10-29 19:03:09.867312	2020-10-29 19:03:09.867312
4118	5	7	28	2	\N	2018-03-26	-22.00	fc7	2020-10-29 19:03:09.868625	2020-10-29 19:03:09.868625
4119	1	9	45	2	\N	2018-03-26	-49.99	9c6	2020-10-29 19:03:09.869831	2020-10-29 19:03:09.869831
4120	1	5	20	2	\N	2018-03-26	-210.02	ceb	2020-10-29 19:03:09.871239	2020-10-29 19:03:09.871239
4121	1	7	33	2	\N	2018-03-26	-250.39	866	2020-10-29 19:03:09.872634	2020-10-29 19:03:09.872634
4122	1	2	1	1	\N	2018-03-26	9500.59	d8c	2020-10-29 19:03:09.87392	2020-10-29 19:03:09.87392
4123	1	10	51	3	\N	2018-03-26	-500.00	28a	2020-10-29 19:03:09.875273	2020-10-29 19:03:09.875273
4124	1	10	51	3	\N	2018-03-26	-1000.00	5d8	2020-10-29 19:03:09.876501	2020-10-29 19:03:09.876501
4125	1	10	51	3	\N	2018-03-26	-1000.00	39f	2020-10-29 19:03:09.877718	2020-10-29 19:03:09.877718
4126	6	10	51	4	\N	2018-03-26	1000.00	39f	2020-10-29 19:03:09.879033	2020-10-29 19:03:09.879033
4127	1	9	48	2	\N	2018-03-26	-100.00	bbb	2020-10-29 19:03:09.880288	2020-10-29 19:03:09.880288
4128	5	1	5	2	\N	2018-03-28	-16.99	8a9	2020-10-29 19:03:09.881516	2020-10-29 19:03:09.881516
4129	2	7	34	1	\N	2018-03-28	73.70	db9	2020-10-29 19:03:09.883086	2020-10-29 19:03:09.883086
4130	2	7	34	1	\N	2018-03-28	70.70	db9	2020-10-29 19:03:09.884324	2020-10-29 19:03:09.884324
4131	2	2	1	1	\N	2018-03-28	5750.32	bbf	2020-10-29 19:03:09.885532	2020-10-29 19:03:09.885532
4132	2	10	51	3	\N	2018-03-29	-1500.00	0e3	2020-10-29 19:03:09.886772	2020-10-29 19:03:09.886772
4133	5	10	51	4	\N	2018-03-29	1500.00	0e3	2020-10-29 19:03:09.888105	2020-10-29 19:03:09.888105
4134	2	10	51	3	\N	2018-03-29	-500.00	aee	2020-10-29 19:03:09.889582	2020-10-29 19:03:09.889582
4135	4	10	51	4	\N	2018-03-29	500.00	aee	2020-10-29 19:03:09.891032	2020-10-29 19:03:09.891032
4136	2	10	51	3	\N	2018-03-29	-2000.00	490	2020-10-29 19:03:09.892249	2020-10-29 19:03:09.892249
4137	6	10	51	4	\N	2018-03-29	2000.00	490	2020-10-29 19:03:09.893366	2020-10-29 19:03:09.893366
4138	5	4	-1	2	\N	2018-03-29	-590.00	e12	2020-10-29 19:03:09.8945	2020-10-29 19:03:09.8945
4139	5	4	10	2	\N	2018-03-29	-419.22	037	2020-10-29 19:03:09.895718	2020-10-29 19:03:09.895718
4140	5	4	12	2	\N	2018-03-29	-80.32	119	2020-10-29 19:03:09.897029	2020-10-29 19:03:09.897029
4141	5	7	27	2	\N	2018-03-30	-200.00	e1f	2020-10-29 19:03:09.898382	2020-10-29 19:03:09.898382
4142	1	9	48	2	\N	2018-03-29	-20.00	909	2020-10-29 19:03:09.899812	2020-10-29 19:03:09.899812
4143	1	7	34	2	\N	2018-03-31	-8.99	506	2020-10-29 19:03:09.901313	2020-10-29 19:03:09.901313
4144	5	5	20	3	\N	2018-03-31	-226.00	49b	2020-10-29 19:03:09.902674	2020-10-29 19:03:09.902674
4145	1	2	2	4	\N	2018-03-31	226.00	49b	2020-10-29 19:03:09.904124	2020-10-29 19:03:09.904124
4146	1	10	51	3	\N	2018-03-31	-7000.00	518	2020-10-29 19:03:09.90533	2020-10-29 19:03:09.90533
4147	5	7	30	3	\N	2018-03-31	-15.00	1c5	2020-10-29 19:03:09.906436	2020-10-29 19:03:09.906436
4148	1	2	2	4	\N	2018-03-31	15.00	1c5	2020-10-29 19:03:09.907698	2020-10-29 19:03:09.907698
4149	2	5	20	1	\N	2018-03-22	109.59	6e4	2020-10-29 19:03:09.908979	2020-10-29 19:03:09.908979
4150	1	9	-1	2	\N	2018-04-01	-34.33	381	2020-10-29 19:03:09.910272	2020-10-29 19:03:09.910272
4151	5	9	-1	2	\N	2018-04-01	-8.63	381	2020-10-29 19:03:09.91166	2020-10-29 19:03:09.91166
4152	1	9	-1	2	\N	2018-04-01	-146.86	0b0	2020-10-29 19:03:09.913318	2020-10-29 19:03:09.913318
4153	1	8	38	2	\N	2018-04-01	-46.00	912	2020-10-29 19:03:09.91516	2020-10-29 19:03:09.91516
4154	6	2	-1	4	\N	2018-04-02	200.00	6ab	2020-10-29 19:03:09.916821	2020-10-29 19:03:09.916821
4155	6	10	52	1	\N	2018-04-01	134.90	15b	2020-10-29 19:03:09.918196	2020-10-29 19:03:09.918196
4156	5	1	5	2	\N	2018-04-02	-3.40	d9a	2020-10-29 19:03:09.91945	2020-10-29 19:03:09.91945
4157	5	8	40	2	\N	2018-04-01	-179.36	d6e	2020-10-29 19:03:09.920693	2020-10-29 19:03:09.920693
4158	2	7	29	2	\N	2018-04-02	-306.94	5ec	2020-10-29 19:03:09.92199	2020-10-29 19:03:09.92199
4159	2	9	-1	1	\N	2018-04-03	105.00	f2f	2020-10-29 19:03:09.92329	2020-10-29 19:03:09.92329
4160	2	4	15	2	\N	2018-04-03	-19.99	de2	2020-10-29 19:03:09.924868	2020-10-29 19:03:09.924868
4161	5	4	-1	2	\N	2018-04-05	-189.00	693	2020-10-29 19:03:09.926446	2020-10-29 19:03:09.926446
4162	5	1	5	2	\N	2018-04-06	-121.41	463	2020-10-29 19:03:09.927819	2020-10-29 19:03:09.927819
4163	1	8	42	2	\N	2018-04-08	-22.00	a68	2020-10-29 19:03:09.929315	2020-10-29 19:03:09.929315
4164	1	7	27	2	\N	2018-04-07	-25.00	272	2020-10-29 19:03:09.93065	2020-10-29 19:03:09.93065
4165	1	1	6	2	\N	2018-04-07	-56.50	af6	2020-10-29 19:03:09.932738	2020-10-29 19:03:09.932738
4166	1	3	-1	2	\N	2018-04-06	-18.00	16f	2020-10-29 19:03:09.934288	2020-10-29 19:03:09.934288
4167	1	1	7	2	\N	2018-04-06	-13.11	e37	2020-10-29 19:03:09.935493	2020-10-29 19:03:09.935493
4168	1	1	5	2	\N	2018-04-05	-43.90	b88	2020-10-29 19:03:09.936727	2020-10-29 19:03:09.936727
4169	1	3	-1	2	\N	2018-04-05	-23.47	3ea	2020-10-29 19:03:09.938459	2020-10-29 19:03:09.938459
4170	1	8	42	2	\N	2018-04-04	-21.79	897	2020-10-29 19:03:09.939733	2020-10-29 19:03:09.939733
4171	5	1	5	2	\N	2018-04-06	-1.25	217	2020-10-29 19:03:09.941247	2020-10-29 19:03:09.941247
4172	5	1	5	2	\N	2018-04-05	-6.28	7d2	2020-10-29 19:03:09.942613	2020-10-29 19:03:09.942613
4173	5	10	51	4	\N	2018-04-04	5500.00	039	2020-10-29 19:03:09.944185	2020-10-29 19:03:09.944185
4174	5	10	51	3	\N	2018-04-08	-200.00	f36	2020-10-29 19:03:09.94579	2020-10-29 19:03:09.94579
4175	6	8	40	2	\N	2018-04-09	-585.00	63a	2020-10-29 19:03:09.947278	2020-10-29 19:03:09.947278
4176	1	5	19	2	\N	2018-04-09	-1769.00	04a	2020-10-29 19:03:09.949165	2020-10-29 19:03:09.949165
4177	1	1	7	2	\N	2018-04-09	-13.36	e33	2020-10-29 19:03:09.950578	2020-10-29 19:03:09.950578
4178	5	10	51	3	\N	2018-04-09	-2500.00	3c9	2020-10-29 19:03:09.952018	2020-10-29 19:03:09.952018
4179	5	10	51	4	\N	2018-04-10	2500.00	d9d	2020-10-29 19:03:09.953393	2020-10-29 19:03:09.953393
4180	1	4	15	2	\N	2018-04-11	-19.00	de2	2020-10-29 19:03:09.954743	2020-10-29 19:03:09.954743
4181	1	1	5	2	\N	2018-04-12	-26.98	7d2	2020-10-29 19:03:09.956256	2020-10-29 19:03:09.956256
4182	5	1	8	2	\N	2018-04-11	-4.99	b89	2020-10-29 19:03:09.957613	2020-10-29 19:03:09.957613
4183	5	1	5	2	\N	2018-04-11	-3.75	85c	2020-10-29 19:03:09.958913	2020-10-29 19:03:09.958913
4184	5	8	40	2	\N	2018-04-12	-761.00	aa8	2020-10-29 19:03:09.960294	2020-10-29 19:03:09.960294
4185	5	1	5	2	\N	2018-04-10	-2.36	85c	2020-10-29 19:03:09.961843	2020-10-29 19:03:09.961843
4186	6	10	51	3	\N	2018-04-11	-43000.00	f19	2020-10-29 19:03:09.963135	2020-10-29 19:03:09.963135
4187	5	10	51	4	\N	2018-04-11	43000.00	f19	2020-10-29 19:03:09.965964	2020-10-29 19:03:09.965964
4188	2	5	18	2	\N	2018-04-14	-82.90	c29	2020-10-29 19:03:09.967481	2020-10-29 19:03:09.967481
4189	2	5	20	2	\N	2018-04-14	-3.99	459	2020-10-29 19:03:09.96887	2020-10-29 19:03:09.96887
4190	5	9	45	2	\N	2018-04-14	-44.40	2db	2020-10-29 19:03:09.970176	2020-10-29 19:03:09.970176
4191	2	3	-1	2	\N	2018-04-13	-16.50	b50	2020-10-29 19:03:09.971402	2020-10-29 19:03:09.971402
4192	2	1	5	2	\N	2018-04-14	-7.56	0fc	2020-10-29 19:03:09.97268	2020-10-29 19:03:09.97268
4193	2	4	13	2	\N	2018-04-16	-14.99	f2b	2020-10-29 19:03:09.974209	2020-10-29 19:03:09.974209
4194	1	1	7	2	\N	2018-04-13	-19.10	e33	2020-10-29 19:03:09.975484	2020-10-29 19:03:09.975484
4195	1	7	33	2	\N	2018-04-14	-89.80	ba5	2020-10-29 19:03:09.976729	2020-10-29 19:03:09.976729
4196	1	7	32	2	\N	2018-04-16	-62.80	921	2020-10-29 19:03:09.977897	2020-10-29 19:03:09.977897
4197	5	8	40	2	\N	2018-04-15	-216.31	588	2020-10-29 19:03:09.97908	2020-10-29 19:03:09.97908
4198	5	5	20	2	\N	2018-04-13	-16.49	6d8	2020-10-29 19:03:09.98039	2020-10-29 19:03:09.98039
4199	5	1	5	2	\N	2018-04-13	-161.76	e5f	2020-10-29 19:03:09.981634	2020-10-29 19:03:09.981634
4200	5	1	5	2	\N	2018-04-14	-7.48	a93	2020-10-29 19:03:09.983372	2020-10-29 19:03:09.983372
4201	5	1	5	2	\N	2018-04-14	-7.98	b6c	2020-10-29 19:03:09.984649	2020-10-29 19:03:09.984649
4202	5	1	5	2	\N	2018-04-14	-12.50	f13	2020-10-29 19:03:09.98602	2020-10-29 19:03:09.98602
4203	5	1	5	2	\N	2018-04-18	6.58	8c3	2020-10-29 19:03:09.987694	2020-10-29 19:03:09.987694
4204	1	2	2	1	\N	2018-04-18	50.00	e6a	2020-10-29 19:03:09.988944	2020-10-29 19:03:09.988944
4205	5	1	5	2	\N	2018-04-17	-39.08	8c3	2020-10-29 19:03:09.990208	2020-10-29 19:03:09.990208
4206	5	1	5	2	\N	2018-04-21	-11.20	f13	2020-10-29 19:03:09.991343	2020-10-29 19:03:09.991343
4207	1	9	45	2	\N	2018-04-21	-22.00	3f2	2020-10-29 19:03:09.992495	2020-10-29 19:03:09.992495
4208	1	1	5	2	\N	2018-04-20	-17.56	8c3	2020-10-29 19:03:09.993761	2020-10-29 19:03:09.993761
4209	5	1	5	2	\N	2018-04-18	-39.08	8c3	2020-10-29 19:03:09.995143	2020-10-29 19:03:09.995143
4210	5	1	5	2	\N	2018-04-20	-97.19	e5f	2020-10-29 19:03:09.99685	2020-10-29 19:03:09.99685
4211	1	1	6	2	\N	2018-04-21	-6.00	8fc	2020-10-29 19:03:09.998314	2020-10-29 19:03:09.998314
4212	1	5	22	2	\N	2018-04-21	-25.00	9da	2020-10-29 19:03:10.000145	2020-10-29 19:03:10.000145
4213	1	9	48	2	\N	2018-04-21	-100.00	bbb	2020-10-29 19:03:10.001455	2020-10-29 19:03:10.001455
4214	2	6	24	2	\N	2018-04-19	-39.00	248	2020-10-29 19:03:10.002729	2020-10-29 19:03:10.002729
4215	1	10	51	4	\N	2018-04-23	1500.00	3aa	2020-10-29 19:03:10.00412	2020-10-29 19:03:10.00412
4216	1	3	-1	2	\N	2018-04-22	-10.50	3ea	2020-10-29 19:03:10.005748	2020-10-29 19:03:10.005748
4217	1	3	-1	2	\N	2018-04-21	-18.00	3ea	2020-10-29 19:03:10.007008	2020-10-29 19:03:10.007008
4218	1	9	45	2	\N	2018-04-23	-12.00	5a8	2020-10-29 19:03:10.008576	2020-10-29 19:03:10.008576
4219	1	9	46	2	\N	2018-04-23	-372.75	cd7	2020-10-29 19:03:10.010531	2020-10-29 19:03:10.010531
4220	5	1	5	2	\N	2018-04-23	-14.57	7d2	2020-10-29 19:03:10.011953	2020-10-29 19:03:10.011953
4221	2	5	18	2	\N	2018-04-24	-99.80	587	2020-10-29 19:03:10.013482	2020-10-29 19:03:10.013482
4222	2	5	20	2	\N	2018-04-24	-90.48	9ae	2020-10-29 19:03:10.014891	2020-10-29 19:03:10.014891
4223	2	1	5	2	\N	2018-04-25	-6.57	12a	2020-10-29 19:03:10.016509	2020-10-29 19:03:10.016509
4224	2	9	44	2	\N	2018-04-26	-50.00	ce8	2020-10-29 19:03:10.018114	2020-10-29 19:03:10.018114
4225	2	6	24	2	\N	2018-04-26	-39.00	295	2020-10-29 19:03:10.019326	2020-10-29 19:03:10.019326
4226	2	2	1	1	\N	2018-04-27	5747.61	0cc	2020-10-29 19:03:10.020456	2020-10-29 19:03:10.020456
4227	2	10	51	3	\N	2018-04-27	-1500.00	edd	2020-10-29 19:03:10.021584	2020-10-29 19:03:10.021584
4228	5	10	51	4	\N	2018-04-27	1500.00	edd	2020-10-29 19:03:10.022871	2020-10-29 19:03:10.022871
4229	2	10	51	3	\N	2018-04-27	-500.00	8ce	2020-10-29 19:03:10.024265	2020-10-29 19:03:10.024265
4230	4	10	51	4	\N	2018-04-27	500.00	8ce	2020-10-29 19:03:10.026062	2020-10-29 19:03:10.026062
4231	2	10	51	3	\N	2018-04-27	-1600.00	490	2020-10-29 19:03:10.027349	2020-10-29 19:03:10.027349
4232	6	10	51	4	\N	2018-04-27	1600.00	490	2020-10-29 19:03:10.028567	2020-10-29 19:03:10.028567
4233	5	4	13	2	\N	2018-04-27	-49.90	7b8	2020-10-29 19:03:10.029764	2020-10-29 19:03:10.029764
4234	1	9	-1	3	\N	2018-04-26	-20.00	874	2020-10-29 19:03:10.031407	2020-10-29 19:03:10.031407
4235	5	3	-1	2	\N	2018-04-27	-17.50	925	2020-10-29 19:03:10.032772	2020-10-29 19:03:10.032772
4236	5	1	5	2	\N	2018-04-27	-225.67	bee	2020-10-29 19:03:10.03407	2020-10-29 19:03:10.03407
4237	5	1	8	2	\N	2018-04-26	-4.99	f21	2020-10-29 19:03:10.035187	2020-10-29 19:03:10.035187
4238	5	1	5	2	\N	2018-04-25	-5.40	f13	2020-10-29 19:03:10.036256	2020-10-29 19:03:10.036256
4239	1	1	7	2	\N	2018-04-27	-18.60	573	2020-10-29 19:03:10.037471	2020-10-29 19:03:10.037471
4240	1	1	7	2	\N	2018-04-26	-12.70	573	2020-10-29 19:03:10.038787	2020-10-29 19:03:10.038787
4241	1	1	7	2	\N	2018-04-25	-14.19	573	2020-10-29 19:03:10.040103	2020-10-29 19:03:10.040103
4242	1	9	46	2	\N	2018-04-26	-79.50	662	2020-10-29 19:03:10.041472	2020-10-29 19:03:10.041472
4243	1	2	1	1	\N	2018-04-27	15337.99	43c	2020-10-29 19:03:10.042732	2020-10-29 19:03:10.042732
4244	1	10	51	3	\N	2018-04-28	-7500.00	52c	2020-10-29 19:03:10.043988	2020-10-29 19:03:10.043988
4245	6	10	51	4	\N	2018-04-28	7500.00	52c	2020-10-29 19:03:10.045651	2020-10-29 19:03:10.045651
4246	1	10	51	3	\N	2018-04-28	-500.00	359	2020-10-29 19:03:10.046908	2020-10-29 19:03:10.046908
4247	1	9	45	2	\N	2018-04-28	-83.97	86c	2020-10-29 19:03:10.048093	2020-10-29 19:03:10.048093
4248	5	1	5	2	\N	2018-04-28	-88.02	7d2	2020-10-29 19:03:10.049826	2020-10-29 19:03:10.049826
4249	5	1	5	2	\N	2018-04-28	-16.75	473	2020-10-29 19:03:10.051787	2020-10-29 19:03:10.051787
4250	5	4	-1	2	\N	2018-04-28	-590.00	401	2020-10-29 19:03:10.053504	2020-10-29 19:03:10.053504
4251	5	4	10	2	\N	2018-04-28	-391.79	105	2020-10-29 19:03:10.054899	2020-10-29 19:03:10.054899
4252	5	4	10	2	\N	2018-04-28	-135.45	092	2020-10-29 19:03:10.056395	2020-10-29 19:03:10.056395
4253	5	4	12	2	\N	2018-04-28	-109.78	6b4	2020-10-29 19:03:10.057736	2020-10-29 19:03:10.057736
4254	5	4	11	2	\N	2018-04-28	-106.21	2e7	2020-10-29 19:03:10.059424	2020-10-29 19:03:10.059424
4255	2	7	30	2	\N	2018-04-28	-105.00	82e	2020-10-29 19:03:10.060696	2020-10-29 19:03:10.060696
4256	1	9	45	2	\N	2018-04-28	-108.00	892	2020-10-29 19:03:10.061997	2020-10-29 19:03:10.061997
4257	1	3	-1	2	\N	2018-04-28	-12.07	e73	2020-10-29 19:03:10.063342	2020-10-29 19:03:10.063342
4258	2	8	38	2	\N	2018-04-28	-50.00	074	2020-10-29 19:03:10.06475	2020-10-29 19:03:10.06475
4259	2	3	-1	2	\N	2018-04-28	-20.60	459	2020-10-29 19:03:10.066665	2020-10-29 19:03:10.066665
4260	1	2	2	4	\N	2018-04-30	15.00	58d	2020-10-29 19:03:10.068037	2020-10-29 19:03:10.068037
4261	1	5	19	2	\N	2018-04-30	-1012.50	04a	2020-10-29 19:03:10.069878	2020-10-29 19:03:10.069878
4262	1	1	5	2	\N	2018-04-30	-39.21	8e5	2020-10-29 19:03:10.071194	2020-10-29 19:03:10.071194
4263	5	1	5	2	\N	2018-04-30	-17.76	dd9	2020-10-29 19:03:10.072979	2020-10-29 19:03:10.072979
4264	5	7	30	3	\N	2018-04-30	-15.00	58d	2020-10-29 19:03:10.074195	2020-10-29 19:03:10.074195
4265	1	8	38	2	\N	2018-04-30	-23.40	074	2020-10-29 19:03:10.075288	2020-10-29 19:03:10.075288
4266	1	7	32	2	\N	2018-04-28	-102.00	c17	2020-10-29 19:03:10.076484	2020-10-29 19:03:10.076484
4267	2	4	15	2	\N	2018-04-30	-29.00	f48	2020-10-29 19:03:10.078062	2020-10-29 19:03:10.078062
4268	5	2	1	1	\N	2018-04-27	1500.00	6f1	2020-10-29 19:03:10.079436	2020-10-29 19:03:10.079436
4269	6	10	52	1	\N	2018-04-30	105.81	15b	2020-10-29 19:03:10.081204	2020-10-29 19:03:10.081204
4270	6	9	-1	1	\N	2018-05-01	39.69	45c	2020-10-29 19:03:10.082849	2020-10-29 19:03:10.082849
4271	1	9	-1	2	\N	2018-05-01	-70.85	f6e	2020-10-29 19:03:10.084298	2020-10-29 19:03:10.084298
4272	5	9	-1	1	\N	2018-05-01	50.00	3ff	2020-10-29 19:03:10.085632	2020-10-29 19:03:10.085632
4273	5	9	45	2	\N	2018-05-10	-500.00	c56	2020-10-29 19:03:10.086948	2020-10-29 19:03:10.086948
4274	5	1	5	2	\N	2018-05-04	-50.11	7d2	2020-10-29 19:03:10.088246	2020-10-29 19:03:10.088246
4275	5	4	-1	2	\N	2018-05-05	-153.00	f8a	2020-10-29 19:03:10.089444	2020-10-29 19:03:10.089444
4276	2	9	44	2	\N	2018-05-03	-50.00	17b	2020-10-29 19:03:10.090601	2020-10-29 19:03:10.090601
4277	5	10	51	4	\N	2018-05-04	5500.00	93e	2020-10-29 19:03:10.091681	2020-10-29 19:03:10.091681
4278	5	1	5	2	\N	2018-05-05	-28.92	17e	2020-10-29 19:03:10.092975	2020-10-29 19:03:10.092975
4279	5	1	5	2	\N	2018-04-30	-51.05	8b8	2020-10-29 19:03:10.094442	2020-10-29 19:03:10.094442
4280	5	8	40	2	\N	2018-05-05	-171.15	588	2020-10-29 19:03:10.095779	2020-10-29 19:03:10.095779
4281	5	1	5	2	\N	2018-05-04	-14.57	d3a	2020-10-29 19:03:10.097085	2020-10-29 19:03:10.097085
4282	5	1	5	2	\N	2018-05-07	-61.56	a4a	2020-10-29 19:03:10.098517	2020-10-29 19:03:10.098517
4283	5	1	5	2	\N	2018-05-08	-22.31	a67	2020-10-29 19:03:10.100204	2020-10-29 19:03:10.100204
4284	5	10	51	3	\N	2018-05-11	-500.00	789	2020-10-29 19:03:10.101518	2020-10-29 19:03:10.101518
4285	5	10	51	3	\N	2018-05-11	-1000.00	039	2020-10-29 19:03:10.102887	2020-10-29 19:03:10.102887
4286	6	10	51	4	\N	2018-05-11	1000.00	039	2020-10-29 19:03:10.104055	2020-10-29 19:03:10.104055
4287	5	10	51	4	\N	2018-05-11	4900.00	d9d	2020-10-29 19:03:10.105177	2020-10-29 19:03:10.105177
4288	5	10	51	3	\N	2018-05-11	-4926.88	039	2020-10-29 19:03:10.106379	2020-10-29 19:03:10.106379
4289	6	10	51	4	\N	2018-05-11	4926.88	039	2020-10-29 19:03:10.107735	2020-10-29 19:03:10.107735
4290	5	8	40	2	\N	2018-05-11	-141.40	9cd	2020-10-29 19:03:10.109551	2020-10-29 19:03:10.109551
4291	5	8	40	2	\N	2018-05-11	-140.17	d29	2020-10-29 19:03:10.110883	2020-10-29 19:03:10.110883
4292	5	1	5	2	\N	2018-05-06	-12.28	8c3	2020-10-29 19:03:10.112451	2020-10-29 19:03:10.112451
4293	1	1	6	2	\N	2018-05-16	-28.90	534	2020-10-29 19:03:10.113588	2020-10-29 19:03:10.113588
4294	5	1	5	2	\N	2018-05-15	-8.50	473	2020-10-29 19:03:10.114842	2020-10-29 19:03:10.114842
4295	1	5	19	2	\N	2018-05-14	-100.00	4be	2020-10-29 19:03:10.116117	2020-10-29 19:03:10.116117
4296	1	1	7	2	\N	2018-05-15	-15.88	e33	2020-10-29 19:03:10.117979	2020-10-29 19:03:10.117979
4297	1	1	7	2	\N	2018-05-15	-2.80	73e	2020-10-29 19:03:10.119386	2020-10-29 19:03:10.119386
4298	1	7	32	2	\N	2018-05-15	-150.00	c78	2020-10-29 19:03:10.120577	2020-10-29 19:03:10.120577
4299	1	4	15	2	\N	2018-05-14	-19.00	de2	2020-10-29 19:03:10.121856	2020-10-29 19:03:10.121856
4300	1	9	45	2	\N	2018-05-14	-99.00	195	2020-10-29 19:03:10.123013	2020-10-29 19:03:10.123013
4301	1	10	51	3	\N	2018-05-11	-150.00	d40	2020-10-29 19:03:10.124177	2020-10-29 19:03:10.124177
4302	1	10	51	3	\N	2018-05-11	-4000.00	789	2020-10-29 19:03:10.125376	2020-10-29 19:03:10.125376
4303	1	1	5	2	\N	2018-05-11	-3.00	473	2020-10-29 19:03:10.126589	2020-10-29 19:03:10.126589
4304	1	3	-1	2	\N	2018-05-11	-16.00	1a5	2020-10-29 19:03:10.12781	2020-10-29 19:03:10.12781
4305	1	9	48	2	\N	2018-05-10	-100.00	bbb	2020-10-29 19:03:10.129018	2020-10-29 19:03:10.129018
4306	1	2	-1	1	\N	2018-05-10	3823.45	a45	2020-10-29 19:03:10.130173	2020-10-29 19:03:10.130173
4307	1	3	-1	2	\N	2018-05-10	-9.00	43c	2020-10-29 19:03:10.131607	2020-10-29 19:03:10.131607
4308	1	3	-1	2	\N	2018-05-10	-22.00	0f3	2020-10-29 19:03:10.133115	2020-10-29 19:03:10.133115
4309	1	1	6	2	\N	2018-05-10	-20.00	845	2020-10-29 19:03:10.134425	2020-10-29 19:03:10.134425
4310	1	5	18	2	\N	2018-05-09	-56.97	90b	2020-10-29 19:03:10.13565	2020-10-29 19:03:10.13565
4311	1	1	7	2	\N	2018-05-09	-2.80	73e	2020-10-29 19:03:10.136991	2020-10-29 19:03:10.136991
4312	1	5	18	2	\N	2018-05-08	-50.90	8e7	2020-10-29 19:03:10.138264	2020-10-29 19:03:10.138264
4313	1	7	28	2	\N	2018-05-07	-15.00	dc0	2020-10-29 19:03:10.139645	2020-10-29 19:03:10.139645
4314	1	2	2	1	\N	2018-05-07	108.00	50c	2020-10-29 19:03:10.141142	2020-10-29 19:03:10.141142
4315	1	8	38	2	\N	2018-05-07	-46.00	a3a	2020-10-29 19:03:10.142175	2020-10-29 19:03:10.142175
4316	1	9	46	3	\N	2018-05-07	-150.00	29e	2020-10-29 19:03:10.143615	2020-10-29 19:03:10.143615
4317	1	10	51	4	\N	2018-05-04	1500.00	2b5	2020-10-29 19:03:10.144797	2020-10-29 19:03:10.144797
4318	1	10	51	3	\N	2018-05-02	-7000.00	15a	2020-10-29 19:03:10.146116	2020-10-29 19:03:10.146116
4319	1	3	-1	2	\N	2018-05-04	-8.18	3ed	2020-10-29 19:03:10.147328	2020-10-29 19:03:10.147328
4320	1	1	6	2	\N	2018-05-04	-253.00	557	2020-10-29 19:03:10.148623	2020-10-29 19:03:10.148623
4321	5	1	5	2	\N	2018-05-17	-10.74	7fb	2020-10-29 19:03:10.150327	2020-10-29 19:03:10.150327
4322	5	1	5	2	\N	2018-05-16	-12.28	7d2	2020-10-29 19:03:10.151505	2020-10-29 19:03:10.151505
4323	5	1	5	2	\N	2018-05-07	-19.40	7d2	2020-10-29 19:03:10.152745	2020-10-29 19:03:10.152745
4324	5	1	5	2	\N	2018-05-09	-15.60	473	2020-10-29 19:03:10.154433	2020-10-29 19:03:10.154433
4325	5	9	44	2	\N	2018-05-17	-50.00	b40	2020-10-29 19:03:10.156	2020-10-29 19:03:10.156
4326	5	9	44	2	\N	2018-05-16	-50.00	778	2020-10-29 19:03:10.157243	2020-10-29 19:03:10.157243
4327	5	1	5	2	\N	2018-05-17	-22.31	daf	2020-10-29 19:03:10.158369	2020-10-29 19:03:10.158369
4328	2	4	13	2	\N	2018-05-18	-29.99	fc6	2020-10-29 19:03:10.159683	2020-10-29 19:03:10.159683
4329	6	10	51	3	\N	2018-05-18	-10000.00	3ae	2020-10-29 19:03:10.16108	2020-10-29 19:03:10.16108
4330	5	10	51	4	\N	2018-05-18	10000.00	3ae	2020-10-29 19:03:10.162336	2020-10-29 19:03:10.162336
4331	5	1	5	2	\N	2018-05-19	-13.83	94a	2020-10-29 19:03:10.163484	2020-10-29 19:03:10.163484
4332	2	5	23	2	\N	2018-05-19	-41.82	4c2	2020-10-29 19:03:10.164798	2020-10-29 19:03:10.164798
4333	1	5	19	2	\N	2018-05-21	-100.00	2e8	2020-10-29 19:03:10.166832	2020-10-29 19:03:10.166832
4334	1	7	33	2	\N	2018-05-21	-17.43	b72	2020-10-29 19:03:10.168501	2020-10-29 19:03:10.168501
4335	1	1	5	2	\N	2018-05-20	-2.69	012	2020-10-29 19:03:10.169781	2020-10-29 19:03:10.169781
4336	5	1	5	2	\N	2018-05-21	-23.57	7d2	2020-10-29 19:03:10.170999	2020-10-29 19:03:10.170999
4337	5	3	-1	2	\N	2018-05-19	-19.99	efe	2020-10-29 19:03:10.172519	2020-10-29 19:03:10.172519
4338	5	1	5	2	\N	2018-05-18	-185.00	e5f	2020-10-29 19:03:10.173762	2020-10-29 19:03:10.173762
4339	5	1	5	2	\N	2018-05-19	-8.59	6cc	2020-10-29 19:03:10.175039	2020-10-29 19:03:10.175039
4340	5	1	5	2	\N	2018-05-19	-8.60	473	2020-10-29 19:03:10.176224	2020-10-29 19:03:10.176224
4341	5	1	5	2	\N	2018-05-19	-10.74	d9a	2020-10-29 19:03:10.177362	2020-10-29 19:03:10.177362
4342	5	3	-1	2	\N	2018-05-19	-10.16	3ea	2020-10-29 19:03:10.178548	2020-10-29 19:03:10.178548
4343	5	1	5	2	\N	2018-05-24	-7.40	473	2020-10-29 19:03:10.179684	2020-10-29 19:03:10.179684
4344	5	1	8	2	\N	2018-05-23	-3.00	e53	2020-10-29 19:03:10.180828	2020-10-29 19:03:10.180828
4345	5	5	20	2	\N	2018-05-25	-28.99	bb7	2020-10-29 19:03:10.181961	2020-10-29 19:03:10.181961
4346	5	1	5	2	\N	2018-05-25	-197.72	e5f	2020-10-29 19:03:10.18325	2020-10-29 19:03:10.18325
4347	1	9	45	2	\N	2018-05-25	-30.00	4a4	2020-10-29 19:03:10.184415	2020-10-29 19:03:10.184415
4348	1	1	7	2	\N	2018-05-25	-21.34	e33	2020-10-29 19:03:10.185652	2020-10-29 19:03:10.185652
4349	5	1	5	2	\N	2018-05-26	-11.90	473	2020-10-29 19:03:10.221072	2020-10-29 19:03:10.221072
4350	5	1	5	2	\N	2018-05-26	-7.50	caf	2020-10-29 19:03:10.222592	2020-10-29 19:03:10.222592
4351	5	1	5	2	\N	2018-05-26	-16.00	9fe	2020-10-29 19:03:10.224164	2020-10-29 19:03:10.224164
4352	1	9	45	2	\N	2018-05-26	-15.00	779	2020-10-29 19:03:10.225607	2020-10-29 19:03:10.225607
4353	5	4	13	2	\N	2018-05-27	-49.90	97a	2020-10-29 19:03:10.227171	2020-10-29 19:03:10.227171
4354	5	3	-1	2	\N	2018-05-26	-20.46	3ea	2020-10-29 19:03:10.22845	2020-10-29 19:03:10.22845
4355	1	2	1	1	\N	2018-05-28	10781.41	0ef	2020-10-29 19:03:10.229869	2020-10-29 19:03:10.229869
4356	1	7	33	2	\N	2018-05-28	-78.25	b7b	2020-10-29 19:03:10.231454	2020-10-29 19:03:10.231454
4357	1	9	46	2	\N	2018-05-28	-613.77	769	2020-10-29 19:03:10.233692	2020-10-29 19:03:10.233692
4358	1	9	46	2	\N	2018-05-28	-150.00	dac	2020-10-29 19:03:10.235502	2020-10-29 19:03:10.235502
4359	1	10	51	3	\N	2018-05-28	-500.00	1d5	2020-10-29 19:03:10.23685	2020-10-29 19:03:10.23685
4360	1	10	51	3	\N	2018-05-28	-1000.00	789	2020-10-29 19:03:10.257697	2020-10-29 19:03:10.257697
4361	5	5	20	2	\N	2018-05-28	-29.49	f40	2020-10-29 19:03:10.259681	2020-10-29 19:03:10.259681
4362	1	9	46	3	\N	2018-05-28	-100.00	29e	2020-10-29 19:03:10.261098	2020-10-29 19:03:10.261098
4363	1	1	5	2	\N	2018-05-29	-1.62	168	2020-10-29 19:03:10.262282	2020-10-29 19:03:10.262282
4364	1	1	5	2	\N	2018-05-29	-13.90	6cc	2020-10-29 19:03:10.263472	2020-10-29 19:03:10.263472
4365	5	1	5	2	\N	2018-05-29	-9.90	d9a	2020-10-29 19:03:10.264717	2020-10-29 19:03:10.264717
4366	5	5	20	2	\N	2018-05-29	-90.10	ceb	2020-10-29 19:03:10.26627	2020-10-29 19:03:10.26627
4367	5	1	5	2	\N	2018-05-30	-11.98	7d2	2020-10-29 19:03:10.268346	2020-10-29 19:03:10.268346
4368	5	1	5	2	\N	2018-05-30	-6.20	473	2020-10-29 19:03:10.270447	2020-10-29 19:03:10.270447
4369	5	1	5	2	\N	2018-05-30	-11.20	30f	2020-10-29 19:03:10.271809	2020-10-29 19:03:10.271809
4370	2	2	1	1	\N	2018-05-30	13874.16	955	2020-10-29 19:03:10.273067	2020-10-29 19:03:10.273067
4371	2	2	1	1	\N	2018-05-30	559.94	251	2020-10-29 19:03:10.274323	2020-10-29 19:03:10.274323
4372	2	10	51	3	\N	2018-05-30	-5000.00	dd9	2020-10-29 19:03:10.275902	2020-10-29 19:03:10.275902
4373	5	10	51	4	\N	2018-05-30	5000.00	dd9	2020-10-29 19:03:10.277336	2020-10-29 19:03:10.277336
4374	5	4	10	2	\N	2018-05-30	-391.79	297	2020-10-29 19:03:10.27856	2020-10-29 19:03:10.27856
4375	5	4	-1	2	\N	2018-05-30	-590.00	314	2020-10-29 19:03:10.279728	2020-10-29 19:03:10.279728
4376	5	4	12	2	\N	2018-05-30	-109.78	783	2020-10-29 19:03:10.281219	2020-10-29 19:03:10.281219
4377	2	10	51	3	\N	2018-05-31	-500.00	148	2020-10-29 19:03:10.283045	2020-10-29 19:03:10.283045
4378	4	10	51	4	\N	2018-05-31	500.00	148	2020-10-29 19:03:10.284295	2020-10-29 19:03:10.284295
4379	2	10	51	3	\N	2018-05-31	-6000.00	320	2020-10-29 19:03:10.285527	2020-10-29 19:03:10.285527
4380	5	10	51	4	\N	2018-05-31	6000.00	320	2020-10-29 19:03:10.287008	2020-10-29 19:03:10.287008
4381	2	9	44	3	\N	2018-05-22	-50.00	92a	2020-10-29 19:03:10.288525	2020-10-29 19:03:10.288525
4382	5	7	30	3	\N	2018-05-31	-15.00	1c5	2020-10-29 19:03:10.289781	2020-10-29 19:03:10.289781
4383	1	2	2	4	\N	2018-05-31	15.00	1c5	2020-10-29 19:03:10.29103	2020-10-29 19:03:10.29103
4384	5	1	5	2	\N	2018-05-31	-17.80	7d2	2020-10-29 19:03:10.29222	2020-10-29 19:03:10.29222
4385	1	1	6	2	\N	2018-05-31	-221.00	e46	2020-10-29 19:03:10.29337	2020-10-29 19:03:10.29337
4386	2	1	5	2	\N	2018-05-31	-11.99	7d2	2020-10-29 19:03:10.294563	2020-10-29 19:03:10.294563
4387	6	10	52	1	\N	2018-05-31	102.62	15b	2020-10-29 19:03:10.295791	2020-10-29 19:03:10.295791
4388	1	10	51	3	\N	2018-06-01	-7000.00	a47	2020-10-29 19:03:10.297346	2020-10-29 19:03:10.297346
4389	1	9	-1	4	\N	2018-06-01	15.23	f6e	2020-10-29 19:03:10.298799	2020-10-29 19:03:10.298799
4390	5	2	-1	4	\N	2018-06-01	16.83	dd1	2020-10-29 19:03:10.300665	2020-10-29 19:03:10.300665
4391	5	1	5	2	\N	2018-06-01	-110.84	e5f	2020-10-29 19:03:10.301919	2020-10-29 19:03:10.301919
4392	5	1	5	2	\N	2018-06-01	-5.80	473	2020-10-29 19:03:10.30326	2020-10-29 19:03:10.30326
4393	2	9	-1	2	\N	2018-06-01	-200.00	8a8	2020-10-29 19:03:10.304513	2020-10-29 19:03:10.304513
4394	5	9	45	2	\N	2018-06-01	-29.70	c18	2020-10-29 19:03:10.305981	2020-10-29 19:03:10.305981
4395	5	1	5	2	\N	2018-06-01	-8.29	357	2020-10-29 19:03:10.307363	2020-10-29 19:03:10.307363
4396	5	1	5	2	\N	2018-06-01	-54.83	ff5	2020-10-29 19:03:10.308595	2020-10-29 19:03:10.308595
4397	5	9	-1	2	\N	2018-06-01	-27.50	9c3	2020-10-29 19:03:10.309732	2020-10-29 19:03:10.309732
4398	2	5	20	2	\N	2018-06-01	-11.99	e0a	2020-10-29 19:03:10.310871	2020-10-29 19:03:10.310871
4399	2	3	-1	2	\N	2018-06-02	-18.00	550	2020-10-29 19:03:10.312049	2020-10-29 19:03:10.312049
4400	1	1	6	2	\N	2018-06-02	-45.00	28f	2020-10-29 19:03:10.313619	2020-10-29 19:03:10.313619
4401	1	10	51	3	\N	2018-06-03	-200.00	c52	2020-10-29 19:03:10.315342	2020-10-29 19:03:10.315342
4402	5	1	-1	2	\N	2018-06-03	-21.98	aad	2020-10-29 19:03:10.316931	2020-10-29 19:03:10.316931
4403	5	5	20	2	\N	2018-06-04	-34.97	e0a	2020-10-29 19:03:10.318179	2020-10-29 19:03:10.318179
4404	1	1	6	2	\N	2018-06-04	-9.00	7bd	2020-10-29 19:03:10.319653	2020-10-29 19:03:10.319653
4405	1	1	5	2	\N	2018-06-05	-6.67	78b	2020-10-29 19:03:10.320819	2020-10-29 19:03:10.320819
4406	1	1	8	2	\N	2018-06-05	-3.99	b6a	2020-10-29 19:03:10.322138	2020-10-29 19:03:10.322138
4407	1	9	46	2	\N	2018-06-05	-10.00	469	2020-10-29 19:03:10.323376	2020-10-29 19:03:10.323376
4408	5	1	5	2	\N	2018-06-05	-23.00	9e4	2020-10-29 19:03:10.324463	2020-10-29 19:03:10.324463
4409	5	1	5	2	\N	2018-06-05	-7.80	473	2020-10-29 19:03:10.3255	2020-10-29 19:03:10.3255
4410	5	4	-1	2	\N	2018-06-06	-117.00	d8e	2020-10-29 19:03:10.326561	2020-10-29 19:03:10.326561
4411	2	9	45	2	\N	2018-06-06	-10.00	75c	2020-10-29 19:03:10.327579	2020-10-29 19:03:10.327579
4412	2	5	20	2	\N	2018-06-07	-55.98	f40	2020-10-29 19:03:10.328665	2020-10-29 19:03:10.328665
4413	5	1	5	2	\N	2018-06-07	-50.00	47f	2020-10-29 19:03:10.329685	2020-10-29 19:03:10.329685
4414	2	8	38	2	\N	2018-06-07	-50.00	074	2020-10-29 19:03:10.330752	2020-10-29 19:03:10.330752
4415	2	8	38	2	\N	2018-06-08	-11.00	9e6	2020-10-29 19:03:10.331783	2020-10-29 19:03:10.331783
4416	5	1	5	2	\N	2018-06-09	-4.80	f13	2020-10-29 19:03:10.333371	2020-10-29 19:03:10.333371
4417	5	1	5	2	\N	2018-06-09	-7.21	add	2020-10-29 19:03:10.334617	2020-10-29 19:03:10.334617
4418	5	1	5	2	\N	2018-06-08	-125.26	641	2020-10-29 19:03:10.335677	2020-10-29 19:03:10.335677
4419	1	1	6	2	\N	2016-06-07	-27.90	6f6	2020-10-29 19:03:10.33675	2020-10-29 19:03:10.33675
4420	1	3	-1	2	\N	2018-06-08	-17.46	3ea	2020-10-29 19:03:10.337846	2020-10-29 19:03:10.337846
4421	1	1	7	2	\N	2018-06-08	-15.75	e33	2020-10-29 19:03:10.338946	2020-10-29 19:03:10.338946
4422	1	2	2	1	\N	2018-06-07	613.77	cb6	2020-10-29 19:03:10.340272	2020-10-29 19:03:10.340272
4423	1	10	51	3	\N	2018-06-07	-1000.00	3aa	2020-10-29 19:03:10.341392	2020-10-29 19:03:10.341392
4424	1	8	38	2	\N	2018-06-06	-25.40	94a	2020-10-29 19:03:10.342464	2020-10-29 19:03:10.342464
4425	1	8	38	2	\N	2018-06-06	-46.00	8be	2020-10-29 19:03:10.343558	2020-10-29 19:03:10.343558
4426	1	8	48	2	\N	2018-06-06	-100.00	bbb	2020-10-29 19:03:10.344681	2020-10-29 19:03:10.344681
4427	5	1	5	2	\N	2018-06-07	-11.34	63a	2020-10-29 19:03:10.345765	2020-10-29 19:03:10.345765
4428	5	5	20	2	\N	2018-06-07	-66.57	ceb	2020-10-29 19:03:10.346805	2020-10-29 19:03:10.346805
4429	5	10	51	4	\N	2018-06-06	5500.00	1e1	2020-10-29 19:03:10.347891	2020-10-29 19:03:10.347891
4430	5	10	51	3	\N	2018-06-08	-2500.00	1e1	2020-10-29 19:03:10.349141	2020-10-29 19:03:10.349141
4431	2	9	45	2	\N	2018-06-09	-33.96	d50	2020-10-29 19:03:10.350554	2020-10-29 19:03:10.350554
4432	5	10	51	4	\N	2018-06-11	2500.00	ac8	2020-10-29 19:03:10.351756	2020-10-29 19:03:10.351756
4433	1	7	27	2	\N	2018-06-10	-805.70	c73	2020-10-29 19:03:10.352964	2020-10-29 19:03:10.352964
4434	1	2	2	1	\N	2018-06-11	230.20	7c1	2020-10-29 19:03:10.354208	2020-10-29 19:03:10.354208
4435	5	7	27	3	\N	2018-06-11	-345.30	aac	2020-10-29 19:03:10.355498	2020-10-29 19:03:10.355498
4436	1	2	2	4	\N	2018-06-11	345.30	aac	2020-10-29 19:03:10.356805	2020-10-29 19:03:10.356805
4437	1	2	-1	4	\N	2018-06-10	1000.00	2f6	2020-10-29 19:03:10.358094	2020-10-29 19:03:10.358094
4438	5	7	27	2	\N	2018-06-11	-460.00	98a	2020-10-29 19:03:10.35934	2020-10-29 19:03:10.35934
4439	6	10	51	3	\N	2018-06-11	-10000.00	d0a	2020-10-29 19:03:10.360845	2020-10-29 19:03:10.360845
4440	5	10	51	4	\N	2018-06-11	10000.00	d0a	2020-10-29 19:03:10.362084	2020-10-29 19:03:10.362084
4441	5	1	5	2	\N	2018-06-12	-13.33	67a	2020-10-29 19:03:10.363295	2020-10-29 19:03:10.363295
4442	5	1	5	2	\N	2018-06-12	-5.80	473	2020-10-29 19:03:10.364506	2020-10-29 19:03:10.364506
4443	1	1	5	2	\N	2018-06-12	-6.00	879	2020-10-29 19:03:10.366246	2020-10-29 19:03:10.366246
4444	1	4	15	2	\N	2018-06-12	-19.00	de2	2020-10-29 19:03:10.367488	2020-10-29 19:03:10.367488
4445	5	8	40	2	\N	2018-06-13	-246.00	588	2020-10-29 19:03:10.368786	2020-10-29 19:03:10.368786
4446	5	1	6	2	\N	2018-06-14	-20.18	2b8	2020-10-29 19:03:10.37025	2020-10-29 19:03:10.37025
4447	1	1	7	2	\N	2018-06-13	-20.80	a93	2020-10-29 19:03:10.371376	2020-10-29 19:03:10.371376
4448	5	1	5	2	\N	2018-06-14	-33.78	7d2	2020-10-29 19:03:10.372482	2020-10-29 19:03:10.372482
4449	5	5	20	2	\N	2018-06-15	-37.48	f40	2020-10-29 19:03:10.373698	2020-10-29 19:03:10.373698
4450	5	1	5	2	\N	2018-06-15	-9.20	473	2020-10-29 19:03:10.375306	2020-10-29 19:03:10.375306
4451	5	1	5	2	\N	2018-06-15	-140.64	6ee	2020-10-29 19:03:10.376445	2020-10-29 19:03:10.376445
4452	1	3	-1	2	\N	2018-06-16	-14.16	e9c	2020-10-29 19:03:10.377536	2020-10-29 19:03:10.377536
4453	1	7	35	2	\N	2018-06-16	-16.00	cb4	2020-10-29 19:03:10.37881	2020-10-29 19:03:10.37881
4454	1	3	-1	2	\N	2018-06-17	-11.16	3ea	2020-10-29 19:03:10.379968	2020-10-29 19:03:10.379968
4455	2	7	31	2	\N	2018-06-17	-50.00	611	2020-10-29 19:03:10.381219	2020-10-29 19:03:10.381219
4456	2	1	6	2	\N	2018-06-16	-41.00	1dd	2020-10-29 19:03:10.382684	2020-10-29 19:03:10.382684
4457	2	9	-1	2	\N	2018-06-18	-830.00	d3b	2020-10-29 19:03:10.384078	2020-10-29 19:03:10.384078
4458	2	3	-1	2	\N	2018-06-18	-10.00	6bd	2020-10-29 19:03:10.385193	2020-10-29 19:03:10.385193
4459	2	2	2	1	\N	2018-06-18	660.00	55e	2020-10-29 19:03:10.386415	2020-10-29 19:03:10.386415
4460	5	1	8	2	\N	2018-06-19	-11.50	cb5	2020-10-29 19:03:10.387628	2020-10-29 19:03:10.387628
4461	5	5	23	2	\N	2018-06-19	-78.80	bc9	2020-10-29 19:03:10.38892	2020-10-29 19:03:10.38892
4462	5	1	5	2	\N	2018-06-19	-80.00	d41	2020-10-29 19:03:10.390035	2020-10-29 19:03:10.390035
4463	2	4	15	2	\N	2018-06-19	-29.99	fc6	2020-10-29 19:03:10.391149	2020-10-29 19:03:10.391149
4464	5	4	13	2	\N	2018-06-23	-49.90	97a	2020-10-29 19:03:10.392235	2020-10-29 19:03:10.392235
4465	5	8	40	2	\N	2018-06-23	-213.07	0ba	2020-10-29 19:03:10.393456	2020-10-29 19:03:10.393456
4466	5	8	40	2	\N	2018-06-23	-40.00	7fe	2020-10-29 19:03:10.394707	2020-10-29 19:03:10.394707
4467	5	7	27	2	\N	2016-06-22	-135.00	e9e	2020-10-29 19:03:10.395786	2020-10-29 19:03:10.395786
4468	5	7	27	2	\N	2016-06-21	-10.00	3f3	2020-10-29 19:03:10.397117	2020-10-29 19:03:10.397117
4469	5	1	5	2	\N	2018-06-22	-19.29	7d2	2020-10-29 19:03:10.39821	2020-10-29 19:03:10.39821
4470	5	3	-1	2	\N	2018-06-19	-23.98	3ea	2020-10-29 19:03:10.399577	2020-10-29 19:03:10.399577
4471	5	1	5	2	\N	2018-06-18	-14.80	473	2020-10-29 19:03:10.400893	2020-10-29 19:03:10.400893
4472	5	1	5	2	\N	2018-06-20	-130.12	e5f	2020-10-29 19:03:10.402078	2020-10-29 19:03:10.402078
4473	5	5	20	2	\N	2018-06-20	-18.99	f40	2020-10-29 19:03:10.40363	2020-10-29 19:03:10.40363
4474	1	2	2	1	\N	2018-06-21	230.20	d73	2020-10-29 19:03:10.405048	2020-10-29 19:03:10.405048
4475	1	1	7	2	\N	2018-06-21	-2.80	78a	2020-10-29 19:03:10.406606	2020-10-29 19:03:10.406606
4476	1	10	51	3	\N	2018-06-23	-800.00	3aa	2020-10-29 19:03:10.407686	2020-10-29 19:03:10.407686
4477	5	7	27	2	\N	2018-06-22	-50.00	698	2020-10-29 19:03:10.408791	2020-10-29 19:03:10.408791
4478	5	2	2	1	\N	2018-06-21	99.72	ea8	2020-10-29 19:03:10.409958	2020-10-29 19:03:10.409958
4479	5	5	20	2	\N	2018-06-20	-19.99	f40	2020-10-29 19:03:10.411212	2020-10-29 19:03:10.411212
4480	5	9	-1	2	\N	2018-06-23	-20.70	04c	2020-10-29 19:03:10.412486	2020-10-29 19:03:10.412486
4481	2	5	20	2	\N	2018-06-20	-8.99	7f9	2020-10-29 19:03:10.413733	2020-10-29 19:03:10.413733
4482	2	5	20	2	\N	2018-06-21	-6.99	6c5	2020-10-29 19:03:10.415252	2020-10-29 19:03:10.415252
4483	2	1	6	2	\N	2018-06-23	-14.00	e10	2020-10-29 19:03:10.416906	2020-10-29 19:03:10.416906
4484	2	9	45	2	\N	2018-06-23	-87.93	5f3	2020-10-29 19:03:10.418247	2020-10-29 19:03:10.418247
4485	2	5	20	2	\N	2018-06-23	-74.11	627	2020-10-29 19:03:10.419475	2020-10-29 19:03:10.419475
4486	2	1	5	2	\N	2018-06-24	-11.85	f13	2020-10-29 19:03:10.420686	2020-10-29 19:03:10.420686
4487	2	5	20	1	\N	2018-06-20	109.61	b5d	2020-10-29 19:03:10.421992	2020-10-29 19:03:10.421992
4488	1	9	45	2	\N	2018-06-23	-74.99	409	2020-10-29 19:03:10.423509	2020-10-29 19:03:10.423509
4489	1	7	30	3	\N	2018-06-26	-20.00	a76	2020-10-29 19:03:10.424802	2020-10-29 19:03:10.424802
4490	1	2	1	1	\N	2018-06-26	10713.70	e47	2020-10-29 19:03:10.426204	2020-10-29 19:03:10.426204
4491	1	8	38	2	\N	2018-06-25	-29.60	074	2020-10-29 19:03:10.427512	2020-10-29 19:03:10.427512
4492	1	9	45	2	\N	2018-06-24	-30.00	9aa	2020-10-29 19:03:10.429091	2020-10-29 19:03:10.429091
4493	5	1	-1	2	\N	2018-06-26	-3.49	502	2020-10-29 19:03:10.430591	2020-10-29 19:03:10.430591
4494	5	1	5	2	\N	2018-06-26	-9.54	d9a	2020-10-29 19:03:10.431988	2020-10-29 19:03:10.431988
4495	5	1	5	2	\N	2018-06-25	-20.00	300	2020-10-29 19:03:10.433581	2020-10-29 19:03:10.433581
4496	5	1	5	2	\N	2018-06-25	-4.50	a93	2020-10-29 19:03:10.434839	2020-10-29 19:03:10.434839
4497	5	1	5	2	\N	2018-06-26	-9.60	f13	2020-10-29 19:03:10.436069	2020-10-29 19:03:10.436069
4498	1	10	51	3	\N	2018-06-27	-500.00	1d5	2020-10-29 19:03:10.437302	2020-10-29 19:03:10.437302
4499	1	10	51	3	\N	2018-06-27	-1200.00	179	2020-10-29 19:03:10.438578	2020-10-29 19:03:10.438578
4500	1	10	51	3	\N	2018-06-27	-1000.00	cd2	2020-10-29 19:03:10.440036	2020-10-29 19:03:10.440036
4501	6	10	51	4	\N	2018-06-27	1000.00	cd2	2020-10-29 19:03:10.441245	2020-10-29 19:03:10.441245
4502	2	9	-1	2	\N	2018-06-28	-110.00	dec	2020-10-29 19:03:10.442487	2020-10-29 19:03:10.442487
4503	1	3	-1	2	\N	2018-06-27	-13.00	3ea	2020-10-29 19:03:10.443683	2020-10-29 19:03:10.443683
4504	1	1	7	2	\N	2018-06-29	-2.80	8f7	2020-10-29 19:03:10.444904	2020-10-29 19:03:10.444904
4505	1	1	7	2	\N	2018-06-29	-16.13	e37	2020-10-29 19:03:10.44626	2020-10-29 19:03:10.44626
4506	1	3	-1	2	\N	2018-06-27	-16.18	3ea	2020-10-29 19:03:10.447444	2020-10-29 19:03:10.447444
4507	1	7	30	3	\N	2018-06-27	-20.00	d11	2020-10-29 19:03:10.448565	2020-10-29 19:03:10.448565
4508	5	1	5	2	\N	2018-06-29	-125.19	e5f	2020-10-29 19:03:10.450334	2020-10-29 19:03:10.450334
4509	5	1	5	2	\N	2018-06-28	-15.67	9c1	2020-10-29 19:03:10.451709	2020-10-29 19:03:10.451709
4510	5	8	40	2	\N	2018-06-28	-115.00	e06	2020-10-29 19:03:10.45301	2020-10-29 19:03:10.45301
4511	5	7	30	3	\N	2018-06-30	-15.00	1c5	2020-10-29 19:03:10.454686	2020-10-29 19:03:10.454686
4512	1	2	2	4	\N	2018-06-30	15.00	1c5	2020-10-29 19:03:10.455952	2020-10-29 19:03:10.455952
4513	5	9	45	2	\N	2018-06-30	-13.50	1fb	2020-10-29 19:03:10.457253	2020-10-29 19:03:10.457253
4514	5	9	45	2	\N	2018-06-30	-24.97	577	2020-10-29 19:03:10.458368	2020-10-29 19:03:10.458368
4515	5	5	20	2	\N	2018-06-30	-23.99	ceb	2020-10-29 19:03:10.459499	2020-10-29 19:03:10.459499
4516	5	1	5	2	\N	2018-06-30	-50.00	7d2	2020-10-29 19:03:10.460673	2020-10-29 19:03:10.460673
4517	1	10	51	3	\N	2018-07-01	-7000.00	106	2020-10-29 19:03:10.461793	2020-10-29 19:03:10.461793
4518	6	10	52	1	\N	2018-06-30	89.33	c48	2020-10-29 19:03:10.463171	2020-10-29 19:03:10.463171
4519	2	2	1	1	\N	2018-06-27	6340.75	c76	2020-10-29 19:03:10.464446	2020-10-29 19:03:10.464446
4520	1	2	2	4	\N	2018-07-01	8.00	f6e	2020-10-29 19:03:10.465706	2020-10-29 19:03:10.465706
4521	5	9	-1	3	\N	2018-07-01	-28.94	dd1	2020-10-29 19:03:10.467316	2020-10-29 19:03:10.467316
4522	1	9	46	2	\N	2018-07-01	-100.00	124	2020-10-29 19:03:10.468729	2020-10-29 19:03:10.468729
4523	1	8	38	2	\N	2018-07-01	-46.00	815	2020-10-29 19:03:10.470013	2020-10-29 19:03:10.470013
4524	2	3	-1	2	\N	2018-07-01	-23.50	873	2020-10-29 19:03:10.471277	2020-10-29 19:03:10.471277
4525	2	10	51	3	\N	2018-07-01	-500.00	375	2020-10-29 19:03:10.472542	2020-10-29 19:03:10.472542
4526	4	10	51	4	\N	2018-07-01	500.00	375	2020-10-29 19:03:10.47367	2020-10-29 19:03:10.47367
4527	2	10	51	3	\N	2018-07-01	-4500.00	d4a	2020-10-29 19:03:10.474834	2020-10-29 19:03:10.474834
4528	5	10	51	4	\N	2018-07-01	4500.00	d4a	2020-10-29 19:03:10.476117	2020-10-29 19:03:10.476117
4529	5	4	10	2	\N	2018-07-01	-391.79	f08	2020-10-29 19:03:10.477389	2020-10-29 19:03:10.477389
4530	5	4	12	2	\N	2018-07-01	-109.78	f30	2020-10-29 19:03:10.478611	2020-10-29 19:03:10.478611
4531	5	4	11	2	\N	2018-07-01	-108.44	322	2020-10-29 19:03:10.479738	2020-10-29 19:03:10.479738
4532	5	4	-1	2	\N	2018-07-01	-590.00	774	2020-10-29 19:03:10.481162	2020-10-29 19:03:10.481162
4533	2	10	51	3	\N	2018-07-02	-1500.00	bae	2020-10-29 19:03:10.482874	2020-10-29 19:03:10.482874
4534	2	4	15	2	\N	2018-07-02	-29.00	70f	2020-10-29 19:03:10.484233	2020-10-29 19:03:10.484233
4535	2	9	-1	2	\N	2018-07-02	-80.00	ad3	2020-10-29 19:03:10.48532	2020-10-29 19:03:10.48532
4536	2	1	6	2	\N	2018-07-02	-10.00	dc4	2020-10-29 19:03:10.486535	2020-10-29 19:03:10.486535
4537	2	7	30	2	\N	2018-07-02	-100.00	fab	2020-10-29 19:03:10.487767	2020-10-29 19:03:10.487767
4538	2	9	45	2	\N	2018-07-04	-82.95	418	2020-10-29 19:03:10.489041	2020-10-29 19:03:10.489041
4539	5	1	5	2	\N	2018-07-04	-27.28	970	2020-10-29 19:03:10.490312	2020-10-29 19:03:10.490312
4540	5	9	45	2	\N	2018-07-02	-100.00	d5f	2020-10-29 19:03:10.491569	2020-10-29 19:03:10.491569
4541	5	1	5	2	\N	2018-07-03	-22.37	63a	2020-10-29 19:03:10.492878	2020-10-29 19:03:10.492878
4542	5	1	5	2	\N	2018-07-03	-15.27	61a	2020-10-29 19:03:10.494191	2020-10-29 19:03:10.494191
4543	5	5	20	2	\N	2018-07-03	-65.06	f40	2020-10-29 19:03:10.495526	2020-10-29 19:03:10.495526
4544	5	1	5	2	\N	2018-07-03	-13.00	61a	2020-10-29 19:03:10.496857	2020-10-29 19:03:10.496857
4545	5	1	5	2	\N	2018-07-03	-6.00	07d	2020-10-29 19:03:10.498136	2020-10-29 19:03:10.498136
4546	5	10	51	4	\N	2018-07-04	5500.00	039	2020-10-29 19:03:10.49977	2020-10-29 19:03:10.49977
4547	5	1	5	2	\N	2018-07-06	-167.57	6ee	2020-10-29 19:03:10.501213	2020-10-29 19:03:10.501213
4548	2	9	45	1	\N	2018-07-06	32.89	34e	2020-10-29 19:03:10.502543	2020-10-29 19:03:10.502543
4549	2	9	45	2	\N	2018-07-06	-49.75	d26	2020-10-29 19:03:10.504001	2020-10-29 19:03:10.504001
4550	2	9	45	2	\N	2018-07-06	-59.99	e56	2020-10-29 19:03:10.505412	2020-10-29 19:03:10.505412
4551	2	5	20	2	\N	2018-07-06	-22.99	993	2020-10-29 19:03:10.506751	2020-10-29 19:03:10.506751
4552	2	5	20	2	\N	2018-07-06	-17.09	736	2020-10-29 19:03:10.508067	2020-10-29 19:03:10.508067
4553	5	1	5	2	\N	2018-07-06	-17.53	d9a	2020-10-29 19:03:10.509223	2020-10-29 19:03:10.509223
4554	2	4	15	2	\N	2018-07-06	-25.00	f48	2020-10-29 19:03:10.510596	2020-10-29 19:03:10.510596
4555	2	7	31	1	\N	2018-07-06	70.00	4bb	2020-10-29 19:03:10.51168	2020-10-29 19:03:10.51168
4556	1	9	48	2	\N	2018-07-06	-100.00	bbb	2020-10-29 19:03:10.512821	2020-10-29 19:03:10.512821
4557	5	3	-1	2	\N	2018-07-06	-31.66	f50	2020-10-29 19:03:10.513857	2020-10-29 19:03:10.513857
4558	1	9	45	2	\N	2018-07-07	-97.40	f8c	2020-10-29 19:03:10.514877	2020-10-29 19:03:10.514877
4559	2	1	5	2	\N	2018-07-07	-12.00	892	2020-10-29 19:03:10.51602	2020-10-29 19:03:10.51602
4560	5	1	5	2	\N	2018-07-08	-1.99	2fa	2020-10-29 19:03:10.517544	2020-10-29 19:03:10.517544
4561	6	10	51	3	\N	2018-07-09	-5000.00	4ee	2020-10-29 19:03:10.519264	2020-10-29 19:03:10.519264
4562	5	10	51	4	\N	2018-07-09	5000.00	4ee	2020-10-29 19:03:10.520576	2020-10-29 19:03:10.520576
4563	5	10	51	3	\N	2018-07-09	-2500.00	6c7	2020-10-29 19:03:10.521636	2020-10-29 19:03:10.521636
4564	2	1	5	2	\N	2018-07-09	-20.00	92b	2020-10-29 19:03:10.522768	2020-10-29 19:03:10.522768
4565	5	1	5	3	\N	2018-07-09	-20.00	92b	2020-10-29 19:03:10.523782	2020-10-29 19:03:10.523782
4566	2	1	5	4	\N	2018-07-09	20.00	92b	2020-10-29 19:03:10.524843	2020-10-29 19:03:10.524843
4567	5	4	-1	2	\N	2018-07-09	-126.00	371	2020-10-29 19:03:10.525884	2020-10-29 19:03:10.525884
4568	2	2	2	1	\N	2018-07-10	960.00	5bd	2020-10-29 19:03:10.526859	2020-10-29 19:03:10.526859
4569	5	9	45	2	\N	2018-07-10	-44.60	713	2020-10-29 19:03:10.527832	2020-10-29 19:03:10.527832
4570	5	1	5	2	\N	2018-07-12	-9.50	3d0	2020-10-29 19:03:10.528802	2020-10-29 19:03:10.528802
4571	5	1	5	2	\N	2018-07-12	-7.60	ecd	2020-10-29 19:03:10.529785	2020-10-29 19:03:10.529785
4572	1	5	22	2	\N	2018-07-12	-45.00	9da	2020-10-29 19:03:10.530778	2020-10-29 19:03:10.530778
4573	1	8	41	2	\N	2018-07-12	-21.37	af0	2020-10-29 19:03:10.532373	2020-10-29 19:03:10.532373
4574	1	6	24	2	\N	2018-07-11	-39.90	819	2020-10-29 19:03:10.53368	2020-10-29 19:03:10.53368
4575	5	9	45	2	\N	2018-07-11	-10.00	3ef	2020-10-29 19:03:10.534765	2020-10-29 19:03:10.534765
4576	5	9	45	2	\N	2018-07-11	-15.00	e12	2020-10-29 19:03:10.535725	2020-10-29 19:03:10.535725
4577	1	1	7	2	\N	2018-07-11	-13.40	a93	2020-10-29 19:03:10.536774	2020-10-29 19:03:10.536774
4578	5	1	7	2	\N	2018-07-12	-13.40	a93	2020-10-29 19:03:10.537755	2020-10-29 19:03:10.537755
4579	1	1	7	2	\N	2018-07-10	-18.60	e33	2020-10-29 19:03:10.538733	2020-10-29 19:03:10.538733
4580	1	5	18	2	\N	2018-07-11	-32.65	0ec	2020-10-29 19:03:10.539682	2020-10-29 19:03:10.539682
4581	5	1	5	2	\N	2018-07-11	-77.40	20c	2020-10-29 19:03:10.54075	2020-10-29 19:03:10.54075
4582	1	1	7	2	\N	2018-07-12	-15.70	a93	2020-10-29 19:03:10.541774	2020-10-29 19:03:10.541774
4583	5	9	45	2	\N	2018-07-11	-52.98	bb9	2020-10-29 19:03:10.5428	2020-10-29 19:03:10.5428
4584	5	1	5	2	\N	2018-07-10	-3.94	85c	2020-10-29 19:03:10.543802	2020-10-29 19:03:10.543802
4585	5	1	8	2	\N	2018-07-09	-3.39	a00	2020-10-29 19:03:10.544798	2020-10-29 19:03:10.544798
4586	5	10	51	4	\N	2018-07-10	2500.00	355	2020-10-29 19:03:10.545799	2020-10-29 19:03:10.545799
4587	1	3	-1	2	\N	2018-07-14	-21.11	3ea	2020-10-29 19:03:10.546781	2020-10-29 19:03:10.546781
4588	1	1	7	2	\N	2018-07-13	-11.06	e33	2020-10-29 19:03:10.548487	2020-10-29 19:03:10.548487
4589	1	1	7	2	\N	2018-07-13	-2.80	175	2020-10-29 19:03:10.549746	2020-10-29 19:03:10.549746
4590	5	3	-1	2	\N	2018-07-14	-44.68	a92	2020-10-29 19:03:10.550923	2020-10-29 19:03:10.550923
4591	5	1	5	2	\N	2018-07-14	-30.11	7d2	2020-10-29 19:03:10.552115	2020-10-29 19:03:10.552115
4592	5	1	5	2	\N	2018-07-14	-12.90	473	2020-10-29 19:03:10.553116	2020-10-29 19:03:10.553116
4593	5	1	5	2	\N	2018-07-14	-49.80	6ee	2020-10-29 19:03:10.554115	2020-10-29 19:03:10.554115
4594	5	1	5	2	\N	2018-07-12	-7.65	473	2020-10-29 19:03:10.555162	2020-10-29 19:03:10.555162
4595	5	1	5	2	\N	2018-07-13	-202.83	6ee	2020-10-29 19:03:10.556289	2020-10-29 19:03:10.556289
4596	2	4	13	2	\N	2018-07-16	-29.99	fc6	2020-10-29 19:03:10.557351	2020-10-29 19:03:10.557351
4597	2	9	45	2	\N	2018-07-20	-20.00	b32	2020-10-29 19:03:10.55838	2020-10-29 19:03:10.55838
4598	2	1	6	2	\N	2018-07-21	-20.48	63e	2020-10-29 19:03:10.559432	2020-10-29 19:03:10.559432
4599	5	9	-1	2	\N	2018-07-21	-120.99	693	2020-10-29 19:03:10.560535	2020-10-29 19:03:10.560535
4600	5	9	45	2	\N	2018-07-21	-10.00	178	2020-10-29 19:03:10.561645	2020-10-29 19:03:10.561645
4601	5	8	40	2	\N	2018-07-21	-225.81	a6f	2020-10-29 19:03:10.562684	2020-10-29 19:03:10.562684
4602	5	3	-1	2	\N	2018-07-22	-17.99	efe	2020-10-29 19:03:10.563719	2020-10-29 19:03:10.563719
4603	1	1	7	2	\N	2018-07-18	-19.00	47e	2020-10-29 19:03:10.564772	2020-10-29 19:03:10.564772
4604	1	3	-1	2	\N	2018-07-19	-29.80	3ea	2020-10-29 19:03:10.565836	2020-10-29 19:03:10.565836
4605	1	1	5	2	\N	2018-07-19	-3.75	473	2020-10-29 19:03:10.567126	2020-10-29 19:03:10.567126
4606	1	3	-1	2	\N	2018-07-20	-60.00	f01	2020-10-29 19:03:10.568428	2020-10-29 19:03:10.568428
4607	1	1	7	2	\N	2018-07-20	-14.11	e33	2020-10-29 19:03:10.569733	2020-10-29 19:03:10.569733
4608	1	5	20	2	\N	2018-07-20	-27.49	18d	2020-10-29 19:03:10.57101	2020-10-29 19:03:10.57101
4609	1	9	45	2	\N	2018-07-21	-11.65	0ca	2020-10-29 19:03:10.572618	2020-10-29 19:03:10.572618
4610	1	1	7	2	\N	2018-07-21	-2.80	73e	2020-10-29 19:03:10.574681	2020-10-29 19:03:10.574681
4611	1	1	5	2	\N	2018-07-21	-2.25	473	2020-10-29 19:03:10.575953	2020-10-29 19:03:10.575953
4612	1	1	7	2	\N	2018-07-21	-15.63	e33	2020-10-29 19:03:10.577023	2020-10-29 19:03:10.577023
4613	1	1	7	2	\N	2018-07-23	-11.89	e33	2020-10-29 19:03:10.578093	2020-10-29 19:03:10.578093
4614	1	1	5	2	\N	2018-07-21	-14.50	7d2	2020-10-29 19:03:10.579108	2020-10-29 19:03:10.579108
4615	5	1	5	2	\N	2018-07-21	-9.20	473	2020-10-29 19:03:10.58015	2020-10-29 19:03:10.58015
4616	5	1	5	2	\N	2018-07-20	-132.19	e5f	2020-10-29 19:03:10.581186	2020-10-29 19:03:10.581186
4617	1	8	38	2	\N	2018-07-22	-23.00	076	2020-10-29 19:03:10.582339	2020-10-29 19:03:10.582339
4618	1	9	-1	3	\N	2018-07-22	-20.00	124	2020-10-29 19:03:10.583593	2020-10-29 19:03:10.583593
4619	5	1	5	2	\N	2018-07-23	-7.50	473	2020-10-29 19:03:10.584972	2020-10-29 19:03:10.584972
4620	2	9	45	2	\N	2018-07-24	-164.45	96b	2020-10-29 19:03:10.58669	2020-10-29 19:03:10.58669
4621	2	2	1	1	\N	2018-07-27	5964.30	2ec	2020-10-29 19:03:10.587848	2020-10-29 19:03:10.587848
4622	2	7	30	2	\N	2018-07-28	-50.00	661	2020-10-29 19:03:10.588955	2020-10-29 19:03:10.588955
4623	2	9	-1	4	\N	2018-07-28	391.81	87c	2020-10-29 19:03:10.590122	2020-10-29 19:03:10.590122
4624	2	10	51	3	\N	2018-07-28	-5000.00	fc3	2020-10-29 19:03:10.591273	2020-10-29 19:03:10.591273
4625	5	10	51	4	\N	2018-07-28	5000.00	fc3	2020-10-29 19:03:10.592531	2020-10-29 19:03:10.592531
4626	5	4	10	2	\N	2018-07-29	-391.79	664	2020-10-29 19:03:10.59367	2020-10-29 19:03:10.59367
4627	5	4	-1	2	\N	2018-07-29	-590.00	e2a	2020-10-29 19:03:10.594833	2020-10-29 19:03:10.594833
4628	5	4	12	2	\N	2018-07-29	-109.78	783	2020-10-29 19:03:10.596025	2020-10-29 19:03:10.596025
4629	5	1	5	2	\N	2018-07-26	-13.84	f3e	2020-10-29 19:03:10.597272	2020-10-29 19:03:10.597272
4630	5	1	5	2	\N	2018-07-28	-13.24	35b	2020-10-29 19:03:10.598406	2020-10-29 19:03:10.598406
4631	5	1	5	2	\N	2018-07-28	-13.15	ecd	2020-10-29 19:03:10.600094	2020-10-29 19:03:10.600094
4632	5	1	5	2	\N	2018-07-28	-19.11	63a	2020-10-29 19:03:10.601325	2020-10-29 19:03:10.601325
4633	2	1	7	2	\N	2018-07-29	-16.00	6a4	2020-10-29 19:03:10.602523	2020-10-29 19:03:10.602523
4634	6	10	51	3	\N	2018-07-25	-50000.00	073	2020-10-29 19:03:10.603815	2020-10-29 19:03:10.603815
4635	5	10	51	4	\N	2018-07-25	50000.00	073	2020-10-29 19:03:10.605106	2020-10-29 19:03:10.605106
4636	5	9	45	2	\N	2018-07-28	-31.79	6d7	2020-10-29 19:03:10.606915	2020-10-29 19:03:10.606915
4637	1	1	5	2	\N	2018-07-25	-2.38	473	2020-10-29 19:03:10.608276	2020-10-29 19:03:10.608276
4638	1	2	2	1	\N	2018-07-27	45.65	5e3	2020-10-29 19:03:10.609695	2020-10-29 19:03:10.609695
4639	1	2	2	1	\N	2018-07-27	40.55	5e3	2020-10-29 19:03:10.610951	2020-10-29 19:03:10.610951
4640	1	2	1	1	\N	2018-07-27	10781.96	8a8	2020-10-29 19:03:10.612216	2020-10-29 19:03:10.612216
4641	1	10	51	3	\N	2018-07-27	-1000.00	3aa	2020-10-29 19:03:10.613561	2020-10-29 19:03:10.613561
4642	1	10	51	3	\N	2018-07-27	-500.00	1d5	2020-10-29 19:03:10.614848	2020-10-29 19:03:10.614848
4643	1	10	51	3	\N	2018-07-27	-200.00	f60	2020-10-29 19:03:10.616536	2020-10-29 19:03:10.616536
4644	1	10	51	3	\N	2018-07-27	-1000.00	cd2	2020-10-29 19:03:10.617819	2020-10-29 19:03:10.617819
4645	6	10	51	4	\N	2018-07-27	1000.00	cd2	2020-10-29 19:03:10.618982	2020-10-29 19:03:10.618982
4646	1	9	48	2	\N	2018-07-27	-100.00	bbb	2020-10-29 19:03:10.620108	2020-10-29 19:03:10.620108
4647	1	1	6	2	\N	2018-07-27	-32.00	c65	2020-10-29 19:03:10.621502	2020-10-29 19:03:10.621502
4648	1	4	15	2	\N	2018-07-28	-29.00	de2	2020-10-29 19:03:10.622899	2020-10-29 19:03:10.622899
4649	1	1	7	2	\N	2018-07-28	-15.00	e33	2020-10-29 19:03:10.624419	2020-10-29 19:03:10.624419
4650	1	9	45	2	\N	2018-07-28	-32.00	544	2020-10-29 19:03:10.625625	2020-10-29 19:03:10.625625
4651	1	7	33	2	\N	2018-07-30	-130.00	661	2020-10-29 19:03:10.626922	2020-10-29 19:03:10.626922
4652	1	1	7	2	\N	2018-07-30	-13.67	e33	2020-10-29 19:03:10.628312	2020-10-29 19:03:10.628312
4653	5	1	5	2	\N	2018-07-28	-100.32	6ee	2020-10-29 19:03:10.629884	2020-10-29 19:03:10.629884
4654	5	5	20	2	\N	2018-07-24	-3.50	5e4	2020-10-29 19:03:10.631146	2020-10-29 19:03:10.631146
4655	5	1	5	2	\N	2018-07-24	-9.96	7d2	2020-10-29 19:03:10.632286	2020-10-29 19:03:10.632286
4656	5	1	5	2	\N	2018-07-28	-47.12	e0d	2020-10-29 19:03:10.633897	2020-10-29 19:03:10.633897
4657	5	9	47	2	\N	2018-07-25	-7.50	edc	2020-10-29 19:03:10.635179	2020-10-29 19:03:10.635179
4658	5	3	-1	2	\N	2018-07-28	-17.99	0d2	2020-10-29 19:03:10.636414	2020-10-29 19:03:10.636414
4659	5	1	5	2	\N	2018-07-30	-35.00	182	2020-10-29 19:03:10.637846	2020-10-29 19:03:10.637846
4660	5	7	30	3	\N	2018-07-31	-15.00	58d	2020-10-29 19:03:10.639205	2020-10-29 19:03:10.639205
4661	1	2	2	4	\N	2018-07-31	15.00	58d	2020-10-29 19:03:10.640441	2020-10-29 19:03:10.640441
4662	1	1	7	2	\N	2018-08-01	-10.45	e33	2020-10-29 19:03:10.641669	2020-10-29 19:03:10.641669
4663	1	1	5	2	\N	2018-07-31	-5.78	476	2020-10-29 19:03:10.64295	2020-10-29 19:03:10.64295
4664	1	10	51	3	\N	2018-08-01	-7000.00	c5d	2020-10-29 19:03:10.644306	2020-10-29 19:03:10.644306
4665	5	10	51	4	\N	2018-08-01	885.00	c5d	2020-10-29 19:03:10.64588	2020-10-29 19:03:10.64588
4666	6	10	51	4	\N	2018-08-01	9000.00	c5d	2020-10-29 19:03:10.647263	2020-10-29 19:03:10.647263
4667	6	10	51	4	\N	2018-08-01	21000.00	c5d	2020-10-29 19:03:10.648887	2020-10-29 19:03:10.648887
4668	5	1	5	2	\N	2018-08-01	-15.34	e48	2020-10-29 19:03:10.650765	2020-10-29 19:03:10.650765
4669	5	10	51	3	\N	2018-08-01	-2733.10	c5d	2020-10-29 19:03:10.652299	2020-10-29 19:03:10.652299
4670	6	10	51	4	\N	2018-08-01	2733.10	c5d	2020-10-29 19:03:10.653584	2020-10-29 19:03:10.653584
4671	6	10	52	1	\N	2018-08-01	74.94	15b	2020-10-29 19:03:10.654882	2020-10-29 19:03:10.654882
4672	1	9	-1	2	\N	2018-08-01	-44.06	fd0	2020-10-29 19:03:10.656313	2020-10-29 19:03:10.656313
4673	5	9	-1	2	\N	2018-08-01	-81.33	fd0	2020-10-29 19:03:10.6576	2020-10-29 19:03:10.6576
4674	1	2	2	1	\N	2018-08-01	0.00	033	2020-10-29 19:03:10.658979	2020-10-29 19:03:10.658979
4675	5	1	5	2	\N	2018-08-04	-7.80	473	2020-10-29 19:03:10.660491	2020-10-29 19:03:10.660491
4676	5	9	45	2	\N	2018-08-04	-500.00	bf7	2020-10-29 19:03:10.661767	2020-10-29 19:03:10.661767
4677	5	9	45	2	\N	2018-08-03	-22.90	5a9	2020-10-29 19:03:10.662948	2020-10-29 19:03:10.662948
4678	5	9	45	2	\N	2018-08-04	-5.20	596	2020-10-29 19:03:10.664892	2020-10-29 19:03:10.664892
4679	5	1	5	2	\N	2018-08-04	-137.77	b5c	2020-10-29 19:03:10.666699	2020-10-29 19:03:10.666699
4680	5	8	40	2	\N	2018-08-03	-203.47	346	2020-10-29 19:03:10.668898	2020-10-29 19:03:10.668898
4681	5	5	20	2	\N	2018-08-03	-28.98	f40	2020-10-29 19:03:10.670762	2020-10-29 19:03:10.670762
4682	2	9	44	2	\N	2018-08-04	-100.00	8d7	2020-10-29 19:03:10.672111	2020-10-29 19:03:10.672111
4683	2	4	15	2	\N	2018-08-06	-25.00	a4d	2020-10-29 19:03:10.673687	2020-10-29 19:03:10.673687
4684	1	1	7	2	\N	2018-08-10	-21.65	e33	2020-10-29 19:03:10.674966	2020-10-29 19:03:10.674966
4685	1	3	-1	2	\N	2018-08-09	-12.00	498	2020-10-29 19:03:10.676557	2020-10-29 19:03:10.676557
4686	1	1	6	2	\N	2018-08-09	-25.00	496	2020-10-29 19:03:10.677747	2020-10-29 19:03:10.677747
4687	1	3	-1	2	\N	2018-08-09	-8.00	3ea	2020-10-29 19:03:10.679032	2020-10-29 19:03:10.679032
4688	1	3	-1	2	\N	2018-08-09	-9.00	3ea	2020-10-29 19:03:10.680643	2020-10-29 19:03:10.680643
4689	1	3	-1	2	\N	2018-08-09	-14.00	3ea	2020-10-29 19:03:10.682042	2020-10-29 19:03:10.682042
4690	1	1	7	2	\N	2018-08-09	-14.97	e33	2020-10-29 19:03:10.68408	2020-10-29 19:03:10.68408
4691	1	1	7	2	\N	2018-08-08	-12.00	e33	2020-10-29 19:03:10.685334	2020-10-29 19:03:10.685334
4692	1	3	-1	2	\N	2018-08-07	-4.09	3ea	2020-10-29 19:03:10.686586	2020-10-29 19:03:10.686586
4693	1	1	6	2	\N	2018-08-04	-6.50	a97	2020-10-29 19:03:10.687754	2020-10-29 19:03:10.687754
4694	1	1	7	2	\N	2018-08-03	-40.00	ef3	2020-10-29 19:03:10.688911	2020-10-29 19:03:10.688911
4695	5	1	5	2	\N	2018-08-11	-11.30	473	2020-10-29 19:03:10.690118	2020-10-29 19:03:10.690118
4696	5	1	5	2	\N	2018-08-09	-11.00	473	2020-10-29 19:03:10.691361	2020-10-29 19:03:10.691361
4697	5	1	5	2	\N	2018-08-09	-21.24	476	2020-10-29 19:03:10.692792	2020-10-29 19:03:10.692792
4698	5	1	-1	2	\N	2018-08-07	-153.00	7de	2020-10-29 19:03:10.694033	2020-10-29 19:03:10.694033
4699	5	1	5	2	\N	2018-08-07	-23.68	7d8	2020-10-29 19:03:10.695249	2020-10-29 19:03:10.695249
4700	5	8	40	2	\N	2018-08-07	-192.07	4ca	2020-10-29 19:03:10.696475	2020-10-29 19:03:10.696475
4701	5	10	51	4	\N	2018-08-06	5500.00	d9d	2020-10-29 19:03:10.697587	2020-10-29 19:03:10.697587
4702	5	10	51	3	\N	2018-08-07	-2500.00	d9d	2020-10-29 19:03:10.69878	2020-10-29 19:03:10.69878
4703	2	10	51	3	\N	2018-08-02	-1500.00	d9d	2020-10-29 19:03:10.70088	2020-10-29 19:03:10.70088
4704	5	1	5	2	\N	2018-08-11	-149.52	20c	2020-10-29 19:03:10.70296	2020-10-29 19:03:10.70296
4705	2	1	5	2	\N	2018-08-11	-8.00	75d	2020-10-29 19:03:10.704288	2020-10-29 19:03:10.704288
4706	2	5	23	2	\N	2018-08-11	-4.49	e48	2020-10-29 19:03:10.705539	2020-10-29 19:03:10.705539
4707	2	5	23	2	\N	2018-08-11	-69.83	846	2020-10-29 19:03:10.706748	2020-10-29 19:03:10.706748
4708	2	1	7	2	\N	2018-08-11	-15.96	a19	2020-10-29 19:03:10.708192	2020-10-29 19:03:10.708192
4709	2	9	45	2	\N	2018-08-11	-39.99	992	2020-10-29 19:03:10.709352	2020-10-29 19:03:10.709352
4710	2	6	24	2	\N	2018-08-11	-14.90	628	2020-10-29 19:03:10.710526	2020-10-29 19:03:10.710526
4711	2	6	24	2	\N	2018-08-11	-69.99	039	2020-10-29 19:03:10.711727	2020-10-29 19:03:10.711727
4712	5	8	40	2	\N	2018-08-13	-219.85	8f2	2020-10-29 19:03:10.713257	2020-10-29 19:03:10.713257
4713	5	10	51	4	\N	2018-08-13	2500.00	d9d	2020-10-29 19:03:10.714528	2020-10-29 19:03:10.714528
4714	5	10	51	3	\N	2018-08-13	-5000.00	039	2020-10-29 19:03:10.715838	2020-10-29 19:03:10.715838
4715	6	10	51	4	\N	2018-08-13	5000.00	039	2020-10-29 19:03:10.718077	2020-10-29 19:03:10.718077
4716	1	9	45	2	\N	2018-08-13	-309.00	336	2020-10-29 19:03:10.72018	2020-10-29 19:03:10.72018
4717	1	9	45	2	\N	2018-08-13	-16.49	336	2020-10-29 19:03:10.721425	2020-10-29 19:03:10.721425
4718	5	1	5	2	\N	2018-08-13	-4.70	473	2020-10-29 19:03:10.72381	2020-10-29 19:03:10.72381
4719	5	5	20	2	\N	2018-08-13	-35.97	f40	2020-10-29 19:03:10.725029	2020-10-29 19:03:10.725029
4720	5	1	8	2	\N	2018-08-13	-23.98	86c	2020-10-29 19:03:10.72617	2020-10-29 19:03:10.72617
4721	1	1	6	2	\N	2018-08-15	-80.00	1a3	2020-10-29 19:03:10.727239	2020-10-29 19:03:10.727239
4722	1	8	38	2	\N	2018-08-16	-4.00	a3a	2020-10-29 19:03:10.728233	2020-10-29 19:03:10.728233
4723	1	8	38	2	\N	2018-08-16	-50.95	074	2020-10-29 19:03:10.729278	2020-10-29 19:03:10.729278
4724	5	2	2	1	\N	2018-08-16	151.20	1a2	2020-10-29 19:03:10.730419	2020-10-29 19:03:10.730419
4725	5	5	22	2	\N	2018-08-14	-25.00	a8b	2020-10-29 19:03:10.731612	2020-10-29 19:03:10.731612
4726	5	1	5	2	\N	2018-08-14	-5.00	07d	2020-10-29 19:03:10.73293	2020-10-29 19:03:10.73293
4727	5	3	-1	2	\N	2018-08-16	-8.98	3ea	2020-10-29 19:03:10.734793	2020-10-29 19:03:10.734793
4728	5	1	5	2	\N	2018-08-16	-16.59	35b	2020-10-29 19:03:10.736736	2020-10-29 19:03:10.736736
4729	5	1	5	2	\N	2018-08-16	-8.54	d04	2020-10-29 19:03:10.738623	2020-10-29 19:03:10.738623
4730	5	1	5	2	\N	2018-08-16	-5.40	07d	2020-10-29 19:03:10.740239	2020-10-29 19:03:10.740239
4731	4	10	51	3	\N	2018-08-16	-500.00	3ae	2020-10-29 19:03:10.741541	2020-10-29 19:03:10.741541
4732	2	10	51	4	\N	2018-08-16	500.00	3ae	2020-10-29 19:03:10.74365	2020-10-29 19:03:10.74365
4733	2	4	13	2	\N	2018-08-16	-29.99	54d	2020-10-29 19:03:10.745073	2020-10-29 19:03:10.745073
4734	2	6	24	2	\N	2018-08-16	-16.70	6e4	2020-10-29 19:03:10.746479	2020-10-29 19:03:10.746479
4735	1	6	24	2	\N	2018-08-17	-199.00	17c	2020-10-29 19:03:10.747795	2020-10-29 19:03:10.747795
4736	1	6	24	2	\N	2018-08-17	-329.90	54a	2020-10-29 19:03:10.749366	2020-10-29 19:03:10.749366
4737	1	6	24	2	\N	2018-08-17	-59.99	e7d	2020-10-29 19:03:10.750824	2020-10-29 19:03:10.750824
4738	1	5	18	2	\N	2018-08-17	-12.99	481	2020-10-29 19:03:10.752183	2020-10-29 19:03:10.752183
4739	1	9	47	2	\N	2018-08-17	-7.50	199	2020-10-29 19:03:10.753487	2020-10-29 19:03:10.753487
4740	1	10	51	4	\N	2018-08-17	400.00	665	2020-10-29 19:03:10.755074	2020-10-29 19:03:10.755074
4741	1	9	-1	3	\N	2018-08-16	-100.00	a76	2020-10-29 19:03:10.756319	2020-10-29 19:03:10.756319
4742	2	6	24	2	\N	2018-08-17	-14.00	480	2020-10-29 19:03:10.757358	2020-10-29 19:03:10.757358
4743	5	9	45	2	\N	2018-08-17	-34.00	b2e	2020-10-29 19:03:10.758456	2020-10-29 19:03:10.758456
4744	2	9	44	2	\N	2018-08-17	-50.00	231	2020-10-29 19:03:10.759574	2020-10-29 19:03:10.759574
4745	5	9	44	2	\N	2018-08-17	-500.00	7b4	2020-10-29 19:03:10.760622	2020-10-29 19:03:10.760622
4746	2	5	22	2	\N	2018-08-20	-40.00	b6f	2020-10-29 19:03:10.761674	2020-10-29 19:03:10.761674
4747	2	8	38	2	\N	2018-08-21	-50.00	f6a	2020-10-29 19:03:10.762824	2020-10-29 19:03:10.762824
4748	5	1	5	2	\N	2018-08-20	-105.26	b5c	2020-10-29 19:03:10.763986	2020-10-29 19:03:10.763986
4749	2	1	5	2	\N	2018-08-21	-5.40	094	2020-10-29 19:03:10.765161	2020-10-29 19:03:10.765161
4750	2	1	6	2	\N	2018-08-22	-49.00	2a6	2020-10-29 19:03:10.766793	2020-10-29 19:03:10.766793
4751	1	3	-1	2	\N	2018-08-21	-29.00	af4	2020-10-29 19:03:10.768492	2020-10-29 19:03:10.768492
4752	5	1	5	2	\N	2018-08-20	-9.25	473	2020-10-29 19:03:10.7699	2020-10-29 19:03:10.7699
4753	5	1	5	2	\N	2018-08-21	-13.10	473	2020-10-29 19:03:10.771993	2020-10-29 19:03:10.771993
4754	5	5	20	2	\N	2018-08-19	-40.50	efc	2020-10-29 19:03:10.773382	2020-10-29 19:03:10.773382
4755	5	8	38	2	\N	2018-08-19	-203.36	cc4	2020-10-29 19:03:10.774688	2020-10-29 19:03:10.774688
4756	5	7	33	2	\N	2018-08-20	-7.90	5fd	2020-10-29 19:03:10.77602	2020-10-29 19:03:10.77602
4757	1	8	38	2	\N	2018-08-17	-37.00	d00	2020-10-29 19:03:10.777188	2020-10-29 19:03:10.777188
4758	5	1	5	2	\N	2018-08-24	-9.60	586	2020-10-29 19:03:10.778445	2020-10-29 19:03:10.778445
4759	5	4	13	2	\N	2018-08-24	-49.90	97a	2020-10-29 19:03:10.779601	2020-10-29 19:03:10.779601
4760	2	1	6	2	\N	2018-08-22	-25.00	ecb	2020-10-29 19:03:10.780796	2020-10-29 19:03:10.780796
4761	2	1	6	2	\N	2018-08-22	-49.00	2fd	2020-10-29 19:03:10.782798	2020-10-29 19:03:10.782798
4762	2	4	13	1	\N	2018-08-22	100.00	0d8	2020-10-29 19:03:10.784711	2020-10-29 19:03:10.784711
4763	1	3	-1	2	\N	2018-08-24	-3.39	3ea	2020-10-29 19:03:10.78612	2020-10-29 19:03:10.78612
4764	1	1	6	2	\N	2018-08-23	-62.80	683	2020-10-29 19:03:10.787353	2020-10-29 19:03:10.787353
4765	5	8	40	2	\N	2018-08-24	-248.01	a6f	2020-10-29 19:03:10.788612	2020-10-29 19:03:10.788612
4766	5	1	5	2	\N	2018-08-26	-81.97	6ee	2020-10-29 19:03:10.789776	2020-10-29 19:03:10.789776
4767	1	4	15	2	\N	2018-08-27	-19.00	de2	2020-10-29 19:03:10.790927	2020-10-29 19:03:10.790927
4768	1	2	1	1	\N	2018-08-27	8607.60	577	2020-10-29 19:03:10.792216	2020-10-29 19:03:10.792216
4769	1	10	51	3	\N	2018-08-27	-500.00	1d5	2020-10-29 19:03:10.79347	2020-10-29 19:03:10.79347
4770	1	10	51	3	\N	2018-08-27	-700.00	6bc	2020-10-29 19:03:10.794704	2020-10-29 19:03:10.794704
4771	2	6	24	2	\N	2018-08-28	-130.00	1f6	2020-10-29 19:03:10.79589	2020-10-29 19:03:10.79589
4772	2	2	1	1	\N	2018-08-28	9061.89	e4a	2020-10-29 19:03:10.79722	2020-10-29 19:03:10.79722
4773	2	10	51	3	\N	2018-08-28	-500.00	375	2020-10-29 19:03:10.798534	2020-10-29 19:03:10.798534
4774	4	10	51	4	\N	2018-08-28	500.00	375	2020-10-29 19:03:10.80017	2020-10-29 19:03:10.80017
4775	2	10	51	3	\N	2018-08-28	-6500.00	210	2020-10-29 19:03:10.802261	2020-10-29 19:03:10.802261
4776	5	10	51	4	\N	2018-08-28	6500.00	210	2020-10-29 19:03:10.803733	2020-10-29 19:03:10.803733
4777	5	4	10	2	\N	2018-08-28	-404.88	297	2020-10-29 19:03:10.805151	2020-10-29 19:03:10.805151
4778	5	4	12	2	\N	2018-08-28	-115.48	56e	2020-10-29 19:03:10.806516	2020-10-29 19:03:10.806516
4779	5	4	11	2	\N	2018-08-28	-108.33	fec	2020-10-29 19:03:10.807874	2020-10-29 19:03:10.807874
4780	5	1	5	2	\N	2018-08-29	-4.80	473	2020-10-29 19:03:10.809276	2020-10-29 19:03:10.809276
4781	1	1	5	2	\N	2018-08-28	-10.68	6b9	2020-10-29 19:03:10.810589	2020-10-29 19:03:10.810589
4782	1	1	5	2	\N	2018-08-28	-1.69	45f	2020-10-29 19:03:10.812893	2020-10-29 19:03:10.812893
4783	1	9	48	2	\N	2018-08-30	-100.00	bbb	2020-10-29 19:03:10.81521	2020-10-29 19:03:10.81521
4784	5	1	5	2	\N	2018-08-29	-14.53	476	2020-10-29 19:03:10.817848	2020-10-29 19:03:10.817848
4785	5	1	5	2	\N	2018-08-30	-4.20	07d	2020-10-29 19:03:10.820192	2020-10-29 19:03:10.820192
4786	5	5	20	2	\N	2018-08-30	-88.02	ceb	2020-10-29 19:03:10.822489	2020-10-29 19:03:10.822489
4787	5	7	30	3	\N	2018-08-31	-15.00	022	2020-10-29 19:03:10.824857	2020-10-29 19:03:10.824857
4788	1	2	2	4	\N	2018-08-31	15.00	022	2020-10-29 19:03:10.827028	2020-10-29 19:03:10.827028
4789	5	1	5	2	\N	2018-08-31	-10.00	473	2020-10-29 19:03:10.829138	2020-10-29 19:03:10.829138
4790	5	9	45	2	\N	2018-08-31	-39.69	3c9	2020-10-29 19:03:10.831422	2020-10-29 19:03:10.831422
4791	5	1	5	2	\N	2018-08-31	-124.67	b5c	2020-10-29 19:03:10.833708	2020-10-29 19:03:10.833708
4792	6	10	52	1	\N	2018-08-31	68.07	fa7	2020-10-29 19:03:10.835995	2020-10-29 19:03:10.835995
4793	5	2	2	1	\N	2018-09-01	0.00	ac7	2020-10-29 19:03:10.838236	2020-10-29 19:03:10.838236
4794	1	10	51	3	\N	2018-09-01	-7000.00	3c9	2020-10-29 19:03:10.840409	2020-10-29 19:03:10.840409
4795	1	9	46	2	\N	2018-09-01	-100.00	e1b	2020-10-29 19:03:10.842025	2020-10-29 19:03:10.842025
4796	5	5	23	2	\N	2018-09-01	-44.40	c44	2020-10-29 19:03:10.843415	2020-10-29 19:03:10.843415
4797	2	9	45	2	\N	2018-09-01	-7.99	19f	2020-10-29 19:03:10.845323	2020-10-29 19:03:10.845323
4798	2	1	8	2	\N	2018-09-01	-12.00	7e7	2020-10-29 19:03:10.847608	2020-10-29 19:03:10.847608
4799	1	1	8	2	\N	2018-09-02	-10.50	cb5	2020-10-29 19:03:10.849063	2020-10-29 19:03:10.849063
4800	5	9	45	2	\N	2018-09-02	-70.00	d83	2020-10-29 19:03:10.851251	2020-10-29 19:03:10.851251
4801	2	9	45	2	\N	2018-09-02	-30.00	328	2020-10-29 19:03:10.853377	2020-10-29 19:03:10.853377
4802	1	1	7	2	\N	2018-09-05	-9.40	e33	2020-10-29 19:03:10.854756	2020-10-29 19:03:10.854756
4803	5	1	5	2	\N	2018-09-05	-119.42	6ee	2020-10-29 19:03:10.856018	2020-10-29 19:03:10.856018
4804	5	1	5	2	\N	2018-09-04	-11.94	476	2020-10-29 19:03:10.857096	2020-10-29 19:03:10.857096
4805	5	1	5	2	\N	2018-09-04	-9.30	473	2020-10-29 19:03:10.858215	2020-10-29 19:03:10.858215
4806	5	5	20	2	\N	2018-09-03	-25.49	ceb	2020-10-29 19:03:10.859313	2020-10-29 19:03:10.859313
4807	5	1	5	2	\N	2018-09-03	-3.80	473	2020-10-29 19:03:10.860583	2020-10-29 19:03:10.860583
4808	5	4	-1	2	\N	2018-09-06	-162.00	457	2020-10-29 19:03:10.861938	2020-10-29 19:03:10.861938
4809	5	10	51	4	\N	2018-09-04	5500.00	5f1	2020-10-29 19:03:10.863197	2020-10-29 19:03:10.863197
4810	2	10	51	3	\N	2018-09-03	-1500.00	5f1	2020-10-29 19:03:10.864414	2020-10-29 19:03:10.864414
4811	1	10	51	4	\N	2018-09-06	500.00	253	2020-10-29 19:03:10.865734	2020-10-29 19:03:10.865734
4812	5	10	51	3	\N	2018-09-06	-500.00	3aa	2020-10-29 19:03:10.867502	2020-10-29 19:03:10.867502
4813	1	10	51	4	\N	2018-09-06	500.00	3aa	2020-10-29 19:03:10.868989	2020-10-29 19:03:10.868989
4814	1	8	39	2	\N	2018-09-06	-212.00	247	2020-10-29 19:03:10.870396	2020-10-29 19:03:10.870396
4815	5	10	51	3	\N	2018-09-07	-2500.00	5f1	2020-10-29 19:03:10.871638	2020-10-29 19:03:10.871638
4816	5	1	5	2	\N	2018-09-07	-9.00	473	2020-10-29 19:03:10.872828	2020-10-29 19:03:10.872828
4817	5	8	40	2	\N	2018-09-07	-251.42	a2d	2020-10-29 19:03:10.874244	2020-10-29 19:03:10.874244
4818	5	1	6	2	\N	2018-09-07	-21.98	de4	2020-10-29 19:03:10.875598	2020-10-29 19:03:10.875598
4819	1	1	6	2	\N	2018-09-08	-8.73	de4	2020-10-29 19:03:10.876999	2020-10-29 19:03:10.876999
4820	1	3	-1	2	\N	2018-09-08	-20.00	e1c	2020-10-29 19:03:10.878241	2020-10-29 19:03:10.878241
4821	1	1	5	2	\N	2018-09-08	-36.60	de4	2020-10-29 19:03:10.87956	2020-10-29 19:03:10.87956
4822	1	8	39	2	\N	2018-09-09	-182.00	9a1	2020-10-29 19:03:10.881041	2020-10-29 19:03:10.881041
4823	1	7	32	2	\N	2018-09-09	-67.00	a1b	2020-10-29 19:03:10.882758	2020-10-29 19:03:10.882758
4824	1	1	6	2	\N	2018-09-09	-41.90	e04	2020-10-29 19:03:10.884466	2020-10-29 19:03:10.884466
4825	1	1	6	2	\N	2018-09-10	-9.00	8fc	2020-10-29 19:03:10.885896	2020-10-29 19:03:10.885896
4826	1	1	5	2	\N	2018-09-10	-1.50	473	2020-10-29 19:03:10.88711	2020-10-29 19:03:10.88711
4827	1	1	7	2	\N	2018-09-11	-17.60	e33	2020-10-29 19:03:10.88823	2020-10-29 19:03:10.88823
4828	1	9	48	2	\N	2018-09-13	-20.00	909	2020-10-29 19:03:10.889365	2020-10-29 19:03:10.889365
4829	5	10	51	4	\N	2018-09-11	2500.00	5f1	2020-10-29 19:03:10.891122	2020-10-29 19:03:10.891122
4830	5	1	5	2	\N	2018-09-11	-7.40	473	2020-10-29 19:03:10.892422	2020-10-29 19:03:10.892422
4831	5	5	18	2	\N	2018-09-12	-45.16	846	2020-10-29 19:03:10.893926	2020-10-29 19:03:10.893926
4832	5	2	2	1	\N	2018-09-13	67.16	ea8	2020-10-29 19:03:10.895536	2020-10-29 19:03:10.895536
4833	5	1	5	2	\N	2018-09-13	-5.67	476	2020-10-29 19:03:10.897988	2020-10-29 19:03:10.897988
4834	5	5	20	2	\N	2018-09-13	-45.97	ceb	2020-10-29 19:03:10.901719	2020-10-29 19:03:10.901719
4835	5	1	5	2	\N	2018-09-13	-106.94	e5f	2020-10-29 19:03:10.903615	2020-10-29 19:03:10.903615
4836	5	1	5	2	\N	2018-09-13	-15.01	708	2020-10-29 19:03:10.905046	2020-10-29 19:03:10.905046
4837	1	9	48	2	\N	2018-09-13	-100.00	bbb	2020-10-29 19:03:10.90657	2020-10-29 19:03:10.90657
4838	1	1	6	2	\N	2018-09-15	-37.90	52c	2020-10-29 19:03:10.907769	2020-10-29 19:03:10.907769
4839	5	1	5	2	\N	2018-09-15	-15.70	f62	2020-10-29 19:03:10.909011	2020-10-29 19:03:10.909011
4840	5	1	5	2	\N	2018-09-15	-2.87	5b0	2020-10-29 19:03:10.91009	2020-10-29 19:03:10.91009
4841	5	1	5	2	\N	2018-09-15	-9.90	473	2020-10-29 19:03:10.911161	2020-10-29 19:03:10.911161
4842	5	9	45	2	\N	2018-09-14	-28.55	ce5	2020-10-29 19:03:10.912283	2020-10-29 19:03:10.912283
4843	1	3	-1	2	\N	2018-09-15	-21.00	be0	2020-10-29 19:03:10.913337	2020-10-29 19:03:10.913337
4844	5	1	5	2	\N	2018-09-16	-15.70	13a	2020-10-29 19:03:10.914415	2020-10-29 19:03:10.914415
4845	5	1	5	2	\N	2018-09-17	-20.14	292	2020-10-29 19:03:10.915561	2020-10-29 19:03:10.915561
4846	2	4	13	2	\N	2018-09-20	-29.99	fc6	2020-10-29 19:03:10.917627	2020-10-29 19:03:10.917627
4847	2	5	19	1	\N	2018-09-13	128.17	cca	2020-10-29 19:03:10.919022	2020-10-29 19:03:10.919022
4848	2	4	15	2	\N	2018-09-08	-25.00	f80	2020-10-29 19:03:10.920591	2020-10-29 19:03:10.920591
4849	2	1	6	2	\N	2018-09-09	-21.98	f89	2020-10-29 19:03:10.921877	2020-10-29 19:03:10.921877
4850	2	4	13	1	\N	2018-09-07	100.00	f9d	2020-10-29 19:03:10.923349	2020-10-29 19:03:10.923349
4851	5	9	45	2	\N	2018-09-20	-65.00	ab5	2020-10-29 19:03:10.92457	2020-10-29 19:03:10.92457
4852	2	9	45	2	\N	2018-09-20	-54.98	d78	2020-10-29 19:03:10.925661	2020-10-29 19:03:10.925661
4853	5	1	5	2	\N	2018-09-20	-63.73	0c8	2020-10-29 19:03:10.926725	2020-10-29 19:03:10.926725
4854	5	1	5	2	\N	2018-09-20	-134.42	88c	2020-10-29 19:03:10.927834	2020-10-29 19:03:10.927834
4855	5	9	45	2	\N	2018-09-20	-24.90	4c3	2020-10-29 19:03:10.928893	2020-10-29 19:03:10.928893
4856	2	5	20	2	\N	2018-09-20	-35.69	43e	2020-10-29 19:03:10.929977	2020-10-29 19:03:10.929977
4857	1	1	7	2	\N	2018-09-21	-17.21	e33	2020-10-29 19:03:10.931063	2020-10-29 19:03:10.931063
4858	1	8	39	2	\N	2018-09-18	-73.00	cda	2020-10-29 19:03:10.932198	2020-10-29 19:03:10.932198
4859	1	1	6	2	\N	2018-09-21	-16.00	509	2020-10-29 19:03:10.933737	2020-10-29 19:03:10.933737
4860	5	1	5	2	\N	2018-09-22	-9.95	add	2020-10-29 19:03:10.935034	2020-10-29 19:03:10.935034
4861	5	1	5	2	\N	2018-09-22	-11.20	caf	2020-10-29 19:03:10.936177	2020-10-29 19:03:10.936177
4862	5	1	5	2	\N	2018-09-22	-8.60	473	2020-10-29 19:03:10.93726	2020-10-29 19:03:10.93726
4863	5	1	5	2	\N	2018-09-21	-3.84	85c	2020-10-29 19:03:10.938262	2020-10-29 19:03:10.938262
4864	2	9	44	3	\N	2018-09-22	-100.00	3bf	2020-10-29 19:03:10.939447	2020-10-29 19:03:10.939447
4865	2	1	8	2	\N	2018-09-22	-13.20	1a7	2020-10-29 19:03:10.940657	2020-10-29 19:03:10.940657
4866	2	3	-1	2	\N	2018-09-21	-11.00	3ea	2020-10-29 19:03:10.941692	2020-10-29 19:03:10.941692
4867	5	7	27	2	\N	2018-09-22	-50.00	151	2020-10-29 19:03:10.942714	2020-10-29 19:03:10.942714
4868	5	5	23	2	\N	2018-09-22	-36.91	0e6	2020-10-29 19:03:10.94378	2020-10-29 19:03:10.94378
4869	2	9	45	2	\N	2018-09-22	-58.00	f16	2020-10-29 19:03:10.944814	2020-10-29 19:03:10.944814
4870	2	9	45	2	\N	2018-09-22	-49.99	034	2020-10-29 19:03:10.945873	2020-10-29 19:03:10.945873
4871	5	1	5	2	\N	2018-09-23	-7.49	8a1	2020-10-29 19:03:10.9472	2020-10-29 19:03:10.9472
4872	1	9	46	3	\N	2018-09-22	-50.00	576	2020-10-29 19:03:10.948447	2020-10-29 19:03:10.948447
4873	1	7	33	2	\N	2018-09-22	-33.89	489	2020-10-29 19:03:10.949804	2020-10-29 19:03:10.949804
4874	2	8	42	2	\N	2018-09-22	-39.00	049	2020-10-29 19:03:10.951256	2020-10-29 19:03:10.951256
4875	5	1	5	2	\N	2018-09-24	-54.60	a4a	2020-10-29 19:03:10.952404	2020-10-29 19:03:10.952404
4876	1	1	8	2	\N	2018-09-24	-5.88	b15	2020-10-29 19:03:10.953549	2020-10-29 19:03:10.953549
4877	5	8	42	2	\N	2018-09-24	-39.00	5c6	2020-10-29 19:03:10.955172	2020-10-29 19:03:10.955172
4878	5	8	40	2	\N	2018-09-25	-234.26	a6f	2020-10-29 19:03:10.956328	2020-10-29 19:03:10.956328
4879	1	9	46	2	\N	2018-09-25	-99.00	6f4	2020-10-29 19:03:10.957512	2020-10-29 19:03:10.957512
4880	1	1	7	2	\N	2018-10-01	-2.80	d47	2020-10-29 19:03:10.958708	2020-10-29 19:03:10.958708
4881	1	1	7	2	\N	2018-10-01	-13.64	e37	2020-10-29 19:03:10.959851	2020-10-29 19:03:10.959851
4882	1	9	45	2	\N	2018-10-01	-20.00	ab1	2020-10-29 19:03:10.960963	2020-10-29 19:03:10.960963
4883	1	1	5	2	\N	2018-10-29	-2.99	4e7	2020-10-29 19:03:10.962069	2020-10-29 19:03:10.962069
4884	1	8	38	2	\N	2018-09-30	-29.55	017	2020-10-29 19:03:10.963273	2020-10-29 19:03:10.963273
4885	1	1	5	2	\N	2018-09-28	-1.80	d7d	2020-10-29 19:03:10.964362	2020-10-29 19:03:10.964362
4886	1	5	22	2	\N	2018-09-28	-50.00	9da	2020-10-29 19:03:10.965411	2020-10-29 19:03:10.965411
4887	1	3	-1	2	\N	2018-09-26	-55.00	2d5	2020-10-29 19:03:10.966735	2020-10-29 19:03:10.966735
4888	1	4	15	2	\N	2018-09-27	-19.00	de2	2020-10-29 19:03:10.968001	2020-10-29 19:03:10.968001
4889	1	1	8	2	\N	2018-09-27	-18.80	042	2020-10-29 19:03:10.969056	2020-10-29 19:03:10.969056
4890	1	6	25	2	\N	2018-09-27	-8.98	4b1	2020-10-29 19:03:10.970176	2020-10-29 19:03:10.970176
4891	1	9	45	2	\N	2018-09-27	-74.99	d66	2020-10-29 19:03:10.971268	2020-10-29 19:03:10.971268
4892	1	3	-1	2	\N	2018-09-26	-11.00	872	2020-10-29 19:03:10.972411	2020-10-29 19:03:10.972411
4893	1	8	38	2	\N	2018-09-26	-5.90	a3a	2020-10-29 19:03:10.973468	2020-10-29 19:03:10.973468
4894	1	8	38	2	\N	2018-09-26	-26.40	94a	2020-10-29 19:03:10.974572	2020-10-29 19:03:10.974572
4895	1	2	1	1	\N	2018-09-26	9603.33	8c4	2020-10-29 19:03:10.975648	2020-10-29 19:03:10.975648
4896	1	10	51	3	\N	2018-10-01	-7000.00	812	2020-10-29 19:03:10.976734	2020-10-29 19:03:10.976734
4897	5	1	5	2	\N	2018-10-01	-18.38	63a	2020-10-29 19:03:10.977784	2020-10-29 19:03:10.977784
4898	5	1	5	2	\N	2018-10-01	-19.45	332	2020-10-29 19:03:10.978886	2020-10-29 19:03:10.978886
4899	5	9	-1	2	\N	2018-10-01	-98.29	758	2020-10-29 19:03:10.97996	2020-10-29 19:03:10.97996
4900	5	1	5	2	\N	2018-09-28	-7.20	63a	2020-10-29 19:03:10.981025	2020-10-29 19:03:10.981025
4901	5	1	8	2	\N	2018-09-28	-3.99	6a2	2020-10-29 19:03:10.98211	2020-10-29 19:03:10.98211
4902	5	1	5	2	\N	2018-09-26	-8.40	473	2020-10-29 19:03:10.983681	2020-10-29 19:03:10.983681
4903	6	10	52	1	\N	2018-09-30	0.36	15b	2020-10-29 19:03:10.984931	2020-10-29 19:03:10.984931
4904	6	10	52	1	\N	2018-09-30	69.30	15b	2020-10-29 19:03:10.986208	2020-10-29 19:03:10.986208
4905	1	9	46	2	\N	2018-10-01	-99.99	844	2020-10-29 19:03:10.987231	2020-10-29 19:03:10.987231
4906	1	10	51	3	\N	2018-10-01	-500.00	1d5	2020-10-29 19:03:10.988273	2020-10-29 19:03:10.988273
4907	1	10	51	3	\N	2018-10-01	-500.00	3aa	2020-10-29 19:03:10.989338	2020-10-29 19:03:10.989338
4908	1	10	51	3	\N	2018-10-01	-200.00	fff	2020-10-29 19:03:10.990408	2020-10-29 19:03:10.990408
4909	5	7	27	2	\N	2018-10-01	-47.95	151	2020-10-29 19:03:10.991652	2020-10-29 19:03:10.991652
4910	5	7	30	3	\N	2018-10-01	-15.00	1c5	2020-10-29 19:03:10.992958	2020-10-29 19:03:10.992958
4911	1	2	2	4	\N	2018-10-01	15.00	1c5	2020-10-29 19:03:10.994441	2020-10-29 19:03:10.994441
4912	5	1	5	2	\N	2018-10-02	-6.70	473	2020-10-29 19:03:10.995523	2020-10-29 19:03:10.995523
4913	5	5	20	2	\N	2018-10-02	-39.48	ceb	2020-10-29 19:03:10.99674	2020-10-29 19:03:10.99674
4914	1	1	8	2	\N	2018-10-02	-2.00	d30	2020-10-29 19:03:10.997985	2020-10-29 19:03:10.997985
4915	2	2	1	1	\N	2018-10-03	4991.13	601	2020-10-29 19:03:10.999219	2020-10-29 19:03:10.999219
4916	2	10	51	3	\N	2018-10-02	-3000.00	ec8	2020-10-29 19:03:11.000707	2020-10-29 19:03:11.000707
4917	5	10	51	4	\N	2018-10-02	3000.00	ec8	2020-10-29 19:03:11.001988	2020-10-29 19:03:11.001988
4918	2	9	-1	2	\N	2018-10-02	-96.41	99e	2020-10-29 19:03:11.003114	2020-10-29 19:03:11.003114
4919	5	4	10	2	\N	2018-10-03	-398.78	a16	2020-10-29 19:03:11.004286	2020-10-29 19:03:11.004286
4920	5	10	51	3	\N	2018-10-03	-5000.00	2bf	2020-10-29 19:03:11.005448	2020-10-29 19:03:11.005448
4921	6	10	51	4	\N	2018-10-03	5000.00	2bf	2020-10-29 19:03:11.006543	2020-10-29 19:03:11.006543
4922	5	4	13	2	\N	2018-10-04	-49.90	233	2020-10-29 19:03:11.007586	2020-10-29 19:03:11.007586
4923	1	9	-1	2	\N	2018-10-04	-79.99	7ac	2020-10-29 19:03:11.008637	2020-10-29 19:03:11.008637
4924	5	1	5	2	\N	2018-10-04	-100.16	641	2020-10-29 19:03:11.010028	2020-10-29 19:03:11.010028
4925	5	10	51	4	\N	2018-10-08	5400.00	ad3	2020-10-29 19:03:11.011415	2020-10-29 19:03:11.011415
4926	1	1	7	2	\N	2018-10-05	-15.19	e33	2020-10-29 19:03:11.012658	2020-10-29 19:03:11.012658
4927	1	8	38	2	\N	2018-10-06	-33.22	94a	2020-10-29 19:03:11.013775	2020-10-29 19:03:11.013775
4928	1	9	48	2	\N	2018-10-05	-100.00	bbb	2020-10-29 19:03:11.015007	2020-10-29 19:03:11.015007
4929	5	1	5	2	\N	2018-10-06	-65.26	545	2020-10-29 19:03:11.016319	2020-10-29 19:03:11.016319
4930	5	1	5	2	\N	2018-10-06	-4.80	473	2020-10-29 19:03:11.018006	2020-10-29 19:03:11.018006
4931	5	1	5	2	\N	2018-10-05	-31.95	7d2	2020-10-29 19:03:11.019139	2020-10-29 19:03:11.019139
4932	5	1	5	2	\N	2018-10-05	-4.95	7d2	2020-10-29 19:03:11.020208	2020-10-29 19:03:11.020208
4933	5	1	5	2	\N	2018-10-07	-47.87	a81	2020-10-29 19:03:11.021206	2020-10-29 19:03:11.021206
4934	5	10	51	3	\N	2018-10-08	-2500.00	15a	2020-10-29 19:03:11.02264	2020-10-29 19:03:11.02264
4935	5	1	5	2	\N	2018-10-07	-8.95	641	2020-10-29 19:03:11.024024	2020-10-29 19:03:11.024024
4936	5	9	45	2	\N	2018-10-08	-108.16	73c	2020-10-29 19:03:11.02535	2020-10-29 19:03:11.02535
4937	2	3	-1	2	\N	2018-10-08	-14.69	1ee	2020-10-29 19:03:11.026535	2020-10-29 19:03:11.026535
4938	2	4	15	2	\N	2018-10-08	-25.00	f80	2020-10-29 19:03:11.027578	2020-10-29 19:03:11.027578
4939	2	1	5	2	\N	2018-10-09	-18.31	c9e	2020-10-29 19:03:11.028622	2020-10-29 19:03:11.028622
4940	5	10	51	4	\N	2018-10-11	2500.00	d9d	2020-10-29 19:03:11.029723	2020-10-29 19:03:11.029723
4941	5	1	5	2	\N	2018-10-09	-10.10	473	2020-10-29 19:03:11.03096	2020-10-29 19:03:11.03096
4942	1	1	7	2	\N	2018-10-11	-15.72	550	2020-10-29 19:03:11.032099	2020-10-29 19:03:11.032099
4943	1	3	-1	2	\N	2018-10-12	-47.00	ef3	2020-10-29 19:03:11.033269	2020-10-29 19:03:11.033269
4944	5	10	51	3	\N	2018-10-12	-5000.00	039	2020-10-29 19:03:11.035116	2020-10-29 19:03:11.035116
4945	6	10	51	4	\N	2018-10-12	5000.00	039	2020-10-29 19:03:11.036831	2020-10-29 19:03:11.036831
4946	5	1	5	2	\N	2018-10-13	-8.20	473	2020-10-29 19:03:11.038211	2020-10-29 19:03:11.038211
4947	5	1	5	2	\N	2018-10-12	-19.73	7d2	2020-10-29 19:03:11.039703	2020-10-29 19:03:11.039703
4948	5	1	5	2	\N	2018-10-12	-182.28	7d2	2020-10-29 19:03:11.041022	2020-10-29 19:03:11.041022
4949	2	2	1	1	\N	2018-10-13	1534.03	3fd	2020-10-29 19:03:11.042285	2020-10-29 19:03:11.042285
4950	2	9	44	2	\N	2018-10-14	-50.00	412	2020-10-29 19:03:11.043682	2020-10-29 19:03:11.043682
4951	5	1	6	2	\N	2018-10-16	-1.80	11c	2020-10-29 19:03:11.044967	2020-10-29 19:03:11.044967
4952	5	1	5	2	\N	2018-10-18	-140.09	88c	2020-10-29 19:03:11.046151	2020-10-29 19:03:11.046151
4953	5	3	-1	2	\N	2018-10-19	-19.99	925	2020-10-29 19:03:11.04745	2020-10-29 19:03:11.04745
4954	1	3	-1	2	\N	2018-10-18	-430.00	10c	2020-10-29 19:03:11.048795	2020-10-29 19:03:11.048795
4955	1	1	7	2	\N	2018-10-19	-2.80	78a	2020-10-29 19:03:11.050316	2020-10-29 19:03:11.050316
4956	1	5	20	2	\N	2018-10-19	-51.49	18d	2020-10-29 19:03:11.05198	2020-10-29 19:03:11.05198
4957	1	1	7	2	\N	2018-10-17	-13.75	346	2020-10-29 19:03:11.053491	2020-10-29 19:03:11.053491
4958	1	1	7	2	\N	2018-10-18	-11.17	346	2020-10-29 19:03:11.05475	2020-10-29 19:03:11.05475
4959	1	1	6	2	\N	2018-10-17	-19.00	ca7	2020-10-29 19:03:11.055951	2020-10-29 19:03:11.055951
4960	1	5	20	2	\N	2018-10-17	-2.50	18d	2020-10-29 19:03:11.057077	2020-10-29 19:03:11.057077
4961	1	5	20	2	\N	2018-10-17	-17.73	18d	2020-10-29 19:03:11.058165	2020-10-29 19:03:11.058165
4962	1	5	20	2	\N	2018-10-16	-18.99	18d	2020-10-29 19:03:11.059219	2020-10-29 19:03:11.059219
4963	1	1	8	2	\N	2018-10-16	-14.50	5a5	2020-10-29 19:03:11.060678	2020-10-29 19:03:11.060678
4964	1	8	38	2	\N	2018-10-15	-37.00	912	2020-10-29 19:03:11.061892	2020-10-29 19:03:11.061892
4965	1	8	38	2	\N	2018-10-15	-33.42	074	2020-10-29 19:03:11.063293	2020-10-29 19:03:11.063293
4966	5	6	24	2	\N	2018-10-20	-13.98	dec	2020-10-29 19:03:11.064514	2020-10-29 19:03:11.064514
4967	5	1	5	2	\N	2018-10-20	-9.90	07d	2020-10-29 19:03:11.065823	2020-10-29 19:03:11.065823
4968	5	1	5	2	\N	2018-10-18	-11.34	63a	2020-10-29 19:03:11.067763	2020-10-29 19:03:11.067763
4969	5	4	12	2	\N	2018-10-24	-126.28	333	2020-10-29 19:03:11.069114	2020-10-29 19:03:11.069114
4970	4	10	51	3	\N	2018-10-23	-2000.00	d41	2020-10-29 19:03:11.070338	2020-10-29 19:03:11.070338
4971	2	10	51	4	\N	2018-10-23	2000.00	d41	2020-10-29 19:03:11.071501	2020-10-29 19:03:11.071501
4972	2	6	24	2	\N	2018-10-20	-59.60	450	2020-10-29 19:03:11.072625	2020-10-29 19:03:11.072625
4973	2	5	23	2	\N	2018-10-19	-111.22	3d0	2020-10-29 19:03:11.073821	2020-10-29 19:03:11.073821
4974	5	5	23	2	\N	2018-10-24	-59.25	2ea	2020-10-29 19:03:11.075126	2020-10-29 19:03:11.075126
4975	2	5	23	1	\N	2018-10-24	59.25	2ea	2020-10-29 19:03:11.076604	2020-10-29 19:03:11.076604
4976	2	9	45	2	\N	2018-10-13	-23.99	bd5	2020-10-29 19:03:11.077894	2020-10-29 19:03:11.077894
4977	2	1	5	2	\N	2018-10-18	-9.29	a07	2020-10-29 19:03:11.079762	2020-10-29 19:03:11.079762
4978	2	9	45	2	\N	2018-10-25	-10.00	3e0	2020-10-29 19:03:11.081234	2020-10-29 19:03:11.081234
4979	2	9	45	2	\N	2018-10-25	-10.00	128	2020-10-29 19:03:11.083317	2020-10-29 19:03:11.083317
4980	5	4	13	2	\N	2018-10-26	-49.90	5cf	2020-10-29 19:03:11.08544	2020-10-29 19:03:11.08544
4981	2	9	-1	2	\N	2018-10-26	-6.40	244	2020-10-29 19:03:11.08711	2020-10-29 19:03:11.08711
4982	1	3	-1	2	\N	2018-10-27	-24.00	1f2	2020-10-29 19:03:11.089086	2020-10-29 19:03:11.089086
4983	1	3	-1	2	\N	2018-10-25	-18.00	b4a	2020-10-29 19:03:11.090704	2020-10-29 19:03:11.090704
4984	1	1	7	2	\N	2018-10-26	-13.83	820	2020-10-29 19:03:11.092551	2020-10-29 19:03:11.092551
4985	1	5	20	2	\N	2018-10-26	-12.00	18d	2020-10-29 19:03:11.094255	2020-10-29 19:03:11.094255
4986	5	8	38	2	\N	2018-10-27	-34.24	074	2020-10-29 19:03:11.095459	2020-10-29 19:03:11.095459
4987	1	5	20	2	\N	2018-10-27	-59.15	18d	2020-10-29 19:03:11.097171	2020-10-29 19:03:11.097171
4988	1	10	51	3	\N	2018-10-27	-900.00	789	2020-10-29 19:03:11.0986	2020-10-29 19:03:11.0986
4989	1	10	51	3	\N	2018-10-27	-500.00	1d5	2020-10-29 19:03:11.100395	2020-10-29 19:03:11.100395
4990	1	9	45	2	\N	2018-10-25	-10.00	671	2020-10-29 19:03:11.101708	2020-10-29 19:03:11.101708
4991	1	2	1	1	\N	2018-10-25	10045.59	6fa	2020-10-29 19:03:11.102941	2020-10-29 19:03:11.102941
4992	1	9	-1	2	\N	2018-10-26	-10.00	ae9	2020-10-29 19:03:11.104528	2020-10-29 19:03:11.104528
4993	1	1	7	2	\N	2018-10-25	-19.80	1e8	2020-10-29 19:03:11.105902	2020-10-29 19:03:11.105902
4994	1	5	20	2	\N	2018-10-28	-73.99	18d	2020-10-29 19:03:11.107529	2020-10-29 19:03:11.107529
4995	5	1	5	2	\N	2018-10-28	-205.84	20c	2020-10-29 19:03:11.108943	2020-10-29 19:03:11.108943
4996	5	1	5	2	\N	2018-10-28	-17.34	96a	2020-10-29 19:03:11.110125	2020-10-29 19:03:11.110125
4997	5	1	5	2	\N	2018-10-27	-24.29	ff5	2020-10-29 19:03:11.111269	2020-10-29 19:03:11.111269
4998	5	1	5	2	\N	2018-10-27	-3.78	ff5	2020-10-29 19:03:11.112377	2020-10-29 19:03:11.112377
4999	5	1	5	2	\N	2018-10-27	-14.20	6cc	2020-10-29 19:03:11.113402	2020-10-29 19:03:11.113402
5000	5	1	5	2	\N	2018-10-27	-8.70	473	2020-10-29 19:03:11.114538	2020-10-29 19:03:11.114538
5001	5	3	-1	2	\N	2018-10-26	-22.18	efe	2020-10-29 19:03:11.115872	2020-10-29 19:03:11.115872
5002	5	1	5	2	\N	2018-10-26	-62.32	b5c	2020-10-29 19:03:11.117805	2020-10-29 19:03:11.117805
5003	2	10	51	3	\N	2018-10-26	-1000.00	5c4	2020-10-29 19:03:11.11913	2020-10-29 19:03:11.11913
5004	5	10	51	4	\N	2018-10-26	1000.00	5c4	2020-10-29 19:03:11.12081	2020-10-29 19:03:11.12081
5005	5	1	5	2	\N	2018-10-24	-12.06	7d2	2020-10-29 19:03:11.122128	2020-10-29 19:03:11.122128
5006	5	5	20	2	\N	2018-10-24	-1.90	ceb	2020-10-29 19:03:11.12335	2020-10-29 19:03:11.12335
5007	5	5	20	2	\N	2018-10-24	-109.40	ceb	2020-10-29 19:03:11.12515	2020-10-29 19:03:11.12515
5008	5	1	5	2	\N	2018-10-24	-11.90	473	2020-10-29 19:03:11.126602	2020-10-29 19:03:11.126602
5009	5	1	5	2	\N	2018-10-24	-2.49	7d2	2020-10-29 19:03:11.127871	2020-10-29 19:03:11.127871
5010	5	1	5	2	\N	2018-10-23	-27.51	b8a	2020-10-29 19:03:11.129095	2020-10-29 19:03:11.129095
5011	5	7	33	2	\N	2018-10-23	-72.79	b7b	2020-10-29 19:03:11.130317	2020-10-29 19:03:11.130317
5012	5	5	20	2	\N	2018-10-23	-46.98	ceb	2020-10-29 19:03:11.13174	2020-10-29 19:03:11.13174
5013	5	1	5	2	\N	2018-10-23	-3.40	7d2	2020-10-29 19:03:11.133068	2020-10-29 19:03:11.133068
5014	1	1	5	2	\N	2018-10-22	-8.45	7d2	2020-10-29 19:03:11.134616	2020-10-29 19:03:11.134616
5015	1	9	48	2	\N	2018-10-28	-100.00	bbb	2020-10-29 19:03:11.136204	2020-10-29 19:03:11.136204
5016	1	10	51	3	\N	2018-10-28	-300.00	789	2020-10-29 19:03:11.137643	2020-10-29 19:03:11.137643
5017	1	9	-1	3	\N	2018-10-28	-1000.00	5a8	2020-10-29 19:03:11.138795	2020-10-29 19:03:11.138795
5018	1	10	51	3	\N	2018-11-01	-7000.00	039	2020-10-29 19:03:11.140088	2020-10-29 19:03:11.140088
5019	2	9	45	2	\N	2018-10-28	-19.99	eb4	2020-10-29 19:03:11.141742	2020-10-29 19:03:11.141742
5020	2	2	1	1	\N	2018-10-29	5762.43	61e	2020-10-29 19:03:11.143167	2020-10-29 19:03:11.143167
5021	2	10	51	3	\N	2018-10-30	-500.00	375	2020-10-29 19:03:11.144462	2020-10-29 19:03:11.144462
5022	4	10	51	4	\N	2018-10-30	500.00	375	2020-10-29 19:03:11.145863	2020-10-29 19:03:11.145863
5023	2	10	51	3	\N	2018-10-30	-3000.00	877	2020-10-29 19:03:11.147164	2020-10-29 19:03:11.147164
5024	5	10	51	4	\N	2018-10-30	3000.00	877	2020-10-29 19:03:11.148363	2020-10-29 19:03:11.148363
5025	5	4	10	2	\N	2018-10-30	-404.88	f2f	2020-10-29 19:03:11.14959	2020-10-29 19:03:11.14959
5026	5	8	40	2	\N	2018-10-30	-227.75	a6f	2020-10-29 19:03:11.151162	2020-10-29 19:03:11.151162
5027	5	4	12	2	\N	2018-10-31	-125.80	070	2020-10-29 19:03:11.152349	2020-10-29 19:03:11.152349
5028	5	4	11	2	\N	2018-10-31	-125.06	fec	2020-10-29 19:03:11.153586	2020-10-29 19:03:11.153586
5029	5	7	30	3	\N	2018-10-31	-15.00	1c5	2020-10-29 19:03:11.154928	2020-10-29 19:03:11.154928
5030	1	2	2	4	\N	2018-10-31	15.00	1c5	2020-10-29 19:03:11.156199	2020-10-29 19:03:11.156199
5031	6	10	52	1	\N	2018-10-31	78.08	1a8	2020-10-29 19:03:11.157424	2020-10-29 19:03:11.157424
5032	5	9	-1	2	\N	2018-11-01	-312.16	3b7	2020-10-29 19:03:11.158699	2020-10-29 19:03:11.158699
5033	1	9	-1	2	\N	2018-11-01	-16.80	1c1	2020-10-29 19:03:11.160068	2020-10-29 19:03:11.160068
5034	5	8	40	2	\N	2018-11-02	0.00	f10	2020-10-29 19:03:11.161619	2020-10-29 19:03:11.161619
5035	1	8	37	2	\N	2018-11-02	0.00	73d	2020-10-29 19:03:11.163058	2020-10-29 19:03:11.163058
5036	5	3	-1	2	\N	2018-11-02	-8.98	3ea	2020-10-29 19:03:11.164413	2020-10-29 19:03:11.164413
5037	5	1	5	2	\N	2018-11-03	-269.47	20c	2020-10-29 19:03:11.165891	2020-10-29 19:03:11.165891
5038	5	1	5	2	\N	2018-11-03	-34.44	add	2020-10-29 19:03:11.167581	2020-10-29 19:03:11.167581
5039	2	6	24	2	\N	2018-11-03	-139.97	2b8	2020-10-29 19:03:11.168868	2020-10-29 19:03:11.168868
5040	2	9	45	2	\N	2018-11-03	-75.88	0a7	2020-10-29 19:03:11.170149	2020-10-29 19:03:11.170149
5041	2	9	45	2	\N	2018-11-03	-209.50	8b7	2020-10-29 19:03:11.171827	2020-10-29 19:03:11.171827
5042	2	1	5	2	\N	2018-11-03	-28.97	25d	2020-10-29 19:03:11.173281	2020-10-29 19:03:11.173281
5043	5	9	45	2	\N	2018-11-02	-29.70	a17	2020-10-29 19:03:11.174548	2020-10-29 19:03:11.174548
5044	5	1	5	2	\N	2018-11-02	-11.90	d41	2020-10-29 19:03:11.175798	2020-10-29 19:03:11.175798
5045	2	9	48	2	\N	2018-11-02	-100.00	c5a	2020-10-29 19:03:11.176956	2020-10-29 19:03:11.176956
5046	5	1	5	2	\N	2018-11-07	-7.41	7d2	2020-10-29 19:03:11.178152	2020-10-29 19:03:11.178152
5047	5	9	50	4	\N	2018-11-05	5400.00	121	2020-10-29 19:03:11.179684	2020-10-29 19:03:11.179684
5048	5	9	50	3	\N	2018-11-07	-2500.00	121	2020-10-29 19:03:11.180977	2020-10-29 19:03:11.180977
5049	1	6	26	2	\N	2018-11-08	-20.00	aca	2020-10-29 19:03:11.18231	2020-10-29 19:03:11.18231
5050	5	1	5	2	\N	2018-11-08	-16.75	7d2	2020-10-29 19:03:11.184059	2020-10-29 19:03:11.184059
5051	5	1	5	2	\N	2018-11-08	-10.40	473	2020-10-29 19:03:11.185975	2020-10-29 19:03:11.185975
5052	2	4	13	2	\N	2018-11-09	-29.99	54d	2020-10-29 19:03:11.187684	2020-10-29 19:03:11.187684
5053	2	4	15	2	\N	2018-11-09	-25.00	f80	2020-10-29 19:03:11.189667	2020-10-29 19:03:11.189667
5054	5	1	5	2	\N	2018-11-09	-188.35	20c	2020-10-29 19:03:11.190838	2020-10-29 19:03:11.190838
5055	5	3	-1	2	\N	2018-11-09	-19.99	efe	2020-10-29 19:03:11.192023	2020-10-29 19:03:11.192023
5056	5	9	50	4	\N	2018-11-10	2500.00	937	2020-10-29 19:03:11.193497	2020-10-29 19:03:11.193497
5057	5	1	5	2	\N	2018-11-10	-8.48	6cc	2020-10-29 19:03:11.194676	2020-10-29 19:03:11.194676
5058	5	1	5	2	\N	2018-11-10	-2.95	473	2020-10-29 19:03:11.196071	2020-10-29 19:03:11.196071
5059	5	9	33	2	\N	2018-11-13	-116.16	7d2	2020-10-29 19:03:11.197641	2020-10-29 19:03:11.197641
5060	2	1	8	2	\N	2018-11-07	-12.60	f01	2020-10-29 19:03:11.198886	2020-10-29 19:03:11.198886
5061	5	1	5	2	\N	2018-11-14	-10.17	035	2020-10-29 19:03:11.200664	2020-10-29 19:03:11.200664
5062	1	1	7	2	\N	2018-11-15	-23.50	e37	2020-10-29 19:03:11.202001	2020-10-29 19:03:11.202001
5063	5	1	5	2	\N	2018-11-13	-5.80	473	2020-10-29 19:03:11.203481	2020-10-29 19:03:11.203481
5064	5	5	20	2	\N	2018-11-13	-32.55	ceb	2020-10-29 19:03:11.20468	2020-10-29 19:03:11.20468
5065	5	1	5	2	\N	2018-11-16	-13.77	7b4	2020-10-29 19:03:11.205914	2020-10-29 19:03:11.205914
5066	5	1	5	2	\N	2018-11-16	-13.60	473	2020-10-29 19:03:11.207359	2020-10-29 19:03:11.207359
5067	1	1	7	2	\N	2018-11-16	-16.50	e37	2020-10-29 19:03:11.208586	2020-10-29 19:03:11.208586
5068	5	3	-1	2	\N	2018-11-16	-46.44	406	2020-10-29 19:03:11.210051	2020-10-29 19:03:11.210051
5069	5	1	5	2	\N	2018-11-16	-133.85	e5f	2020-10-29 19:03:11.211454	2020-10-29 19:03:11.211454
5070	5	1	8	2	\N	2018-11-16	-27.90	feb	2020-10-29 19:03:11.212662	2020-10-29 19:03:11.212662
5071	5	5	23	2	\N	2018-11-20	-87.40	2fd	2020-10-29 19:03:11.213863	2020-10-29 19:03:11.213863
5072	2	6	24	1	\N	2018-11-21	59.99	7d3	2020-10-29 19:03:11.21526	2020-10-29 19:03:11.21526
5073	2	9	45	2	\N	2018-11-22	-300.00	892	2020-10-29 19:03:11.216822	2020-10-29 19:03:11.216822
5074	5	1	5	2	\N	2018-11-20	-18.56	7d2	2020-10-29 19:03:11.218483	2020-10-29 19:03:11.218483
5075	5	1	5	2	\N	2018-11-20	-10.14	c5a	2020-10-29 19:03:11.219742	2020-10-29 19:03:11.219742
5076	5	2	2	1	\N	2018-11-10	1207.92	140	2020-10-29 19:03:11.221	2020-10-29 19:03:11.221
5077	5	1	5	2	\N	2018-11-12	-12.30	a4e	2020-10-29 19:03:11.222652	2020-10-29 19:03:11.222652
5078	2	7	32	2	\N	2018-11-23	-9.95	8a6	2020-10-29 19:03:11.223952	2020-10-29 19:03:11.223952
5079	5	9	45	2	\N	2018-11-23	-25.00	002	2020-10-29 19:03:11.225141	2020-10-29 19:03:11.225141
5080	5	4	13	2	\N	2018-11-23	-49.90	5cf	2020-10-29 19:03:11.226206	2020-10-29 19:03:11.226206
5081	5	1	5	2	\N	2018-11-23	-197.71	20c	2020-10-29 19:03:11.227303	2020-10-29 19:03:11.227303
5082	5	1	5	2	\N	2018-11-24	-14.15	473	2020-10-29 19:03:11.228722	2020-10-29 19:03:11.228722
5083	5	1	5	2	\N	2018-11-25	-29.27	463	2020-10-29 19:03:11.230006	2020-10-29 19:03:11.230006
5084	6	10	51	3	\N	2018-11-27	-15000.00	966	2020-10-29 19:03:11.231374	2020-10-29 19:03:11.231374
5085	5	10	51	4	\N	2018-11-27	15000.00	966	2020-10-29 19:03:11.232846	2020-10-29 19:03:11.232846
5086	5	1	5	2	\N	2018-11-27	-10.14	d9a	2020-10-29 19:03:11.234677	2020-10-29 19:03:11.234677
5087	1	2	1	1	\N	2018-11-26	11118.76	f39	2020-10-29 19:03:11.236412	2020-10-29 19:03:11.236412
5088	2	2	1	1	\N	2018-11-27	8869.03	6da	2020-10-29 19:03:11.237643	2020-10-29 19:03:11.237643
5089	2	10	51	3	\N	2018-11-28	-500.00	375	2020-10-29 19:03:11.239078	2020-10-29 19:03:11.239078
5090	4	10	51	4	\N	2018-11-28	500.00	375	2020-10-29 19:03:11.240572	2020-10-29 19:03:11.240572
5091	2	10	51	3	\N	2018-11-28	-6500.00	fc3	2020-10-29 19:03:11.241735	2020-10-29 19:03:11.241735
5092	5	10	51	4	\N	2018-11-28	6500.00	fc3	2020-10-29 19:03:11.242919	2020-10-29 19:03:11.242919
5093	5	4	10	2	\N	2018-11-28	-404.88	a16	2020-10-29 19:03:11.244128	2020-10-29 19:03:11.244128
5094	5	4	12	2	\N	2018-11-28	-125.80	070	2020-10-29 19:03:11.245423	2020-10-29 19:03:11.245423
5095	5	4	11	2	\N	2018-11-28	-105.39	fec	2020-10-29 19:03:11.246631	2020-10-29 19:03:11.246631
5096	2	4	13	2	\N	2018-11-28	-35.98	ba4	2020-10-29 19:03:11.247803	2020-10-29 19:03:11.247803
5097	5	1	5	2	\N	2018-11-28	-7.93	7d2	2020-10-29 19:03:11.248922	2020-10-29 19:03:11.248922
5098	5	7	30	3	\N	2018-11-30	-15.00	1c5	2020-10-29 19:03:11.250684	2020-10-29 19:03:11.250684
5099	1	7	30	4	\N	2018-11-30	15.00	1c5	2020-10-29 19:03:11.252242	2020-10-29 19:03:11.252242
5100	5	9	45	2	\N	2018-12-01	-108.90	e4d	2020-10-29 19:03:11.253453	2020-10-29 19:03:11.253453
5101	5	5	20	2	\N	2018-12-01	-13.00	f40	2020-10-29 19:03:11.254622	2020-10-29 19:03:11.254622
5102	5	1	5	2	\N	2018-11-30	-286.47	20c	2020-10-29 19:03:11.255788	2020-10-29 19:03:11.255788
5103	5	1	5	2	\N	2018-12-01	-11.70	473	2020-10-29 19:03:11.257043	2020-10-29 19:03:11.257043
5104	6	10	52	1	\N	2018-11-30	25.25	c48	2020-10-29 19:03:11.258355	2020-10-29 19:03:11.258355
5105	1	10	51	3	\N	2018-12-01	-500.00	0f1	2020-10-29 19:03:11.259548	2020-10-29 19:03:11.259548
5106	1	10	51	3	\N	2018-12-01	-200.00	fff	2020-10-29 19:03:11.260755	2020-10-29 19:03:11.260755
5107	1	10	51	3	\N	2018-12-01	-7000.00	039	2020-10-29 19:03:11.261948	2020-10-29 19:03:11.261948
5108	1	10	51	3	\N	2018-12-01	-1000.00	3aa	2020-10-29 19:03:11.263177	2020-10-29 19:03:11.263177
5109	1	9	45	2	\N	2018-11-30	-129.99	f69	2020-10-29 19:03:11.264341	2020-10-29 19:03:11.264341
5110	5	2	2	1	\N	2018-11-30	129.99	227	2020-10-29 19:03:11.265522	2020-10-29 19:03:11.265522
5111	1	9	-1	3	\N	2018-12-01	-797.50	fbd	2020-10-29 19:03:11.267031	2020-10-29 19:03:11.267031
5112	1	10	51	3	\N	2018-12-01	-1471.10	3aa	2020-10-29 19:03:11.268661	2020-10-29 19:03:11.268661
5113	6	10	51	4	\N	2018-12-01	3000.00	ba1	2020-10-29 19:03:11.26996	2020-10-29 19:03:11.26996
5114	6	10	51	4	\N	2018-12-01	4000.00	ba1	2020-10-29 19:03:11.271235	2020-10-29 19:03:11.271235
5115	5	2	-1	1	\N	2018-12-01	59.99	b87	2020-10-29 19:03:11.272336	2020-10-29 19:03:11.272336
5116	5	9	46	2	\N	2018-12-01	-230.08	f85	2020-10-29 19:03:11.273479	2020-10-29 19:03:11.273479
5117	5	9	45	2	\N	2018-12-01	-98.26	ff9	2020-10-29 19:03:11.274905	2020-10-29 19:03:11.274905
5118	2	9	45	2	\N	2018-12-02	-141.40	959	2020-10-29 19:03:11.276229	2020-10-29 19:03:11.276229
5119	5	1	5	2	\N	2018-12-02	-20.54	0a5	2020-10-29 19:03:11.277645	2020-10-29 19:03:11.277645
5120	2	10	51	3	\N	2018-12-03	-1500.00	bae	2020-10-29 19:03:11.279059	2020-10-29 19:03:11.279059
5121	5	8	40	2	\N	2018-12-03	-238.15	e10	2020-10-29 19:03:11.280238	2020-10-29 19:03:11.280238
5122	2	5	22	2	\N	2018-12-03	-45.00	d41	2020-10-29 19:03:11.281424	2020-10-29 19:03:11.281424
5123	2	1	7	2	\N	2018-12-05	-14.74	d41	2020-10-29 19:03:11.282657	2020-10-29 19:03:11.282657
5124	2	9	45	2	\N	2018-12-05	-58.19	92a	2020-10-29 19:03:11.284844	2020-10-29 19:03:11.284844
5125	1	9	47	2	\N	2018-12-02	-11.00	292	2020-10-29 19:03:11.28618	2020-10-29 19:03:11.28618
5126	5	9	44	2	\N	2018-12-03	-40.00	462	2020-10-29 19:03:11.287479	2020-10-29 19:03:11.287479
5127	1	9	44	1	\N	2018-12-03	40.00	462	2020-10-29 19:03:11.288618	2020-10-29 19:03:11.288618
5128	1	9	-1	2	\N	2018-12-03	-20.00	945	2020-10-29 19:03:11.289763	2020-10-29 19:03:11.289763
5129	1	9	50	3	\N	2018-12-07	-40.00	227	2020-10-29 19:03:11.291143	2020-10-29 19:03:11.291143
5130	5	2	2	4	\N	2018-12-07	40.00	227	2020-10-29 19:03:11.292493	2020-10-29 19:03:11.292493
5131	5	2	-1	4	\N	2018-12-05	5400.00	ac6	2020-10-29 19:03:11.293716	2020-10-29 19:03:11.293716
5132	5	9	50	3	\N	2018-12-07	-2500.00	ac6	2020-10-29 19:03:11.29506	2020-10-29 19:03:11.29506
5133	5	1	5	2	\N	2018-12-05	-11.34	361	2020-10-29 19:03:11.296222	2020-10-29 19:03:11.296222
5134	5	1	5	2	\N	2018-12-05	-45.47	a4a	2020-10-29 19:03:11.297368	2020-10-29 19:03:11.297368
5135	5	9	45	2	\N	2018-12-03	-29.85	7ab	2020-10-29 19:03:11.298637	2020-10-29 19:03:11.298637
5136	5	9	50	3	\N	2018-12-07	-65.00	218	2020-10-29 19:03:11.299997	2020-10-29 19:03:11.299997
5137	1	2	2	4	\N	2018-12-07	65.00	218	2020-10-29 19:03:11.301482	2020-10-29 19:03:11.301482
5138	1	8	38	2	\N	2018-12-07	-37.00	a3a	2020-10-29 19:03:11.302629	2020-10-29 19:03:11.302629
5139	1	9	50	3	\N	2018-12-07	-27.00	ad3	2020-10-29 19:03:11.30381	2020-10-29 19:03:11.30381
5140	5	1	5	2	\N	2018-12-07	-146.11	ff5	2020-10-29 19:03:11.304931	2020-10-29 19:03:11.304931
5141	5	1	5	2	\N	2018-12-07	-8.40	232	2020-10-29 19:03:11.30608	2020-10-29 19:03:11.30608
5142	5	1	5	2	\N	2018-12-07	-27.28	add	2020-10-29 19:03:11.307559	2020-10-29 19:03:11.307559
5143	5	1	5	2	\N	2018-12-07	-9.90	473	2020-10-29 19:03:11.308806	2020-10-29 19:03:11.308806
5144	2	9	45	2	\N	2018-12-08	-43.00	560	2020-10-29 19:03:11.310207	2020-10-29 19:03:11.310207
5145	2	1	6	2	\N	2018-12-08	-43.00	53c	2020-10-29 19:03:11.311498	2020-10-29 19:03:11.311498
5146	5	9	45	2	\N	2018-12-08	-5.99	4d8	2020-10-29 19:03:11.313082	2020-10-29 19:03:11.313082
5147	2	9	45	2	\N	2018-12-08	-80.42	2ea	2020-10-29 19:03:11.314317	2020-10-29 19:03:11.314317
5148	2	1	5	2	\N	2018-12-08	-16.60	cf9	2020-10-29 19:03:11.315475	2020-10-29 19:03:11.315475
5149	2	4	15	2	\N	2018-12-08	-25.00	f80	2020-10-29 19:03:11.316971	2020-10-29 19:03:11.316971
5150	2	1	7	2	\N	2018-12-08	-14.74	a8c	2020-10-29 19:03:11.318245	2020-10-29 19:03:11.318245
5151	5	9	45	3	\N	2018-12-08	-100.00	945	2020-10-29 19:03:11.319604	2020-10-29 19:03:11.319604
5152	2	9	45	4	\N	2018-12-08	100.00	945	2020-10-29 19:03:11.320613	2020-10-29 19:03:11.320613
5153	2	1	6	2	\N	2018-12-09	-11.00	65e	2020-10-29 19:03:11.321643	2020-10-29 19:03:11.321643
5154	5	9	45	2	\N	2018-12-10	-87.06	8b7	2020-10-29 19:03:11.322793	2020-10-29 19:03:11.322793
5155	2	9	45	2	\N	2018-12-11	-70.00	8b7	2020-10-29 19:03:11.324022	2020-10-29 19:03:11.324022
5156	2	9	45	2	\N	2018-12-12	-10.00	9b1	2020-10-29 19:03:11.325222	2020-10-29 19:03:11.325222
5157	5	1	5	2	\N	2018-12-11	-7.19	ff5	2020-10-29 19:03:11.326365	2020-10-29 19:03:11.326365
5158	1	9	48	2	\N	2018-12-11	-20.00	4f2	2020-10-29 19:03:11.327571	2020-10-29 19:03:11.327571
5159	5	2	-1	1	\N	2018-12-10	2500.00	1cb	2020-10-29 19:03:11.328817	2020-10-29 19:03:11.328817
5160	2	9	48	2	\N	2018-12-13	-10.00	67d	2020-10-29 19:03:11.330224	2020-10-29 19:03:11.330224
5161	5	1	5	2	\N	2018-12-13	-7.20	473	2020-10-29 19:03:11.331805	2020-10-29 19:03:11.331805
5162	5	1	5	2	\N	2018-12-14	-105.27	e5f	2020-10-29 19:03:11.332923	2020-10-29 19:03:11.332923
5163	5	1	5	2	\N	2018-12-14	-8.94	d9a	2020-10-29 19:03:11.334461	2020-10-29 19:03:11.334461
5164	5	1	8	2	\N	2018-12-14	-5.25	6dc	2020-10-29 19:03:11.335735	2020-10-29 19:03:11.335735
5165	5	1	5	2	\N	2018-12-15	-9.00	473	2020-10-29 19:03:11.336932	2020-10-29 19:03:11.336932
5166	5	1	5	2	\N	2018-12-15	-193.65	7d2	2020-10-29 19:03:11.338277	2020-10-29 19:03:11.338277
5167	5	1	5	2	\N	2018-12-18	-1.20	9bb	2020-10-29 19:03:11.339642	2020-10-29 19:03:11.339642
5168	5	1	5	2	\N	2018-12-18	-7.96	098	2020-10-29 19:03:11.3409	2020-10-29 19:03:11.3409
5169	5	1	5	2	\N	2018-12-18	-15.50	c4c	2020-10-29 19:03:11.34217	2020-10-29 19:03:11.34217
5170	5	1	5	2	\N	2018-12-18	-10.60	ecd	2020-10-29 19:03:11.343386	2020-10-29 19:03:11.343386
5171	5	5	20	2	\N	2018-12-18	-123.08	9ef	2020-10-29 19:03:11.344496	2020-10-29 19:03:11.344496
5172	5	9	45	2	\N	2018-12-19	-35.00	b3a	2020-10-29 19:03:11.34564	2020-10-29 19:03:11.34564
5173	5	9	45	2	\N	2018-12-19	-22.90	c31	2020-10-29 19:03:11.346709	2020-10-29 19:03:11.346709
5174	5	9	45	2	\N	2018-12-19	-30.49	4c6	2020-10-29 19:03:11.348085	2020-10-29 19:03:11.348085
5175	1	2	-1	4	\N	2018-12-17	324.17	1d1	2020-10-29 19:03:11.34933	2020-10-29 19:03:11.34933
5176	1	9	47	2	\N	2018-12-17	-7.50	821	2020-10-29 19:03:11.351114	2020-10-29 19:03:11.351114
5177	1	9	50	3	\N	2018-12-17	-300.00	abf	2020-10-29 19:03:11.35237	2020-10-29 19:03:11.35237
5178	5	1	8	2	\N	2018-12-15	-0.99	ae5	2020-10-29 19:03:11.354037	2020-10-29 19:03:11.354037
5179	5	9	45	2	\N	2018-12-17	-27.00	441	2020-10-29 19:03:11.355265	2020-10-29 19:03:11.355265
5180	5	9	45	2	\N	2018-12-16	-24.98	f00	2020-10-29 19:03:11.356422	2020-10-29 19:03:11.356422
5181	5	1	8	2	\N	2018-12-13	-2.20	ae5	2020-10-29 19:03:11.357593	2020-10-29 19:03:11.357593
5182	5	5	22	2	\N	2018-12-14	-25.00	a8b	2020-10-29 19:03:11.358755	2020-10-29 19:03:11.358755
5183	5	1	5	2	\N	2018-12-20	-6.79	4b4	2020-10-29 19:03:11.360263	2020-10-29 19:03:11.360263
5184	5	9	45	3	\N	2018-12-21	-1000.00	f0b	2020-10-29 19:03:11.36146	2020-10-29 19:03:11.36146
5185	1	2	1	4	\N	2018-12-21	10745.14	8a8	2020-10-29 19:03:11.362844	2020-10-29 19:03:11.362844
5186	1	9	48	2	\N	2018-12-23	-100.00	bbb	2020-10-29 19:03:11.364156	2020-10-29 19:03:11.364156
5187	5	9	-1	2	\N	2018-12-22	-33.50	f04	2020-10-29 19:03:11.365452	2020-10-29 19:03:11.365452
5188	5	9	45	2	\N	2018-12-22	-154.92	3bd	2020-10-29 19:03:11.366866	2020-10-29 19:03:11.366866
5189	2	4	13	2	\N	2018-12-25	-35.98	fc6	2020-10-29 19:03:11.368577	2020-10-29 19:03:11.368577
5190	1	10	51	3	\N	2018-12-27	-100.00	e49	2020-10-29 19:03:11.369758	2020-10-29 19:03:11.369758
5191	1	10	51	3	\N	2018-12-27	-1000.00	c07	2020-10-29 19:03:11.370968	2020-10-29 19:03:11.370968
5192	1	10	51	3	\N	2018-12-27	-1500.00	b4f	2020-10-29 19:03:11.372127	2020-10-29 19:03:11.372127
5193	5	7	30	3	\N	2018-12-27	-15.00	1c5	2020-10-29 19:03:11.373563	2020-10-29 19:03:11.373563
5194	1	2	2	4	\N	2018-12-27	15.00	1c5	2020-10-29 19:03:11.374825	2020-10-29 19:03:11.374825
5195	5	10	51	3	\N	2018-12-27	-2760.00	7d9	2020-10-29 19:03:11.37602	2020-10-29 19:03:11.37602
5196	6	10	51	4	\N	2018-12-27	2760.00	7d9	2020-10-29 19:03:11.377151	2020-10-29 19:03:11.377151
5197	5	8	40	2	\N	2018-12-28	-210.39	a6f	2020-10-29 19:03:11.378207	2020-10-29 19:03:11.378207
5198	5	1	5	2	\N	2018-12-28	-47.13	a4a	2020-10-29 19:03:11.379281	2020-10-29 19:03:11.379281
5199	1	2	2	1	\N	2018-12-28	50.00	935	2020-10-29 19:03:11.380355	2020-10-29 19:03:11.380355
5200	1	2	2	1	\N	2018-12-28	24.75	935	2020-10-29 19:03:11.381336	2020-10-29 19:03:11.381336
5201	5	7	28	2	\N	2018-12-29	-59.80	9bf	2020-10-29 19:03:11.382327	2020-10-29 19:03:11.382327
5202	1	2	2	4	\N	2018-12-31	80.00	4c6	2020-10-29 19:03:11.383461	2020-10-29 19:03:11.383461
5203	5	2	2	4	\N	2018-12-31	400.00	668	2020-10-29 19:03:11.385012	2020-10-29 19:03:11.385012
5204	5	1	5	2	\N	2018-12-31	-104.22	7d2	2020-10-29 19:03:11.386191	2020-10-29 19:03:11.386191
5205	5	1	-1	2	\N	2018-12-31	-3.58	1c7	2020-10-29 19:03:11.387678	2020-10-29 19:03:11.387678
5206	5	5	20	2	\N	2018-12-31	-12.99	565	2020-10-29 19:03:11.388815	2020-10-29 19:03:11.388815
5207	5	1	5	2	\N	2018-12-31	-12.40	473	2020-10-29 19:03:11.389954	2020-10-29 19:03:11.389954
5208	2	2	1	1	\N	2018-12-31	6331.10	c76	2020-10-29 19:03:11.391163	2020-10-29 19:03:11.391163
5209	2	10	51	3	\N	2018-12-31	-4000.00	1eb	2020-10-29 19:03:11.392252	2020-10-29 19:03:11.392252
5210	5	10	51	4	\N	2018-12-31	4000.00	1eb	2020-10-29 19:03:11.393256	2020-10-29 19:03:11.393256
5211	5	4	10	2	\N	2018-12-31	-404.88	a16	2020-10-29 19:03:11.394277	2020-10-29 19:03:11.394277
5212	5	4	12	2	\N	2018-12-31	-125.80	070	2020-10-29 19:03:11.395335	2020-10-29 19:03:11.395335
5213	2	9	-1	4	\N	2018-12-31	20.08	1f7	2020-10-29 19:03:11.396382	2020-10-29 19:03:11.396382
5214	5	9	-1	2	\N	2018-12-31	-28.85	fbe	2020-10-29 19:03:11.397495	2020-10-29 19:03:11.397495
5215	6	10	52	1	\N	2018-12-31	19.11	1a8	2020-10-29 19:03:11.399199	2020-10-29 19:03:11.399199
5216	1	9	50	3	\N	2019-01-01	-7000.00	5be	2020-10-29 19:03:11.400896	2020-10-29 19:03:11.400896
5217	1	7	32	2	\N	2019-01-01	-55.00	e93	2020-10-29 19:03:11.402178	2020-10-29 19:03:11.402178
5218	1	7	32	2	\N	2019-01-01	-120.00	993	2020-10-29 19:03:11.403674	2020-10-29 19:03:11.403674
5219	1	9	50	3	\N	2019-01-01	-750.00	9da	2020-10-29 19:03:11.404806	2020-10-29 19:03:11.404806
5220	1	9	50	3	\N	2019-01-01	-162.55	15c	2020-10-29 19:03:11.405823	2020-10-29 19:03:11.405823
5221	1	8	38	2	\N	2019-01-01	-37.00	6e8	2020-10-29 19:03:11.40688	2020-10-29 19:03:11.40688
5222	1	9	46	2	\N	2019-01-01	-107.01	068	2020-10-29 19:03:11.407911	2020-10-29 19:03:11.407911
5223	5	5	20	2	\N	2019-01-03	-61.60	12a	2020-10-29 19:03:11.409022	2020-10-29 19:03:11.409022
5224	5	10	51	4	\N	2019-01-04	5400.00	d9d	2020-10-29 19:03:11.4102	2020-10-29 19:03:11.4102
5225	5	7	27	2	\N	2019-01-04	-150.00	86a	2020-10-29 19:03:11.41129	2020-10-29 19:03:11.41129
5226	2	7	27	1	\N	2019-01-04	150.00	86a	2020-10-29 19:03:11.412331	2020-10-29 19:03:11.412331
5227	1	2	2	1	\N	2019-01-05	24.75	361	2020-10-29 19:03:11.413841	2020-10-29 19:03:11.413841
5228	5	1	7	2	\N	2019-01-05	-17.36	62c	2020-10-29 19:03:11.415085	2020-10-29 19:03:11.415085
5229	5	1	5	2	\N	2019-01-07	-7.70	473	2020-10-29 19:03:11.416241	2020-10-29 19:03:11.416241
5230	5	1	5	2	\N	2019-01-07	-178.15	e5f	2020-10-29 19:03:11.417607	2020-10-29 19:03:11.417607
5231	5	9	45	2	\N	2019-01-07	-2.50	7d9	2020-10-29 19:03:11.41886	2020-10-29 19:03:11.41886
5232	5	9	50	3	\N	2019-01-07	-2500.00	441	2020-10-29 19:03:11.420312	2020-10-29 19:03:11.420312
5233	5	3	-1	2	\N	2019-01-07	-84.26	e2b	2020-10-29 19:03:11.421397	2020-10-29 19:03:11.421397
5234	5	9	50	3	\N	2019-01-07	-5000.00	039	2020-10-29 19:03:11.4225	2020-10-29 19:03:11.4225
5235	6	10	51	4	\N	2019-01-07	5000.00	039	2020-10-29 19:03:11.423579	2020-10-29 19:03:11.423579
5236	5	9	45	2	\N	2019-01-07	-13.25	527	2020-10-29 19:03:11.424651	2020-10-29 19:03:11.424651
5237	5	9	45	2	\N	2019-01-07	-59.50	6b2	2020-10-29 19:03:11.425741	2020-10-29 19:03:11.425741
5238	2	4	15	2	\N	2019-01-07	-25.00	a4d	2020-10-29 19:03:11.42683	2020-10-29 19:03:11.42683
5239	2	6	24	2	\N	2019-01-08	-33.60	6e4	2020-10-29 19:03:11.427858	2020-10-29 19:03:11.427858
5240	6	10	51	3	\N	2019-01-10	-20000.00	232	2020-10-29 19:03:11.428854	2020-10-29 19:03:11.428854
5241	5	10	51	4	\N	2019-01-10	20000.00	232	2020-10-29 19:03:11.429938	2020-10-29 19:03:11.429938
5242	2	6	24	2	\N	2019-01-10	-69.80	b35	2020-10-29 19:03:11.431021	2020-10-29 19:03:11.431021
5243	2	9	44	2	\N	2019-01-09	-100.00	a58	2020-10-29 19:03:11.43205	2020-10-29 19:03:11.43205
5244	2	9	45	2	\N	2019-01-10	-10.00	2c3	2020-10-29 19:03:11.433121	2020-10-29 19:03:11.433121
5245	1	2	-1	4	\N	2019-01-12	10.00	665	2020-10-29 19:03:11.434456	2020-10-29 19:03:11.434456
5246	1	7	33	2	\N	2019-01-12	-27.00	529	2020-10-29 19:03:11.435581	2020-10-29 19:03:11.435581
5247	5	9	45	2	\N	2019-01-12	-9.90	9a7	2020-10-29 19:03:11.436645	2020-10-29 19:03:11.436645
5248	5	1	5	2	\N	2019-01-12	-5.70	473	2020-10-29 19:03:11.437818	2020-10-29 19:03:11.437818
5249	5	1	5	2	\N	2019-01-11	-163.02	e5f	2020-10-29 19:03:11.438885	2020-10-29 19:03:11.438885
5250	5	1	5	2	\N	2019-01-10	-8.59	ff5	2020-10-29 19:03:11.439933	2020-10-29 19:03:11.439933
5251	5	1	5	2	\N	2019-01-10	-10.50	473	2020-10-29 19:03:11.440943	2020-10-29 19:03:11.440943
5252	5	5	18	2	\N	2019-01-10	-18.97	0f2	2020-10-29 19:03:11.442001	2020-10-29 19:03:11.442001
5253	2	6	24	2	\N	2019-01-12	-19.99	d9d	2020-10-29 19:03:11.443088	2020-10-29 19:03:11.443088
5254	2	9	45	2	\N	2019-01-12	-40.99	2c2	2020-10-29 19:03:11.444219	2020-10-29 19:03:11.444219
5255	2	4	13	2	\N	2019-01-14	-29.99	ee0	2020-10-29 19:03:11.445329	2020-10-29 19:03:11.445329
5256	5	1	8	2	\N	2019-01-14	-10.80	6dc	2020-10-29 19:03:11.446356	2020-10-29 19:03:11.446356
5257	5	10	51	4	\N	2019-01-11	2500.00	c06	2020-10-29 19:03:11.44736	2020-10-29 19:03:11.44736
5258	2	6	24	1	\N	2019-01-16	39.90	7cd	2020-10-29 19:03:11.448365	2020-10-29 19:03:11.448365
5259	2	1	6	2	\N	2019-01-16	-40.00	b45	2020-10-29 19:03:11.449409	2020-10-29 19:03:11.449409
5260	2	6	24	2	\N	2019-01-16	-79.98	942	2020-10-29 19:03:11.450629	2020-10-29 19:03:11.450629
5261	2	1	7	2	\N	2019-01-16	-14.24	4bf	2020-10-29 19:03:11.451834	2020-10-29 19:03:11.451834
5262	5	8	40	2	\N	2019-01-16	-230.47	588	2020-10-29 19:03:11.452962	2020-10-29 19:03:11.452962
5263	5	4	-1	2	\N	2019-01-17	-91.00	306	2020-10-29 19:03:11.45406	2020-10-29 19:03:11.45406
5264	5	9	48	2	\N	2019-01-13	-40.00	5f5	2020-10-29 19:03:11.455174	2020-10-29 19:03:11.455174
5265	5	1	5	2	\N	2019-01-18	-8.45	473	2020-10-29 19:03:11.456263	2020-10-29 19:03:11.456263
5266	2	1	5	2	\N	2019-01-17	-7.97	223	2020-10-29 19:03:11.45728	2020-10-29 19:03:11.45728
5267	5	1	5	2	\N	2019-01-18	-146.54	88c	2020-10-29 19:03:11.458286	2020-10-29 19:03:11.458286
5268	1	2	-1	4	\N	2019-01-21	450.00	424	2020-10-29 19:03:11.459781	2020-10-29 19:03:11.459781
5269	1	9	45	2	\N	2019-01-21	-256.00	f64	2020-10-29 19:03:11.460924	2020-10-29 19:03:11.460924
5270	5	3	-1	2	\N	2019-01-19	-46.33	3ea	2020-10-29 19:03:11.462023	2020-10-29 19:03:11.462023
5271	2	9	44	2	\N	2019-01-24	-14.68	808	2020-10-29 19:03:11.463259	2020-10-29 19:03:11.463259
5272	1	2	2	1	\N	2019-01-24	50.00	a14	2020-10-29 19:03:11.464356	2020-10-29 19:03:11.464356
5273	1	8	38	2	\N	2019-01-26	-25.00	076	2020-10-29 19:03:11.465433	2020-10-29 19:03:11.465433
5274	5	10	51	4	\N	2019-01-26	5429.44	646	2020-10-29 19:03:11.466556	2020-10-29 19:03:11.466556
5275	1	10	51	4	\N	2019-01-26	4500.00	600	2020-10-29 19:03:11.467885	2020-10-29 19:03:11.467885
5276	5	9	50	3	\N	2019-01-26	-3929.44	039	2020-10-29 19:03:11.469045	2020-10-29 19:03:11.469045
5277	6	10	51	4	\N	2019-01-26	3929.44	039	2020-10-29 19:03:11.470109	2020-10-29 19:03:11.470109
5278	1	9	50	3	\N	2019-01-26	-1000.00	627	2020-10-29 19:03:11.471215	2020-10-29 19:03:11.471215
5279	1	9	50	3	\N	2019-01-26	-450.00	1fe	2020-10-29 19:03:11.47237	2020-10-29 19:03:11.47237
5280	1	9	50	3	\N	2019-01-26	-1500.00	859	2020-10-29 19:03:11.473457	2020-10-29 19:03:11.473457
5281	1	9	50	3	\N	2019-01-26	-1000.00	3aa	2020-10-29 19:03:11.474516	2020-10-29 19:03:11.474516
5282	1	9	50	3	\N	2019-01-26	-706.75	f02	2020-10-29 19:03:11.475591	2020-10-29 19:03:11.475591
5283	5	1	5	2	\N	2019-01-26	-15.35	473	2020-10-29 19:03:11.476543	2020-10-29 19:03:11.476543
5284	5	1	5	2	\N	2019-01-24	-106.32	7d2	2020-10-29 19:03:11.477511	2020-10-29 19:03:11.477511
5285	5	3	-1	2	\N	2019-01-25	-31.39	efe	2020-10-29 19:03:11.478432	2020-10-29 19:03:11.478432
5286	5	1	4	2	\N	2019-01-24	-17.67	ba3	2020-10-29 19:03:11.479394	2020-10-29 19:03:11.479394
5287	5	2	2	1	\N	2019-01-26	26.08	cdb	2020-10-29 19:03:11.480345	2020-10-29 19:03:11.480345
5288	5	9	50	3	\N	2019-01-26	-200.00	002	2020-10-29 19:03:11.481272	2020-10-29 19:03:11.481272
5289	5	1	5	2	\N	2019-01-27	-188.15	20c	2020-10-29 19:03:11.482235	2020-10-29 19:03:11.482235
5290	2	6	24	2	\N	2019-01-27	-34.98	a50	2020-10-29 19:03:11.483223	2020-10-29 19:03:11.483223
5291	2	9	45	2	\N	2019-01-27	-139.88	dfc	2020-10-29 19:03:11.48425	2020-10-29 19:03:11.48425
5292	2	3	-1	2	\N	2019-01-26	-12.00	6a0	2020-10-29 19:03:11.485225	2020-10-29 19:03:11.485225
5293	2	7	28	2	\N	2019-01-26	-22.00	4af	2020-10-29 19:03:11.486232	2020-10-29 19:03:11.486232
5294	1	8	38	2	\N	2019-01-30	-3.00	540	2020-10-29 19:03:11.487175	2020-10-29 19:03:11.487175
5295	1	2	2	1	\N	2019-01-29	98.00	3cb	2020-10-29 19:03:11.488114	2020-10-29 19:03:11.488114
5296	1	2	2	1	\N	2019-01-29	96.00	57f	2020-10-29 19:03:11.489158	2020-10-29 19:03:11.489158
5297	1	2	2	1	\N	2019-01-29	48.00	3f5	2020-10-29 19:03:11.490144	2020-10-29 19:03:11.490144
5298	5	5	20	2	\N	2019-01-30	-39.47	f40	2020-10-29 19:03:11.491103	2020-10-29 19:03:11.491103
5299	5	1	5	2	\N	2019-01-30	-8.42	473	2020-10-29 19:03:11.492037	2020-10-29 19:03:11.492037
5300	5	1	5	2	\N	2019-01-30	-7.02	1b7	2020-10-29 19:03:11.493049	2020-10-29 19:03:11.493049
5301	2	2	1	1	\N	2019-01-29	6898.64	06b	2020-10-29 19:03:11.494044	2020-10-29 19:03:11.494044
5302	5	1	4	2	\N	2019-01-30	-15.05	ce3	2020-10-29 19:03:11.495038	2020-10-29 19:03:11.495038
5303	2	10	51	3	\N	2019-01-31	-5000.00	59f	2020-10-29 19:03:11.496045	2020-10-29 19:03:11.496045
5304	5	10	51	4	\N	2019-01-31	5000.00	59f	2020-10-29 19:03:11.497245	2020-10-29 19:03:11.497245
5305	5	4	10	2	\N	2019-01-31	-340.89	115	2020-10-29 19:03:11.498317	2020-10-29 19:03:11.498317
5306	5	4	12	2	\N	2019-01-31	-125.80	070	2020-10-29 19:03:11.499353	2020-10-29 19:03:11.499353
5307	5	4	11	2	\N	2019-01-31	-105.70	fec	2020-10-29 19:03:11.500865	2020-10-29 19:03:11.500865
5308	5	4	13	2	\N	2019-01-31	-54.89	97a	2020-10-29 19:03:11.502128	2020-10-29 19:03:11.502128
5309	5	8	40	2	\N	2019-02-01	-176.08	a6f	2020-10-29 19:03:11.503254	2020-10-29 19:03:11.503254
5310	5	1	5	2	\N	2019-02-01	-2.99	b77	2020-10-29 19:03:11.504348	2020-10-29 19:03:11.504348
5311	1	9	50	3	\N	2019-02-01	-100.00	f36	2020-10-29 19:03:11.505443	2020-10-29 19:03:11.505443
5312	5	2	2	4	\N	2019-02-03	152.50	4e5	2020-10-29 19:03:11.506668	2020-10-29 19:03:11.506668
5313	1	9	50	3	\N	2019-02-03	-152.50	4e5	2020-10-29 19:03:11.507836	2020-10-29 19:03:11.507836
5314	5	9	50	3	\N	2019-02-01	-152.50	695	2020-10-29 19:03:11.508966	2020-10-29 19:03:11.508966
5315	5	7	27	2	\N	2019-02-03	-145.09	e64	2020-10-29 19:03:11.510087	2020-10-29 19:03:11.510087
5316	5	1	8	2	\N	2019-01-31	-1.50	6c8	2020-10-29 19:03:11.511225	2020-10-29 19:03:11.511225
5317	5	4	13	2	\N	2019-01-31	-49.90	97a	2020-10-29 19:03:11.512323	2020-10-29 19:03:11.512323
5318	6	10	52	1	\N	2019-01-31	12.07	c48	2020-10-29 19:03:11.513414	2020-10-29 19:03:11.513414
5319	5	7	30	3	\N	2019-02-03	-15.00	1c5	2020-10-29 19:03:11.514465	2020-10-29 19:03:11.514465
5320	1	2	2	4	\N	2019-02-03	15.00	1c5	2020-10-29 19:03:11.515497	2020-10-29 19:03:11.515497
5321	1	8	38	2	\N	2019-02-03	-37.00	a3a	2020-10-29 19:03:11.516623	2020-10-29 19:03:11.516623
5322	1	2	2	1	\N	2019-02-01	0.00	809	2020-10-29 19:03:11.517959	2020-10-29 19:03:11.517959
5323	5	9	50	3	\N	2019-02-03	-250.00	16f	2020-10-29 19:03:11.519317	2020-10-29 19:03:11.519317
5324	1	2	-1	4	\N	2019-02-03	250.00	16f	2020-10-29 19:03:11.520384	2020-10-29 19:03:11.520384
5325	1	9	50	3	\N	2019-02-03	-280.00	5a8	2020-10-29 19:03:11.521513	2020-10-29 19:03:11.521513
5326	5	1	5	2	\N	2019-02-06	-16.23	d3a	2020-10-29 19:03:11.522667	2020-10-29 19:03:11.522667
5327	5	1	4	2	\N	2019-02-05	-6.78	c39	2020-10-29 19:03:11.523795	2020-10-29 19:03:11.523795
5328	5	5	20	2	\N	2019-02-06	-23.99	ff0	2020-10-29 19:03:11.524892	2020-10-29 19:03:11.524892
5329	5	1	5	2	\N	2019-02-06	-9.84	f13	2020-10-29 19:03:11.526088	2020-10-29 19:03:11.526088
5330	5	1	5	2	\N	2019-02-08	-180.77	88c	2020-10-29 19:03:11.527246	2020-10-29 19:03:11.527246
5331	2	4	15	2	\N	2019-02-08	-25.00	f80	2020-10-29 19:03:11.528318	2020-10-29 19:03:11.528318
5332	5	1	8	2	\N	2019-02-08	-18.40	720	2020-10-29 19:03:11.529403	2020-10-29 19:03:11.529403
5333	5	1	5	2	\N	2019-02-08	-21.35	ecd	2020-10-29 19:03:11.530507	2020-10-29 19:03:11.530507
5334	5	1	5	2	\N	2019-02-08	-13.50	005	2020-10-29 19:03:11.531662	2020-10-29 19:03:11.531662
5335	5	1	5	2	\N	2019-02-08	-12.68	193	2020-10-29 19:03:11.532855	2020-10-29 19:03:11.532855
5336	6	10	51	3	\N	2019-02-11	-3961.00	8cb	2020-10-29 19:03:11.534651	2020-10-29 19:03:11.534651
5337	5	10	51	4	\N	2019-02-11	3961.00	8cb	2020-10-29 19:03:11.535973	2020-10-29 19:03:11.535973
5338	5	2	-1	4	\N	2019-02-11	600.00	615	2020-10-29 19:03:11.537223	2020-10-29 19:03:11.537223
5339	1	2	2	1	\N	2019-02-11	100.00	210	2020-10-29 19:03:11.538298	2020-10-29 19:03:11.538298
5340	1	9	50	3	\N	2019-02-11	-94.50	abf	2020-10-29 19:03:11.539363	2020-10-29 19:03:11.539363
5341	5	9	44	3	\N	2019-02-11	-3000.00	462	2020-10-29 19:03:11.540539	2020-10-29 19:03:11.540539
5342	5	1	5	2	\N	2019-02-09	-49.88	7d2	2020-10-29 19:03:11.541728	2020-10-29 19:03:11.541728
5343	5	7	27	2	\N	2019-02-09	-140.00	2df	2020-10-29 19:03:11.542837	2020-10-29 19:03:11.542837
5344	5	1	6	2	\N	2019-02-09	-162.00	50a	2020-10-29 19:03:11.544036	2020-10-29 19:03:11.544036
5345	5	8	40	2	\N	2019-02-08	-17.50	a6e	2020-10-29 19:03:11.545181	2020-10-29 19:03:11.545181
5346	5	1	5	2	\N	2019-02-08	-42.55	6ee	2020-10-29 19:03:11.546326	2020-10-29 19:03:11.546326
5347	5	8	40	2	\N	2019-02-08	-259.00	b57	2020-10-29 19:03:11.547911	2020-10-29 19:03:11.547911
5348	5	5	18	2	\N	2019-02-12	-66.43	508	2020-10-29 19:03:11.549448	2020-10-29 19:03:11.549448
5349	2	5	18	2	\N	2019-02-12	-31.97	479	2020-10-29 19:03:11.551137	2020-10-29 19:03:11.551137
5350	2	4	13	2	\N	2019-02-12	-31.99	940	2020-10-29 19:03:11.552671	2020-10-29 19:03:11.552671
5351	1	2	2	1	\N	2019-02-14	39.17	894	2020-10-29 19:03:11.553933	2020-10-29 19:03:11.553933
5352	1	2	-1	4	\N	2019-02-13	1120.00	b80	2020-10-29 19:03:11.555351	2020-10-29 19:03:11.555351
5353	1	8	40	2	\N	2019-02-13	-1120.00	b80	2020-10-29 19:03:11.55656	2020-10-29 19:03:11.55656
5354	1	9	45	2	\N	2019-02-16	-28.79	9a0	2020-10-29 19:03:11.558139	2020-10-29 19:03:11.558139
5355	5	1	5	2	\N	2019-02-16	-140.14	6ee	2020-10-29 19:03:11.559432	2020-10-29 19:03:11.559432
5356	5	1	5	2	\N	2019-02-16	-11.25	473	2020-10-29 19:03:11.560832	2020-10-29 19:03:11.560832
5357	5	1	5	2	\N	2019-02-16	-37.49	6cc	2020-10-29 19:03:11.562376	2020-10-29 19:03:11.562376
5358	5	8	40	2	\N	2019-02-14	-50.00	138	2020-10-29 19:03:11.563908	2020-10-29 19:03:11.563908
5359	1	9	48	2	\N	2019-02-14	-20.00	909	2020-10-29 19:03:11.56556	2020-10-29 19:03:11.56556
5360	5	8	40	2	\N	2019-02-03	-52.00	a5d	2020-10-29 19:03:11.567548	2020-10-29 19:03:11.567548
5361	4	10	51	3	\N	2019-02-15	-2008.58	ce9	2020-10-29 19:03:11.568866	2020-10-29 19:03:11.568866
5362	2	10	51	4	\N	2019-02-15	2008.58	ce9	2020-10-29 19:03:11.570079	2020-10-29 19:03:11.570079
5363	2	4	16	2	\N	2019-02-16	-1664.00	3a1	2020-10-29 19:03:11.571712	2020-10-29 19:03:11.571712
5364	2	5	20	2	\N	2019-02-16	-55.97	34c	2020-10-29 19:03:11.573282	2020-10-29 19:03:11.573282
5365	2	6	24	2	\N	2019-02-16	-22.60	6e4	2020-10-29 19:03:11.574603	2020-10-29 19:03:11.574603
5366	5	8	40	2	\N	2019-02-16	-179.99	fa7	2020-10-29 19:03:11.576164	2020-10-29 19:03:11.576164
5367	5	1	5	2	\N	2019-02-20	-28.07	e2e	2020-10-29 19:03:11.577569	2020-10-29 19:03:11.577569
5368	5	4	-1	2	\N	2019-02-21	-14.00	365	2020-10-29 19:03:11.579041	2020-10-29 19:03:11.579041
5369	5	4	13	2	\N	2019-02-22	-49.90	97a	2020-10-29 19:03:11.580257	2020-10-29 19:03:11.580257
5370	2	9	44	2	\N	2019-02-22	-50.00	138	2020-10-29 19:03:11.58156	2020-10-29 19:03:11.58156
5371	5	1	5	2	\N	2019-02-22	-13.05	b7e	2020-10-29 19:03:11.582759	2020-10-29 19:03:11.582759
5372	5	4	-1	2	\N	2019-02-21	-19.00	365	2020-10-29 19:03:11.584271	2020-10-29 19:03:11.584271
5373	1	8	38	2	\N	2019-02-23	-0.30	a07	2020-10-29 19:03:11.585814	2020-10-29 19:03:11.585814
5374	5	8	38	2	\N	2019-02-23	-1.00	a07	2020-10-29 19:03:11.587068	2020-10-29 19:03:11.587068
5375	5	1	6	2	\N	2019-02-23	-29.40	dab	2020-10-29 19:03:11.588385	2020-10-29 19:03:11.588385
5376	5	8	40	2	\N	2019-02-23	-226.50	0ba	2020-10-29 19:03:11.589824	2020-10-29 19:03:11.589824
5377	5	1	5	2	\N	2019-02-22	-179.68	b5c	2020-10-29 19:03:11.591777	2020-10-29 19:03:11.591777
5378	5	1	5	2	\N	2019-02-25	-8.30	473	2020-10-29 19:03:11.593658	2020-10-29 19:03:11.593658
5379	5	1	5	2	\N	2019-02-24	-21.45	63a	2020-10-29 19:03:11.595362	2020-10-29 19:03:11.595362
5380	5	9	47	2	\N	2019-02-25	-7.50	d07	2020-10-29 19:03:11.597177	2020-10-29 19:03:11.597177
5381	5	2	-1	1	\N	2019-02-25	0.32	e59	2020-10-29 19:03:11.598443	2020-10-29 19:03:11.598443
5382	1	9	47	2	\N	2019-02-25	-7.50	d07	2020-10-29 19:03:11.599621	2020-10-29 19:03:11.599621
5383	1	2	-1	4	\N	2019-02-25	3546.27	41b	2020-10-29 19:03:11.601579	2020-10-29 19:03:11.601579
5384	1	9	50	3	\N	2019-02-25	-3538.50	41b	2020-10-29 19:03:11.603774	2020-10-29 19:03:11.603774
5385	5	2	-1	4	\N	2019-02-25	3538.50	41b	2020-10-29 19:03:11.605766	2020-10-29 19:03:11.605766
5386	5	2	-1	4	\N	2019-02-25	2441.50	41b	2020-10-29 19:03:11.60724	2020-10-29 19:03:11.60724
5387	5	1	5	2	\N	2019-02-26	-21.44	aea	2020-10-29 19:03:11.608636	2020-10-29 19:03:11.608636
5388	2	1	7	2	\N	2019-02-27	-13.90	54f	2020-10-29 19:03:11.610117	2020-10-29 19:03:11.610117
5389	2	2	1	1	\N	2019-02-27	11967.51	0cc	2020-10-29 19:03:11.611599	2020-10-29 19:03:11.611599
5390	2	10	51	3	\N	2019-02-27	-10000.00	3ad	2020-10-29 19:03:11.612896	2020-10-29 19:03:11.612896
5391	5	10	51	4	\N	2019-02-27	10000.00	3ad	2020-10-29 19:03:11.614296	2020-10-29 19:03:11.614296
5392	6	10	52	1	\N	2019-02-28	5.97	1a8	2020-10-29 19:03:11.615399	2020-10-29 19:03:11.615399
5393	5	1	5	2	\N	2019-02-27	-17.95	332	2020-10-29 19:03:11.616511	2020-10-29 19:03:11.616511
5394	5	1	5	2	\N	2019-02-27	-111.37	a4a	2020-10-29 19:03:11.618538	2020-10-29 19:03:11.618538
5395	5	1	8	2	\N	2019-02-27	-15.80	f83	2020-10-29 19:03:11.620274	2020-10-29 19:03:11.620274
5396	5	1	5	2	\N	2019-03-01	-9.50	473	2020-10-29 19:03:11.621709	2020-10-29 19:03:11.621709
5397	5	9	47	2	\N	2019-03-01	-10.00	07c	2020-10-29 19:03:11.623074	2020-10-29 19:03:11.623074
5398	5	1	5	2	\N	2019-03-01	-3.48	ce6	2020-10-29 19:03:11.624434	2020-10-29 19:03:11.624434
5399	1	2	-1	1	\N	2019-03-01	0.00	809	2020-10-29 19:03:11.625766	2020-10-29 19:03:11.625766
5400	5	2	-1	4	\N	2019-03-01	4000.00	6d7	2020-10-29 19:03:11.62708	2020-10-29 19:03:11.62708
5401	1	2	-1	4	\N	2019-03-01	5929.02	bb7	2020-10-29 19:03:11.628208	2020-10-29 19:03:11.628208
5402	5	9	50	3	\N	2019-03-01	-1000.00	1d5	2020-10-29 19:03:11.629354	2020-10-29 19:03:11.629354
5403	5	9	50	3	\N	2019-03-01	-6000.00	7d9	2020-10-29 19:03:11.630768	2020-10-29 19:03:11.630768
5404	6	10	51	4	\N	2019-03-01	6000.00	7d9	2020-10-29 19:03:11.6323	2020-10-29 19:03:11.6323
5405	1	9	48	2	\N	2019-03-01	-120.00	44a	2020-10-29 19:03:11.6339	2020-10-29 19:03:11.6339
5406	1	8	38	2	\N	2019-03-01	-37.00	004	2020-10-29 19:03:11.635648	2020-10-29 19:03:11.635648
5407	1	9	50	3	\N	2019-03-01	-540.37	576	2020-10-29 19:03:11.636935	2020-10-29 19:03:11.636935
5408	1	9	50	3	\N	2019-03-01	-3620.00	e25	2020-10-29 19:03:11.638324	2020-10-29 19:03:11.638324
5409	5	1	5	2	\N	2019-03-02	-43.75	7d2	2020-10-29 19:03:11.639648	2020-10-29 19:03:11.639648
5410	5	1	5	2	\N	2019-03-02	-115.81	7d2	2020-10-29 19:03:11.658725	2020-10-29 19:03:11.658725
5411	2	5	20	2	\N	2019-03-04	-29.99	acd	2020-10-29 19:03:11.660843	2020-10-29 19:03:11.660843
5412	2	5	20	2	\N	2019-03-04	-13.99	033	2020-10-29 19:03:11.662952	2020-10-29 19:03:11.662952
5413	2	7	28	2	\N	2019-03-04	-23.00	cd7	2020-10-29 19:03:11.665317	2020-10-29 19:03:11.665317
5414	2	1	6	2	\N	2019-03-04	-16.80	2c6	2020-10-29 19:03:11.667456	2020-10-29 19:03:11.667456
5415	5	4	10	2	\N	2019-03-05	-395.74	21b	2020-10-29 19:03:11.670204	2020-10-29 19:03:11.670204
5416	2	6	24	2	\N	2019-03-05	-10.90	6e4	2020-10-29 19:03:11.672511	2020-10-29 19:03:11.672511
5417	1	9	47	2	\N	2019-03-03	-11.00	382	2020-10-29 19:03:11.674601	2020-10-29 19:03:11.674601
5418	1	2	-1	4	\N	2019-03-03	20.00	630	2020-10-29 19:03:11.676711	2020-10-29 19:03:11.676711
5419	1	4	16	2	\N	2019-03-06	-1612.00	065	2020-10-29 19:03:11.678706	2020-10-29 19:03:11.678706
5420	5	1	5	2	\N	2019-03-08	-10.05	473	2020-10-29 19:03:11.680694	2020-10-29 19:03:11.680694
5421	5	1	8	2	\N	2019-03-07	-3.60	cfc	2020-10-29 19:03:11.682732	2020-10-29 19:03:11.682732
5422	5	1	-1	2	\N	2019-03-06	-5.98	c6f	2020-10-29 19:03:11.685124	2020-10-29 19:03:11.685124
5423	5	1	5	2	\N	2019-03-05	-15.75	576	2020-10-29 19:03:11.687059	2020-10-29 19:03:11.687059
5424	5	9	47	2	\N	2019-03-02	-8.00	191	2020-10-29 19:03:11.688929	2020-10-29 19:03:11.688929
5425	2	1	6	2	\N	2019-03-08	-29.96	aee	2020-10-29 19:03:11.691137	2020-10-29 19:03:11.691137
5426	2	5	20	2	\N	2019-03-08	-16.99	820	2020-10-29 19:03:11.692986	2020-10-29 19:03:11.692986
5427	1	3	-1	2	\N	2019-03-09	-5.39	3ea	2020-10-29 19:03:11.69454	2020-10-29 19:03:11.69454
5428	5	1	5	2	\N	2019-03-09	-184.35	a4a	2020-10-29 19:03:11.696169	2020-10-29 19:03:11.696169
5429	2	4	15	2	\N	2019-03-12	-25.00	f35	2020-10-29 19:03:11.698424	2020-10-29 19:03:11.698424
5430	2	4	15	2	\N	2019-03-12	-31.99	fc6	2020-10-29 19:03:11.700445	2020-10-29 19:03:11.700445
5431	5	8	40	2	\N	2019-03-13	-1000.00	95f	2020-10-29 19:03:11.702695	2020-10-29 19:03:11.702695
5432	5	2	-1	4	\N	2019-03-13	15.00	227	2020-10-29 19:03:11.704738	2020-10-29 19:03:11.704738
5433	5	9	-1	3	\N	2019-03-13	-15.00	227	2020-10-29 19:03:11.706807	2020-10-29 19:03:11.706807
5434	1	2	-1	4	\N	2019-03-13	15.00	227	2020-10-29 19:03:11.708816	2020-10-29 19:03:11.708816
5435	5	1	8	2	\N	2019-03-12	-7.74	576	2020-10-29 19:03:11.710892	2020-10-29 19:03:11.710892
5436	5	5	23	2	\N	2013-03-14	-30.11	4ed	2020-10-29 19:03:11.712906	2020-10-29 19:03:11.712906
5437	5	1	5	2	\N	2013-03-14	-18.60	87c	2020-10-29 19:03:11.715038	2020-10-29 19:03:11.715038
5438	5	1	5	2	\N	2013-03-14	-9.29	906	2020-10-29 19:03:11.717561	2020-10-29 19:03:11.717561
5439	5	1	5	2	\N	2013-03-14	-12.30	f13	2020-10-29 19:03:11.719644	2020-10-29 19:03:11.719644
5440	5	1	5	2	\N	2013-03-14	-2.50	548	2020-10-29 19:03:11.721725	2020-10-29 19:03:11.721725
5441	5	1	5	2	\N	2013-03-14	-20.54	7b4	2020-10-29 19:03:11.723737	2020-10-29 19:03:11.723737
5442	2	9	44	2	\N	2019-03-12	-50.00	d41	2020-10-29 19:03:11.725713	2020-10-29 19:03:11.725713
5443	5	1	5	2	\N	2019-03-14	-7.48	be1	2020-10-29 19:03:11.72775	2020-10-29 19:03:11.72775
5444	5	1	5	2	\N	2019-03-14	-144.68	6ee	2020-10-29 19:03:11.729881	2020-10-29 19:03:11.729881
5445	2	1	5	2	\N	2019-03-16	-11.32	c20	2020-10-29 19:03:11.732231	2020-10-29 19:03:11.732231
5446	2	9	44	2	\N	2019-03-17	-50.00	4b5	2020-10-29 19:03:11.734542	2020-10-29 19:03:11.734542
5447	5	4	13	2	\N	2019-03-17	-49.90	97a	2020-10-29 19:03:11.73661	2020-10-29 19:03:11.73661
5448	5	1	8	2	\N	2019-03-17	-6.40	cfc	2020-10-29 19:03:11.738724	2020-10-29 19:03:11.738724
5449	5	1	5	2	\N	2019-03-17	-2.80	b43	2020-10-29 19:03:11.740737	2020-10-29 19:03:11.740737
5450	2	1	6	2	\N	2019-03-18	-33.96	824	2020-10-29 19:03:11.742584	2020-10-29 19:03:11.742584
5451	5	1	8	2	\N	2019-03-19	-19.20	6dc	2020-10-29 19:03:11.744339	2020-10-29 19:03:11.744339
5452	5	2	-1	4	\N	2019-03-26	4800.00	20e	2020-10-29 19:03:11.746324	2020-10-29 19:03:11.746324
5453	5	1	5	2	\N	2019-03-21	-10.07	7d2	2020-10-29 19:03:11.747876	2020-10-29 19:03:11.747876
5454	5	5	18	2	\N	2019-03-26	-76.24	469	2020-10-29 19:03:11.749517	2020-10-29 19:03:11.749517
5455	5	5	20	2	\N	2019-03-23	-28.49	f40	2020-10-29 19:03:11.75178	2020-10-29 19:03:11.75178
5456	5	1	8	2	\N	2019-03-23	-19.20	6dc	2020-10-29 19:03:11.75384	2020-10-29 19:03:11.75384
5457	5	1	5	2	\N	2019-03-23	-11.26	6cc	2020-10-29 19:03:11.755839	2020-10-29 19:03:11.755839
5458	5	1	5	2	\N	2019-03-23	-10.82	07d	2020-10-29 19:03:11.758154	2020-10-29 19:03:11.758154
5459	5	1	5	2	\N	2019-03-22	-150.77	6ee	2020-10-29 19:03:11.760375	2020-10-29 19:03:11.760375
5460	5	1	5	2	\N	2019-03-21	-1.79	7d2	2020-10-29 19:03:11.762364	2020-10-29 19:03:11.762364
5461	5	1	5	2	\N	2019-03-18	-23.56	7d2	2020-10-29 19:03:11.764035	2020-10-29 19:03:11.764035
5462	5	1	5	2	\N	2019-03-18	-12.00	473	2020-10-29 19:03:11.76554	2020-10-29 19:03:11.76554
5463	5	9	47	2	\N	2019-03-11	-5.00	858	2020-10-29 19:03:11.766964	2020-10-29 19:03:11.766964
5464	5	10	51	3	\N	2019-03-26	-4000.00	039	2020-10-29 19:03:11.769259	2020-10-29 19:03:11.769259
5465	6	10	51	4	\N	2019-03-26	4000.00	039	2020-10-29 19:03:11.770871	2020-10-29 19:03:11.770871
5466	5	2	2	4	\N	2019-03-26	14.13	a54	2020-10-29 19:03:11.772971	2020-10-29 19:03:11.772971
5467	2	2	1	1	\N	2019-03-27	7498.78	a3a	2020-10-29 19:03:11.775411	2020-10-29 19:03:11.775411
5468	2	10	51	3	\N	2019-03-27	-5000.00	0a8	2020-10-29 19:03:11.777539	2020-10-29 19:03:11.777539
5469	5	10	51	4	\N	2019-03-27	5000.00	61f	2020-10-29 19:03:11.779544	2020-10-29 19:03:11.779544
5470	2	2	2	1	\N	2019-03-27	5.00	9d4	2020-10-29 19:03:11.781483	2020-10-29 19:03:11.781483
5471	5	4	10	2	\N	2019-03-27	-395.74	769	2020-10-29 19:03:11.783374	2020-10-29 19:03:11.783374
5472	5	4	12	2	\N	2019-03-27	-39.91	070	2020-10-29 19:03:11.78556	2020-10-29 19:03:11.78556
5473	5	8	42	2	\N	2019-03-28	-40.00	8c2	2020-10-29 19:03:11.787725	2020-10-29 19:03:11.787725
5474	5	8	42	2	\N	2019-03-29	-40.00	cd5	2020-10-29 19:03:11.789714	2020-10-29 19:03:11.789714
5475	5	1	5	2	\N	2019-03-27	-14.05	473	2020-10-29 19:03:11.791974	2020-10-29 19:03:11.791974
5476	5	1	5	2	\N	2019-03-29	-152.16	7d2	2020-10-29 19:03:11.793802	2020-10-29 19:03:11.793802
5477	5	5	20	2	\N	2019-03-30	-31.96	e0a	2020-10-29 19:03:11.79577	2020-10-29 19:03:11.79577
5478	5	3	-1	2	\N	2019-03-30	-7.80	3ea	2020-10-29 19:03:11.797666	2020-10-29 19:03:11.797666
5479	5	9	45	2	\N	2019-03-31	-100.00	8fb	2020-10-29 19:03:11.799559	2020-10-29 19:03:11.799559
5480	5	1	8	2	\N	2019-03-31	-26.30	cfc	2020-10-29 19:03:11.801687	2020-10-29 19:03:11.801687
5481	5	8	40	2	\N	2019-03-30	-15.00	750	2020-10-29 19:03:11.803715	2020-10-29 19:03:11.803715
5482	5	1	5	2	\N	2019-03-30	-11.80	473	2020-10-29 19:03:11.805639	2020-10-29 19:03:11.805639
5483	5	1	5	2	\N	2019-03-30	-14.78	7d2	2020-10-29 19:03:11.807142	2020-10-29 19:03:11.807142
5484	5	9	44	2	\N	2019-03-29	-20.00	462	2020-10-29 19:03:11.808569	2020-10-29 19:03:11.808569
5485	5	9	-1	2	\N	2019-03-29	-3.93	a54	2020-10-29 19:03:11.81009	2020-10-29 19:03:11.81009
5486	6	10	52	1	\N	2019-03-31	7.10	15b	2020-10-29 19:03:11.81227	2020-10-29 19:03:11.81227
5487	1	2	-1	4	\N	2019-04-01	0.00	809	2020-10-29 19:03:11.813678	2020-10-29 19:03:11.813678
5488	5	2	-1	4	\N	2019-04-01	1500.00	b18	2020-10-29 19:03:11.81534	2020-10-29 19:03:11.81534
5489	2	9	50	3	\N	2019-04-01	-1500.00	44e	2020-10-29 19:03:11.817291	2020-10-29 19:03:11.817291
5490	1	9	48	2	\N	2019-04-01	-120.00	a99	2020-10-29 19:03:11.818878	2020-10-29 19:03:11.818878
5491	5	2	-1	4	\N	2019-04-01	414.16	7ad	2020-10-29 19:03:11.820447	2020-10-29 19:03:11.820447
5492	1	2	-1	4	\N	2019-04-01	750.00	a6b	2020-10-29 19:03:11.82205	2020-10-29 19:03:11.82205
5493	1	9	50	3	\N	2019-04-01	-120.00	576	2020-10-29 19:03:11.823489	2020-10-29 19:03:11.823489
5494	5	1	5	2	\N	2019-04-01	-8.90	07d	2020-10-29 19:03:11.824825	2020-10-29 19:03:11.824825
5495	2	6	24	2	\N	2019-04-01	-55.80	44c	2020-10-29 19:03:11.82644	2020-10-29 19:03:11.82644
5496	1	1	4	2	\N	2019-04-01	-20.00	534	2020-10-29 19:03:11.828065	2020-10-29 19:03:11.828065
5497	1	3	-1	2	\N	2019-04-01	-21.46	3d8	2020-10-29 19:03:11.829478	2020-10-29 19:03:11.829478
5498	1	7	32	2	\N	2019-04-01	-110.00	e10	2020-10-29 19:03:11.830976	2020-10-29 19:03:11.830976
5499	5	1	8	2	\N	2019-04-03	-6.00	a00	2020-10-29 19:03:11.83236	2020-10-29 19:03:11.83236
5500	5	1	5	2	\N	2019-04-03	-8.97	7d2	2020-10-29 19:03:11.83441	2020-10-29 19:03:11.83441
5501	5	1	5	2	\N	2019-04-03	-8.38	7d2	2020-10-29 19:03:11.83633	2020-10-29 19:03:11.83633
5502	5	1	5	2	\N	2019-04-03	-6.60	07d	2020-10-29 19:03:11.837822	2020-10-29 19:03:11.837822
5503	5	1	8	2	\N	2019-04-02	-3.59	a00	2020-10-29 19:03:11.839516	2020-10-29 19:03:11.839516
5504	5	1	5	2	\N	2019-04-02	-11.94	d9a	2020-10-29 19:03:11.840966	2020-10-29 19:03:11.840966
5505	5	5	20	2	\N	2019-04-02	-3.00	f40	2020-10-29 19:03:11.842369	2020-10-29 19:03:11.842369
5506	5	1	5	2	\N	2019-04-02	-72.60	6ee	2020-10-29 19:03:11.843831	2020-10-29 19:03:11.843831
5507	5	5	20	2	\N	2019-04-02	-1.50	f40	2020-10-29 19:03:11.852255	2020-10-29 19:03:11.852255
5508	5	8	40	2	\N	2019-04-01	-300.00	50b	2020-10-29 19:03:11.854025	2020-10-29 19:03:11.854025
5509	5	2	2	1	\N	2019-04-01	20.43	72b	2020-10-29 19:03:11.855911	2020-10-29 19:03:11.855911
5510	5	9	-1	2	\N	2019-04-04	-1.58	ba4	2020-10-29 19:03:11.857615	2020-10-29 19:03:11.857615
5511	1	8	38	2	\N	2019-04-04	-37.00	a3a	2020-10-29 19:03:11.85953	2020-10-29 19:03:11.85953
5512	2	6	24	2	\N	2019-04-04	-35.00	6e4	2020-10-29 19:03:11.861133	2020-10-29 19:03:11.861133
5513	2	1	8	2	\N	2019-04-04	-6.00	f23	2020-10-29 19:03:11.862838	2020-10-29 19:03:11.862838
5514	2	5	20	2	\N	2019-04-04	-29.90	1aa	2020-10-29 19:03:11.864251	2020-10-29 19:03:11.864251
5515	2	1	5	2	\N	2019-04-04	-3.39	e2c	2020-10-29 19:03:11.865532	2020-10-29 19:03:11.865532
5516	2	5	20	2	\N	2019-04-04	-94.16	ea1	2020-10-29 19:03:11.866864	2020-10-29 19:03:11.866864
5517	2	10	51	3	\N	2019-04-05	-500.00	d86	2020-10-29 19:03:11.868661	2020-10-29 19:03:11.868661
5518	4	10	51	4	\N	2019-04-05	500.00	d86	2020-10-29 19:03:11.870445	2020-10-29 19:03:11.870445
5519	1	1	4	2	\N	2019-04-05	-10.50	23d	2020-10-29 19:03:11.871952	2020-10-29 19:03:11.871952
5520	5	8	40	2	\N	2019-04-05	-229.23	11c	2020-10-29 19:03:11.873785	2020-10-29 19:03:11.873785
5521	5	1	5	2	\N	2019-04-05	-66.14	e7e	2020-10-29 19:03:11.876031	2020-10-29 19:03:11.876031
5522	2	1	6	2	\N	2019-04-06	-42.00	f8d	2020-10-29 19:03:11.877538	2020-10-29 19:03:11.877538
5523	2	1	7	2	\N	2019-04-06	-10.90	f17	2020-10-29 19:03:11.878828	2020-10-29 19:03:11.878828
5524	2	1	7	2	\N	2019-04-06	-10.90	de2	2020-10-29 19:03:11.880004	2020-10-29 19:03:11.880004
5525	2	1	7	1	\N	2019-04-06	30.90	c48	2020-10-29 19:03:11.881091	2020-10-29 19:03:11.881091
5526	1	1	7	2	\N	2019-04-09	-20.00	820	2020-10-29 19:03:11.882228	2020-10-29 19:03:11.882228
5527	1	1	7	2	\N	2019-04-08	-15.30	346	2020-10-29 19:03:11.883386	2020-10-29 19:03:11.883386
5528	1	1	5	2	\N	2019-04-07	-15.78	c71	2020-10-29 19:03:11.885048	2020-10-29 19:03:11.885048
5529	1	1	6	2	\N	2019-04-06	-22.00	9bb	2020-10-29 19:03:11.886686	2020-10-29 19:03:11.886686
5530	1	1	5	2	\N	2019-04-06	-9.89	7d2	2020-10-29 19:03:11.888447	2020-10-29 19:03:11.888447
5531	1	1	5	2	\N	2019-04-06	-1.69	7d2	2020-10-29 19:03:11.890345	2020-10-29 19:03:11.890345
5532	1	7	32	2	\N	2019-04-05	-19.96	bee	2020-10-29 19:03:11.892075	2020-10-29 19:03:11.892075
5533	5	1	5	2	\N	2019-04-09	-119.85	6ee	2020-10-29 19:03:11.89414	2020-10-29 19:03:11.89414
5534	5	1	5	2	\N	2019-04-09	-11.72	7d2	2020-10-29 19:03:11.8956	2020-10-29 19:03:11.8956
5535	5	1	5	2	\N	2019-04-08	-10.99	7d2	2020-10-29 19:03:11.897037	2020-10-29 19:03:11.897037
5536	5	1	5	2	\N	2019-04-08	-6.50	473	2020-10-29 19:03:11.898446	2020-10-29 19:03:11.898446
5537	5	8	40	2	\N	2019-04-07	-72.40	18e	2020-10-29 19:03:11.90006	2020-10-29 19:03:11.90006
5538	5	8	40	2	\N	2019-04-09	-724.00	193	2020-10-29 19:03:11.901813	2020-10-29 19:03:11.901813
5539	2	1	5	2	\N	2019-04-10	-9.27	449	2020-10-29 19:03:11.903212	2020-10-29 19:03:11.903212
5540	2	1	7	2	\N	2019-04-10	-3.00	c00	2020-10-29 19:03:11.904402	2020-10-29 19:03:11.904402
5541	5	8	40	2	\N	2019-04-10	-107.99	ffa	2020-10-29 19:03:11.905546	2020-10-29 19:03:11.905546
5542	5	9	-1	2	\N	2019-04-11	-42.00	7a5	2020-10-29 19:03:11.906652	2020-10-29 19:03:11.906652
5543	5	1	5	2	\N	2019-04-12	-6.28	244	2020-10-29 19:03:11.90773	2020-10-29 19:03:11.90773
5544	5	1	5	2	\N	2019-04-12	-5.30	ecd	2020-10-29 19:03:11.908781	2020-10-29 19:03:11.908781
5545	2	6	24	2	\N	2019-04-12	-8.60	6e4	2020-10-29 19:03:11.909847	2020-10-29 19:03:11.909847
5546	5	1	5	2	\N	2019-04-15	-10.40	f13	2020-10-29 19:03:11.911108	2020-10-29 19:03:11.911108
5547	2	1	7	2	\N	2019-04-15	-13.90	fe4	2020-10-29 19:03:11.912458	2020-10-29 19:03:11.912458
5548	2	9	44	2	\N	2019-04-16	-20.00	5f0	2020-10-29 19:03:11.913591	2020-10-29 19:03:11.913591
5549	2	1	7	2	\N	2019-04-17	-11.20	de7	2020-10-29 19:03:11.914716	2020-10-29 19:03:11.914716
5550	5	5	23	2	\N	2019-04-17	-111.28	fe6	2020-10-29 19:03:11.915832	2020-10-29 19:03:11.915832
5551	2	5	23	2	\N	2019-04-17	-46.76	80f	2020-10-29 19:03:11.916982	2020-10-29 19:03:11.916982
5552	5	5	23	1	\N	2019-04-17	46.76	80f	2020-10-29 19:03:11.918779	2020-10-29 19:03:11.918779
5553	2	5	20	2	\N	2019-04-17	-17.47	1ce	2020-10-29 19:03:11.91999	2020-10-29 19:03:11.91999
5554	5	1	8	2	\N	2019-04-17	-7.88	48b	2020-10-29 19:03:11.92122	2020-10-29 19:03:11.92122
5555	2	4	13	2	\N	2019-04-18	-31.99	54d	2020-10-29 19:03:11.923021	2020-10-29 19:03:11.923021
5556	6	10	51	3	\N	2019-04-19	-10013.07	d41	2020-10-29 19:03:11.924221	2020-10-29 19:03:11.924221
5557	5	10	51	4	\N	2019-04-19	10013.07	d41	2020-10-29 19:03:11.92554	2020-10-29 19:03:11.92554
5558	5	1	5	2	\N	2019-04-19	-12.54	c66	2020-10-29 19:03:11.927089	2020-10-29 19:03:11.927089
5559	2	6	24	2	\N	2019-04-19	-34.00	b45	2020-10-29 19:03:11.928201	2020-10-29 19:03:11.928201
5560	5	1	5	2	\N	2019-04-19	-257.01	e88	2020-10-29 19:03:11.929668	2020-10-29 19:03:11.929668
5561	1	2	-1	4	\N	2019-04-21	125.46	5bc	2020-10-29 19:03:11.930972	2020-10-29 19:03:11.930972
5562	1	9	50	3	\N	2019-04-27	-103.73	00f	2020-10-29 19:03:11.932322	2020-10-29 19:03:11.932322
5563	1	9	50	3	\N	2019-04-18	-20.00	abf	2020-10-29 19:03:11.933546	2020-10-29 19:03:11.933546
5564	5	9	50	3	\N	2019-04-28	-200.00	bdb	2020-10-29 19:03:11.934943	2020-10-29 19:03:11.934943
5565	1	8	38	2	\N	2019-04-23	-70.00	1bf	2020-10-29 19:03:11.936085	2020-10-29 19:03:11.936085
5566	1	3	-1	2	\N	2019-04-19	-12.47	3ea	2020-10-29 19:03:11.937132	2020-10-29 19:03:11.937132
5567	1	1	7	2	\N	2019-04-18	-18.75	e37	2020-10-29 19:03:11.938782	2020-10-29 19:03:11.938782
5568	1	1	7	2	\N	2019-04-17	-14.17	e37	2020-10-29 19:03:11.940143	2020-10-29 19:03:11.940143
5569	1	1	7	2	\N	2019-04-15	-19.35	e37	2020-10-29 19:03:11.94117	2020-10-29 19:03:11.94117
5570	1	1	8	2	\N	2019-04-15	-3.98	a00	2020-10-29 19:03:11.942228	2020-10-29 19:03:11.942228
5571	1	1	4	2	\N	2019-04-15	-12.00	f04	2020-10-29 19:03:11.943229	2020-10-29 19:03:11.943229
5572	1	3	-1	2	\N	2019-04-15	-12.00	8ae	2020-10-29 19:03:11.944248	2020-10-29 19:03:11.944248
5573	1	3	-1	2	\N	2019-04-15	-8.00	3ea	2020-10-29 19:03:11.945261	2020-10-29 19:03:11.945261
5574	1	1	7	2	\N	2019-04-13	-13.97	e37	2020-10-29 19:03:11.946308	2020-10-29 19:03:11.946308
5575	1	3	-1	2	\N	2019-04-13	-15.00	3ea	2020-10-29 19:03:11.947456	2020-10-29 19:03:11.947456
5576	1	3	-1	2	\N	2019-04-13	-10.00	3ea	2020-10-29 19:03:11.948936	2020-10-29 19:03:11.948936
5577	1	8	38	2	\N	2019-04-13	-7.60	f79	2020-10-29 19:03:11.950075	2020-10-29 19:03:11.950075
5578	1	1	8	2	\N	2019-04-13	-3.59	a00	2020-10-29 19:03:11.951472	2020-10-29 19:03:11.951472
5579	6	2	1	1	\N	2019-04-26	10000.00	655	2020-10-29 19:03:11.952701	2020-10-29 19:03:11.952701
5580	5	2	1	1	\N	2019-04-26	4284.40	655	2020-10-29 19:03:11.953775	2020-10-29 19:03:11.953775
5581	5	1	5	2	\N	2019-04-28	-303.46	e7e	2020-10-29 19:03:11.954878	2020-10-29 19:03:11.954878
5582	5	3	-1	2	\N	2019-04-27	-14.20	3ea	2020-10-29 19:03:11.955927	2020-10-29 19:03:11.955927
5583	5	1	4	2	\N	2019-04-27	-3.30	dc1	2020-10-29 19:03:11.956921	2020-10-29 19:03:11.956921
5584	5	1	5	2	\N	2019-04-27	-14.85	473	2020-10-29 19:03:11.957919	2020-10-29 19:03:11.957919
5585	5	1	5	2	\N	2019-04-25	-125.61	e7e	2020-10-29 19:03:11.958968	2020-10-29 19:03:11.958968
5586	5	8	40	2	\N	2019-04-24	-204.78	0a1	2020-10-29 19:03:11.96007	2020-10-29 19:03:11.96007
5587	5	9	-1	2	\N	2019-04-23	-45.00	a9e	2020-10-29 19:03:11.961075	2020-10-29 19:03:11.961075
5588	5	1	5	2	\N	2019-04-23	-7.10	473	2020-10-29 19:03:11.962123	2020-10-29 19:03:11.962123
5589	5	2	2	1	\N	2019-04-19	83.91	72b	2020-10-29 19:03:11.963233	2020-10-29 19:03:11.963233
5590	5	8	40	2	\N	2019-04-16	-239.90	0e7	2020-10-29 19:03:11.964274	2020-10-29 19:03:11.964274
5591	5	1	5	2	\N	2019-04-15	-166.99	6ee	2020-10-29 19:03:11.965342	2020-10-29 19:03:11.965342
5592	5	1	5	2	\N	2019-04-15	-12.61	473	2020-10-29 19:03:11.966736	2020-10-29 19:03:11.966736
5593	5	1	8	2	\N	2019-04-13	-8.80	cfc	2020-10-29 19:03:11.968471	2020-10-29 19:03:11.968471
5594	2	5	18	2	\N	2019-04-29	-43.96	c1e	2020-10-29 19:03:11.9696	2020-10-29 19:03:11.9696
5595	5	1	5	2	\N	2019-04-29	-35.07	463	2020-10-29 19:03:11.970701	2020-10-29 19:03:11.970701
5596	5	5	20	2	\N	2019-04-29	-31.99	ecc	2020-10-29 19:03:11.971742	2020-10-29 19:03:11.971742
5597	2	6	24	2	\N	2019-04-29	-32.00	e4a	2020-10-29 19:03:11.972786	2020-10-29 19:03:11.972786
5598	5	1	5	2	\N	2019-04-29	-9.10	ecd	2020-10-29 19:03:11.973875	2020-10-29 19:03:11.973875
5599	5	1	5	2	\N	2019-04-25	-14.85	ecd	2020-10-29 19:03:11.974916	2020-10-29 19:03:11.974916
5600	5	1	5	2	\N	2019-04-29	-7.50	06b	2020-10-29 19:03:11.976024	2020-10-29 19:03:11.976024
5601	1	5	20	2	\N	2019-04-29	-41.98	bc0	2020-10-29 19:03:11.977138	2020-10-29 19:03:11.977138
5602	2	2	1	1	\N	2019-04-30	7465.07	c8e	2020-10-29 19:03:11.978194	2020-10-29 19:03:11.978194
5603	2	10	51	3	\N	2019-04-30	-5000.00	edd	2020-10-29 19:03:11.979177	2020-10-29 19:03:11.979177
5604	5	10	51	4	\N	2019-04-30	5000.00	edd	2020-10-29 19:03:11.980184	2020-10-29 19:03:11.980184
5605	2	10	51	3	\N	2019-04-30	-500.00	b79	2020-10-29 19:03:11.981174	2020-10-29 19:03:11.981174
5606	4	10	51	4	\N	2019-04-30	500.00	b79	2020-10-29 19:03:11.982206	2020-10-29 19:03:11.982206
5607	5	9	50	4	\N	2019-05-01	5500.00	6d7	2020-10-29 19:03:11.983244	2020-10-29 19:03:11.983244
5608	1	10	51	4	\N	2019-05-01	4228.45	ab5	2020-10-29 19:03:11.984542	2020-10-29 19:03:11.984542
5609	1	9	48	2	\N	2019-05-01	-120.00	a99	2020-10-29 19:03:11.985951	2020-10-29 19:03:11.985951
5610	5	9	50	3	\N	2019-05-01	-7000.00	039	2020-10-29 19:03:11.987167	2020-10-29 19:03:11.987167
5611	6	10	51	4	\N	2019-05-01	7000.00	039	2020-10-29 19:03:11.988478	2020-10-29 19:03:11.988478
5612	5	4	13	3	\N	2019-05-01	-146.00	876	2020-10-29 19:03:11.989593	2020-10-29 19:03:11.989593
5613	1	2	2	4	\N	2019-05-01	146.00	876	2020-10-29 19:03:11.990659	2020-10-29 19:03:11.990659
5614	5	9	50	3	\N	2019-05-01	-1000.00	d4f	2020-10-29 19:03:11.991756	2020-10-29 19:03:11.991756
5615	6	10	52	1	\N	2019-05-01	8.17	1a8	2020-10-29 19:03:11.992854	2020-10-29 19:03:11.992854
5616	1	9	50	3	\N	2019-05-01	-1000.00	cd2	2020-10-29 19:03:11.994143	2020-10-29 19:03:11.994143
5617	1	9	50	3	\N	2019-05-01	-500.00	93d	2020-10-29 19:03:11.995463	2020-10-29 19:03:11.995463
5618	1	9	50	3	\N	2019-05-01	-500.00	845	2020-10-29 19:03:11.996587	2020-10-29 19:03:11.996587
5619	1	9	50	3	\N	2019-05-01	-1000.00	3aa	2020-10-29 19:03:11.997694	2020-10-29 19:03:11.997694
5620	5	2	2	1	\N	2019-04-30	451.00	058	2020-10-29 19:03:11.998784	2020-10-29 19:03:11.998784
5621	5	9	-1	1	\N	2019-05-01	44.31	6ae	2020-10-29 19:03:11.999927	2020-10-29 19:03:11.999927
5622	1	8	38	2	\N	2019-05-01	-45.00	d3b	2020-10-29 19:03:12.001399	2020-10-29 19:03:12.001399
5623	1	8	38	2	\N	2019-05-01	-14.15	074	2020-10-29 19:03:12.002829	2020-10-29 19:03:12.002829
5624	1	9	50	3	\N	2019-05-01	-60.00	a76	2020-10-29 19:03:12.003926	2020-10-29 19:03:12.003926
5625	5	2	-1	4	\N	2019-05-01	2500.00	3fc	2020-10-29 19:03:12.004976	2020-10-29 19:03:12.004976
5626	1	1	6	2	\N	2019-05-01	-110.00	90b	2020-10-29 19:03:12.00615	2020-10-29 19:03:12.00615
5627	1	9	45	2	\N	2019-05-02	-200.00	d39	2020-10-29 19:03:12.007417	2020-10-29 19:03:12.007417
5628	2	2	-1	1	\N	2019-05-02	200.00	d39	2020-10-29 19:03:12.008572	2020-10-29 19:03:12.008572
5629	5	4	10	2	\N	2019-05-02	-209.16	9ad	2020-10-29 19:03:12.00973	2020-10-29 19:03:12.00973
5630	5	1	5	2	\N	2019-05-02	-289.27	f7a	2020-10-29 19:03:12.01083	2020-10-29 19:03:12.01083
5631	5	4	12	2	\N	2019-05-02	-102.00	b4e	2020-10-29 19:03:12.011965	2020-10-29 19:03:12.011965
5632	5	4	11	2	\N	2019-05-02	-101.10	a07	2020-10-29 19:03:12.01326	2020-10-29 19:03:12.01326
5633	5	9	-1	2	\N	2019-05-02	-796.00	215	2020-10-29 19:03:12.01474	2020-10-29 19:03:12.01474
5634	1	1	6	2	\N	2019-05-02	-1.48	305	2020-10-29 19:03:12.015936	2020-10-29 19:03:12.015936
5635	1	7	28	2	\N	2019-05-02	-81.00	ef8	2020-10-29 19:03:12.017197	2020-10-29 19:03:12.017197
5636	5	1	5	2	\N	2019-05-02	-24.43	20c	2020-10-29 19:03:12.01872	2020-10-29 19:03:12.01872
5637	5	9	45	2	\N	2019-05-02	-150.00	157	2020-10-29 19:03:12.020065	2020-10-29 19:03:12.020065
5638	5	9	50	3	\N	2019-05-03	-250.00	874	2020-10-29 19:03:12.021444	2020-10-29 19:03:12.021444
5639	5	1	5	2	\N	2019-05-04	-50.85	3bd	2020-10-29 19:03:12.022648	2020-10-29 19:03:12.022648
5640	5	8	40	2	\N	2019-05-04	-254.83	a6f	2020-10-29 19:03:12.02416	2020-10-29 19:03:12.02416
5641	6	9	50	3	\N	2019-05-05	-3000.00	5bc	2020-10-29 19:03:12.025298	2020-10-29 19:03:12.025298
5642	5	2	-1	4	\N	2019-05-05	3000.00	5bc	2020-10-29 19:03:12.026387	2020-10-29 19:03:12.026387
5643	1	1	8	2	\N	2019-05-08	-3.99	b6a	2020-10-29 19:03:12.027432	2020-10-29 19:03:12.027432
5644	5	4	13	2	\N	2019-05-08	-70.00	dc8	2020-10-29 19:03:12.02849	2020-10-29 19:03:12.02849
5645	5	5	22	2	\N	2019-05-08	-50.00	9da	2020-10-29 19:03:12.02956	2020-10-29 19:03:12.02956
5646	5	1	5	2	\N	2019-05-08	-155.06	6ee	2020-10-29 19:03:12.030971	2020-10-29 19:03:12.030971
5647	5	1	5	2	\N	2019-05-08	-7.34	d3a	2020-10-29 19:03:12.032343	2020-10-29 19:03:12.032343
5648	2	5	22	2	\N	2019-05-09	-50.00	37e	2020-10-29 19:03:12.033557	2020-10-29 19:03:12.033557
5649	2	1	5	2	\N	2019-05-09	-10.00	0f8	2020-10-29 19:03:12.034916	2020-10-29 19:03:12.034916
5650	1	9	45	2	\N	2019-05-09	-10.55	0a9	2020-10-29 19:03:12.036341	2020-10-29 19:03:12.036341
5651	1	2	2	1	\N	2019-05-11	54.00	dfa	2020-10-29 19:03:12.037534	2020-10-29 19:03:12.037534
5652	5	1	8	2	\N	2019-05-12	-19.57	37e	2020-10-29 19:03:12.03869	2020-10-29 19:03:12.03869
5653	5	5	20	2	\N	2019-05-11	-26.22	f40	2020-10-29 19:03:12.039752	2020-10-29 19:03:12.039752
5654	5	1	5	2	\N	2019-05-11	-364.30	7d2	2020-10-29 19:03:12.040773	2020-10-29 19:03:12.040773
5655	5	2	2	1	\N	2019-05-11	29.99	694	2020-10-29 19:03:12.042028	2020-10-29 19:03:12.042028
5656	5	2	2	1	\N	2019-05-11	7.19	694	2020-10-29 19:03:12.043377	2020-10-29 19:03:12.043377
5657	5	2	2	1	\N	2019-05-11	50.00	8a9	2020-10-29 19:03:12.044566	2020-10-29 19:03:12.044566
5658	5	9	44	2	\N	2019-05-18	-20.00	3e9	2020-10-29 19:03:12.045759	2020-10-29 19:03:12.045759
5659	5	1	5	2	\N	2019-05-17	-55.51	463	2020-10-29 19:03:12.047015	2020-10-29 19:03:12.047015
5660	5	5	20	2	\N	2019-05-18	-13.90	b76	2020-10-29 19:03:12.048287	2020-10-29 19:03:12.048287
5661	5	1	5	2	\N	2019-05-18	-41.10	ff8	2020-10-29 19:03:12.049447	2020-10-29 19:03:12.049447
5662	5	1	6	2	\N	2019-05-19	-10.00	c00	2020-10-29 19:03:12.05063	2020-10-29 19:03:12.05063
5663	5	1	5	2	\N	2019-05-20	-5.56	806	2020-10-29 19:03:12.052154	2020-10-29 19:03:12.052154
5664	5	1	8	2	\N	2019-05-16	-2.15	204	2020-10-29 19:03:12.053247	2020-10-29 19:03:12.053247
5665	5	1	5	2	\N	2019-05-17	-232.22	463	2020-10-29 19:03:12.054392	2020-10-29 19:03:12.054392
5666	2	1	6	2	\N	2019-05-15	-14.00	5a4	2020-10-29 19:03:12.055772	2020-10-29 19:03:12.055772
5667	2	4	15	2	\N	2019-05-16	-25.00	f35	2020-10-29 19:03:12.056967	2020-10-29 19:03:12.056967
5668	2	9	45	2	\N	2019-05-17	-20.00	51e	2020-10-29 19:03:12.058178	2020-10-29 19:03:12.058178
5669	2	6	24	2	\N	2019-05-18	-81.85	dfc	2020-10-29 19:03:12.059398	2020-10-29 19:03:12.059398
5670	5	9	44	2	\N	2019-05-19	-2000.00	3d9	2020-10-29 19:03:12.060841	2020-10-29 19:03:12.060841
5671	1	9	50	3	\N	2019-05-26	-20.00	ad3	2020-10-29 19:03:12.062252	2020-10-29 19:03:12.062252
5672	1	9	46	2	\N	2019-05-26	-195.57	b0c	2020-10-29 19:03:12.063465	2020-10-29 19:03:12.063465
5673	1	1	7	2	\N	2019-05-26	-15.25	37f	2020-10-29 19:03:12.064509	2020-10-29 19:03:12.064509
5674	1	7	30	2	\N	2019-05-26	-44.20	71f	2020-10-29 19:03:12.065574	2020-10-29 19:03:12.065574
5675	1	1	8	2	\N	2019-05-26	-3.90	d9a	2020-10-29 19:03:12.066677	2020-10-29 19:03:12.066677
5676	1	3	-1	2	\N	2019-05-26	-100.00	477	2020-10-29 19:03:12.068478	2020-10-29 19:03:12.068478
5677	5	9	-1	2	\N	2019-05-26	-20.00	fab	2020-10-29 19:03:12.069854	2020-10-29 19:03:12.069854
5678	5	1	6	2	\N	2019-05-26	-38.00	c06	2020-10-29 19:03:12.071239	2020-10-29 19:03:12.071239
5679	5	1	5	2	\N	2019-05-26	-10.36	725	2020-10-29 19:03:12.072424	2020-10-29 19:03:12.072424
5680	5	1	5	2	\N	2019-05-26	-119.35	e5f	2020-10-29 19:03:12.073698	2020-10-29 19:03:12.073698
5681	5	1	8	2	\N	2019-05-26	-8.00	f83	2020-10-29 19:03:12.074987	2020-10-29 19:03:12.074987
5682	5	1	5	2	\N	2019-05-26	-12.13	57f	2020-10-29 19:03:12.076503	2020-10-29 19:03:12.076503
5683	5	4	13	2	\N	2019-05-26	-49.90	771	2020-10-29 19:03:12.078758	2020-10-29 19:03:12.078758
5684	5	9	47	2	\N	2019-05-26	-7.50	0a3	2020-10-29 19:03:12.080137	2020-10-29 19:03:12.080137
5685	5	1	8	2	\N	2019-05-26	-3.30	f83	2020-10-29 19:03:12.08155	2020-10-29 19:03:12.08155
5686	5	1	8	2	\N	2019-05-26	-4.50	4eb	2020-10-29 19:03:12.083074	2020-10-29 19:03:12.083074
5687	5	10	51	4	\N	2019-05-28	3000.00	0c3	2020-10-29 19:03:12.085235	2020-10-29 19:03:12.085235
5688	2	2	1	1	\N	2019-05-28	10724.16	3ae	2020-10-29 19:03:12.086608	2020-10-29 19:03:12.086608
5689	2	10	51	3	\N	2019-05-30	-500.00	b52	2020-10-29 19:03:12.087811	2020-10-29 19:03:12.087811
5690	4	10	51	4	\N	2019-05-30	500.00	b52	2020-10-29 19:03:12.089127	2020-10-29 19:03:12.089127
5691	2	10	51	3	\N	2019-05-30	-8000.00	f5e	2020-10-29 19:03:12.090382	2020-10-29 19:03:12.090382
5692	5	10	51	4	\N	2019-05-30	8000.00	f5e	2020-10-29 19:03:12.09159	2020-10-29 19:03:12.09159
5693	5	4	10	2	\N	2019-05-30	-370.94	eff	2020-10-29 19:03:12.092794	2020-10-29 19:03:12.092794
5694	5	4	12	2	\N	2019-05-30	-102.00	faf	2020-10-29 19:03:12.093907	2020-10-29 19:03:12.093907
5695	5	4	12	2	\N	2019-05-30	-62.27	616	2020-10-29 19:03:12.094954	2020-10-29 19:03:12.094954
5696	5	1	5	2	\N	2019-05-29	-12.34	d3a	2020-10-29 19:03:12.096091	2020-10-29 19:03:12.096091
5697	6	10	52	1	\N	2019-06-01	12.82	3e1	2020-10-29 19:03:12.097235	2020-10-29 19:03:12.097235
5698	5	2	-1	4	\N	2019-06-01	2500.00	cba	2020-10-29 19:03:12.098406	2020-10-29 19:03:12.098406
5699	5	9	50	3	\N	2019-06-01	-1000.00	359	2020-10-29 19:03:12.09965	2020-10-29 19:03:12.09965
5700	1	10	51	4	\N	2019-06-01	4429.44	62d	2020-10-29 19:03:12.10148	2020-10-29 19:03:12.10148
5701	1	9	50	3	\N	2019-06-01	-709.44	b8f	2020-10-29 19:03:12.103467	2020-10-29 19:03:12.103467
5702	5	10	51	4	\N	2019-06-01	709.44	b8f	2020-10-29 19:03:12.104827	2020-10-29 19:03:12.104827
5703	1	9	50	3	\N	2019-06-01	-2000.00	bee	2020-10-29 19:03:12.106036	2020-10-29 19:03:12.106036
5704	1	9	48	2	\N	2019-06-01	-120.00	a99	2020-10-29 19:03:12.107102	2020-10-29 19:03:12.107102
5705	1	9	46	2	\N	2019-06-01	-79.50	793	2020-10-29 19:03:12.1082	2020-10-29 19:03:12.1082
5706	1	9	50	3	\N	2019-06-01	-20.00	844	2020-10-29 19:03:12.109245	2020-10-29 19:03:12.109245
5707	1	1	7	2	\N	2019-06-01	-14.53	e37	2020-10-29 19:03:12.110508	2020-10-29 19:03:12.110508
5708	1	1	7	2	\N	2019-06-01	-5.60	78a	2020-10-29 19:03:12.111701	2020-10-29 19:03:12.111701
5709	1	1	8	2	\N	2019-06-01	-2.20	f83	2020-10-29 19:03:12.11288	2020-10-29 19:03:12.11288
5710	1	1	8	2	\N	2019-06-01	-2.80	54f	2020-10-29 19:03:12.114114	2020-10-29 19:03:12.114114
5711	1	3	-1	2	\N	2019-06-01	-20.00	686	2020-10-29 19:03:12.115597	2020-10-29 19:03:12.115597
5712	5	1	5	2	\N	2019-06-01	-19.10	5d7	2020-10-29 19:03:12.116796	2020-10-29 19:03:12.116796
5713	5	1	5	2	\N	2019-06-01	-62.25	5d7	2020-10-29 19:03:12.118325	2020-10-29 19:03:12.118325
5714	5	1	8	2	\N	2019-06-01	-6.00	a61	2020-10-29 19:03:12.119754	2020-10-29 19:03:12.119754
5715	5	1	5	2	\N	2019-06-01	-172.50	e5f	2020-10-29 19:03:12.120878	2020-10-29 19:03:12.120878
5716	5	9	45	2	\N	2019-06-01	-219.90	fc9	2020-10-29 19:03:12.121958	2020-10-29 19:03:12.121958
5717	5	5	20	2	\N	2019-06-01	-42.49	e0a	2020-10-29 19:03:12.123112	2020-10-29 19:03:12.123112
5718	5	1	5	2	\N	2019-06-01	-42.00	6cc	2020-10-29 19:03:12.124307	2020-10-29 19:03:12.124307
5719	5	1	5	2	\N	2019-06-01	-12.95	473	2020-10-29 19:03:12.125597	2020-10-29 19:03:12.125597
5720	1	5	18	2	\N	2019-06-01	-62.66	0ec	2020-10-29 19:03:12.126845	2020-10-29 19:03:12.126845
5721	5	8	40	2	\N	2019-06-01	-243.79	a6f	2020-10-29 19:03:12.12806	2020-10-29 19:03:12.12806
5722	5	9	45	2	\N	2019-06-01	-219.48	414	2020-10-29 19:03:12.12931	2020-10-29 19:03:12.12931
5723	1	2	2	1	\N	2019-07-01	0.00	73b	2020-10-29 19:03:12.130491	2020-10-29 19:03:12.130491
5724	5	10	51	4	\N	2019-07-01	3500.00	b20	2020-10-29 19:03:12.131645	2020-10-29 19:03:12.131645
5725	1	10	51	4	\N	2019-07-01	2246.26	cd4	2020-10-29 19:03:12.13279	2020-10-29 19:03:12.13279
5726	5	4	10	2	\N	2019-07-02	-377.44	9eb	2020-10-29 19:03:12.133913	2020-10-29 19:03:12.133913
5727	5	4	12	2	\N	2019-07-02	-102.00	070	2020-10-29 19:03:12.135796	2020-10-29 19:03:12.135796
5728	5	4	11	2	\N	2019-07-02	-105.39	fec	2020-10-29 19:03:12.137329	2020-10-29 19:03:12.137329
5729	5	1	5	2	\N	2019-07-02	-50.00	2dd	2020-10-29 19:03:12.138563	2020-10-29 19:03:12.138563
5730	5	10	51	3	\N	2019-07-02	-5000.00	6d7	2020-10-29 19:03:12.139829	2020-10-29 19:03:12.139829
5731	6	10	51	4	\N	2019-07-02	5000.00	6d7	2020-10-29 19:03:12.14106	2020-10-29 19:03:12.14106
5732	5	10	51	3	\N	2019-07-02	-500.00	5c3	2020-10-29 19:03:12.142327	2020-10-29 19:03:12.142327
5733	1	9	50	3	\N	2019-07-04	-15.00	297	2020-10-29 19:03:12.143583	2020-10-29 19:03:12.143583
5734	5	2	2	4	\N	2019-07-04	15.00	297	2020-10-29 19:03:12.144692	2020-10-29 19:03:12.144692
5735	1	8	38	2	\N	2019-07-02	-45.00	741	2020-10-29 19:03:12.145808	2020-10-29 19:03:12.145808
5736	1	7	33	2	\N	2019-07-02	-18.19	f47	2020-10-29 19:03:12.146914	2020-10-29 19:03:12.146914
5737	1	9	48	2	\N	2019-07-02	-120.00	a99	2020-10-29 19:03:12.148038	2020-10-29 19:03:12.148038
5738	1	7	33	2	\N	2019-07-02	-197.00	ea9	2020-10-29 19:03:12.149422	2020-10-29 19:03:12.149422
5739	1	9	50	3	\N	2019-07-02	-1000.00	b8a	2020-10-29 19:03:12.150867	2020-10-29 19:03:12.150867
5740	5	1	5	2	\N	2019-07-03	-83.21	f6b	2020-10-29 19:03:12.152277	2020-10-29 19:03:12.152277
5741	5	9	50	3	\N	2019-07-04	-500.00	a39	2020-10-29 19:03:12.153536	2020-10-29 19:03:12.153536
5742	5	7	27	2	\N	2019-07-04	-142.00	b73	2020-10-29 19:03:12.154844	2020-10-29 19:03:12.154844
5743	2	1	7	2	\N	2019-07-04	-13.90	54f	2020-10-29 19:03:12.155966	2020-10-29 19:03:12.155966
5744	2	1	6	2	\N	2019-07-04	-9.98	fe1	2020-10-29 19:03:12.157103	2020-10-29 19:03:12.157103
5745	1	9	46	2	\N	2019-07-06	-57.22	3f7	2020-10-29 19:03:12.158371	2020-10-29 19:03:12.158371
5746	5	1	5	2	\N	2019-07-06	-11.56	20c	2020-10-29 19:03:12.159492	2020-10-29 19:03:12.159492
5747	5	1	5	2	\N	2019-07-06	-166.11	20c	2020-10-29 19:03:12.160564	2020-10-29 19:03:12.160564
5748	5	1	5	2	\N	2019-07-06	-25.53	20c	2020-10-29 19:03:12.161722	2020-10-29 19:03:12.161722
5749	5	7	27	2	\N	2019-07-06	-700.00	0aa	2020-10-29 19:03:12.162847	2020-10-29 19:03:12.162847
5750	5	5	20	2	\N	2019-07-06	-49.98	f40	2020-10-29 19:03:12.163976	2020-10-29 19:03:12.163976
5751	5	9	-1	2	\N	2019-07-06	-6.99	bb9	2020-10-29 19:03:12.165204	2020-10-29 19:03:12.165204
5752	2	1	6	2	\N	2019-07-06	-105.00	77a	2020-10-29 19:03:12.16654	2020-10-29 19:03:12.16654
5753	1	1	8	2	\N	2019-07-08	-11.00	537	2020-10-29 19:03:12.167958	2020-10-29 19:03:12.167958
5754	5	4	13	2	\N	2019-07-08	-70.00	c48	2020-10-29 19:03:12.16932	2020-10-29 19:03:12.16932
5755	5	1	6	2	\N	2019-07-08	-14.00	162	2020-10-29 19:03:12.170399	2020-10-29 19:03:12.170399
5756	5	1	5	2	\N	2019-07-08	-1.99	d9a	2020-10-29 19:03:12.171476	2020-10-29 19:03:12.171476
5757	5	5	23	2	\N	2019-07-08	-104.23	86a	2020-10-29 19:03:12.172553	2020-10-29 19:03:12.172553
5758	5	1	5	2	\N	2019-07-08	-45.43	3dd	2020-10-29 19:03:12.173778	2020-10-29 19:03:12.173778
5759	2	4	13	2	\N	2019-07-12	-37.98	fc6	2020-10-29 19:03:12.175045	2020-10-29 19:03:12.175045
5760	5	5	19	2	\N	2019-07-16	-110.00	323	2020-10-29 19:03:12.176325	2020-10-29 19:03:12.176325
5761	5	1	5	2	\N	2019-07-16	-13.43	c9e	2020-10-29 19:03:12.177572	2020-10-29 19:03:12.177572
5762	5	1	8	2	\N	2019-07-16	-10.00	e7f	2020-10-29 19:03:12.178841	2020-10-29 19:03:12.178841
5763	4	10	51	3	\N	2019-07-16	-2000.00	9e3	2020-10-29 19:03:12.180049	2020-10-29 19:03:12.180049
5764	2	10	51	4	\N	2019-07-16	2000.00	9e3	2020-10-29 19:03:12.181206	2020-10-29 19:03:12.181206
5765	2	4	15	2	\N	2019-07-17	-25.00	f80	2020-10-29 19:03:12.182234	2020-10-29 19:03:12.182234
5766	5	1	5	2	\N	2019-07-15	-238.35	f6b	2020-10-29 19:03:12.183361	2020-10-29 19:03:12.183361
5767	5	1	5	2	\N	2019-07-15	-6.00	ecd	2020-10-29 19:03:12.184695	2020-10-29 19:03:12.184695
5768	5	8	40	2	\N	2019-07-15	-237.90	588	2020-10-29 19:03:12.186169	2020-10-29 19:03:12.186169
5769	6	10	51	3	\N	2019-07-16	-3000.00	2bf	2020-10-29 19:03:12.187388	2020-10-29 19:03:12.187388
5770	5	10	51	4	\N	2019-07-16	3000.00	2bf	2020-10-29 19:03:12.188616	2020-10-29 19:03:12.188616
5771	5	7	27	2	\N	2019-07-16	-810.28	cfa	2020-10-29 19:03:12.189771	2020-10-29 19:03:12.189771
5772	1	7	27	1	\N	2019-07-16	810.28	cfa	2020-10-29 19:03:12.190868	2020-10-29 19:03:12.190868
5773	5	1	5	2	\N	2019-07-18	-8.37	4f6	2020-10-29 19:03:12.192144	2020-10-29 19:03:12.192144
5774	5	1	5	2	\N	2019-07-18	-22.56	99f	2020-10-29 19:03:12.19339	2020-10-29 19:03:12.19339
5775	5	1	5	2	\N	2019-07-18	-20.00	02b	2020-10-29 19:03:12.194483	2020-10-29 19:03:12.194483
5776	5	5	20	2	\N	2019-07-18	-25.99	a7e	2020-10-29 19:03:12.195691	2020-10-29 19:03:12.195691
5777	5	1	5	2	\N	2019-07-18	-3.99	daf	2020-10-29 19:03:12.196932	2020-10-29 19:03:12.196932
5778	2	4	13	2	\N	2019-07-19	-31.99	b50	2020-10-29 19:03:12.198037	2020-10-29 19:03:12.198037
5779	5	1	5	2	\N	2019-07-19	-31.57	193	2020-10-29 19:03:12.199246	2020-10-29 19:03:12.199246
5780	5	1	5	2	\N	2019-07-19	-10.20	f13	2020-10-29 19:03:12.200503	2020-10-29 19:03:12.200503
5781	2	1	5	2	\N	2019-07-19	-5.20	db0	2020-10-29 19:03:12.201949	2020-10-29 19:03:12.201949
5782	5	1	7	2	\N	2019-07-19	-13.90	8c9	2020-10-29 19:03:12.203333	2020-10-29 19:03:12.203333
5783	5	7	33	2	\N	2019-07-19	-44.66	d21	2020-10-29 19:03:12.204481	2020-10-29 19:03:12.204481
5784	1	9	50	3	\N	2019-07-19	-47.27	536	2020-10-29 19:03:12.205726	2020-10-29 19:03:12.205726
5785	1	9	50	3	\N	2019-07-19	-790.00	536	2020-10-29 19:03:12.207014	2020-10-29 19:03:12.207014
5786	1	2	-1	4	\N	2019-07-19	500.00	458	2020-10-29 19:03:12.208086	2020-10-29 19:03:12.208086
5787	1	7	28	2	\N	2019-07-19	-97.50	548	2020-10-29 19:03:12.20915	2020-10-29 19:03:12.20915
5788	1	9	46	2	\N	2019-07-19	-67.18	f3f	2020-10-29 19:03:12.210151	2020-10-29 19:03:12.210151
5789	1	9	45	2	\N	2019-07-19	-100.00	19d	2020-10-29 19:03:12.211196	2020-10-29 19:03:12.211196
5790	1	9	46	2	\N	2019-07-19	-629.03	371	2020-10-29 19:03:12.212366	2020-10-29 19:03:12.212366
5791	5	1	5	2	\N	2019-07-19	-499.34	20c	2020-10-29 19:03:12.213623	2020-10-29 19:03:12.213623
5792	5	1	5	2	\N	2019-07-19	-1.35	473	2020-10-29 19:03:12.214906	2020-10-29 19:03:12.214906
5793	5	9	45	2	\N	2019-07-19	-140.98	b35	2020-10-29 19:03:12.216184	2020-10-29 19:03:12.216184
5794	2	9	45	2	\N	2019-07-23	-49.98	c37	2020-10-29 19:03:12.21752	2020-10-29 19:03:12.21752
5795	5	9	45	2	\N	2019-07-23	-39.99	3ca	2020-10-29 19:03:12.219199	2020-10-29 19:03:12.219199
5796	2	5	23	2	\N	2019-07-23	-41.53	c42	2020-10-29 19:03:12.220517	2020-10-29 19:03:12.220517
5797	5	1	5	2	\N	2019-07-23	-7.48	c04	2020-10-29 19:03:12.221613	2020-10-29 19:03:12.221613
5798	5	1	5	2	\N	2019-07-23	-3.60	f13	2020-10-29 19:03:12.222666	2020-10-29 19:03:12.222666
5799	2	6	24	2	\N	2019-07-23	-52.96	f52	2020-10-29 19:03:12.223672	2020-10-29 19:03:12.223672
5800	2	9	-1	1	\N	2019-07-25	29.99	9bc	2020-10-29 19:03:12.224702	2020-10-29 19:03:12.224702
5801	2	5	18	2	\N	2019-07-25	-28.27	37a	2020-10-29 19:03:12.225878	2020-10-29 19:03:12.225878
5802	5	1	5	2	\N	2019-07-25	-9.56	07d	2020-10-29 19:03:12.227023	2020-10-29 19:03:12.227023
5803	2	1	6	2	\N	2019-07-25	-36.00	c8d	2020-10-29 19:03:12.228106	2020-10-29 19:03:12.228106
5804	5	4	13	2	\N	2019-07-26	-49.90	97a	2020-10-29 19:03:12.229132	2020-10-29 19:03:12.229132
5805	2	9	44	2	\N	2019-07-25	-50.00	614	2020-10-29 19:03:12.230138	2020-10-29 19:03:12.230138
5806	5	1	5	2	\N	2019-07-29	-9.80	f13	2020-10-29 19:03:12.231155	2020-10-29 19:03:12.231155
5807	5	7	35	2	\N	2019-07-28	-30.00	022	2020-10-29 19:03:12.232149	2020-10-29 19:03:12.232149
5808	5	7	35	2	\N	2019-07-28	-26.00	47c	2020-10-29 19:03:12.233208	2020-10-29 19:03:12.233208
5809	5	5	20	2	\N	2019-07-31	-107.73	4ba	2020-10-29 19:03:12.234286	2020-10-29 19:03:12.234286
5810	2	6	24	2	\N	2019-07-31	-29.90	6c3	2020-10-29 19:03:12.236291	2020-10-29 19:03:12.236291
5811	2	6	24	2	\N	2019-07-31	-64.97	91d	2020-10-29 19:03:12.237534	2020-10-29 19:03:12.237534
5812	2	2	1	1	\N	2019-07-29	7147.43	3b8	2020-10-29 19:03:12.238812	2020-10-29 19:03:12.238812
5813	2	10	51	3	\N	2019-07-29	-4500.00	acf	2020-10-29 19:03:12.240164	2020-10-29 19:03:12.240164
5814	5	10	51	4	\N	2019-07-29	4500.00	acf	2020-10-29 19:03:12.241707	2020-10-29 19:03:12.241707
5815	5	1	5	2	\N	2019-08-01	-214.90	9f1	2020-10-29 19:03:12.243169	2020-10-29 19:03:12.243169
5816	5	5	20	2	\N	2019-08-01	-19.95	010	2020-10-29 19:03:12.244441	2020-10-29 19:03:12.244441
5817	5	4	10	2	\N	2019-08-02	-412.74	8a8	2020-10-29 19:03:12.245682	2020-10-29 19:03:12.245682
5818	5	4	12	2	\N	2019-08-02	-102.00	070	2020-10-29 19:03:12.24687	2020-10-29 19:03:12.24687
5819	5	10	51	4	\N	2019-08-01	4000.00	039	2020-10-29 19:03:12.248139	2020-10-29 19:03:12.248139
5820	1	10	51	4	\N	2019-08-01	3740.00	039	2020-10-29 19:03:12.249442	2020-10-29 19:03:12.249442
5821	1	7	33	2	\N	2019-08-01	-60.94	251	2020-10-29 19:03:12.25089	2020-10-29 19:03:12.25089
5822	1	2	-1	3	\N	2019-08-01	-263.00	576	2020-10-29 19:03:12.252698	2020-10-29 19:03:12.252698
5823	1	2	-1	3	\N	2019-08-01	-23.34	576	2020-10-29 19:03:12.25413	2020-10-29 19:03:12.25413
5824	5	9	50	3	\N	2019-08-01	-500.00	6ae	2020-10-29 19:03:12.255766	2020-10-29 19:03:12.255766
5825	5	9	50	3	\N	2019-08-01	-4500.00	516	2020-10-29 19:03:12.257223	2020-10-29 19:03:12.257223
5826	6	10	51	4	\N	2019-08-01	4500.00	516	2020-10-29 19:03:12.258439	2020-10-29 19:03:12.258439
5827	5	2	-1	1	\N	2019-08-01	500.00	06a	2020-10-29 19:03:12.25959	2020-10-29 19:03:12.25959
5828	5	9	50	3	\N	2019-08-01	-500.00	06a	2020-10-29 19:03:12.260849	2020-10-29 19:03:12.260849
5829	6	10	52	1	\N	2019-08-01	5.67	1a8	2020-10-29 19:03:12.262195	2020-10-29 19:03:12.262195
5830	1	9	50	3	\N	2019-08-01	-3000.00	bbb	2020-10-29 19:03:12.263735	2020-10-29 19:03:12.263735
5831	1	1	7	2	\N	2019-08-01	-2.80	78a	2020-10-29 19:03:12.265096	2020-10-29 19:03:12.265096
5832	1	8	38	2	\N	2019-08-01	-45.00	1bf	2020-10-29 19:03:12.266454	2020-10-29 19:03:12.266454
5833	1	9	48	2	\N	2019-08-01	-120.00	a99	2020-10-29 19:03:12.268007	2020-10-29 19:03:12.268007
5834	1	1	6	2	\N	2019-08-01	-190.00	e84	2020-10-29 19:03:12.269329	2020-10-29 19:03:12.269329
5835	1	1	8	2	\N	2019-08-01	-4.59	d04	2020-10-29 19:03:12.270762	2020-10-29 19:03:12.270762
5836	1	1	8	2	\N	2019-08-01	-3.99	981	2020-10-29 19:03:12.271922	2020-10-29 19:03:12.271922
5837	1	9	-1	2	\N	2019-08-01	-57.00	cf5	2020-10-29 19:03:12.273208	2020-10-29 19:03:12.273208
5838	1	1	8	2	\N	2019-08-01	-8.48	e36	2020-10-29 19:03:12.27433	2020-10-29 19:03:12.27433
5839	5	1	5	2	\N	2019-08-01	-2.49	07d	2020-10-29 19:03:12.275581	2020-10-29 19:03:12.275581
5840	5	1	5	2	\N	2019-08-01	-151.69	e5f	2020-10-29 19:03:12.276828	2020-10-29 19:03:12.276828
5841	1	9	50	3	\N	2019-08-01	-30.00	7ab	2020-10-29 19:03:12.278116	2020-10-29 19:03:12.278116
5842	5	2	2	4	\N	2019-08-01	30.00	7ab	2020-10-29 19:03:12.279358	2020-10-29 19:03:12.279358
5843	5	1	5	2	\N	2019-08-01	-8.73	473	2020-10-29 19:03:12.280457	2020-10-29 19:03:12.280457
5844	5	9	-1	2	\N	2019-08-01	-21.27	fd0	2020-10-29 19:03:12.281635	2020-10-29 19:03:12.281635
5845	1	2	2	1	\N	2019-08-02	0.00	809	2020-10-29 19:03:12.282882	2020-10-29 19:03:12.282882
5846	5	9	50	3	\N	2019-08-04	-200.00	02c	2020-10-29 19:03:12.284404	2020-10-29 19:03:12.284404
5847	5	1	5	2	\N	2019-08-05	-62.87	65c	2020-10-29 19:03:12.286006	2020-10-29 19:03:12.286006
5848	5	8	40	2	\N	2019-08-05	-195.18	a0d	2020-10-29 19:03:12.287607	2020-10-29 19:03:12.287607
5849	2	9	44	2	\N	2019-08-06	-50.00	968	2020-10-29 19:03:12.289056	2020-10-29 19:03:12.289056
5850	1	9	50	3	\N	2019-08-06	-200.00	abf	2020-10-29 19:03:12.290417	2020-10-29 19:03:12.290417
5851	1	1	7	2	\N	2019-08-09	-6.99	7b3	2020-10-29 19:03:12.291697	2020-10-29 19:03:12.291697
5852	1	1	4	2	\N	2019-08-09	-11.00	f04	2020-10-29 19:03:12.292989	2020-10-29 19:03:12.292989
5853	1	1	7	2	\N	2019-08-08	-18.02	c2d	2020-10-29 19:03:12.294156	2020-10-29 19:03:12.294156
5854	1	1	8	2	\N	2019-08-06	-3.00	9e7	2020-10-29 19:03:12.295336	2020-10-29 19:03:12.295336
5855	1	1	7	2	\N	2019-08-06	-16.86	914	2020-10-29 19:03:12.296407	2020-10-29 19:03:12.296407
5856	5	1	5	2	\N	2019-08-09	-11.59	473	2020-10-29 19:03:12.29819	2020-10-29 19:03:12.29819
5857	5	1	5	2	\N	2019-08-09	-170.53	e5f	2020-10-29 19:03:12.299309	2020-10-29 19:03:12.299309
5858	5	4	14	2	\N	2019-08-11	-479.00	089	2020-10-29 19:03:12.300673	2020-10-29 19:03:12.300673
5859	5	4	14	2	\N	2019-08-11	-226.00	4d5	2020-10-29 19:03:12.302104	2020-10-29 19:03:12.302104
5860	5	2	2	1	\N	2019-08-11	22.44	72b	2020-10-29 19:03:12.303443	2020-10-29 19:03:12.303443
5861	5	2	2	1	\N	2019-08-11	6.99	72b	2020-10-29 19:03:12.304748	2020-10-29 19:03:12.304748
5862	5	4	13	2	\N	2019-08-06	-70.00	e3c	2020-10-29 19:03:12.306047	2020-10-29 19:03:12.306047
5863	5	9	45	2	\N	2019-08-06	-100.00	427	2020-10-29 19:03:12.307235	2020-10-29 19:03:12.307235
5864	5	1	6	2	\N	2019-08-16	-210.30	87b	2020-10-29 19:03:12.308467	2020-10-29 19:03:12.308467
5865	5	1	8	2	\N	2019-08-16	-4.00	9e7	2020-10-29 19:03:12.309609	2020-10-29 19:03:12.309609
5866	5	1	6	2	\N	2019-08-16	-5.73	07b	2020-10-29 19:03:12.310846	2020-10-29 19:03:12.310846
5867	5	7	36	2	\N	2019-08-16	-11.00	f2d	2020-10-29 19:03:12.311967	2020-10-29 19:03:12.311967
5868	5	7	36	2	\N	2019-08-16	-24.00	36a	2020-10-29 19:03:12.313099	2020-10-29 19:03:12.313099
5869	5	7	35	2	\N	2019-08-15	-62.00	1cc	2020-10-29 19:03:12.31418	2020-10-29 19:03:12.31418
5870	5	1	5	2	\N	2019-08-15	-19.96	6ee	2020-10-29 19:03:12.315734	2020-10-29 19:03:12.315734
5871	5	1	5	2	\N	2019-08-14	-170.86	e7e	2020-10-29 19:03:12.317027	2020-10-29 19:03:12.317027
5872	5	1	8	2	\N	2019-08-14	-3.00	9e7	2020-10-29 19:03:12.318347	2020-10-29 19:03:12.318347
5873	5	1	5	2	\N	2019-08-12	-4.08	473	2020-10-29 19:03:12.319544	2020-10-29 19:03:12.319544
5874	5	8	40	2	\N	2019-08-12	-246.05	23d	2020-10-29 19:03:12.320552	2020-10-29 19:03:12.320552
5875	1	9	50	3	\N	2019-08-16	-30.00	576	2020-10-29 19:03:12.321623	2020-10-29 19:03:12.321623
5876	1	7	32	2	\N	2019-08-17	-199.00	66c	2020-10-29 19:03:12.322648	2020-10-29 19:03:12.322648
5877	1	1	5	2	\N	2019-08-15	-1.39	d9a	2020-10-29 19:03:12.323693	2020-10-29 19:03:12.323693
5878	1	9	46	2	\N	2019-08-14	-35.67	b0c	2020-10-29 19:03:12.324686	2020-10-29 19:03:12.324686
5879	1	9	46	2	\N	2019-08-14	-37.99	11f	2020-10-29 19:03:12.325742	2020-10-29 19:03:12.325742
5880	1	9	46	2	\N	2019-08-14	-49.64	897	2020-10-29 19:03:12.326741	2020-10-29 19:03:12.326741
5881	1	9	46	2	\N	2019-08-14	-259.38	f5a	2020-10-29 19:03:12.327752	2020-10-29 19:03:12.327752
5882	1	2	-1	4	\N	2019-08-14	1500.00	025	2020-10-29 19:03:12.328764	2020-10-29 19:03:12.328764
5883	5	2	-1	4	\N	2019-08-18	1800.00	891	2020-10-29 19:03:12.329842	2020-10-29 19:03:12.329842
5884	1	9	45	2	\N	2019-08-18	-150.00	d56	2020-10-29 19:03:12.330896	2020-10-29 19:03:12.330896
5885	1	1	6	2	\N	2019-08-18	-162.00	c86	2020-10-29 19:03:12.331942	2020-10-29 19:03:12.331942
5886	5	7	27	2	\N	2019-08-18	-580.25	6b6	2020-10-29 19:03:12.333045	2020-10-29 19:03:12.333045
5887	2	6	24	2	\N	2019-08-17	-75.50	fcd	2020-10-29 19:03:12.334095	2020-10-29 19:03:12.334095
5888	2	6	24	2	\N	2019-08-17	-169.97	d69	2020-10-29 19:03:12.335411	2020-10-29 19:03:12.335411
5889	2	5	18	2	\N	2019-08-13	-13.59	547	2020-10-29 19:03:12.3365	2020-10-29 19:03:12.3365
5890	2	4	15	2	\N	2019-08-14	-25.00	de2	2020-10-29 19:03:12.337582	2020-10-29 19:03:12.337582
5891	2	9	45	1	\N	2019-08-14	150.00	211	2020-10-29 19:03:12.338768	2020-10-29 19:03:12.338768
5892	2	10	51	3	\N	2019-08-10	-500.00	22a	2020-10-29 19:03:12.33993	2020-10-29 19:03:12.33993
5893	4	10	51	4	\N	2019-08-10	500.00	22a	2020-10-29 19:03:12.341103	2020-10-29 19:03:12.341103
5894	5	5	20	2	\N	2019-08-19	-72.14	d1f	2020-10-29 19:03:12.342437	2020-10-29 19:03:12.342437
5895	2	1	7	2	\N	2019-08-20	-16.00	a0f	2020-10-29 19:03:12.343573	2020-10-29 19:03:12.343573
5896	2	6	24	2	\N	2019-08-20	-13.00	6e4	2020-10-29 19:03:12.344659	2020-10-29 19:03:12.344659
5897	5	1	5	2	\N	2019-08-20	-7.70	f13	2020-10-29 19:03:12.345968	2020-10-29 19:03:12.345968
5898	5	1	5	2	\N	2019-08-21	-22.22	153	2020-10-29 19:03:12.34716	2020-10-29 19:03:12.34716
5899	1	9	50	3	\N	2019-08-23	-25.80	576	2020-10-29 19:03:12.34836	2020-10-29 19:03:12.34836
5900	1	5	18	2	\N	2019-08-20	-65.35	0f2	2020-10-29 19:03:12.349414	2020-10-29 19:03:12.349414
5901	1	5	22	2	\N	2019-08-20	-50.00	9da	2020-10-29 19:03:12.350482	2020-10-29 19:03:12.350482
5902	1	1	6	2	\N	2019-08-21	-39.00	fd3	2020-10-29 19:03:12.35209	2020-10-29 19:03:12.35209
5903	1	3	-1	2	\N	2019-08-20	-43.00	2df	2020-10-29 19:03:12.353238	2020-10-29 19:03:12.353238
5904	1	1	6	2	\N	2019-08-20	-30.00	07b	2020-10-29 19:03:12.354279	2020-10-29 19:03:12.354279
5905	1	9	46	2	\N	2019-08-20	-197.00	15f	2020-10-29 19:03:12.35547	2020-10-29 19:03:12.35547
5906	5	1	5	2	\N	2019-08-24	-53.04	aec	2020-10-29 19:03:12.356547	2020-10-29 19:03:12.356547
5907	5	8	40	2	\N	2019-08-23	-233.81	d6e	2020-10-29 19:03:12.357578	2020-10-29 19:03:12.357578
5908	5	4	13	2	\N	2019-08-23	-49.90	97a	2020-10-29 19:03:12.358674	2020-10-29 19:03:12.358674
5909	2	9	44	2	\N	2019-08-26	-50.00	09e	2020-10-29 19:03:12.359809	2020-10-29 19:03:12.359809
5910	2	4	13	2	\N	2019-08-27	-30.30	54d	2020-10-29 19:03:12.360959	2020-10-29 19:03:12.360959
5911	2	1	7	2	\N	2019-08-23	-13.90	fe4	2020-10-29 19:03:12.362163	2020-10-29 19:03:12.362163
5912	5	1	5	2	\N	2019-08-28	-139.63	543	2020-10-29 19:03:12.363311	2020-10-29 19:03:12.363311
5913	5	1	5	2	\N	2019-08-27	-10.20	ecd	2020-10-29 19:03:12.364462	2020-10-29 19:03:12.364462
5914	5	1	4	2	\N	2019-08-27	-20.40	f04	2020-10-29 19:03:12.365697	2020-10-29 19:03:12.365697
5915	2	2	1	1	\N	2019-08-28	10294.99	5d9	2020-10-29 19:03:12.367117	2020-10-29 19:03:12.367117
5916	2	10	51	3	\N	2019-08-28	-1500.00	375	2020-10-29 19:03:12.368783	2020-10-29 19:03:12.368783
5917	4	10	51	4	\N	2019-08-28	1500.00	375	2020-10-29 19:03:12.370668	2020-10-29 19:03:12.370668
5918	2	10	51	3	\N	2019-08-28	-800.00	065	2020-10-29 19:03:12.371807	2020-10-29 19:03:12.371807
5919	2	10	51	3	\N	2019-08-28	-6000.00	efb	2020-10-29 19:03:12.373001	2020-10-29 19:03:12.373001
5920	5	10	51	4	\N	2019-08-28	6000.00	efb	2020-10-29 19:03:12.374245	2020-10-29 19:03:12.374245
5921	5	10	51	3	\N	2019-08-28	-2500.00	059	2020-10-29 19:03:12.375453	2020-10-29 19:03:12.375453
5922	6	10	51	4	\N	2019-08-28	2500.00	059	2020-10-29 19:03:12.376663	2020-10-29 19:03:12.376663
5923	5	5	20	2	\N	2019-08-28	-23.98	010	2020-10-29 19:03:12.377937	2020-10-29 19:03:12.377937
5924	5	5	23	2	\N	2019-08-28	-13.99	3e7	2020-10-29 19:03:12.37913	2020-10-29 19:03:12.37913
5925	5	5	20	2	\N	2019-08-28	-10.38	183	2020-10-29 19:03:12.380291	2020-10-29 19:03:12.380291
5926	2	8	41	2	\N	2019-08-28	-15.95	09d	2020-10-29 19:03:12.381388	2020-10-29 19:03:12.381388
5927	2	1	6	2	\N	2019-08-28	-35.00	b4d	2020-10-29 19:03:12.382422	2020-10-29 19:03:12.382422
5928	2	5	20	1	\N	2019-08-29	202.17	489	2020-10-29 19:03:12.383502	2020-10-29 19:03:12.383502
5929	5	5	20	1	\N	2019-08-29	7.00	5ef	2020-10-29 19:03:12.384706	2020-10-29 19:03:12.384706
5930	5	1	5	2	\N	2019-08-30	-34.66	d41	2020-10-29 19:03:12.386084	2020-10-29 19:03:12.386084
5931	5	4	10	2	\N	2019-08-30	-392.95	297	2020-10-29 19:03:12.387343	2020-10-29 19:03:12.387343
5932	5	4	11	2	\N	2019-08-30	-103.26	fec	2020-10-29 19:03:12.388523	2020-10-29 19:03:12.388523
5933	5	4	11	2	\N	2019-08-30	-58.59	420	2020-10-29 19:03:12.389653	2020-10-29 19:03:12.389653
5934	5	10	51	4	\N	2019-08-30	5000.00	b20	2020-10-29 19:03:12.390829	2020-10-29 19:03:12.390829
5935	1	10	51	4	\N	2019-08-30	3596.39	5fd	2020-10-29 19:03:12.392053	2020-10-29 19:03:12.392053
5936	1	9	48	2	\N	2019-08-30	-120.00	a99	2020-10-29 19:03:12.393299	2020-10-29 19:03:12.393299
5937	1	9	50	3	\N	2019-08-30	-88.00	a76	2020-10-29 19:03:12.394522	2020-10-29 19:03:12.394522
5938	1	9	50	3	\N	2019-08-30	-1500.00	499	2020-10-29 19:03:12.395554	2020-10-29 19:03:12.395554
5939	1	8	38	2	\N	2019-08-30	-45.00	16e	2020-10-29 19:03:12.396639	2020-10-29 19:03:12.396639
5940	1	9	50	3	\N	2019-08-30	-500.00	d5d	2020-10-29 19:03:12.397905	2020-10-29 19:03:12.397905
5941	1	1	7	2	\N	2019-08-30	-17.40	af9	2020-10-29 19:03:12.399127	2020-10-29 19:03:12.399127
5942	6	10	52	1	\N	2019-08-31	9.49	1a8	2020-10-29 19:03:12.400438	2020-10-29 19:03:12.400438
5943	5	1	8	2	\N	2019-09-01	-16.00	e62	2020-10-29 19:03:12.401946	2020-10-29 19:03:12.401946
5944	5	9	50	3	\N	2019-09-01	-4000.00	7ec	2020-10-29 19:03:12.403465	2020-10-29 19:03:12.403465
5945	6	10	51	4	\N	2019-09-01	4000.00	7ec	2020-10-29 19:03:12.404824	2020-10-29 19:03:12.404824
5946	5	9	50	3	\N	2019-09-01	-500.00	359	2020-10-29 19:03:12.405868	2020-10-29 19:03:12.405868
5947	5	1	5	2	\N	2019-09-01	-17.96	0da	2020-10-29 19:03:12.407213	2020-10-29 19:03:12.407213
5948	5	1	5	2	\N	2019-09-01	-450.47	20c	2020-10-29 19:03:12.408311	2020-10-29 19:03:12.408311
5949	1	9	50	3	\N	2019-09-01	-360.98	990	2020-10-29 19:03:12.409366	2020-10-29 19:03:12.409366
5950	5	2	-1	4	\N	2019-09-01	360.98	990	2020-10-29 19:03:12.410455	2020-10-29 19:03:12.410455
5951	1	2	1	1	\N	2019-09-01	0.00	809	2020-10-29 19:03:12.411588	2020-10-29 19:03:12.411588
5952	1	7	33	2	\N	2019-09-01	-112.36	866	2020-10-29 19:03:12.412893	2020-10-29 19:03:12.412893
5953	1	7	33	2	\N	2019-09-01	-40.65	866	2020-10-29 19:03:12.414204	2020-10-29 19:03:12.414204
5954	2	5	23	2	\N	2019-09-02	-20.98	628	2020-10-29 19:03:12.415526	2020-10-29 19:03:12.415526
5955	2	9	45	2	\N	2019-09-02	-18.40	37b	2020-10-29 19:03:12.417046	2020-10-29 19:03:12.417046
5956	2	1	5	2	\N	2019-09-02	-1.99	edc	2020-10-29 19:03:12.419353	2020-10-29 19:03:12.419353
5957	5	9	45	2	\N	2019-09-02	-72.32	702	2020-10-29 19:03:12.420931	2020-10-29 19:03:12.420931
5958	2	8	38	2	\N	2019-09-02	-50.00	98c	2020-10-29 19:03:12.422198	2020-10-29 19:03:12.422198
5959	5	4	12	2	\N	2019-09-02	-306.93	013	2020-10-29 19:03:12.423386	2020-10-29 19:03:12.423386
5960	5	9	44	2	\N	2019-09-02	-20.00	4db	2020-10-29 19:03:12.424532	2020-10-29 19:03:12.424532
5961	5	7	29	2	\N	2019-09-03	-101.78	89f	2020-10-29 19:03:12.426101	2020-10-29 19:03:12.426101
5962	5	10	51	3	\N	2019-09-03	-2500.00	abd	2020-10-29 19:03:12.42747	2020-10-29 19:03:12.42747
5963	5	1	5	2	\N	2019-09-04	-5.40	ecd	2020-10-29 19:03:12.42873	2020-10-29 19:03:12.42873
5964	5	1	5	2	\N	2019-09-05	-268.29	cb5	2020-10-29 19:03:12.429932	2020-10-29 19:03:12.429932
5965	5	1	5	2	\N	2019-09-05	-43.88	79e	2020-10-29 19:03:12.431162	2020-10-29 19:03:12.431162
5966	2	1	5	3	\N	2019-09-06	-200.00	738	2020-10-29 19:03:12.432414	2020-10-29 19:03:12.432414
5967	5	1	5	4	\N	2019-09-06	200.00	738	2020-10-29 19:03:12.4337	2020-10-29 19:03:12.4337
5968	5	8	40	2	\N	2019-09-06	-245.64	a4d	2020-10-29 19:03:12.434986	2020-10-29 19:03:12.434986
5969	5	9	44	2	\N	2019-09-06	-40.00	ae0	2020-10-29 19:03:12.436274	2020-10-29 19:03:12.436274
5970	5	9	45	2	\N	2019-09-07	-34.99	ae0	2020-10-29 19:03:12.43741	2020-10-29 19:03:12.43741
5971	5	1	5	2	\N	2019-09-07	-99.02	3bd	2020-10-29 19:03:12.438634	2020-10-29 19:03:12.438634
5972	1	9	50	3	\N	2019-09-07	-40.00	227	2020-10-29 19:03:12.4398	2020-10-29 19:03:12.4398
5973	5	2	2	4	\N	2019-09-07	40.00	227	2020-10-29 19:03:12.440814	2020-10-29 19:03:12.440814
5974	5	4	13	2	\N	2019-09-07	-70.00	d5d	2020-10-29 19:03:12.441763	2020-10-29 19:03:12.441763
5975	5	1	5	2	\N	2019-09-07	-6.80	07d	2020-10-29 19:03:12.442717	2020-10-29 19:03:12.442717
5976	1	9	50	3	\N	2019-09-07	-71.91	ec0	2020-10-29 19:03:12.44369	2020-10-29 19:03:12.44369
5977	1	2	2	1	\N	2019-09-08	46.20	6ad	2020-10-29 19:03:12.444673	2020-10-29 19:03:12.444673
5978	1	1	8	2	\N	2019-09-08	-14.00	d93	2020-10-29 19:03:12.44563	2020-10-29 19:03:12.44563
5979	1	1	8	2	\N	2019-09-08	-2.80	f15	2020-10-29 19:03:12.446564	2020-10-29 19:03:12.446564
5980	1	9	50	3	\N	2019-09-04	-60.99	ec0	2020-10-29 19:03:12.447493	2020-10-29 19:03:12.447493
5981	1	9	50	3	\N	2019-09-08	-200.00	576	2020-10-29 19:03:12.448378	2020-10-29 19:03:12.448378
5982	2	9	45	2	\N	2019-09-07	-7.99	987	2020-10-29 19:03:12.449348	2020-10-29 19:03:12.449348
5983	5	1	5	2	\N	2019-09-10	-8.73	ecd	2020-10-29 19:03:12.45033	2020-10-29 19:03:12.45033
5984	2	9	48	2	\N	2019-09-11	-100.00	f9c	2020-10-29 19:03:12.451364	2020-10-29 19:03:12.451364
5985	5	5	20	2	\N	2019-09-11	-16.65	809	2020-10-29 19:03:12.452558	2020-10-29 19:03:12.452558
5986	5	1	8	2	\N	2019-09-12	-2.00	510	2020-10-29 19:03:12.453546	2020-10-29 19:03:12.453546
5987	5	1	5	2	\N	2019-09-12	-8.94	07d	2020-10-29 19:03:12.454489	2020-10-29 19:03:12.454489
5988	5	5	20	2	\N	2019-09-12	-32.97	365	2020-10-29 19:03:12.455499	2020-10-29 19:03:12.455499
5989	2	6	24	2	\N	2019-09-12	-14.00	aad	2020-10-29 19:03:12.456454	2020-10-29 19:03:12.456454
5990	5	1	5	2	\N	2019-09-12	-80.31	6ee	2020-10-29 19:03:12.457383	2020-10-29 19:03:12.457383
5991	2	4	15	2	\N	2019-09-12	-25.00	61f	2020-10-29 19:03:12.458316	2020-10-29 19:03:12.458316
5992	5	1	6	2	\N	2019-09-16	-12.40	9df	2020-10-29 19:03:12.459294	2020-10-29 19:03:12.459294
5993	5	8	40	2	\N	2019-09-15	-36.20	e3e	2020-10-29 19:03:12.460239	2020-10-29 19:03:12.460239
5994	5	8	40	2	\N	2019-09-15	-189.38	450	2020-10-29 19:03:12.461195	2020-10-29 19:03:12.461195
5995	5	8	40	2	\N	2019-09-14	-36.20	974	2020-10-29 19:03:12.462127	2020-10-29 19:03:12.462127
5996	1	7	32	2	\N	2019-09-13	-19.96	14a	2020-10-29 19:03:12.46306	2020-10-29 19:03:12.46306
5997	1	8	38	2	\N	2019-09-11	-30.57	23b	2020-10-29 19:03:12.463982	2020-10-29 19:03:12.463982
5998	1	9	46	2	\N	2019-09-11	-489.53	3d4	2020-10-29 19:03:12.464925	2020-10-29 19:03:12.464925
5999	5	9	-1	3	\N	2019-09-16	-200.00	a3a	2020-10-29 19:03:12.465971	2020-10-29 19:03:12.465971
6000	2	9	-1	4	\N	2019-09-16	200.00	a3a	2020-10-29 19:03:12.466989	2020-10-29 19:03:12.466989
6001	2	4	13	2	\N	2019-09-16	-29.99	f94	2020-10-29 19:03:12.46813	2020-10-29 19:03:12.46813
6002	4	9	-1	3	\N	2019-09-17	-500.00	d1b	2020-10-29 19:03:12.469339	2020-10-29 19:03:12.469339
6003	2	9	-1	4	\N	2019-09-17	500.00	d1b	2020-10-29 19:03:12.470414	2020-10-29 19:03:12.470414
6004	2	8	41	2	\N	2019-09-16	-4.50	f45	2020-10-29 19:03:12.471585	2020-10-29 19:03:12.471585
6005	5	5	23	3	\N	2019-09-17	-37.43	013	2020-10-29 19:03:12.472631	2020-10-29 19:03:12.472631
6006	2	5	23	4	\N	2019-09-17	37.43	013	2020-10-29 19:03:12.473656	2020-10-29 19:03:12.473656
6007	2	9	-1	2	\N	2019-09-17	-2.90	3f3	2020-10-29 19:03:12.474737	2020-10-29 19:03:12.474737
6008	5	1	5	2	\N	2019-09-17	-14.59	35b	2020-10-29 19:03:12.475785	2020-10-29 19:03:12.475785
6009	2	1	5	2	\N	2019-09-21	-46.74	d0d	2020-10-29 19:03:12.476813	2020-10-29 19:03:12.476813
6010	1	4	15	2	\N	2019-09-21	-1.00	972	2020-10-29 19:03:12.477833	2020-10-29 19:03:12.477833
6011	1	8	39	2	\N	2019-09-20	-98.00	cd1	2020-10-29 19:03:12.478903	2020-10-29 19:03:12.478903
6012	5	10	51	4	\N	2019-09-27	500.00	525	2020-10-29 19:03:12.480236	2020-10-29 19:03:12.480236
6013	6	9	50	3	\N	2019-09-20	-2000.00	1bb	2020-10-29 19:03:12.481314	2020-10-29 19:03:12.481314
6014	5	2	-1	4	\N	2019-09-20	2000.00	1bb	2020-10-29 19:03:12.482365	2020-10-29 19:03:12.482365
6015	5	1	5	2	\N	2019-09-27	-70.32	6ee	2020-10-29 19:03:12.48344	2020-10-29 19:03:12.48344
6016	5	1	5	2	\N	2019-09-27	-3.49	f7d	2020-10-29 19:03:12.484473	2020-10-29 19:03:12.484473
6017	5	1	5	2	\N	2019-09-28	-81.54	d0d	2020-10-29 19:03:12.485572	2020-10-29 19:03:12.485572
6018	2	9	50	3	\N	2019-09-26	-64.47	6b3	2020-10-29 19:03:12.486622	2020-10-29 19:03:12.486622
6019	5	9	50	4	\N	2019-09-26	64.47	6b3	2020-10-29 19:03:12.487646	2020-10-29 19:03:12.487646
6020	5	7	27	2	\N	2019-09-29	-1468.80	681	2020-10-29 19:03:12.488682	2020-10-29 19:03:12.488682
6021	5	1	5	2	\N	2019-09-23	-104.89	20c	2020-10-29 19:03:12.489646	2020-10-29 19:03:12.489646
6022	5	1	5	2	\N	2019-09-21	-6.56	f62	2020-10-29 19:03:12.490723	2020-10-29 19:03:12.490723
6023	2	9	-1	2	\N	2019-09-26	-100.00	5e0	2020-10-29 19:03:12.491748	2020-10-29 19:03:12.491748
6024	2	6	24	2	\N	2019-09-26	-139.99	b64	2020-10-29 19:03:12.492772	2020-10-29 19:03:12.492772
6025	2	2	1	1	\N	2019-09-26	5422.54	8d3	2020-10-29 19:03:12.49424	2020-10-29 19:03:12.49424
6026	2	10	51	3	\N	2019-09-28	-3000.00	e83	2020-10-29 19:03:12.495377	2020-10-29 19:03:12.495377
6027	5	10	51	4	\N	2019-09-28	3000.00	e83	2020-10-29 19:03:12.496355	2020-10-29 19:03:12.496355
6028	5	9	50	3	\N	2019-09-28	-277.20	b91	2020-10-29 19:03:12.497404	2020-10-29 19:03:12.497404
6029	2	9	50	4	\N	2019-09-28	277.20	b91	2020-10-29 19:03:12.498352	2020-10-29 19:03:12.498352
6030	5	4	10	2	\N	2019-09-28	-392.95	e70	2020-10-29 19:03:12.499689	2020-10-29 19:03:12.499689
6031	5	4	13	2	\N	2019-09-28	-49.90	b9b	2020-10-29 19:03:12.500795	2020-10-29 19:03:12.500795
6032	5	1	5	2	\N	2019-09-28	-8.55	b27	2020-10-29 19:03:12.502288	2020-10-29 19:03:12.502288
6033	2	6	24	2	\N	2019-09-29	-32.90	522	2020-10-29 19:03:12.503377	2020-10-29 19:03:12.503377
6034	2	6	24	2	\N	2019-09-29	-35.80	0a5	2020-10-29 19:03:12.504396	2020-10-29 19:03:12.504396
6035	2	6	24	2	\N	2019-09-29	-85.97	f2f	2020-10-29 19:03:12.505471	2020-10-29 19:03:12.505471
6036	2	6	24	2	\N	2019-09-29	-91.56	7eb	2020-10-29 19:03:12.506484	2020-10-29 19:03:12.506484
6037	5	2	-1	4	\N	2019-10-01	3000.00	7ce	2020-10-29 19:03:12.507453	2020-10-29 19:03:12.507453
6038	5	9	50	3	\N	2019-10-01	-1000.00	7ec	2020-10-29 19:03:12.508418	2020-10-29 19:03:12.508418
6039	6	2	-1	4	\N	2019-10-01	1000.00	7ec	2020-10-29 19:03:12.509447	2020-10-29 19:03:12.509447
6040	5	9	50	3	\N	2019-10-01	-500.00	271	2020-10-29 19:03:12.510592	2020-10-29 19:03:12.510592
6041	1	2	-1	4	\N	2019-10-01	4959.14	c88	2020-10-29 19:03:12.511688	2020-10-29 19:03:12.511688
6042	1	9	50	3	\N	2019-10-01	-2000.00	fb1	2020-10-29 19:03:12.512742	2020-10-29 19:03:12.512742
6043	1	9	48	2	\N	2019-10-01	-120.00	a99	2020-10-29 19:03:12.513745	2020-10-29 19:03:12.513745
6044	6	10	52	1	\N	2019-10-01	15.01	15b	2020-10-29 19:03:12.514762	2020-10-29 19:03:12.514762
6045	5	5	18	2	\N	2019-10-01	-21.15	0f2	2020-10-29 19:03:12.515759	2020-10-29 19:03:12.515759
6046	5	1	5	2	\N	2019-10-01	-131.66	e7e	2020-10-29 19:03:12.516874	2020-10-29 19:03:12.516874
6047	5	1	5	2	\N	2019-10-01	-23.00	e7e	2020-10-29 19:03:12.518083	2020-10-29 19:03:12.518083
6048	1	2	1	1	\N	2019-10-01	0.00	809	2020-10-29 19:03:12.519361	2020-10-29 19:03:12.519361
6049	1	8	38	2	\N	2019-10-01	-25.87	94a	2020-10-29 19:03:12.520444	2020-10-29 19:03:12.520444
6050	1	8	38	2	\N	2019-10-01	-45.00	1bf	2020-10-29 19:03:12.521487	2020-10-29 19:03:12.521487
6051	2	5	22	2	\N	2019-10-02	-45.00	4ca	2020-10-29 19:03:12.522678	2020-10-29 19:03:12.522678
6052	2	6	24	2	\N	2019-10-02	-199.99	ce7	2020-10-29 19:03:12.523786	2020-10-29 19:03:12.523786
6053	2	6	24	2	\N	2019-10-02	-74.16	b88	2020-10-29 19:03:12.524878	2020-10-29 19:03:12.524878
6054	2	6	24	1	\N	2019-10-02	139.99	cd4	2020-10-29 19:03:12.525922	2020-10-29 19:03:12.525922
6055	2	6	24	1	\N	2019-10-02	90.86	955	2020-10-29 19:03:12.52696	2020-10-29 19:03:12.52696
6056	2	6	24	1	\N	2019-10-02	50.98	9c7	2020-10-29 19:03:12.528008	2020-10-29 19:03:12.528008
6057	5	4	12	2	\N	2019-10-02	-7.38	772	2020-10-29 19:03:12.529029	2020-10-29 19:03:12.529029
6058	1	1	5	2	\N	2019-10-02	-16.94	e33	2020-10-29 19:03:12.530045	2020-10-29 19:03:12.530045
6059	1	9	50	3	\N	2019-10-03	-70.63	576	2020-10-29 19:03:12.531172	2020-10-29 19:03:12.531172
6060	5	8	40	2	\N	2019-10-02	-207.43	9fe	2020-10-29 19:03:12.53231	2020-10-29 19:03:12.53231
6061	5	5	19	2	\N	2019-10-02	-50.00	2e7	2020-10-29 19:03:12.533673	2020-10-29 19:03:12.533673
6062	5	1	5	2	\N	2019-10-03	-195.92	e7e	2020-10-29 19:03:12.535701	2020-10-29 19:03:12.535701
6063	5	9	45	2	\N	2019-10-03	-44.99	e3f	2020-10-29 19:03:12.537279	2020-10-29 19:03:12.537279
6064	5	9	45	2	\N	2019-10-03	-19.90	e3f	2020-10-29 19:03:12.538492	2020-10-29 19:03:12.538492
6065	2	5	19	2	\N	2019-10-03	-579.98	f6e	2020-10-29 19:03:12.539583	2020-10-29 19:03:12.539583
6066	5	9	44	2	\N	2019-10-03	-3000.00	778	2020-10-29 19:03:12.541139	2020-10-29 19:03:12.541139
6067	5	1	5	2	\N	2019-10-03	-66.20	6ee	2020-10-29 19:03:12.542326	2020-10-29 19:03:12.542326
6068	5	1	5	2	\N	2019-10-04	-15.84	ecd	2020-10-29 19:03:12.54358	2020-10-29 19:03:12.54358
6069	5	1	5	2	\N	2019-10-05	-16.80	d0d	2020-10-29 19:03:12.544702	2020-10-29 19:03:12.544702
6070	5	1	5	2	\N	2019-10-06	-8.60	ecd	2020-10-29 19:03:12.545927	2020-10-29 19:03:12.545927
6071	2	6	24	1	\N	2019-10-07	199.99	53e	2020-10-29 19:03:12.54775	2020-10-29 19:03:12.54775
6072	2	2	1	1	\N	2019-10-07	330.00	ccc	2020-10-29 19:03:12.549449	2020-10-29 19:03:12.549449
6073	5	8	42	2	\N	2019-10-07	-86.00	51d	2020-10-29 19:03:12.551068	2020-10-29 19:03:12.551068
6074	5	1	5	2	\N	2019-10-10	-191.96	6ee	2020-10-29 19:03:12.552684	2020-10-29 19:03:12.552684
6075	5	1	5	2	\N	2019-10-10	-9.66	75c	2020-10-29 19:03:12.553961	2020-10-29 19:03:12.553961
6076	1	1	7	2	\N	2019-10-12	-14.71	e33	2020-10-29 19:03:12.555189	2020-10-29 19:03:12.555189
6077	1	1	8	2	\N	2019-10-12	-2.80	6cf	2020-10-29 19:03:12.556412	2020-10-29 19:03:12.556412
6078	1	1	5	2	\N	2019-10-12	-27.04	9a8	2020-10-29 19:03:12.557576	2020-10-29 19:03:12.557576
6079	1	1	6	2	\N	2019-10-12	-189.00	e4b	2020-10-29 19:03:12.558686	2020-10-29 19:03:12.558686
6080	1	8	41	2	\N	2019-10-12	-50.00	087	2020-10-29 19:03:12.559842	2020-10-29 19:03:12.559842
6081	1	7	32	2	\N	2019-10-12	-20.00	4ec	2020-10-29 19:03:12.561071	2020-10-29 19:03:12.561071
6082	1	5	19	2	\N	2019-10-12	-138.85	bbe	2020-10-29 19:03:12.562202	2020-10-29 19:03:12.562202
6083	1	9	50	3	\N	2019-10-12	-2000.00	039	2020-10-29 19:03:12.563578	2020-10-29 19:03:12.563578
6084	5	1	6	2	\N	2019-10-12	-57.00	f02	2020-10-29 19:03:12.564834	2020-10-29 19:03:12.564834
6085	5	4	13	2	\N	2019-10-12	-70.00	1e5	2020-10-29 19:03:12.565997	2020-10-29 19:03:12.565997
6086	2	4	13	2	\N	2019-10-13	-29.99	fc6	2020-10-29 19:03:12.567335	2020-10-29 19:03:12.567335
6087	5	1	5	2	\N	2019-10-19	-107.19	ead	2020-10-29 19:03:12.569337	2020-10-29 19:03:12.569337
6088	5	1	5	2	\N	2019-10-14	-72.47	d9e	2020-10-29 19:03:12.571322	2020-10-29 19:03:12.571322
6089	5	1	5	2	\N	2019-10-16	-71.28	d9e	2020-10-29 19:03:12.572528	2020-10-29 19:03:12.572528
6090	5	5	20	2	\N	2019-10-18	-117.05	df4	2020-10-29 19:03:12.573603	2020-10-29 19:03:12.573603
6091	2	5	18	2	\N	2019-10-19	-55.97	1f0	2020-10-29 19:03:12.574721	2020-10-29 19:03:12.574721
6092	5	5	18	1	\N	2019-10-19	55.97	1f0	2020-10-29 19:03:12.575838	2020-10-29 19:03:12.575838
6093	5	5	20	2	\N	2019-10-14	-13.47	48c	2020-10-29 19:03:12.577103	2020-10-29 19:03:12.577103
6094	2	5	19	1	\N	2019-10-18	400.00	e61	2020-10-29 19:03:12.578402	2020-10-29 19:03:12.578402
6095	2	8	41	2	\N	2019-10-18	-17.01	0ae	2020-10-29 19:03:12.579791	2020-10-29 19:03:12.579791
6096	5	1	5	2	\N	2019-10-18	-18.32	c34	2020-10-29 19:03:12.581113	2020-10-29 19:03:12.581113
6097	5	9	44	2	\N	2019-10-19	-200.00	6a7	2020-10-29 19:03:12.582434	2020-10-29 19:03:12.582434
6098	5	9	44	2	\N	2019-10-18	-250.00	41a	2020-10-29 19:03:12.583918	2020-10-29 19:03:12.583918
6099	5	5	20	2	\N	2019-10-17	-39.40	858	2020-10-29 19:03:12.585662	2020-10-29 19:03:12.585662
6100	2	4	15	2	\N	2019-10-18	-25.00	de2	2020-10-29 19:03:12.586937	2020-10-29 19:03:12.586937
6101	5	2	-1	1	\N	2019-10-24	130.00	73b	2020-10-29 19:03:12.588098	2020-10-29 19:03:12.588098
6102	5	1	8	2	\N	2019-10-25	-8.10	720	2020-10-29 19:03:12.589338	2020-10-29 19:03:12.589338
6103	5	1	5	2	\N	2019-10-25	-14.32	ecd	2020-10-29 19:03:12.590544	2020-10-29 19:03:12.590544
6104	5	5	20	2	\N	2019-10-25	-17.98	010	2020-10-29 19:03:12.59178	2020-10-29 19:03:12.59178
6105	2	10	51	3	\N	2019-10-25	-500.00	112	2020-10-29 19:03:12.593008	2020-10-29 19:03:12.593008
6106	4	10	51	4	\N	2019-10-25	500.00	112	2020-10-29 19:03:12.594231	2020-10-29 19:03:12.594231
6107	5	2	-1	4	\N	2019-10-25	1000.00	c9c	2020-10-29 19:03:12.595604	2020-10-29 19:03:12.595604
6108	5	1	5	2	\N	2019-10-25	-78.68	749	2020-10-29 19:03:12.596821	2020-10-29 19:03:12.596821
6109	1	9	50	3	\N	2019-10-22	-20.00	5a8	2020-10-29 19:03:12.598047	2020-10-29 19:03:12.598047
6110	1	8	38	2	\N	2019-10-20	-4.60	a3a	2020-10-29 19:03:12.59933	2020-10-29 19:03:12.59933
6111	1	1	4	2	\N	2019-10-20	-55.98	694	2020-10-29 19:03:12.600691	2020-10-29 19:03:12.600691
6112	1	7	32	2	\N	2019-10-21	-25.00	f89	2020-10-29 19:03:12.602095	2020-10-29 19:03:12.602095
6113	1	1	6	2	\N	2019-10-21	-58.40	b02	2020-10-29 19:03:12.60378	2020-10-29 19:03:12.60378
6114	1	7	32	2	\N	2019-10-25	-69.00	ab2	2020-10-29 19:03:12.605085	2020-10-29 19:03:12.605085
6115	1	1	6	2	\N	2019-10-25	-16.37	3c1	2020-10-29 19:03:12.606531	2020-10-29 19:03:12.606531
6116	1	1	8	2	\N	2019-10-25	-26.86	997	2020-10-29 19:03:12.608091	2020-10-29 19:03:12.608091
6117	1	1	6	2	\N	2019-10-25	-13.00	48d	2020-10-29 19:03:12.609515	2020-10-29 19:03:12.609515
6118	1	1	4	2	\N	2019-10-25	-7.00	694	2020-10-29 19:03:12.611033	2020-10-29 19:03:12.611033
6119	1	9	45	2	\N	2019-10-25	-15.00	3e6	2020-10-29 19:03:12.612412	2020-10-29 19:03:12.612412
6120	1	3	-1	2	\N	2019-10-25	-83.99	4ad	2020-10-29 19:03:12.613722	2020-10-29 19:03:12.613722
6121	1	1	8	2	\N	2019-10-25	-2.80	6cf	2020-10-29 19:03:12.61492	2020-10-29 19:03:12.61492
6122	1	9	50	3	\N	2019-10-25	-20.00	5a8	2020-10-29 19:03:12.616142	2020-10-29 19:03:12.616142
6123	1	9	-1	2	\N	2019-10-25	-2.20	d54	2020-10-29 19:03:12.617534	2020-10-29 19:03:12.617534
6124	1	1	7	2	\N	2019-10-25	-3.50	c6e	2020-10-29 19:03:12.618985	2020-10-29 19:03:12.618985
6125	1	2	-1	4	\N	2019-10-25	533.79	5bc	2020-10-29 19:03:12.620426	2020-10-29 19:03:12.620426
6126	1	9	46	2	\N	2019-10-25	-230.64	5ff	2020-10-29 19:03:12.621784	2020-10-29 19:03:12.621784
6127	1	1	5	2	\N	2019-10-25	-1.80	d9a	2020-10-29 19:03:12.623024	2020-10-29 19:03:12.623024
6128	5	8	40	2	\N	2019-10-25	-80.00	e0d	2020-10-29 19:03:12.62423	2020-10-29 19:03:12.62423
6129	5	1	5	2	\N	2019-10-25	-50.00	749	2020-10-29 19:03:12.625768	2020-10-29 19:03:12.625768
6130	2	8	37	2	\N	2019-10-26	-7.00	38b	2020-10-29 19:03:12.627134	2020-10-29 19:03:12.627134
6131	2	8	41	2	\N	2019-10-26	-35.08	6be	2020-10-29 19:03:12.628483	2020-10-29 19:03:12.628483
6132	5	8	40	2	\N	2019-10-26	-225.00	588	2020-10-29 19:03:12.629809	2020-10-29 19:03:12.629809
6133	5	1	5	2	\N	2019-10-26	-20.64	1f4	2020-10-29 19:03:12.63108	2020-10-29 19:03:12.63108
6134	2	8	41	2	\N	2019-10-28	-27.12	228	2020-10-29 19:03:12.633328	2020-10-29 19:03:12.633328
6135	5	5	20	2	\N	2019-10-28	-12.99	fa8	2020-10-29 19:03:12.635386	2020-10-29 19:03:12.635386
6136	5	4	13	2	\N	2019-10-29	-49.90	97a	2020-10-29 19:03:12.636903	2020-10-29 19:03:12.636903
6137	5	1	5	2	\N	2019-10-29	-16.27	576	2020-10-29 19:03:12.638239	2020-10-29 19:03:12.638239
6138	2	2	1	1	\N	2019-10-29	5615.59	1c6	2020-10-29 19:03:12.639611	2020-10-29 19:03:12.639611
6139	2	10	51	3	\N	2019-10-30	-3000.00	98e	2020-10-29 19:03:12.641187	2020-10-29 19:03:12.641187
6140	5	10	51	4	\N	2019-10-30	3000.00	98e	2020-10-29 19:03:12.642458	2020-10-29 19:03:12.642458
6141	2	10	51	3	\N	2019-10-30	-500.00	375	2020-10-29 19:03:12.643754	2020-10-29 19:03:12.643754
6142	4	10	51	4	\N	2019-10-30	500.00	375	2020-10-29 19:03:12.645016	2020-10-29 19:03:12.645016
6143	5	4	10	2	\N	2019-10-30	-392.95	11b	2020-10-29 19:03:12.646372	2020-10-29 19:03:12.646372
6144	5	7	28	2	\N	2019-10-30	-80.00	e59	2020-10-29 19:03:12.647798	2020-10-29 19:03:12.647798
6145	5	4	12	2	\N	2019-10-30	-103.89	d68	2020-10-29 19:03:12.649296	2020-10-29 19:03:12.649296
6146	1	1	8	2	\N	2019-10-30	-7.50	a00	2020-10-29 19:03:12.650744	2020-10-29 19:03:12.650744
6147	1	9	50	3	\N	2019-10-29	-21.00	576	2020-10-29 19:03:12.652711	2020-10-29 19:03:12.652711
6148	1	9	45	2	\N	2019-10-29	-12.82	3f9	2020-10-29 19:03:12.653943	2020-10-29 19:03:12.653943
6149	1	1	4	2	\N	2019-10-24	-19.00	929	2020-10-29 19:03:12.655103	2020-10-29 19:03:12.655103
6150	5	1	5	2	\N	2019-10-31	-225.53	e5f	2020-10-29 19:03:12.656178	2020-10-29 19:03:12.656178
6151	6	10	52	1	\N	2019-10-31	15.43	15b	2020-10-29 19:03:12.657258	2020-10-29 19:03:12.657258
6152	6	10	51	4	\N	2019-11-01	1500.00	7ec	2020-10-29 19:03:12.658494	2020-10-29 19:03:12.658494
6153	5	10	51	4	\N	2019-11-01	500.00	c9c	2020-10-29 19:03:12.659859	2020-10-29 19:03:12.659859
6154	1	10	51	4	\N	2019-11-01	5000.00	5fd	2020-10-29 19:03:12.661215	2020-10-29 19:03:12.661215
6155	1	9	50	3	\N	2019-11-01	-99.30	5a8	2020-10-29 19:03:12.662446	2020-10-29 19:03:12.662446
6156	1	9	50	3	\N	2019-11-01	-4000.00	5fd	2020-10-29 19:03:12.66431	2020-10-29 19:03:12.66431
6157	1	2	2	1	\N	2019-11-01	0.00	b21	2020-10-29 19:03:12.665531	2020-10-29 19:03:12.665531
6158	1	9	46	2	\N	2019-11-01	-15.52	baf	2020-10-29 19:03:12.666728	2020-10-29 19:03:12.666728
6159	2	5	18	2	\N	2019-11-02	-28.28	5a5	2020-10-29 19:03:12.667802	2020-10-29 19:03:12.667802
6160	2	1	6	2	\N	2019-11-03	-55.00	68e	2020-10-29 19:03:12.669055	2020-10-29 19:03:12.669055
6161	5	7	35	2	\N	2019-11-03	-26.00	fe6	2020-10-29 19:03:12.670221	2020-10-29 19:03:12.670221
6162	5	10	51	3	\N	2019-11-04	-2500.00	c7c	2020-10-29 19:03:12.671371	2020-10-29 19:03:12.671371
6163	6	10	51	4	\N	2019-11-04	2500.00	c7c	2020-10-29 19:03:12.672445	2020-10-29 19:03:12.672445
6164	5	9	45	2	\N	2019-11-05	-108.90	61a	2020-10-29 19:03:12.673718	2020-10-29 19:03:12.673718
6165	2	9	45	2	\N	2019-11-05	-80.25	ba5	2020-10-29 19:03:12.674849	2020-10-29 19:03:12.674849
6166	5	1	5	2	\N	2019-11-04	-6.86	f13	2020-10-29 19:03:12.675943	2020-10-29 19:03:12.675943
6167	5	1	5	2	\N	2019-11-06	-8.00	f13	2020-10-29 19:03:12.677093	2020-10-29 19:03:12.677093
6168	5	5	22	2	\N	2019-11-06	-30.00	a8b	2020-10-29 19:03:12.678247	2020-10-29 19:03:12.678247
6169	2	8	41	2	\N	2019-11-07	-21.84	c2f	2020-10-29 19:03:12.679406	2020-10-29 19:03:12.679406
6170	2	1	6	2	\N	2019-11-07	-6.00	2f4	2020-10-29 19:03:12.680653	2020-10-29 19:03:12.680653
6171	2	5	23	2	\N	2019-11-07	-46.94	494	2020-10-29 19:03:12.681795	2020-10-29 19:03:12.681795
6172	5	5	20	2	\N	2019-11-07	-55.99	907	2020-10-29 19:03:12.682881	2020-10-29 19:03:12.682881
6173	5	5	20	2	\N	2019-11-07	-13.99	725	2020-10-29 19:03:12.684097	2020-10-29 19:03:12.684097
6174	2	6	24	2	\N	2019-11-07	-240.50	8d9	2020-10-29 19:03:12.685549	2020-10-29 19:03:12.685549
6175	2	9	45	2	\N	2019-11-07	-59.95	892	2020-10-29 19:03:12.686943	2020-10-29 19:03:12.686943
6176	5	5	23	2	\N	2019-11-07	-24.26	8b8	2020-10-29 19:03:12.688194	2020-10-29 19:03:12.688194
6177	2	5	23	1	\N	2019-11-07	24.26	8b8	2020-10-29 19:03:12.689437	2020-10-29 19:03:12.689437
6178	5	1	5	2	\N	2019-11-08	-160.59	6ee	2020-10-29 19:03:12.690646	2020-10-29 19:03:12.690646
6179	2	9	46	2	\N	2019-11-12	-245.00	90d	2020-10-29 19:03:12.691875	2020-10-29 19:03:12.691875
6180	5	1	5	2	\N	2019-11-13	-36.19	715	2020-10-29 19:03:12.692965	2020-10-29 19:03:12.692965
6181	5	4	11	2	\N	2019-11-13	-181.50	a2f	2020-10-29 19:03:12.694051	2020-10-29 19:03:12.694051
6182	4	10	51	3	\N	2019-11-13	-2500.00	ec9	2020-10-29 19:03:12.695184	2020-10-29 19:03:12.695184
6183	2	10	51	4	\N	2019-11-13	2500.00	ec9	2020-10-29 19:03:12.696479	2020-10-29 19:03:12.696479
6184	5	5	20	2	\N	2019-11-13	-18.49	a01	2020-10-29 19:03:12.697741	2020-10-29 19:03:12.697741
6185	5	1	5	2	\N	2019-11-13	-11.45	f13	2020-10-29 19:03:12.698968	2020-10-29 19:03:12.698968
6186	2	4	15	2	\N	2019-11-14	-25.00	56e	2020-10-29 19:03:12.7002	2020-10-29 19:03:12.7002
6187	2	9	46	1	\N	2019-11-14	245.00	350	2020-10-29 19:03:12.701563	2020-10-29 19:03:12.701563
6188	2	1	6	2	\N	2019-11-15	-33.00	eba	2020-10-29 19:03:12.703195	2020-10-29 19:03:12.703195
6189	2	4	13	2	\N	2019-11-15	-29.99	e0c	2020-10-29 19:03:12.704378	2020-10-29 19:03:12.704378
6190	2	9	45	1	\N	2019-11-15	100.00	c29	2020-10-29 19:03:12.705531	2020-10-29 19:03:12.705531
6191	2	6	24	2	\N	2019-11-14	-67.97	840	2020-10-29 19:03:12.706708	2020-10-29 19:03:12.706708
6192	5	1	5	2	\N	2019-11-15	-256.17	e7e	2020-10-29 19:03:12.707708	2020-10-29 19:03:12.707708
6193	2	2	2	1	\N	2019-11-15	1.43	b7d	2020-10-29 19:03:12.708789	2020-10-29 19:03:12.708789
6194	1	9	46	2	\N	2019-11-08	-21.07	05a	2020-10-29 19:03:12.710053	2020-10-29 19:03:12.710053
6195	1	1	7	2	\N	2019-11-15	-16.90	e37	2020-10-29 19:03:12.711315	2020-10-29 19:03:12.711315
6196	1	5	22	2	\N	2019-11-12	-59.00	09f	2020-10-29 19:03:12.712544	2020-10-29 19:03:12.712544
6197	1	5	18	2	\N	2019-11-12	-61.85	ded	2020-10-29 19:03:12.71368	2020-10-29 19:03:12.71368
6198	1	9	-1	2	\N	2019-11-12	-330.00	2f0	2020-10-29 19:03:12.71488	2020-10-29 19:03:12.71488
6199	1	9	45	2	\N	2019-11-12	-87.97	0df	2020-10-29 19:03:12.716034	2020-10-29 19:03:12.716034
6200	1	9	45	2	\N	2019-11-12	-10.00	71a	2020-10-29 19:03:12.717284	2020-10-29 19:03:12.717284
6201	1	8	38	2	\N	2019-11-12	-1.00	b4e	2020-10-29 19:03:12.718863	2020-10-29 19:03:12.718863
6202	5	1	4	2	\N	2019-11-12	-31.95	534	2020-10-29 19:03:12.720101	2020-10-29 19:03:12.720101
6203	5	1	5	2	\N	2019-11-07	-3.94	f62	2020-10-29 19:03:12.721279	2020-10-29 19:03:12.721279
6204	5	1	8	2	\N	2019-11-07	-6.00	e5c	2020-10-29 19:03:12.722391	2020-10-29 19:03:12.722391
6205	5	4	13	2	\N	2019-11-03	-70.00	e3c	2020-10-29 19:03:12.723593	2020-10-29 19:03:12.723593
6206	1	2	-1	4	\N	2019-11-17	3000.00	2ad	2020-10-29 19:03:12.72508	2020-10-29 19:03:12.72508
6207	2	2	-1	4	\N	2019-11-17	1000.00	bc0	2020-10-29 19:03:12.726292	2020-10-29 19:03:12.726292
6208	1	8	38	2	\N	2019-11-17	-29.00	074	2020-10-29 19:03:12.727468	2020-10-29 19:03:12.727468
6209	5	8	40	2	\N	2019-11-17	-225.50	a6f	2020-10-29 19:03:12.729031	2020-10-29 19:03:12.729031
6210	2	9	45	2	\N	2019-11-17	-2279.00	37b	2020-10-29 19:03:12.730363	2020-10-29 19:03:12.730363
6211	5	5	20	2	\N	2019-11-18	-13.90	7fb	2020-10-29 19:03:12.731444	2020-10-29 19:03:12.731444
6212	5	5	20	2	\N	2019-11-19	-43.20	699	2020-10-29 19:03:12.732448	2020-10-29 19:03:12.732448
6213	2	1	6	2	\N	2019-11-19	-21.00	ea2	2020-10-29 19:03:12.733845	2020-10-29 19:03:12.733845
6214	2	8	41	2	\N	2019-11-19	-26.16	46b	2020-10-29 19:03:12.735495	2020-10-29 19:03:12.735495
6215	5	9	45	2	\N	2019-11-19	-25.00	9ed	2020-10-29 19:03:12.737262	2020-10-29 19:03:12.737262
6216	1	9	50	3	\N	2019-11-19	-30.00	abf	2020-10-29 19:03:12.739283	2020-10-29 19:03:12.739283
6217	1	9	50	3	\N	2019-11-19	-100.00	abf	2020-10-29 19:03:12.740759	2020-10-29 19:03:12.740759
6218	1	1	6	2	\N	2019-11-23	-1074.70	f25	2020-10-29 19:03:12.742034	2020-10-29 19:03:12.742034
6219	1	1	8	2	\N	2019-11-21	-3.60	a00	2020-10-29 19:03:12.743398	2020-10-29 19:03:12.743398
6220	1	9	-1	2	\N	2019-11-22	-9.20	54d	2020-10-29 19:03:12.744798	2020-10-29 19:03:12.744798
6221	1	1	7	2	\N	2019-11-22	-35.44	d58	2020-10-29 19:03:12.746088	2020-10-29 19:03:12.746088
6222	1	1	8	2	\N	2019-11-22	-3.50	a00	2020-10-29 19:03:12.747286	2020-10-29 19:03:12.747286
6223	5	1	5	2	\N	2019-11-23	-12.11	920	2020-10-29 19:03:12.748606	2020-10-29 19:03:12.748606
6224	5	5	20	2	\N	2019-11-21	-41.98	a76	2020-10-29 19:03:12.750213	2020-10-29 19:03:12.750213
6225	5	1	5	2	\N	2019-11-23	-7.46	473	2020-10-29 19:03:12.751926	2020-10-29 19:03:12.751926
6226	5	4	13	2	\N	2019-11-23	-49.90	da8	2020-10-29 19:03:12.753516	2020-10-29 19:03:12.753516
6227	5	1	5	2	\N	2019-11-23	-7.91	473	2020-10-29 19:03:12.75482	2020-10-29 19:03:12.75482
6228	5	1	5	2	\N	2019-11-23	-224.54	e7e	2020-10-29 19:03:12.756023	2020-10-29 19:03:12.756023
6229	2	1	5	2	\N	2019-11-26	-100.72	bc8	2020-10-29 19:03:12.757257	2020-10-29 19:03:12.757257
6230	5	1	5	2	\N	2019-11-26	-14.35	f13	2020-10-29 19:03:12.758763	2020-10-29 19:03:12.758763
6231	5	5	23	2	\N	2019-11-25	-82.14	9b3	2020-10-29 19:03:12.759906	2020-10-29 19:03:12.759906
6232	1	6	24	2	\N	2019-11-26	-129.99	eef	2020-10-29 19:03:12.76097	2020-10-29 19:03:12.76097
6233	2	9	45	1	\N	2019-11-25	100.00	cb0	2020-10-29 19:03:12.762051	2020-10-29 19:03:12.762051
6234	2	9	45	1	\N	2019-11-25	100.00	9f1	2020-10-29 19:03:12.763232	2020-10-29 19:03:12.763232
6235	5	1	5	2	\N	2019-11-26	-6.60	acc	2020-10-29 19:03:12.764459	2020-10-29 19:03:12.764459
6236	5	5	20	2	\N	2019-11-27	-15.00	f30	2020-10-29 19:03:12.765732	2020-10-29 19:03:12.765732
6237	5	8	40	2	\N	2019-11-27	-12.00	50d	2020-10-29 19:03:12.767132	2020-10-29 19:03:12.767132
6238	2	2	1	1	\N	2019-11-27	8436.72	9c4	2020-10-29 19:03:12.768413	2020-10-29 19:03:12.768413
6239	2	10	51	3	\N	2019-11-27	-1000.00	4fe	2020-10-29 19:03:12.770128	2020-10-29 19:03:12.770128
6240	4	10	51	4	\N	2019-11-27	1000.00	4fe	2020-10-29 19:03:12.771281	2020-10-29 19:03:12.771281
6241	2	10	51	3	\N	2019-11-27	-2000.00	a1e	2020-10-29 19:03:12.772371	2020-10-29 19:03:12.772371
6242	6	10	51	4	\N	2019-11-27	2000.00	a1e	2020-10-29 19:03:12.773518	2020-10-29 19:03:12.773518
6243	2	10	51	3	\N	2019-11-27	-3000.00	4b3	2020-10-29 19:03:12.775213	2020-10-29 19:03:12.775213
6244	5	10	51	4	\N	2019-11-27	3000.00	4b3	2020-10-29 19:03:12.776788	2020-10-29 19:03:12.776788
6245	5	4	10	2	\N	2019-11-27	-392.95	347	2020-10-29 19:03:12.778435	2020-10-29 19:03:12.778435
6246	5	4	12	2	\N	2019-11-27	-103.89	070	2020-10-29 19:03:12.779641	2020-10-29 19:03:12.779641
6247	5	1	5	2	\N	2019-11-28	-154.21	6ee	2020-10-29 19:03:12.781374	2020-10-29 19:03:12.781374
6248	5	1	5	2	\N	2019-11-28	-2.80	473	2020-10-29 19:03:12.78264	2020-10-29 19:03:12.78264
6249	5	5	20	2	\N	2019-11-28	-149.95	197	2020-10-29 19:03:12.783967	2020-10-29 19:03:12.783967
6250	2	6	24	2	\N	2019-11-29	-159.99	ac4	2020-10-29 19:03:12.785529	2020-10-29 19:03:12.785529
6251	2	6	24	2	\N	2019-11-29	-265.92	ff8	2020-10-29 19:03:12.787069	2020-10-29 19:03:12.787069
6252	2	5	18	2	\N	2019-11-29	-150.34	687	2020-10-29 19:03:12.789084	2020-10-29 19:03:12.789084
6253	2	6	24	2	\N	2019-11-29	-55.99	ced	2020-10-29 19:03:12.790364	2020-10-29 19:03:12.790364
6254	1	9	-1	3	\N	2019-11-30	-1000.00	e29	2020-10-29 19:03:12.791711	2020-10-29 19:03:12.791711
6255	1	9	50	3	\N	2019-11-30	-20.00	abf	2020-10-29 19:03:12.793011	2020-10-29 19:03:12.793011
6256	1	9	45	2	\N	2019-11-30	-100.00	cc4	2020-10-29 19:03:12.794224	2020-10-29 19:03:12.794224
6257	1	1	4	2	\N	2019-11-30	-4.00	b29	2020-10-29 19:03:12.795505	2020-10-29 19:03:12.795505
6258	5	8	40	2	\N	2019-11-30	-227.34	a6f	2020-10-29 19:03:12.796809	2020-10-29 19:03:12.796809
6259	1	2	2	1	\N	2019-11-30	227.34	592	2020-10-29 19:03:12.797993	2020-10-29 19:03:12.797993
6260	1	9	45	2	\N	2019-11-30	-15.00	7e3	2020-10-29 19:03:12.799238	2020-10-29 19:03:12.799238
6261	5	9	50	3	\N	2019-11-30	-500.00	a39	2020-10-29 19:03:12.800886	2020-10-29 19:03:12.800886
6262	5	1	5	2	\N	2019-11-30	-227.70	3bd	2020-10-29 19:03:12.802446	2020-10-29 19:03:12.802446
6263	5	5	18	2	\N	2019-11-30	-43.18	0f2	2020-10-29 19:03:12.803908	2020-10-29 19:03:12.803908
6264	5	9	-1	2	\N	2019-11-30	-26.10	446	2020-10-29 19:03:12.8053	2020-10-29 19:03:12.8053
6265	1	2	1	1	\N	2019-12-01	0.00	809	2020-10-29 19:03:12.806666	2020-10-29 19:03:12.806666
6266	6	10	51	4	\N	2019-12-01	500.00	1d7	2020-10-29 19:03:12.807852	2020-10-29 19:03:12.807852
6267	6	10	51	4	\N	2019-12-01	1500.00	7ec	2020-10-29 19:03:12.809303	2020-10-29 19:03:12.809303
6268	5	10	51	4	\N	2019-12-01	1500.00	061	2020-10-29 19:03:12.810503	2020-10-29 19:03:12.810503
6269	6	10	52	1	\N	2019-12-01	18.99	1a8	2020-10-29 19:03:12.811627	2020-10-29 19:03:12.811627
6270	6	10	52	1	\N	2019-12-01	11.22	34b	2020-10-29 19:03:12.813108	2020-10-29 19:03:12.813108
6271	1	9	-1	3	\N	2019-12-01	-800.00	066	2020-10-29 19:03:12.814257	2020-10-29 19:03:12.814257
6272	1	2	-1	4	\N	2019-12-01	999.14	458	2020-10-29 19:03:12.815548	2020-10-29 19:03:12.815548
6273	1	9	50	3	\N	2019-12-01	-30.00	fd5	2020-10-29 19:03:12.816868	2020-10-29 19:03:12.816868
6274	1	9	48	2	\N	2019-12-01	-120.00	a99	2020-10-29 19:03:12.818083	2020-10-29 19:03:12.818083
6275	2	9	48	2	\N	2019-12-02	-50.00	8bf	2020-10-29 19:03:12.819597	2020-10-29 19:03:12.819597
6276	2	6	24	1	\N	2019-12-03	199.96	8d9	2020-10-29 19:03:12.821184	2020-10-29 19:03:12.821184
6277	2	6	24	2	\N	2019-12-03	-179.99	a9f	2020-10-29 19:03:12.822738	2020-10-29 19:03:12.822738
6278	5	9	45	2	\N	2019-12-03	-19.99	9c8	2020-10-29 19:03:12.824199	2020-10-29 19:03:12.824199
6279	5	1	5	2	\N	2019-12-03	-7.86	ca4	2020-10-29 19:03:12.825469	2020-10-29 19:03:12.825469
6280	2	6	24	1	\N	2019-12-04	179.99	b41	2020-10-29 19:03:12.826735	2020-10-29 19:03:12.826735
6281	2	5	20	2	\N	2019-12-04	-19.99	9ad	2020-10-29 19:03:12.82792	2020-10-29 19:03:12.82792
6282	5	5	20	2	\N	2019-12-04	-30.00	75b	2020-10-29 19:03:12.829075	2020-10-29 19:03:12.829075
6283	2	2	2	1	\N	2019-12-04	100.00	60a	2020-10-29 19:03:12.830323	2020-10-29 19:03:12.830323
6284	5	1	5	2	\N	2019-12-05	-15.89	d71	2020-10-29 19:03:12.831587	2020-10-29 19:03:12.831587
6285	5	8	40	2	\N	2019-12-04	-224.59	a01	2020-10-29 19:03:12.832954	2020-10-29 19:03:12.832954
6286	2	7	28	2	\N	2019-12-05	-13.00	5db	2020-10-29 19:03:12.834148	2020-10-29 19:03:12.834148
6287	2	8	39	2	\N	2019-12-05	-60.00	c23	2020-10-29 19:03:12.835794	2020-10-29 19:03:12.835794
6288	1	9	50	3	\N	2019-12-07	-20.00	576	2020-10-29 19:03:12.837093	2020-10-29 19:03:12.837093
6289	1	5	22	2	\N	2019-12-07	-59.00	09f	2020-10-29 19:03:12.838431	2020-10-29 19:03:12.838431
6290	5	9	45	2	\N	2019-12-07	-179.79	184	2020-10-29 19:03:12.839576	2020-10-29 19:03:12.839576
6291	1	9	45	2	\N	2019-12-07	-25.50	777	2020-10-29 19:03:12.840663	2020-10-29 19:03:12.840663
6292	1	1	8	2	\N	2019-12-07	-1.80	6cf	2020-10-29 19:03:12.84179	2020-10-29 19:03:12.84179
6293	1	9	48	2	\N	2019-12-07	-20.00	933	2020-10-29 19:03:12.843189	2020-10-29 19:03:12.843189
6294	1	1	4	2	\N	2019-12-07	-11.99	694	2020-10-29 19:03:12.844364	2020-10-29 19:03:12.844364
6295	1	9	45	2	\N	2019-12-07	-157.09	532	2020-10-29 19:03:12.845736	2020-10-29 19:03:12.845736
6296	1	1	6	2	\N	2019-12-07	-9.90	45f	2020-10-29 19:03:12.847304	2020-10-29 19:03:12.847304
6297	1	5	20	2	\N	2019-12-07	-22.00	b5b	2020-10-29 19:03:12.848491	2020-10-29 19:03:12.848491
6298	1	2	2	4	\N	2019-12-07	224.59	592	2020-10-29 19:03:12.849741	2020-10-29 19:03:12.849741
6299	5	8	40	2	\N	2019-12-07	-36.99	325	2020-10-29 19:03:12.850881	2020-10-29 19:03:12.850881
6300	5	4	13	2	\N	2019-12-07	-70.00	cf8	2020-10-29 19:03:12.852713	2020-10-29 19:03:12.852713
6301	2	6	24	2	\N	2019-12-07	-180.99	fdb	2020-10-29 19:03:12.853982	2020-10-29 19:03:12.853982
6302	5	9	45	2	\N	2019-12-07	-14.98	7d7	2020-10-29 19:03:12.855192	2020-10-29 19:03:12.855192
6303	2	5	18	2	\N	2019-12-07	-60.56	525	2020-10-29 19:03:12.856395	2020-10-29 19:03:12.856395
6304	5	1	5	2	\N	2019-12-07	-165.31	6ee	2020-10-29 19:03:12.857601	2020-10-29 19:03:12.857601
6305	2	1	8	2	\N	2019-12-07	-42.58	7db	2020-10-29 19:03:12.858851	2020-10-29 19:03:12.858851
6306	2	9	45	2	\N	2019-12-08	-68.79	4e0	2020-10-29 19:03:12.860521	2020-10-29 19:03:12.860521
6307	5	9	45	2	\N	2019-12-08	-30.37	87e	2020-10-29 19:03:12.861811	2020-10-29 19:03:12.861811
6308	2	9	48	2	\N	2019-12-09	-100.00	e76	2020-10-29 19:03:12.862936	2020-10-29 19:03:12.862936
6309	5	5	20	2	\N	2019-12-10	-72.99	35b	2020-10-29 19:03:12.864221	2020-10-29 19:03:12.864221
6310	5	1	5	2	\N	2019-12-10	-13.15	69a	2020-10-29 19:03:12.865535	2020-10-29 19:03:12.865535
6311	5	1	5	2	\N	2019-12-10	-13.00	07d	2020-10-29 19:03:12.866795	2020-10-29 19:03:12.866795
6312	5	1	5	2	\N	2019-12-11	-10.81	413	2020-10-29 19:03:12.868456	2020-10-29 19:03:12.868456
6313	2	1	6	2	\N	2019-12-11	-4.00	a96	2020-10-29 19:03:12.870248	2020-10-29 19:03:12.870248
6314	5	8	40	2	\N	2019-12-11	-230.66	a06	2020-10-29 19:03:12.871511	2020-10-29 19:03:12.871511
6315	5	5	23	2	\N	2019-12-11	-66.96	4fc	2020-10-29 19:03:12.897068	2020-10-29 19:03:12.897068
6316	5	2	2	1	\N	2019-12-12	772.17	915	2020-10-29 19:03:12.898377	2020-10-29 19:03:12.898377
6317	5	1	8	2	\N	2019-12-13	-19.40	720	2020-10-29 19:03:12.899576	2020-10-29 19:03:12.899576
6318	5	1	5	2	\N	2019-12-13	-12.16	ecd	2020-10-29 19:03:12.90069	2020-10-29 19:03:12.90069
6319	5	9	46	2	\N	2019-12-14	-50.00	c58	2020-10-29 19:03:12.901856	2020-10-29 19:03:12.901856
6320	2	9	46	1	\N	2019-12-14	50.00	c58	2020-10-29 19:03:12.903131	2020-10-29 19:03:12.903131
6321	2	4	15	2	\N	2019-12-15	-25.00	ea0	2020-10-29 19:03:12.904275	2020-10-29 19:03:12.904275
6322	2	6	24	2	\N	2019-12-15	-110.87	cad	2020-10-29 19:03:12.905642	2020-10-29 19:03:12.905642
6323	2	6	24	2	\N	2019-12-15	-103.87	aa5	2020-10-29 19:03:12.906779	2020-10-29 19:03:12.906779
6324	2	6	24	1	\N	2019-12-15	179.99	df6	2020-10-29 19:03:12.907904	2020-10-29 19:03:12.907904
6325	5	9	45	2	\N	2019-12-15	-200.00	e44	2020-10-29 19:03:12.90903	2020-10-29 19:03:12.90903
6326	5	9	45	2	\N	2019-12-15	-50.00	0ee	2020-10-29 19:03:12.910135	2020-10-29 19:03:12.910135
6327	2	9	45	1	\N	2019-12-15	50.00	0ee	2020-10-29 19:03:12.911216	2020-10-29 19:03:12.911216
6328	2	4	13	2	\N	2019-12-15	-29.99	f2b	2020-10-29 19:03:12.912293	2020-10-29 19:03:12.912293
6329	2	9	45	2	\N	2019-12-15	-75.00	f5b	2020-10-29 19:03:12.913445	2020-10-29 19:03:12.913445
6330	2	9	45	1	\N	2019-12-16	150.00	945	2020-10-29 19:03:12.914669	2020-10-29 19:03:12.914669
6331	2	9	45	2	\N	2019-12-16	-59.99	37b	2020-10-29 19:03:12.916185	2020-10-29 19:03:12.916185
6332	5	1	5	2	\N	2019-12-16	-364.29	8fb	2020-10-29 19:03:12.917498	2020-10-29 19:03:12.917498
6333	5	9	45	2	\N	2019-12-17	-50.77	8b0	2020-10-29 19:03:12.919214	2020-10-29 19:03:12.919214
6334	5	1	5	2	\N	2019-12-18	-12.45	ecd	2020-10-29 19:03:12.920467	2020-10-29 19:03:12.920467
6335	5	1	5	2	\N	2019-12-18	-12.23	20e	2020-10-29 19:03:12.922103	2020-10-29 19:03:12.922103
6336	5	5	19	2	\N	2019-12-17	-110.00	572	2020-10-29 19:03:12.923213	2020-10-29 19:03:12.923213
6337	5	1	6	2	\N	2019-12-18	-25.90	567	2020-10-29 19:03:12.92433	2020-10-29 19:03:12.92433
6338	5	1	5	2	\N	2019-12-18	-52.38	726	2020-10-29 19:03:12.92546	2020-10-29 19:03:12.92546
6339	2	1	6	2	\N	2019-12-18	-23.50	aae	2020-10-29 19:03:12.926711	2020-10-29 19:03:12.926711
6340	1	9	50	3	\N	2019-12-19	-30.00	576	2020-10-29 19:03:12.928193	2020-10-29 19:03:12.928193
6341	1	8	38	2	\N	2019-12-18	-30.57	074	2020-10-29 19:03:12.929436	2020-10-29 19:03:12.929436
6342	1	2	-1	4	\N	2019-12-18	3000.00	542	2020-10-29 19:03:12.930665	2020-10-29 19:03:12.930665
6343	1	9	48	2	\N	2019-12-18	-100.00	21a	2020-10-29 19:03:12.931873	2020-10-29 19:03:12.931873
6344	1	1	7	2	\N	2019-12-18	-12.92	e33	2020-10-29 19:03:12.932977	2020-10-29 19:03:12.932977
6345	1	1	8	2	\N	2019-12-18	-2.00	6cf	2020-10-29 19:03:12.934356	2020-10-29 19:03:12.934356
6346	1	9	45	2	\N	2019-12-18	-150.00	94f	2020-10-29 19:03:12.936026	2020-10-29 19:03:12.936026
6347	1	1	7	2	\N	2019-12-18	-20.00	820	2020-10-29 19:03:12.937306	2020-10-29 19:03:12.937306
6348	1	9	45	2	\N	2019-12-18	-109.89	86e	2020-10-29 19:03:12.938502	2020-10-29 19:03:12.938502
6349	1	1	8	2	\N	2019-12-18	-34.50	f40	2020-10-29 19:03:12.939688	2020-10-29 19:03:12.939688
6350	1	6	24	2	\N	2019-12-18	-159.92	e15	2020-10-29 19:03:12.941251	2020-10-29 19:03:12.941251
6351	1	1	7	2	\N	2019-12-18	-21.20	e33	2020-10-29 19:03:12.956342	2020-10-29 19:03:12.956342
6352	1	1	7	2	\N	2019-12-18	-2.80	73e	2020-10-29 19:03:12.957614	2020-10-29 19:03:12.957614
6353	6	9	50	3	\N	2019-12-16	-3000.00	5bc	2020-10-29 19:03:12.958977	2020-10-29 19:03:12.958977
6354	5	1	5	2	\N	2019-12-17	-27.47	3dc	2020-10-29 19:03:12.960102	2020-10-29 19:03:12.960102
6355	5	1	5	2	\N	2019-12-17	-53.06	ac0	2020-10-29 19:03:12.961285	2020-10-29 19:03:12.961285
6356	5	1	5	2	\N	2019-12-17	-199.22	9ec	2020-10-29 19:03:12.962404	2020-10-29 19:03:12.962404
6357	5	1	5	2	\N	2019-12-23	-354.65	e7e	2020-10-29 19:03:12.963651	2020-10-29 19:03:12.963651
6358	5	1	5	2	\N	2019-12-23	-20.63	576	2020-10-29 19:03:12.964879	2020-10-29 19:03:12.964879
6359	5	9	45	2	\N	2019-12-23	-500.00	903	2020-10-29 19:03:12.966057	2020-10-29 19:03:12.966057
6360	2	2	1	1	\N	2019-12-23	5634.51	8d3	2020-10-29 19:03:12.96737	2020-10-29 19:03:12.96737
6361	5	1	5	2	\N	2019-12-23	-14.60	ecd	2020-10-29 19:03:12.969006	2020-10-29 19:03:12.969006
6362	5	9	44	2	\N	2019-12-23	-50.00	cba	2020-10-29 19:03:12.97034	2020-10-29 19:03:12.97034
6363	5	8	40	2	\N	2019-12-23	-15.00	50d	2020-10-29 19:03:12.971556	2020-10-29 19:03:12.971556
6364	2	10	51	3	\N	2019-12-24	-500.00	375	2020-10-29 19:03:12.97277	2020-10-29 19:03:12.97277
6365	4	10	51	4	\N	2019-12-24	500.00	375	2020-10-29 19:03:12.974608	2020-10-29 19:03:12.974608
6366	2	10	51	3	\N	2019-12-24	-3000.00	3f3	2020-10-29 19:03:12.975852	2020-10-29 19:03:12.975852
6367	5	10	51	4	\N	2019-12-24	3000.00	3f3	2020-10-29 19:03:12.977374	2020-10-29 19:03:12.977374
6368	5	4	10	2	\N	2019-12-24	-392.95	793	2020-10-29 19:03:12.978673	2020-10-29 19:03:12.978673
6369	5	4	12	2	\N	2019-12-24	-103.89	782	2020-10-29 19:03:12.979988	2020-10-29 19:03:12.979988
6370	5	4	11	2	\N	2019-12-24	-113.34	0cb	2020-10-29 19:03:12.981244	2020-10-29 19:03:12.981244
6371	5	5	20	2	\N	2019-12-27	-73.73	71c	2020-10-29 19:03:12.983308	2020-10-29 19:03:12.983308
6372	2	5	23	2	\N	2019-12-27	-26.97	b93	2020-10-29 19:03:12.984661	2020-10-29 19:03:12.984661
6373	2	5	20	2	\N	2019-12-27	-142.97	ffe	2020-10-29 19:03:12.986539	2020-10-29 19:03:12.986539
6374	5	5	20	2	\N	2019-12-27	-5.99	95b	2020-10-29 19:03:12.987901	2020-10-29 19:03:12.987901
6375	5	9	45	3	\N	2019-12-27	-150.00	8c0	2020-10-29 19:03:12.989319	2020-10-29 19:03:12.989319
6376	6	2	-1	4	\N	2019-12-27	150.00	8c0	2020-10-29 19:03:12.990509	2020-10-29 19:03:12.990509
6377	5	8	40	3	\N	2019-12-28	-232.30	c26	2020-10-29 19:03:12.992298	2020-10-29 19:03:12.992298
6378	1	9	50	3	\N	2019-12-28	-757.49	5fd	2020-10-29 19:03:12.993949	2020-10-29 19:03:12.993949
6379	5	4	13	2	\N	2019-12-29	-49.90	0e5	2020-10-29 19:03:12.995341	2020-10-29 19:03:12.995341
6380	5	1	5	2	\N	2019-12-30	-40.19	5ce	2020-10-29 19:03:12.997117	2020-10-29 19:03:12.997117
6381	6	10	52	1	\N	2019-12-31	22.05	15b	2020-10-29 19:03:12.998706	2020-10-29 19:03:12.998706
6382	6	10	52	1	\N	2019-12-31	13.15	15b	2020-10-29 19:03:12.999979	2020-10-29 19:03:12.999979
6383	1	2	-1	4	\N	2020-01-01	0.00	809	2020-10-29 19:03:13.001104	2020-10-29 19:03:13.001104
6384	6	10	51	4	\N	2020-01-01	1500.00	7ec	2020-10-29 19:03:13.00267	2020-10-29 19:03:13.00267
6385	6	10	51	4	\N	2020-01-01	500.00	359	2020-10-29 19:03:13.00394	2020-10-29 19:03:13.00394
6386	5	2	-1	4	\N	2020-01-01	1500.00	061	2020-10-29 19:03:13.005205	2020-10-29 19:03:13.005205
6387	1	2	-1	4	\N	2020-01-01	600.69	458	2020-10-29 19:03:13.006371	2020-10-29 19:03:13.006371
6388	1	9	48	2	\N	2020-01-01	-150.00	cd1	2020-10-29 19:03:13.007753	2020-10-29 19:03:13.007753
6389	1	8	38	2	\N	2020-01-01	-45.00	a3a	2020-10-29 19:03:13.009244	2020-10-29 19:03:13.009244
6390	1	9	50	3	\N	2020-01-01	-30.00	576	2020-10-29 19:03:13.010814	2020-10-29 19:03:13.010814
6391	1	8	38	2	\N	2020-01-01	-22.40	074	2020-10-29 19:03:13.012077	2020-10-29 19:03:13.012077
6392	5	4	13	2	\N	2020-01-02	-70.00	f4b	2020-10-29 19:03:13.013389	2020-10-29 19:03:13.013389
6393	5	8	40	3	\N	2020-01-03	-199.07	faf	2020-10-29 19:03:13.014646	2020-10-29 19:03:13.014646
6394	1	2	-1	4	\N	2020-01-03	199.07	909	2020-10-29 19:03:13.015988	2020-10-29 19:03:13.015988
6395	1	7	34	2	\N	2020-01-03	-19.90	6a1	2020-10-29 19:03:13.017216	2020-10-29 19:03:13.017216
6396	5	8	40	2	\N	2020-01-02	-5.00	cf3	2020-10-29 19:03:13.018317	2020-10-29 19:03:13.018317
6397	5	5	20	2	\N	2020-01-02	-43.97	91b	2020-10-29 19:03:13.019727	2020-10-29 19:03:13.019727
6398	5	8	40	3	\N	2020-01-04	-256.18	faf	2020-10-29 19:03:13.020917	2020-10-29 19:03:13.020917
6399	1	2	2	4	\N	2020-01-04	256.18	909	2020-10-29 19:03:13.022054	2020-10-29 19:03:13.022054
6400	5	1	5	2	\N	2020-01-04	-200.00	6ee	2020-10-29 19:03:13.023189	2020-10-29 19:03:13.023189
6401	2	6	24	2	\N	2020-01-04	-24.99	6ee	2020-10-29 19:03:13.024362	2020-10-29 19:03:13.024362
6402	2	6	24	2	\N	2020-01-03	-499.80	179	2020-10-29 19:03:13.025495	2020-10-29 19:03:13.025495
6403	2	6	24	2	\N	2020-01-02	-249.90	b89	2020-10-29 19:03:13.026554	2020-10-29 19:03:13.026554
6404	2	7	28	2	\N	2020-01-05	-13.00	f68	2020-10-29 19:03:13.028018	2020-10-29 19:03:13.028018
6405	5	9	-1	2	\N	2020-01-05	-50.00	78a	2020-10-29 19:03:13.029203	2020-10-29 19:03:13.029203
6406	2	6	24	1	\N	2020-01-08	499.80	fcf	2020-10-29 19:03:13.030372	2020-10-29 19:03:13.030372
6407	5	5	23	2	\N	2020-01-08	-34.82	a5f	2020-10-29 19:03:13.031521	2020-10-29 19:03:13.031521
6408	5	1	5	2	\N	2020-01-09	-9.57	e08	2020-10-29 19:03:13.033251	2020-10-29 19:03:13.033251
6409	5	1	5	2	\N	2020-01-09	-11.35	07d	2020-10-29 19:03:13.034712	2020-10-29 19:03:13.034712
6410	1	1	4	2	\N	2020-01-10	-29.50	23d	2020-10-29 19:03:13.036088	2020-10-29 19:03:13.036088
6411	1	3	9	2	\N	2020-01-10	-118.00	3ea	2020-10-29 19:03:13.037365	2020-10-29 19:03:13.037365
6412	5	1	5	2	\N	2020-01-11	-149.12	a4a	2020-10-29 19:03:13.038719	2020-10-29 19:03:13.038719
6413	5	6	24	2	\N	2020-01-11	-29.98	3e9	2020-10-29 19:03:13.039931	2020-10-29 19:03:13.039931
6414	2	1	6	2	\N	2020-01-12	-61.00	573	2020-10-29 19:03:13.041081	2020-10-29 19:03:13.041081
6415	2	4	13	2	\N	2020-01-13	-29.99	ee0	2020-10-29 19:03:13.042169	2020-10-29 19:03:13.042169
6416	5	5	20	2	\N	2020-01-15	-54.98	fef	2020-10-29 19:03:13.043264	2020-10-29 19:03:13.043264
6417	5	1	5	2	\N	2020-01-15	-15.20	bdf	2020-10-29 19:03:13.044404	2020-10-29 19:03:13.044404
6418	2	4	15	2	\N	2020-01-15	-25.00	61f	2020-10-29 19:03:13.045687	2020-10-29 19:03:13.045687
6419	5	1	5	2	\N	2020-01-15	-294.60	e7e	2020-10-29 19:03:13.046866	2020-10-29 19:03:13.046866
6420	5	8	40	2	\N	2020-01-15	-6.00	750	2020-10-29 19:03:13.048319	2020-10-29 19:03:13.048319
6421	2	9	44	2	\N	2020-01-15	-50.00	2c3	2020-10-29 19:03:13.049608	2020-10-29 19:03:13.049608
6422	5	7	35	2	\N	2020-01-17	-55.00	18b	2020-10-29 19:03:13.051032	2020-10-29 19:03:13.051032
6423	5	2	-1	1	\N	2020-01-17	1000.00	cff	2020-10-29 19:03:13.052374	2020-10-29 19:03:13.052374
6424	2	7	35	2	\N	2020-01-17	-0.80	812	2020-10-29 19:03:13.053556	2020-10-29 19:03:13.053556
6425	5	1	5	2	\N	2020-01-18	-39.59	ead	2020-10-29 19:03:13.054644	2020-10-29 19:03:13.054644
6426	1	2	2	4	\N	2020-01-16	246.37	909	2020-10-29 19:03:13.055638	2020-10-29 19:03:13.055638
6427	1	1	8	2	\N	2020-01-15	-5.60	16f	2020-10-29 19:03:13.056651	2020-10-29 19:03:13.056651
6428	1	1	7	2	\N	2020-01-15	-2.80	7b3	2020-10-29 19:03:13.057709	2020-10-29 19:03:13.057709
6429	1	1	7	2	\N	2020-01-15	-16.00	820	2020-10-29 19:03:13.058911	2020-10-29 19:03:13.058911
6430	5	9	50	3	\N	2020-01-19	-246.37	909	2020-10-29 19:03:13.059935	2020-10-29 19:03:13.059935
6431	1	9	50	3	\N	2020-01-19	-20.00	576	2020-10-29 19:03:13.060989	2020-10-29 19:03:13.060989
6432	2	9	44	2	\N	2020-01-20	-50.00	055	2020-10-29 19:03:13.062005	2020-10-29 19:03:13.062005
6433	5	1	5	2	\N	2020-01-21	-90.00	445	2020-10-29 19:03:13.063022	2020-10-29 19:03:13.063022
6434	2	1	5	2	\N	2020-01-23	-81.72	32c	2020-10-29 19:03:13.06405	2020-10-29 19:03:13.06405
6435	2	5	20	2	\N	2020-01-23	-43.94	e1c	2020-10-29 19:03:13.065138	2020-10-29 19:03:13.065138
6436	5	8	37	2	\N	2020-01-23	-7.00	360	2020-10-29 19:03:13.066114	2020-10-29 19:03:13.066114
6437	2	5	20	1	\N	2020-01-24	142.97	4f1	2020-10-29 19:03:13.067135	2020-10-29 19:03:13.067135
6438	2	1	5	2	\N	2020-01-24	-132.92	230	2020-10-29 19:03:13.068286	2020-10-29 19:03:13.068286
6439	2	6	24	2	\N	2020-01-24	-21.35	22b	2020-10-29 19:03:13.069771	2020-10-29 19:03:13.069771
6440	1	9	-1	3	\N	2020-01-26	-80.00	8f1	2020-10-29 19:03:13.070923	2020-10-29 19:03:13.070923
6441	1	1	6	2	\N	2020-01-26	-26.17	e95	2020-10-29 19:03:13.072003	2020-10-29 19:03:13.072003
6442	1	9	47	2	\N	2020-01-26	-5.00	088	2020-10-29 19:03:13.073021	2020-10-29 19:03:13.073021
6443	1	9	-1	2	\N	2020-01-26	-392.27	d86	2020-10-29 19:03:13.074022	2020-10-29 19:03:13.074022
6444	1	1	7	2	\N	2020-01-26	-22.00	136	2020-10-29 19:03:13.075116	2020-10-29 19:03:13.075116
6445	1	1	7	2	\N	2020-01-26	-20.00	6af	2020-10-29 19:03:13.076131	2020-10-29 19:03:13.076131
6446	1	8	38	2	\N	2020-01-26	-30.57	074	2020-10-29 19:03:13.077125	2020-10-29 19:03:13.077125
6447	1	8	40	2	\N	2020-01-26	-217.05	886	2020-10-29 19:03:13.078698	2020-10-29 19:03:13.078698
6448	5	2	-1	4	\N	2020-01-26	1500.00	45a	2020-10-29 19:03:13.080294	2020-10-29 19:03:13.080294
6449	5	9	50	3	\N	2020-01-26	-217.05	592	2020-10-29 19:03:13.081484	2020-10-29 19:03:13.081484
6450	1	2	2	4	\N	2020-01-26	217.05	592	2020-10-29 19:03:13.082659	2020-10-29 19:03:13.082659
6451	5	9	50	3	\N	2020-01-27	-214.64	426	2020-10-29 19:03:13.083797	2020-10-29 19:03:13.083797
6452	2	9	50	4	\N	2020-01-27	214.64	426	2020-10-29 19:03:13.08493	2020-10-29 19:03:13.08493
6453	5	9	50	3	\N	2020-01-27	-151.07	179	2020-10-29 19:03:13.086416	2020-10-29 19:03:13.086416
6454	2	9	50	4	\N	2020-01-27	151.07	179	2020-10-29 19:03:13.087737	2020-10-29 19:03:13.087737
6455	5	9	50	3	\N	2020-01-27	-115.98	dfc	2020-10-29 19:03:13.08903	2020-10-29 19:03:13.08903
6456	2	9	50	4	\N	2020-01-27	115.98	320	2020-10-29 19:03:13.090172	2020-10-29 19:03:13.090172
6457	5	4	13	2	\N	2020-01-27	-49.90	0e5	2020-10-29 19:03:13.091225	2020-10-29 19:03:13.091225
6458	2	5	18	2	\N	2020-01-28	-49.61	ab5	2020-10-29 19:03:13.092735	2020-10-29 19:03:13.092735
6459	5	9	-1	2	\N	2020-01-28	-227.08	a52	2020-10-29 19:03:13.093798	2020-10-29 19:03:13.093798
6460	5	4	-1	2	\N	2020-01-29	-96.00	2ea	2020-10-29 19:03:13.094819	2020-10-29 19:03:13.094819
6461	2	2	1	1	\N	2020-01-29	7223.19	080	2020-10-29 19:03:13.095832	2020-10-29 19:03:13.095832
6462	2	10	51	3	\N	2020-01-29	-3000.00	1e8	2020-10-29 19:03:13.096851	2020-10-29 19:03:13.096851
6463	5	10	51	4	\N	2020-01-29	3000.00	1e8	2020-10-29 19:03:13.097862	2020-10-29 19:03:13.097862
6464	2	10	51	3	\N	2020-01-29	-2000.00	0d8	2020-10-29 19:03:13.098924	2020-10-29 19:03:13.098924
6465	6	10	51	4	\N	2020-01-29	2000.00	0d8	2020-10-29 19:03:13.099937	2020-10-29 19:03:13.099937
6466	2	10	51	3	\N	2020-01-29	-500.00	efe	2020-10-29 19:03:13.101262	2020-10-29 19:03:13.101262
6467	4	10	51	4	\N	2020-01-29	500.00	efe	2020-10-29 19:03:13.102516	2020-10-29 19:03:13.102516
6468	1	9	50	3	\N	2020-02-01	-100.00	576	2020-10-29 19:03:13.103666	2020-10-29 19:03:13.103666
6469	6	10	51	4	\N	2020-02-01	1500.00	7ec	2020-10-29 19:03:13.104733	2020-10-29 19:03:13.104733
6470	6	10	51	4	\N	2020-02-01	500.00	93f	2020-10-29 19:03:13.105783	2020-10-29 19:03:13.105783
6471	1	2	-1	4	\N	2020-02-01	5987.46	039	2020-10-29 19:03:13.10713	2020-10-29 19:03:13.10713
6472	6	10	52	1	\N	2020-02-01	22.09	15b	2020-10-29 19:03:13.108213	2020-10-29 19:03:13.108213
6473	6	10	52	1	\N	2020-02-01	14.61	15b	2020-10-29 19:03:13.109235	2020-10-29 19:03:13.109235
6474	1	8	38	2	\N	2020-02-01	-25.60	074	2020-10-29 19:03:13.110221	2020-10-29 19:03:13.110221
6475	1	8	38	2	\N	2020-02-01	-45.00	1bf	2020-10-29 19:03:13.11132	2020-10-29 19:03:13.11132
6476	1	9	50	2	\N	2020-02-01	-700.00	987	2020-10-29 19:03:13.112402	2020-10-29 19:03:13.112402
6477	1	9	48	2	\N	2020-02-01	-150.00	44a	2020-10-29 19:03:13.113459	2020-10-29 19:03:13.113459
6478	1	10	51	3	\N	2020-02-01	-4000.00	039	2020-10-29 19:03:13.114437	2020-10-29 19:03:13.114437
6479	1	8	40	2	\N	2020-02-01	-16.00	750	2020-10-29 19:03:13.115464	2020-10-29 19:03:13.115464
6480	1	7	32	2	\N	2020-02-01	-70.00	8e7	2020-10-29 19:03:13.116517	2020-10-29 19:03:13.116517
6481	1	9	-1	2	\N	2020-02-01	-178.73	d86	2020-10-29 19:03:13.117611	2020-10-29 19:03:13.117611
6482	1	8	40	2	\N	2020-02-01	-42.17	fdb	2020-10-29 19:03:13.118775	2020-10-29 19:03:13.118775
6483	5	1	5	2	\N	2020-02-01	-239.13	6ee	2020-10-29 19:03:13.120027	2020-10-29 19:03:13.120027
6484	5	5	20	2	\N	2020-02-01	-88.00	60b	2020-10-29 19:03:13.121096	2020-10-29 19:03:13.121096
6485	5	8	40	2	\N	2020-02-01	-140.89	3fb	2020-10-29 19:03:13.122222	2020-10-29 19:03:13.122222
6486	5	5	20	2	\N	2020-01-31	-26.59	fdc	2020-10-29 19:03:13.123334	2020-10-29 19:03:13.123334
6487	5	8	40	2	\N	2020-01-31	-600.00	66c	2020-10-29 19:03:13.124394	2020-10-29 19:03:13.124394
6488	5	1	5	2	\N	2020-01-30	-10.02	473	2020-10-29 19:03:13.125501	2020-10-29 19:03:13.125501
6489	5	5	20	2	\N	2020-01-30	-189.94	edb	2020-10-29 19:03:13.126533	2020-10-29 19:03:13.126533
6490	5	8	40	2	\N	2020-01-29	-237.59	250	2020-10-29 19:03:13.127579	2020-10-29 19:03:13.127579
6491	1	2	-1	1	\N	2020-02-01	0.00	b21	2020-10-29 19:03:13.128673	2020-10-29 19:03:13.128673
6492	5	4	10	2	\N	2020-02-04	-392.95	a16	2020-10-29 19:03:13.129661	2020-10-29 19:03:13.129661
6493	5	4	12	2	\N	2020-02-04	-103.89	1d7	2020-10-29 19:03:13.130699	2020-10-29 19:03:13.130699
6494	5	4	11	2	\N	2020-02-04	-111.25	fee	2020-10-29 19:03:13.131713	2020-10-29 19:03:13.131713
6495	2	7	28	2	\N	2020-02-04	-13.00	356	2020-10-29 19:03:13.132778	2020-10-29 19:03:13.132778
6496	1	5	22	2	\N	2020-02-05	-59.00	09f	2020-10-29 19:03:13.133784	2020-10-29 19:03:13.133784
6497	5	1	5	2	\N	2020-02-07	-42.97	207	2020-10-29 19:03:13.13479	2020-10-29 19:03:13.13479
6498	5	5	18	2	\N	2020-02-07	-34.36	0f2	2020-10-29 19:03:13.136248	2020-10-29 19:03:13.136248
6499	5	8	42	2	\N	2020-02-05	-68.80	7d3	2020-10-29 19:03:13.137608	2020-10-29 19:03:13.137608
6500	5	1	5	2	\N	2020-02-05	-63.15	6ee	2020-10-29 19:03:13.138838	2020-10-29 19:03:13.138838
6501	5	4	13	2	\N	2020-02-05	-70.00	03a	2020-10-29 19:03:13.139952	2020-10-29 19:03:13.139952
6502	2	6	24	2	\N	2020-02-05	-59.98	d2c	2020-10-29 19:03:13.141014	2020-10-29 19:03:13.141014
6503	5	1	5	2	\N	2020-02-07	-177.67	6ee	2020-10-29 19:03:13.142121	2020-10-29 19:03:13.142121
6504	2	6	24	2	\N	2020-02-11	-59.98	67e	2020-10-29 19:03:13.143305	2020-10-29 19:03:13.143305
6505	2	6	24	1	\N	2020-02-11	29.99	c09	2020-10-29 19:03:13.144431	2020-10-29 19:03:13.144431
6506	5	1	5	2	\N	2020-02-11	-118.65	922	2020-10-29 19:03:13.145661	2020-10-29 19:03:13.145661
6507	5	8	42	2	\N	2020-02-11	-34.40	d35	2020-10-29 19:03:13.146759	2020-10-29 19:03:13.146759
6508	5	4	10	2	\N	2020-02-13	-573.87	471	2020-10-29 19:03:13.147798	2020-10-29 19:03:13.147798
6509	2	4	15	2	\N	2020-02-14	-25.00	de2	2020-10-29 19:03:13.148795	2020-10-29 19:03:13.148795
6510	2	1	6	2	\N	2020-02-14	-12.00	9a5	2020-10-29 19:03:13.150177	2020-10-29 19:03:13.150177
6511	2	1	6	1	\N	2020-02-15	10.00	728	2020-10-29 19:03:13.15139	2020-10-29 19:03:13.15139
6512	5	1	5	2	\N	2020-02-16	-362.90	e7e	2020-10-29 19:03:13.152699	2020-10-29 19:03:13.152699
6513	2	4	13	2	\N	2020-02-14	-29.99	fc6	2020-10-29 19:03:13.153983	2020-10-29 19:03:13.153983
6514	5	8	40	2	\N	2020-02-15	-228.04	588	2020-10-29 19:03:13.155157	2020-10-29 19:03:13.155157
6515	5	1	5	1	\N	2020-02-15	42.96	89f	2020-10-29 19:03:13.156183	2020-10-29 19:03:13.156183
6516	1	9	50	3	\N	2020-02-11	-90.00	9de	2020-10-29 19:03:13.157283	2020-10-29 19:03:13.157283
6517	1	8	40	2	\N	2020-02-16	-4.00	f35	2020-10-29 19:03:13.158296	2020-10-29 19:03:13.158296
6518	1	9	45	2	\N	2020-02-16	-154.85	93a	2020-10-29 19:03:13.159312	2020-10-29 19:03:13.159312
6519	1	5	18	2	\N	2020-02-16	-42.96	328	2020-10-29 19:03:13.1603	2020-10-29 19:03:13.1603
6520	1	1	4	2	\N	2020-02-16	-24.95	23d	2020-10-29 19:03:13.161375	2020-10-29 19:03:13.161375
6521	1	1	7	2	\N	2020-02-16	-2.80	78a	2020-10-29 19:03:13.162507	2020-10-29 19:03:13.162507
6522	1	1	4	2	\N	2020-02-16	-9.50	23d	2020-10-29 19:03:13.163913	2020-10-29 19:03:13.163913
6523	1	1	8	2	\N	2020-02-16	-50.08	a52	2020-10-29 19:03:13.165134	2020-10-29 19:03:13.165134
6524	1	1	4	2	\N	2020-02-16	-13.45	23d	2020-10-29 19:03:13.16621	2020-10-29 19:03:13.16621
6525	1	7	32	2	\N	2020-02-16	-183.00	4cf	2020-10-29 19:03:13.167385	2020-10-29 19:03:13.167385
6526	5	1	5	2	\N	2020-02-17	-14.35	07d	2020-10-29 19:03:13.168644	2020-10-29 19:03:13.168644
6527	5	1	5	2	\N	2020-02-17	-10.05	955	2020-10-29 19:03:13.169955	2020-10-29 19:03:13.169955
6528	2	5	20	2	\N	2020-02-17	-6.00	1e6	2020-10-29 19:03:13.17117	2020-10-29 19:03:13.17117
6529	5	5	19	2	\N	2020-02-18	-274.99	a73	2020-10-29 19:03:13.172214	2020-10-29 19:03:13.172214
6530	5	5	20	2	\N	2020-02-18	-79.46	53d	2020-10-29 19:03:13.173478	2020-10-29 19:03:13.173478
6531	5	1	5	2	\N	2020-02-18	-166.92	6ee	2020-10-29 19:03:13.174796	2020-10-29 19:03:13.174796
6532	2	6	24	1	\N	2020-02-15	29.99	9eb	2020-10-29 19:03:13.176301	2020-10-29 19:03:13.176301
6533	5	1	8	2	\N	2020-02-18	-10.00	f83	2020-10-29 19:03:13.177486	2020-10-29 19:03:13.177486
6534	2	5	20	2	\N	2020-02-21	-246.65	4fb	2020-10-29 19:03:13.179242	2020-10-29 19:03:13.179242
6535	5	5	20	2	\N	2020-02-21	-125.00	4fb	2020-10-29 19:03:13.180403	2020-10-29 19:03:13.180403
6536	2	5	20	1	\N	2020-02-21	125.00	4fb	2020-10-29 19:03:13.181664	2020-10-29 19:03:13.181664
6537	5	1	5	2	\N	2020-02-24	-8.10	473	2020-10-29 19:03:13.182826	2020-10-29 19:03:13.182826
6538	5	5	20	2	\N	2020-02-24	-22.40	875	2020-10-29 19:03:13.183952	2020-10-29 19:03:13.183952
6539	5	5	20	2	\N	2020-02-24	-19.99	0ad	2020-10-29 19:03:13.185028	2020-10-29 19:03:13.185028
6540	5	4	-1	2	\N	2020-02-24	-15.00	64b	2020-10-29 19:03:13.186572	2020-10-29 19:03:13.186572
6541	2	2	1	1	\N	2020-02-26	10434.03	7a8	2020-10-29 19:03:13.187755	2020-10-29 19:03:13.187755
6542	2	10	51	3	\N	2020-02-27	-3000.00	4b3	2020-10-29 19:03:13.189315	2020-10-29 19:03:13.189315
6543	5	10	51	4	\N	2020-02-27	3000.00	4b3	2020-10-29 19:03:13.190516	2020-10-29 19:03:13.190516
6544	2	10	51	3	\N	2020-02-27	-1000.00	e1d	2020-10-29 19:03:13.191764	2020-10-29 19:03:13.191764
6545	4	10	51	4	\N	2020-02-27	1000.00	e1d	2020-10-29 19:03:13.192931	2020-10-29 19:03:13.192931
6546	5	2	-1	1	\N	2020-02-27	1000.00	06a	2020-10-29 19:03:13.194076	2020-10-29 19:03:13.194076
6547	5	4	10	2	\N	2020-02-27	-81.38	6e5	2020-10-29 19:03:13.195269	2020-10-29 19:03:13.195269
6548	5	4	10	2	\N	2020-02-27	-488.08	ecc	2020-10-29 19:03:13.196345	2020-10-29 19:03:13.196345
6549	5	10	51	3	\N	2020-02-27	-1000.00	06a	2020-10-29 19:03:13.197441	2020-10-29 19:03:13.197441
6550	6	10	51	4	\N	2020-02-27	1000.00	06a	2020-10-29 19:03:13.198478	2020-10-29 19:03:13.198478
6551	5	1	5	2	\N	2020-02-28	-274.77	6ee	2020-10-29 19:03:13.199723	2020-10-29 19:03:13.199723
6552	5	1	5	2	\N	2020-02-28	-6.69	1ee	2020-10-29 19:03:13.200902	2020-10-29 19:03:13.200902
6553	5	4	13	2	\N	2020-02-28	-49.90	0e5	2020-10-29 19:03:13.202151	2020-10-29 19:03:13.202151
6554	1	9	50	3	\N	2020-02-29	-20.00	576	2020-10-29 19:03:13.203626	2020-10-29 19:03:13.203626
6555	1	1	8	2	\N	2020-02-29	-13.50	cfc	2020-10-29 19:03:13.204868	2020-10-29 19:03:13.204868
6556	1	1	8	2	\N	2020-02-29	-2.80	6cf	2020-10-29 19:03:13.205955	2020-10-29 19:03:13.205955
6557	1	8	37	2	\N	2020-02-29	-7.00	f35	2020-10-29 19:03:13.20712	2020-10-29 19:03:13.20712
6558	1	9	48	2	\N	2020-02-29	-20.00	e84	2020-10-29 19:03:13.208235	2020-10-29 19:03:13.208235
6559	1	8	40	2	\N	2020-02-29	-197.90	131	2020-10-29 19:03:13.209376	2020-10-29 19:03:13.209376
6560	1	1	8	2	\N	2020-02-29	-7.50	cfc	2020-10-29 19:03:13.21044	2020-10-29 19:03:13.21044
6561	1	9	45	2	\N	2020-02-29	-600.00	024	2020-10-29 19:03:13.211617	2020-10-29 19:03:13.211617
6562	1	1	8	2	\N	2020-02-29	-8.70	cfc	2020-10-29 19:03:13.212792	2020-10-29 19:03:13.212792
6563	1	1	8	2	\N	2020-02-29	-2.80	6cf	2020-10-29 19:03:13.213996	2020-10-29 19:03:13.213996
6564	1	2	-1	4	\N	2020-02-29	500.00	45a	2020-10-29 19:03:13.215125	2020-10-29 19:03:13.215125
6565	5	8	40	2	\N	2020-03-01	-202.24	250	2020-10-29 19:03:13.216356	2020-10-29 19:03:13.216356
6566	6	10	52	1	\N	2020-03-01	24.27	15b	2020-10-29 19:03:13.217759	2020-10-29 19:03:13.217759
6567	6	10	52	1	\N	2020-03-01	15.21	15b	2020-10-29 19:03:13.219798	2020-10-29 19:03:13.219798
6568	1	8	40	2	\N	2020-03-01	-11.00	8dd	2020-10-29 19:03:13.221038	2020-10-29 19:03:13.221038
6569	1	2	1	1	\N	2020-03-01	0.00	b21	2020-10-29 19:03:13.22213	2020-10-29 19:03:13.22213
6570	1	10	51	4	\N	2020-03-01	6196.85	039	2020-10-29 19:03:13.223262	2020-10-29 19:03:13.223262
6571	5	10	51	4	\N	2020-03-01	3500.00	039	2020-10-29 19:03:13.224368	2020-10-29 19:03:13.224368
6572	5	9	50	3	\N	2020-03-01	-500.00	171	2020-10-29 19:03:13.225626	2020-10-29 19:03:13.225626
6573	6	10	51	4	\N	2020-03-01	500.00	171	2020-10-29 19:03:13.226824	2020-10-29 19:03:13.226824
6574	5	9	50	3	\N	2020-03-01	-1500.00	7ec	2020-10-29 19:03:13.227942	2020-10-29 19:03:13.227942
6575	6	10	51	4	\N	2020-03-01	1500.00	7ec	2020-10-29 19:03:13.229084	2020-10-29 19:03:13.229084
6576	1	9	50	3	\N	2020-03-01	-1000.00	777	2020-10-29 19:03:13.230195	2020-10-29 19:03:13.230195
6577	5	9	50	3	\N	2020-03-01	-447.90	09d	2020-10-29 19:03:13.231453	2020-10-29 19:03:13.231453
6578	1	2	2	4	\N	2020-03-01	447.90	09d	2020-10-29 19:03:13.232517	2020-10-29 19:03:13.232517
6579	1	9	50	3	\N	2020-03-01	-4500.00	5fd	2020-10-29 19:03:13.233648	2020-10-29 19:03:13.233648
6580	1	9	48	2	\N	2020-03-01	-150.00	44a	2020-10-29 19:03:13.234734	2020-10-29 19:03:13.234734
6581	1	8	38	2	\N	2020-03-01	-45.00	1bf	2020-10-29 19:03:13.23629	2020-10-29 19:03:13.23629
6582	1	8	38	2	\N	2020-03-01	-21.20	074	2020-10-29 19:03:13.237554	2020-10-29 19:03:13.237554
6583	1	9	50	3	\N	2020-03-01	-20.00	576	2020-10-29 19:03:13.238669	2020-10-29 19:03:13.238669
6584	5	1	5	2	\N	2020-03-02	-100.10	6ee	2020-10-29 19:03:13.239809	2020-10-29 19:03:13.239809
6585	5	8	40	2	\N	2020-03-04	-300.00	749	2020-10-29 19:03:13.240966	2020-10-29 19:03:13.240966
6586	5	1	5	2	\N	2020-03-04	-11.95	ecd	2020-10-29 19:03:13.242084	2020-10-29 19:03:13.242084
6587	5	10	51	3	\N	2020-03-04	-2500.00	2bf	2020-10-29 19:03:13.243225	2020-10-29 19:03:13.243225
6588	6	10	51	4	\N	2020-03-04	2500.00	2bf	2020-10-29 19:03:13.244358	2020-10-29 19:03:13.244358
6589	1	2	2	1	\N	2020-03-04	17.00	c3d	2020-10-29 19:03:13.245474	2020-10-29 19:03:13.245474
6590	1	2	2	4	\N	2020-03-04	120.00	d25	2020-10-29 19:03:13.246555	2020-10-29 19:03:13.246555
6591	5	9	50	3	\N	2020-03-04	-120.00	d25	2020-10-29 19:03:13.247593	2020-10-29 19:03:13.247593
6592	1	9	50	3	\N	2020-03-04	-200.00	f30	2020-10-29 19:03:13.248778	2020-10-29 19:03:13.248778
6593	6	10	51	4	\N	2020-03-04	200.00	f30	2020-10-29 19:03:13.24984	2020-10-29 19:03:13.24984
6594	1	5	19	2	\N	2020-03-06	-370.00	4fa	2020-10-29 19:03:13.250871	2020-10-29 19:03:13.250871
6595	1	1	4	2	\N	2020-03-06	-18.95	23d	2020-10-29 19:03:13.251891	2020-10-29 19:03:13.251891
6596	1	9	45	2	\N	2020-03-07	-24.92	0de	2020-10-29 19:03:13.253193	2020-10-29 19:03:13.253193
6597	1	1	4	2	\N	2020-03-05	-12.60	23d	2020-10-29 19:03:13.254295	2020-10-29 19:03:13.254295
6598	1	8	37	2	\N	2020-03-05	-7.00	c53	2020-10-29 19:03:13.255467	2020-10-29 19:03:13.255467
6599	5	1	5	2	\N	2020-03-07	-31.47	621	2020-10-29 19:03:13.256657	2020-10-29 19:03:13.256657
6600	5	4	13	2	\N	2020-03-07	-70.00	820	2020-10-29 19:03:13.2577	2020-10-29 19:03:13.2577
6601	5	1	5	2	\N	2020-03-07	-216.30	6ee	2020-10-29 19:03:13.258732	2020-10-29 19:03:13.258732
6602	5	5	20	2	\N	2020-03-12	-32.97	230	2020-10-29 19:03:13.259862	2020-10-29 19:03:13.259862
6603	5	9	-1	2	\N	2020-03-12	-4.10	6e5	2020-10-29 19:03:13.26103	2020-10-29 19:03:13.26103
6604	5	5	20	2	\N	2020-03-12	-88.95	5a0	2020-10-29 19:03:13.262205	2020-10-29 19:03:13.262205
6605	2	1	5	2	\N	2020-03-12	-118.93	b0d	2020-10-29 19:03:13.263395	2020-10-29 19:03:13.263395
6606	5	8	40	2	\N	2020-03-12	-100.00	749	2020-10-29 19:03:13.264562	2020-10-29 19:03:13.264562
6607	1	8	37	2	\N	2020-03-16	-2.00	95c	2020-10-29 19:03:13.265693	2020-10-29 19:03:13.265693
6608	1	5	19	2	\N	2020-03-16	-370.00	cc0	2020-10-29 19:03:13.266799	2020-10-29 19:03:13.266799
6609	5	1	5	2	\N	2020-03-16	-130.36	6ee	2020-10-29 19:03:13.267978	2020-10-29 19:03:13.267978
6610	1	1	7	2	\N	2020-03-16	-2.80	78a	2020-10-29 19:03:13.269561	2020-10-29 19:03:13.269561
6611	1	1	8	2	\N	2020-03-16	-3.20	ceb	2020-10-29 19:03:13.270762	2020-10-29 19:03:13.270762
6612	1	9	45	2	\N	2020-03-16	-16.00	b56	2020-10-29 19:03:13.271856	2020-10-29 19:03:13.271856
6613	1	1	6	2	\N	2020-03-16	-183.00	8de	2020-10-29 19:03:13.272976	2020-10-29 19:03:13.272976
6614	5	5	20	2	\N	2020-03-16	-8.00	f40	2020-10-29 19:03:13.274153	2020-10-29 19:03:13.274153
6615	5	1	5	2	\N	2020-03-16	-142.82	6ee	2020-10-29 19:03:13.275452	2020-10-29 19:03:13.275452
6616	5	1	5	2	\N	2020-03-16	-243.94	6ee	2020-10-29 19:03:13.27674	2020-10-29 19:03:13.27674
6617	5	5	20	2	\N	2020-03-16	-11.99	f40	2020-10-29 19:03:13.277917	2020-10-29 19:03:13.277917
6618	5	5	20	2	\N	2020-03-16	-44.46	f40	2020-10-29 19:03:13.279039	2020-10-29 19:03:13.279039
6619	5	8	40	2	\N	2020-03-16	-216.92	23d	2020-10-29 19:03:13.280104	2020-10-29 19:03:13.280104
6620	5	2	2	1	\N	2020-03-16	4350.00	be4	2020-10-29 19:03:13.281214	2020-10-29 19:03:13.281214
6621	5	9	50	3	\N	2020-03-16	-3500.00	5ff	2020-10-29 19:03:13.282252	2020-10-29 19:03:13.282252
6622	6	10	51	4	\N	2020-03-16	3500.00	5ff	2020-10-29 19:03:13.28326	2020-10-29 19:03:13.28326
6623	2	4	15	2	\N	2020-03-19	-25.00	de2	2020-10-29 19:03:13.284486	2020-10-29 19:03:13.284486
6624	5	10	51	4	\N	2020-03-17	2000.00	92e	2020-10-29 19:03:13.285774	2020-10-29 19:03:13.285774
6625	5	1	5	2	\N	2020-03-22	-128.53	6ee	2020-10-29 19:03:13.287548	2020-10-29 19:03:13.287548
6626	2	4	16	2	\N	2020-03-23	-1780.00	a30	2020-10-29 19:03:13.288702	2020-10-29 19:03:13.288702
6627	2	10	51	3	\N	2020-03-23	-2000.00	6a2	2020-10-29 19:03:13.290018	2020-10-29 19:03:13.290018
6628	6	10	51	4	\N	2020-03-23	2000.00	671	2020-10-29 19:03:13.291159	2020-10-29 19:03:13.291159
6629	6	10	51	3	\N	2020-03-17	-2000.00	eea	2020-10-29 19:03:13.292257	2020-10-29 19:03:13.292257
6630	5	1	5	2	\N	2020-03-23	-321.93	6ee	2020-10-29 19:03:13.293387	2020-10-29 19:03:13.293387
6631	1	9	50	3	\N	2020-03-29	-30.00	576	2020-10-29 19:03:13.294657	2020-10-29 19:03:13.294657
6632	5	9	46	2	\N	2020-03-29	-180.00	3c4	2020-10-29 19:03:13.295659	2020-10-29 19:03:13.295659
6633	5	9	50	3	\N	2020-03-29	-1000.00	039	2020-10-29 19:03:13.296728	2020-10-29 19:03:13.296728
6634	6	10	51	4	\N	2020-03-29	1000.00	039	2020-10-29 19:03:13.297926	2020-10-29 19:03:13.297926
6635	1	2	2	1	\N	2020-03-29	183.00	5f9	2020-10-29 19:03:13.299607	2020-10-29 19:03:13.299607
6636	1	4	-1	2	\N	2020-03-29	-73.00	f1a	2020-10-29 19:03:13.300926	2020-10-29 19:03:13.300926
6637	1	9	46	2	\N	2020-03-29	-1689.90	190	2020-10-29 19:03:13.302256	2020-10-29 19:03:13.302256
6638	1	2	-1	4	\N	2020-03-29	1600.00	190	2020-10-29 19:03:13.303652	2020-10-29 19:03:13.303652
6639	2	2	1	1	\N	2020-03-27	7336.53	3f0	2020-10-29 19:03:13.304904	2020-10-29 19:03:13.304904
6640	2	10	51	3	\N	2020-03-29	-3000.00	4df	2020-10-29 19:03:13.305972	2020-10-29 19:03:13.305972
6641	5	10	51	4	\N	2020-03-29	3000.00	4df	2020-10-29 19:03:13.307026	2020-10-29 19:03:13.307026
6642	5	4	10	2	\N	2020-03-29	-488.08	297	2020-10-29 19:03:13.308075	2020-10-29 19:03:13.308075
6643	5	4	13	2	\N	2020-03-29	-49.90	38a	2020-10-29 19:03:13.309188	2020-10-29 19:03:13.309188
6644	5	4	11	2	\N	2020-03-29	-108.92	fec	2020-10-29 19:03:13.310391	2020-10-29 19:03:13.310391
6645	5	4	12	2	\N	2020-03-29	-243.50	070	2020-10-29 19:03:13.311693	2020-10-29 19:03:13.311693
6646	2	10	51	3	\N	2020-03-29	-2500.00	63f	2020-10-29 19:03:13.312861	2020-10-29 19:03:13.312861
6647	6	10	51	4	\N	2020-03-29	2500.00	0d0	2020-10-29 19:03:13.313942	2020-10-29 19:03:13.313942
6648	2	10	51	3	\N	2020-03-29	-500.00	b3c	2020-10-29 19:03:13.314987	2020-10-29 19:03:13.314987
6649	4	10	51	4	\N	2020-03-29	500.00	b3c	2020-10-29 19:03:13.316009	2020-10-29 19:03:13.316009
6650	5	1	5	2	\N	2020-03-31	-311.12	6ee	2020-10-29 19:03:13.317057	2020-10-29 19:03:13.317057
6651	5	9	46	2	\N	2020-03-31	-37.55	81a	2020-10-29 19:03:13.318088	2020-10-29 19:03:13.318088
6652	6	10	52	1	\N	2020-03-31	31.91	c48	2020-10-29 19:03:13.319427	2020-10-29 19:03:13.319427
6653	6	10	52	1	\N	2020-03-31	18.02	327	2020-10-29 19:03:13.32061	2020-10-29 19:03:13.32061
6654	5	9	50	3	\N	2020-04-01	-1000.00	06a	2020-10-29 19:03:13.321676	2020-10-29 19:03:13.321676
6655	1	2	-1	4	\N	2020-04-01	0.00	b21	2020-10-29 19:03:13.322751	2020-10-29 19:03:13.322751
6656	1	2	-1	4	\N	2020-04-01	5992.45	3f5	2020-10-29 19:03:13.323797	2020-10-29 19:03:13.323797
6657	5	2	-1	4	\N	2020-04-01	3500.00	3f5	2020-10-29 19:03:13.324876	2020-10-29 19:03:13.324876
6658	1	9	-1	3	\N	2020-04-01	-400.00	777	2020-10-29 19:03:13.325875	2020-10-29 19:03:13.325875
6659	5	9	50	3	\N	2020-04-01	-500.00	bb9	2020-10-29 19:03:13.326865	2020-10-29 19:03:13.326865
6660	6	10	51	4	\N	2020-04-01	500.00	bb9	2020-10-29 19:03:13.327865	2020-10-29 19:03:13.327865
6661	5	9	50	3	\N	2020-04-01	-1500.00	7ec	2020-10-29 19:03:13.328962	2020-10-29 19:03:13.328962
6662	6	10	51	4	\N	2020-04-01	1500.00	7ec	2020-10-29 19:03:13.330037	2020-10-29 19:03:13.330037
6663	1	8	38	2	\N	2020-04-01	-15.20	074	2020-10-29 19:03:13.33101	2020-10-29 19:03:13.33101
6664	1	9	50	3	\N	2020-04-01	-30.00	9da	2020-10-29 19:03:13.332062	2020-10-29 19:03:13.332062
6665	1	9	50	3	\N	2020-04-01	-5000.00	7f6	2020-10-29 19:03:13.333137	2020-10-29 19:03:13.333137
6666	1	9	48	2	\N	2020-04-01	-150.00	756	2020-10-29 19:03:13.334386	2020-10-29 19:03:13.334386
6667	2	4	13	2	\N	2020-04-02	-13.00	170	2020-10-29 19:03:13.335541	2020-10-29 19:03:13.335541
6668	5	8	15	2	\N	2020-04-02	-592.00	bc6	2020-10-29 19:03:13.336915	2020-10-29 19:03:13.336915
6669	5	10	51	3	\N	2020-04-03	-2000.00	8ce	2020-10-29 19:03:13.338028	2020-10-29 19:03:13.338028
6670	6	10	51	4	\N	2020-04-03	2000.00	8ce	2020-10-29 19:03:13.339151	2020-10-29 19:03:13.339151
6671	6	9	50	3	\N	2020-04-05	-1000.00	45a	2020-10-29 19:03:13.340217	2020-10-29 19:03:13.340217
6672	5	2	-1	4	\N	2020-04-05	1000.00	45a	2020-10-29 19:03:13.341346	2020-10-29 19:03:13.341346
6673	5	1	5	2	\N	2020-04-05	-488.53	a4a	2020-10-29 19:03:13.342321	2020-10-29 19:03:13.342321
6674	5	4	13	2	\N	2020-04-05	-70.00	801	2020-10-29 19:03:13.343886	2020-10-29 19:03:13.343886
6675	5	2	-1	1	\N	2020-04-11	1000.00	79e	2020-10-29 19:03:13.345029	2020-10-29 19:03:13.345029
6676	5	9	50	3	\N	2020-04-11	-1000.00	79e	2020-10-29 19:03:13.346328	2020-10-29 19:03:13.346328
6677	5	5	20	2	\N	2020-04-13	-464.45	e4b	2020-10-29 19:03:13.347529	2020-10-29 19:03:13.347529
6678	5	1	5	2	\N	2020-04-15	-189.19	842	2020-10-29 19:03:13.348746	2020-10-29 19:03:13.348746
6679	2	6	24	2	\N	2020-04-15	-159.90	dc0	2020-10-29 19:03:13.349897	2020-10-29 19:03:13.349897
6680	2	6	24	1	\N	2020-04-15	89.93	f96	2020-10-29 19:03:13.35111	2020-10-29 19:03:13.35111
6681	1	6	24	2	\N	2020-04-17	-89.93	b4a	2020-10-29 19:03:13.352239	2020-10-29 19:03:13.352239
6682	1	7	33	2	\N	2020-04-18	-39.95	21a	2020-10-29 19:03:13.353678	2020-10-29 19:03:13.353678
6683	1	9	50	3	\N	2020-02-22	-200.00	2a5	2020-10-29 19:03:13.355081	2020-10-29 19:03:13.355081
6684	5	2	-1	4	\N	2020-02-22	200.00	2a5	2020-10-29 19:03:13.356227	2020-10-29 19:03:13.356227
6685	5	1	5	2	\N	2020-04-23	-293.73	a4a	2020-10-29 19:03:13.357394	2020-10-29 19:03:13.357394
6686	5	4	13	2	\N	2020-04-23	-49.90	3c0	2020-10-29 19:03:13.358704	2020-10-29 19:03:13.358704
6687	5	7	33	2	\N	2020-04-23	-6.94	67a	2020-10-29 19:03:13.359866	2020-10-29 19:03:13.359866
6688	2	9	50	3	\N	2020-04-23	-1400.00	4ab	2020-10-29 19:03:13.361215	2020-10-29 19:03:13.361215
6689	5	2	-1	4	\N	2020-04-23	1400.00	4ab	2020-10-29 19:03:13.362361	2020-10-29 19:03:13.362361
6690	4	9	50	3	\N	2020-04-23	-500.00	6ec	2020-10-29 19:03:13.363769	2020-10-29 19:03:13.363769
6691	2	2	-1	4	\N	2020-04-23	503.34	6ec	2020-10-29 19:03:13.365115	2020-10-29 19:03:13.365115
6692	2	5	18	2	\N	2020-04-29	-23.98	236	2020-10-29 19:03:13.366323	2020-10-29 19:03:13.366323
6693	2	2	1	1	\N	2020-04-29	7059.50	9b3	2020-10-29 19:03:13.367447	2020-10-29 19:03:13.367447
6694	2	4	15	2	\N	2020-04-29	-25.00	f80	2020-10-29 19:03:13.368724	2020-10-29 19:03:13.368724
6695	5	2	1	1	\N	2020-04-29	500.00	45a	2020-10-29 19:03:13.370108	2020-10-29 19:03:13.370108
6696	5	5	20	2	\N	2020-04-29	-283.72	93a	2020-10-29 19:03:13.371174	2020-10-29 19:03:13.371174
6697	2	10	51	3	\N	2020-04-29	-3000.00	4b3	2020-10-29 19:03:13.372101	2020-10-29 19:03:13.372101
6698	5	10	51	4	\N	2020-04-29	3000.00	4b3	2020-10-29 19:03:13.373093	2020-10-29 19:03:13.373093
6699	5	5	20	2	\N	2020-04-30	-204.91	533	2020-10-29 19:03:13.374039	2020-10-29 19:03:13.374039
6700	5	1	5	2	\N	2020-04-30	-332.82	a4a	2020-10-29 19:03:13.375302	2020-10-29 19:03:13.375302
6701	5	9	-1	2	\N	2020-04-30	-200.00	042	2020-10-29 19:03:13.376264	2020-10-29 19:03:13.376264
6702	5	4	10	2	\N	2020-04-30	-488.08	105	2020-10-29 19:03:13.377704	2020-10-29 19:03:13.377704
6703	5	4	12	2	\N	2020-04-30	-89.99	861	2020-10-29 19:03:13.378691	2020-10-29 19:03:13.378691
6704	1	2	2	4	\N	2020-04-30	200.00	4e5	2020-10-29 19:03:13.379634	2020-10-29 19:03:13.379634
6705	1	9	50	3	\N	2020-04-30	-75.22	8d3	2020-10-29 19:03:13.380589	2020-10-29 19:03:13.380589
6706	5	2	2	4	\N	2020-04-30	75.22	8d3	2020-10-29 19:03:13.38151	2020-10-29 19:03:13.38151
6707	6	10	52	1	\N	2020-05-01	39.62	15b	2020-10-29 19:03:13.382594	2020-10-29 19:03:13.382594
6708	6	10	52	1	\N	2020-05-01	19.74	15b	2020-10-29 19:03:13.383577	2020-10-29 19:03:13.383577
6709	5	2	2	1	\N	2020-05-01	1340.82	b35	2020-10-29 19:03:13.384552	2020-10-29 19:03:13.384552
6710	5	9	50	3	\N	2020-05-01	-71.00	fcb	2020-10-29 19:03:13.385603	2020-10-29 19:03:13.385603
6711	1	2	2	4	\N	2020-05-01	71.00	fcb	2020-10-29 19:03:13.386781	2020-10-29 19:03:13.386781
6712	6	10	51	4	\N	2020-05-01	500.00	bb9	2020-10-29 19:03:13.387774	2020-10-29 19:03:13.387774
6713	6	10	51	4	\N	2020-05-01	1500.00	7ec	2020-10-29 19:03:13.388766	2020-10-29 19:03:13.388766
6714	5	10	51	4	\N	2020-05-01	1000.00	203	2020-10-29 19:03:13.389675	2020-10-29 19:03:13.389675
6715	1	2	-1	4	\N	2020-05-01	16117.60	27e	2020-10-29 19:03:13.390647	2020-10-29 19:03:13.390647
6716	1	9	50	3	\N	2020-05-01	-15000.00	cee	2020-10-29 19:03:13.39153	2020-10-29 19:03:13.39153
6717	1	9	50	3	\N	2020-05-01	-30.00	9da	2020-10-29 19:03:13.392457	2020-10-29 19:03:13.392457
6718	1	9	48	2	\N	2020-05-01	-150.00	756	2020-10-29 19:03:13.393611	2020-10-29 19:03:13.393611
6719	2	9	48	2	\N	2020-05-03	-50.00	02f	2020-10-29 19:03:13.394596	2020-10-29 19:03:13.394596
6720	5	10	51	3	\N	2020-05-04	-1300.00	285	2020-10-29 19:03:13.395524	2020-10-29 19:03:13.395524
6721	6	10	51	4	\N	2020-05-04	1300.00	285	2020-10-29 19:03:13.396557	2020-10-29 19:03:13.396557
6722	5	4	13	2	\N	2020-05-04	-70.00	d5d	2020-10-29 19:03:13.397764	2020-10-29 19:03:13.397764
6723	1	9	45	2	\N	2020-05-04	-208.66	725	2020-10-29 19:03:13.399227	2020-10-29 19:03:13.399227
6724	2	4	13	2	\N	2020-05-04	-13.00	d41	2020-10-29 19:03:13.400435	2020-10-29 19:03:13.400435
6725	1	3	9	2	\N	2020-05-07	-445.50	324	2020-10-29 19:03:13.401781	2020-10-29 19:03:13.401781
6726	5	8	40	2	\N	2020-05-08	-101.06	a6f	2020-10-29 19:03:13.403217	2020-10-29 19:03:13.403217
6727	5	8	40	2	\N	2020-05-08	-594.00	4b9	2020-10-29 19:03:13.404371	2020-10-29 19:03:13.404371
6728	5	1	5	2	\N	2020-05-07	-253.89	e5f	2020-10-29 19:03:13.405811	2020-10-29 19:03:13.405811
6729	2	9	45	2	\N	2020-05-08	-397.50	b57	2020-10-29 19:03:13.407154	2020-10-29 19:03:13.407154
6730	2	9	45	2	\N	2020-05-08	-44.40	d91	2020-10-29 19:03:13.408144	2020-10-29 19:03:13.408144
6731	5	2	2	1	\N	2020-05-11	139.95	0bd	2020-10-29 19:03:13.409354	2020-10-29 19:03:13.409354
6732	5	2	2	1	\N	2020-05-11	79.18	0bd	2020-10-29 19:03:13.410322	2020-10-29 19:03:13.410322
6733	5	5	19	2	\N	2020-05-12	-360.00	6b3	2020-10-29 19:03:13.411802	2020-10-29 19:03:13.411802
6734	5	10	51	3	\N	2020-05-13	-3000.00	3af	2020-10-29 19:03:13.413127	2020-10-29 19:03:13.413127
6735	6	10	51	4	\N	2020-05-13	3000.00	3af	2020-10-29 19:03:13.414155	2020-10-29 19:03:13.414155
6736	6	10	51	4	\N	2020-05-18	1300.00	704	2020-10-29 19:03:13.415349	2020-10-29 19:03:13.415349
6737	6	10	51	4	\N	2020-05-18	2500.00	883	2020-10-29 19:03:13.416469	2020-10-29 19:03:13.416469
6738	1	9	-1	2	\N	2020-05-18	-9.80	c3b	2020-10-29 19:03:13.418006	2020-10-29 19:03:13.418006
6739	1	9	50	3	\N	2020-05-16	-60.00	844	2020-10-29 19:03:13.419368	2020-10-29 19:03:13.419368
6740	1	9	46	2	\N	2020-05-16	-3578.01	2df	2020-10-29 19:03:13.420471	2020-10-29 19:03:13.420471
6741	1	2	-1	4	\N	2020-05-16	3463.62	702	2020-10-29 19:03:13.42182	2020-10-29 19:03:13.42182
6742	1	9	46	2	\N	2020-05-16	-78.00	b56	2020-10-29 19:03:13.42308	2020-10-29 19:03:13.42308
6743	5	8	40	2	\N	2020-05-17	-149.74	a4e	2020-10-29 19:03:13.424105	2020-10-29 19:03:13.424105
6744	5	5	20	2	\N	2020-05-16	-93.07	f40	2020-10-29 19:03:13.425364	2020-10-29 19:03:13.425364
6745	5	1	5	2	\N	2020-05-15	-420.19	f6b	2020-10-29 19:03:13.426406	2020-10-29 19:03:13.426406
6746	1	5	22	2	\N	2020-05-21	-60.00	9da	2020-10-29 19:03:13.427881	2020-10-29 19:03:13.427881
6747	5	1	5	2	\N	2020-05-21	-142.30	f62	2020-10-29 19:03:13.429241	2020-10-29 19:03:13.429241
6748	5	4	13	2	\N	2020-05-21	-49.90	97a	2020-10-29 19:03:13.430229	2020-10-29 19:03:13.430229
6749	5	9	45	2	\N	2020-05-27	-248.78	d53	2020-10-29 19:03:13.431489	2020-10-29 19:03:13.431489
6750	1	5	18	2	\N	2020-05-26	-38.77	092	2020-10-29 19:03:13.432457	2020-10-29 19:03:13.432457
6751	1	2	-1	4	\N	2020-05-22	500.00	587	2020-10-29 19:03:13.433893	2020-10-29 19:03:13.433893
6752	1	9	47	2	\N	2020-05-22	-7.50	b73	2020-10-29 19:03:13.435149	2020-10-29 19:03:13.435149
6753	1	9	-1	2	\N	2020-05-22	-9.80	c3b	2020-10-29 19:03:13.436381	2020-10-29 19:03:13.436381
6754	1	9	50	2	\N	2020-05-22	-250.00	714	2020-10-29 19:03:13.437693	2020-10-29 19:03:13.437693
6755	2	9	45	2	\N	2020-05-22	-106.69	b4d	2020-10-29 19:03:13.439059	2020-10-29 19:03:13.439059
6756	2	4	15	2	\N	2020-05-22	-25.00	de2	2020-10-29 19:03:13.440053	2020-10-29 19:03:13.440053
6757	2	2	1	1	\N	2020-05-28	7336.53	2d6	2020-10-29 19:03:13.4413	2020-10-29 19:03:13.4413
6758	2	10	51	3	\N	2020-05-28	-3000.00	15c	2020-10-29 19:03:13.442372	2020-10-29 19:03:13.442372
6759	5	10	51	4	\N	2020-05-28	3000.00	15c	2020-10-29 19:03:13.443702	2020-10-29 19:03:13.443702
6760	2	10	51	3	\N	2020-05-28	-2000.00	30a	2020-10-29 19:03:13.444949	2020-10-29 19:03:13.444949
6761	4	10	51	4	\N	2020-05-28	2000.00	7d5	2020-10-29 19:03:13.446014	2020-10-29 19:03:13.446014
6762	2	5	20	2	\N	2020-05-22	-49.97	8c1	2020-10-29 19:03:13.447332	2020-10-29 19:03:13.447332
6763	5	1	5	2	\N	2020-05-28	-229.88	e5f	2020-10-29 19:03:13.448347	2020-10-29 19:03:13.448347
6764	6	10	52	1	\N	2020-05-31	46.28	15b	2020-10-29 19:03:13.449882	2020-10-29 19:03:13.449882
6765	6	10	52	1	\N	2020-05-31	22.87	15b	2020-10-29 19:03:13.451371	2020-10-29 19:03:13.451371
6766	6	10	52	1	\N	2020-05-31	34.42	15b	2020-10-29 19:03:13.452816	2020-10-29 19:03:13.452816
6767	1	9	-1	2	\N	2020-06-01	0.00	033	2020-10-29 19:03:13.454088	2020-10-29 19:03:13.454088
6768	6	10	51	4	\N	2020-06-01	441.50	ea3	2020-10-29 19:03:13.455553	2020-10-29 19:03:13.455553
6769	6	10	51	4	\N	2020-06-01	10358.50	7d9	2020-10-29 19:03:13.457103	2020-10-29 19:03:13.457103
6770	1	9	50	3	\N	2020-06-01	-23.00	ee3	2020-10-29 19:03:13.458131	2020-10-29 19:03:13.458131
6771	6	10	51	4	\N	2020-06-01	500.00	410	2020-10-29 19:03:13.459496	2020-10-29 19:03:13.459496
6772	6	10	51	4	\N	2020-06-01	1500.00	7d9	2020-10-29 19:03:13.460589	2020-10-29 19:03:13.460589
6773	5	10	51	4	\N	2020-06-01	1500.00	203	2020-10-29 19:03:13.461807	2020-10-29 19:03:13.461807
6774	1	9	50	3	\N	2020-06-01	-2500.00	fca	2020-10-29 19:03:13.463105	2020-10-29 19:03:13.463105
6775	1	2	-1	4	\N	2020-06-01	6484.69	910	2020-10-29 19:03:13.464092	2020-10-29 19:03:13.464092
6776	1	9	48	2	\N	2020-06-01	-150.00	756	2020-10-29 19:03:13.46533	2020-10-29 19:03:13.46533
6777	5	1	5	2	\N	2020-06-03	-266.01	e5f	2020-10-29 19:03:13.466337	2020-10-29 19:03:13.466337
6778	2	9	50	3	\N	2020-06-03	-1500.00	660	2020-10-29 19:03:13.467847	2020-10-29 19:03:13.467847
6779	5	7	27	2	\N	2020-06-03	-300.00	11a	2020-10-29 19:03:13.46933	2020-10-29 19:03:13.46933
6780	5	4	10	2	\N	2020-06-04	-273.66	88a	2020-10-29 19:03:13.470486	2020-10-29 19:03:13.470486
6781	5	4	12	2	\N	2020-06-04	-89.99	d0e	2020-10-29 19:03:13.471812	2020-10-29 19:03:13.471812
6782	5	10	51	3	\N	2020-06-04	-3000.00	013	2020-10-29 19:03:13.473213	2020-10-29 19:03:13.473213
6783	6	10	51	4	\N	2020-06-04	3000.00	f01	2020-10-29 19:03:13.475174	2020-10-29 19:03:13.475174
6784	1	9	50	3	\N	2020-06-05	-4000.00	039	2020-10-29 19:03:13.476291	2020-10-29 19:03:13.476291
6785	5	4	13	2	\N	2020-06-06	-70.00	96b	2020-10-29 19:03:13.477802	2020-10-29 19:03:13.477802
6786	1	8	40	2	\N	2020-06-08	-12.00	cf3	2020-10-29 19:03:13.479325	2020-10-29 19:03:13.479325
6787	5	8	40	2	\N	2020-06-08	-180.92	a6f	2020-10-29 19:03:13.480612	2020-10-29 19:03:13.480612
6788	1	8	37	2	\N	2020-06-08	-2.00	c53	2020-10-29 19:03:13.482063	2020-10-29 19:03:13.482063
6789	5	5	18	2	\N	2020-06-08	-58.92	7e0	2020-10-29 19:03:13.483649	2020-10-29 19:03:13.483649
6790	1	2	1	1	\N	2020-06-10	197.93	d21	2020-10-29 19:03:13.485246	2020-10-29 19:03:13.485246
6791	2	5	18	2	\N	2020-06-10	-111.46	92b	2020-10-29 19:03:13.486641	2020-10-29 19:03:13.486641
6792	2	5	18	2	\N	2020-06-10	-39.00	48c	2020-10-29 19:03:13.488054	2020-10-29 19:03:13.488054
6793	5	5	18	1	\N	2020-06-10	39.00	48c	2020-10-29 19:03:13.489352	2020-10-29 19:03:13.489352
6794	2	4	13	2	\N	2020-06-10	-13.00	d7f	2020-10-29 19:03:13.490461	2020-10-29 19:03:13.490461
6795	5	1	5	2	\N	2020-06-10	-138.90	6ee	2020-10-29 19:03:13.492139	2020-10-29 19:03:13.492139
6796	5	1	8	2	\N	2020-06-13	-9.38	731	2020-10-29 19:03:13.493498	2020-10-29 19:03:13.493498
6797	5	1	5	2	\N	2020-06-11	-338.86	6ee	2020-10-29 19:03:13.494675	2020-10-29 19:03:13.494675
6798	2	5	20	2	\N	2020-06-16	-45.98	9f2	2020-10-29 19:03:13.495841	2020-10-29 19:03:13.495841
6799	5	5	23	2	\N	2020-06-16	-58.42	cd0	2020-10-29 19:03:13.497109	2020-10-29 19:03:13.497109
6800	4	9	-1	3	\N	2020-06-15	-1500.00	001	2020-10-29 19:03:13.498174	2020-10-29 19:03:13.498174
6801	2	9	-1	4	\N	2020-06-15	1500.00	001	2020-10-29 19:03:13.499402	2020-10-29 19:03:13.499402
6802	6	9	-1	3	\N	2020-06-22	-600.00	31f	2020-10-29 19:03:13.500523	2020-10-29 19:03:13.500523
6803	5	9	-1	4	\N	2020-06-22	600.00	31f	2020-10-29 19:03:13.501749	2020-10-29 19:03:13.501749
6804	5	9	44	2	\N	2020-06-22	-200.00	6b7	2020-10-29 19:03:13.503452	2020-10-29 19:03:13.503452
6805	5	1	5	2	\N	2020-06-20	-87.25	88c	2020-10-29 19:03:13.504784	2020-10-29 19:03:13.504784
6806	2	5	22	2	\N	2020-06-22	-60.00	31f	2020-10-29 19:03:13.505971	2020-10-29 19:03:13.505971
6807	5	5	20	2	\N	2020-06-22	-54.48	37b	2020-10-29 19:03:13.50721	2020-10-29 19:03:13.50721
6808	2	4	15	2	\N	2020-06-20	-25.00	de2	2020-10-29 19:03:13.50831	2020-10-29 19:03:13.50831
6809	5	1	5	2	\N	2020-06-18	-226.02	6ee	2020-10-29 19:03:13.509518	2020-10-29 19:03:13.509518
6810	5	4	-1	2	\N	2020-06-23	-170.00	0c6	2020-10-29 19:03:13.510658	2020-10-29 19:03:13.510658
6811	5	9	-1	2	\N	2020-06-23	-45.00	640	2020-10-29 19:03:13.511839	2020-10-29 19:03:13.511839
6812	5	9	45	2	\N	2020-06-26	-5.99	6e2	2020-10-29 19:03:13.513172	2020-10-29 19:03:13.513172
6813	5	1	5	2	\N	2020-06-26	-243.41	6ee	2020-10-29 19:03:13.51422	2020-10-29 19:03:13.51422
6814	2	2	1	1	\N	2020-06-26	7090.50	961	2020-10-29 19:03:13.515471	2020-10-29 19:03:13.515471
6815	2	10	51	3	\N	2020-06-26	-4000.00	fba	2020-10-29 19:03:13.51655	2020-10-29 19:03:13.51655
6816	5	10	51	4	\N	2020-06-26	4000.00	fba	2020-10-29 19:03:13.517879	2020-10-29 19:03:13.517879
6817	5	4	10	2	\N	2020-06-27	-493.38	9eb	2020-10-29 19:03:13.519498	2020-10-29 19:03:13.519498
6818	5	4	13	2	\N	2020-06-27	-49.90	886	2020-10-29 19:03:13.520732	2020-10-29 19:03:13.520732
6819	5	4	12	2	\N	2020-06-27	-89.99	bcf	2020-10-29 19:03:13.52195	2020-10-29 19:03:13.52195
6820	5	4	11	2	\N	2020-06-27	-109.02	fec	2020-10-29 19:03:13.523024	2020-10-29 19:03:13.523024
6821	5	10	51	3	\N	2020-06-27	-1400.00	097	2020-10-29 19:03:13.52431	2020-10-29 19:03:13.52431
6822	6	10	51	4	\N	2020-06-27	1400.00	097	2020-10-29 19:03:13.525397	2020-10-29 19:03:13.525397
6823	1	7	30	2	\N	2020-06-30	-29.99	fd5	2020-10-29 19:03:13.526645	2020-10-29 19:03:13.526645
6824	1	2	-1	4	\N	2020-06-28	8000.00	501	2020-10-29 19:03:13.527909	2020-10-29 19:03:13.527909
6825	1	8	37	2	\N	2020-06-29	-7.00	baa	2020-10-29 19:03:13.529007	2020-10-29 19:03:13.529007
6826	1	1	8	2	\N	2020-06-26	-2.49	352	2020-10-29 19:03:13.530198	2020-10-29 19:03:13.530198
6827	1	5	19	2	\N	2020-06-25	-120.00	a7a	2020-10-29 19:03:13.531251	2020-10-29 19:03:13.531251
6828	1	1	6	2	\N	2020-06-25	-10.00	517	2020-10-29 19:03:13.532391	2020-10-29 19:03:13.532391
6829	1	8	40	2	\N	2020-06-25	-12.00	baa	2020-10-29 19:03:13.534225	2020-10-29 19:03:13.534225
6830	1	7	28	2	\N	2020-06-24	-18.00	e48	2020-10-29 19:03:13.535366	2020-10-29 19:03:13.535366
6831	1	9	-1	2	\N	2020-06-24	-65.00	2ea	2020-10-29 19:03:13.536871	2020-10-29 19:03:13.536871
6832	5	1	5	2	\N	2020-06-29	-26.84	6ee	2020-10-29 19:03:13.538002	2020-10-29 19:03:13.538002
6833	5	5	20	2	\N	2020-06-29	-59.99	708	2020-10-29 19:03:13.539236	2020-10-29 19:03:13.539236
6834	5	9	50	3	\N	2020-06-28	-1000.00	716	2020-10-29 19:03:13.540289	2020-10-29 19:03:13.540289
6835	5	4	11	2	\N	2020-06-30	-360.43	507	2020-10-29 19:03:13.541573	2020-10-29 19:03:13.541573
6836	5	9	45	2	\N	2020-06-29	-5.99	b41	2020-10-29 19:03:13.542814	2020-10-29 19:03:13.542814
6837	1	9	48	2	\N	2020-07-01	-50.00	756	2020-10-29 19:03:13.543888	2020-10-29 19:03:13.543888
6838	1	9	50	3	\N	2020-07-01	-8000.00	6dc	2020-10-29 19:03:13.54514	2020-10-29 19:03:13.54514
6839	6	10	52	1	\N	2020-07-01	24.31	15b	2020-10-29 19:03:13.546145	2020-10-29 19:03:13.546145
6840	6	10	52	1	\N	2020-07-01	10.10	15b	2020-10-29 19:03:13.54749	2020-10-29 19:03:13.54749
6841	6	10	51	4	\N	2020-07-01	1000.00	1b0	2020-10-29 19:03:13.549374	2020-10-29 19:03:13.549374
6842	5	2	-1	4	\N	2020-07-01	1500.00	4e4	2020-10-29 19:03:13.550905	2020-10-29 19:03:13.550905
6843	1	2	-1	4	\N	2020-07-01	900.00	d94	2020-10-29 19:03:13.552199	2020-10-29 19:03:13.552199
6844	5	9	45	2	\N	2020-07-02	-319.88	3a0	2020-10-29 19:03:13.554031	2020-10-29 19:03:13.554031
6845	5	1	5	2	\N	2020-07-03	-350.39	6ee	2020-10-29 19:03:13.555446	2020-10-29 19:03:13.555446
6846	5	4	-1	2	\N	2020-07-03	-170.00	501	2020-10-29 19:03:13.556818	2020-10-29 19:03:13.556818
6847	5	10	51	3	\N	2020-07-03	-1000.00	ff5	2020-10-29 19:03:13.558086	2020-10-29 19:03:13.558086
6848	6	10	51	4	\N	2020-07-03	1000.00	097	2020-10-29 19:03:13.55941	2020-10-29 19:03:13.55941
6849	2	10	51	3	\N	2020-07-03	-500.00	cca	2020-10-29 19:03:13.560633	2020-10-29 19:03:13.560633
6850	6	10	51	4	\N	2020-07-03	500.00	45c	2020-10-29 19:03:13.56212	2020-10-29 19:03:13.56212
6851	5	8	40	2	\N	2020-07-03	-164.97	a6f	2020-10-29 19:03:13.563445	2020-10-29 19:03:13.563445
6852	5	5	20	2	\N	2020-07-03	-31.99	f40	2020-10-29 19:03:13.564585	2020-10-29 19:03:13.564585
6853	5	5	18	2	\N	2020-07-03	-29.96	0f2	2020-10-29 19:03:13.565922	2020-10-29 19:03:13.565922
6854	5	9	44	2	\N	2020-07-03	-50.00	98a	2020-10-29 19:03:13.56737	2020-10-29 19:03:13.56737
6855	2	1	6	2	\N	2020-07-03	-54.00	01d	2020-10-29 19:03:13.568975	2020-10-29 19:03:13.568975
6856	2	8	37	2	\N	2020-07-03	-12.00	32e	2020-10-29 19:03:13.571083	2020-10-29 19:03:13.571083
6857	2	4	13	2	\N	2020-07-04	-26.00	88b	2020-10-29 19:03:13.572713	2020-10-29 19:03:13.572713
6858	2	6	24	2	\N	2020-07-07	-130.64	7c8	2020-10-29 19:03:13.574167	2020-10-29 19:03:13.574167
6859	5	1	5	2	\N	2020-07-07	-153.66	83c	2020-10-29 19:03:13.575311	2020-10-29 19:03:13.575311
6860	5	1	5	2	\N	2020-07-07	-16.00	df6	2020-10-29 19:03:13.576723	2020-10-29 19:03:13.576723
6861	5	4	13	2	\N	2020-07-07	-70.00	2d1	2020-10-29 19:03:13.577977	2020-10-29 19:03:13.577977
6862	1	9	-1	2	\N	2020-07-14	-46.15	90d	2020-10-29 19:03:13.579116	2020-10-29 19:03:13.579116
6863	1	3	9	2	\N	2020-07-14	-121.18	0c6	2020-10-29 19:03:13.580366	2020-10-29 19:03:13.580366
6864	1	7	28	2	\N	2020-07-14	-25.00	c19	2020-10-29 19:03:13.581466	2020-10-29 19:03:13.581466
6865	5	8	40	2	\N	2020-07-10	-43.80	325	2020-10-29 19:03:13.582804	2020-10-29 19:03:13.582804
6866	5	1	5	2	\N	2020-07-10	-200.00	3ba	2020-10-29 19:03:13.584179	2020-10-29 19:03:13.584179
6867	5	1	5	2	\N	2020-07-10	-80.00	8e9	2020-10-29 19:03:13.585559	2020-10-29 19:03:13.585559
6868	5	3	9	2	\N	2020-07-10	-42.20	6ee	2020-10-29 19:03:13.587098	2020-10-29 19:03:13.587098
6869	5	3	9	2	\N	2020-07-10	-42.32	6ee	2020-10-29 19:03:13.588167	2020-10-29 19:03:13.588167
6870	5	1	5	2	\N	2020-07-10	-347.77	6ee	2020-10-29 19:03:13.58944	2020-10-29 19:03:13.58944
6871	5	1	5	2	\N	2020-07-10	-29.97	19b	2020-10-29 19:03:13.590677	2020-10-29 19:03:13.590677
6872	2	8	37	2	\N	2020-07-15	-17.00	c53	2020-10-29 19:03:13.591756	2020-10-29 19:03:13.591756
6873	2	1	6	2	\N	2020-07-15	-10.90	a39	2020-10-29 19:03:13.592928	2020-10-29 19:03:13.592928
6874	2	5	18	2	\N	2020-07-16	-16.30	033	2020-10-29 19:03:13.594139	2020-10-29 19:03:13.594139
6875	5	5	20	2	\N	2020-07-16	-138.44	312	2020-10-29 19:03:13.595236	2020-10-29 19:03:13.595236
6876	5	1	5	2	\N	2020-07-16	-56.57	fc0	2020-10-29 19:03:13.596437	2020-10-29 19:03:13.596437
6877	5	1	5	2	\N	2020-07-18	-144.41	a4a	2020-10-29 19:03:13.597508	2020-10-29 19:03:13.597508
6878	5	9	50	3	\N	2020-07-17	-50.00	c5d	2020-10-29 19:03:13.598728	2020-10-29 19:03:13.598728
6879	1	1	6	2	\N	2020-07-19	-118.00	2fd	2020-10-29 19:03:13.59991	2020-10-29 19:03:13.59991
6880	2	1	6	2	\N	2020-07-20	-58.00	35a	2020-10-29 19:03:13.600966	2020-10-29 19:03:13.600966
6881	2	9	50	4	\N	2020-07-17	50.00	ea6	2020-10-29 19:03:13.602269	2020-10-29 19:03:13.602269
6882	2	4	15	2	\N	2020-07-17	-25.00	f80	2020-10-29 19:03:13.603848	2020-10-29 19:03:13.603848
6883	2	8	41	2	\N	2020-07-17	-22.13	d0d	2020-10-29 19:03:13.604957	2020-10-29 19:03:13.604957
6884	5	9	-1	4	\N	2020-07-24	1000.00	ef5	2020-10-29 19:03:13.606171	2020-10-29 19:03:13.606171
6885	5	1	5	2	\N	2020-07-25	-101.12	6ee	2020-10-29 19:03:13.60727	2020-10-29 19:03:13.60727
6886	5	8	40	2	\N	2020-07-25	-194.89	588	2020-10-29 19:03:13.608581	2020-10-29 19:03:13.608581
6887	5	5	20	2	\N	2020-07-25	-44.98	006	2020-10-29 19:03:13.609776	2020-10-29 19:03:13.609776
6888	5	6	24	2	\N	2020-07-25	-89.73	6f9	2020-10-29 19:03:13.610827	2020-10-29 19:03:13.610827
6889	5	1	5	2	\N	2020-07-25	-94.23	6ee	2020-10-29 19:03:13.611982	2020-10-29 19:03:13.611982
6890	5	4	13	2	\N	2020-07-25	-49.90	b9b	2020-10-29 19:03:13.613051	2020-10-29 19:03:13.613051
6891	1	5	20	2	\N	2020-07-25	-19.99	fc9	2020-10-29 19:03:13.614673	2020-10-29 19:03:13.614673
6892	1	8	37	2	\N	2020-07-25	-40.00	9f3	2020-10-29 19:03:13.615856	2020-10-29 19:03:13.615856
6893	1	5	22	2	\N	2020-07-23	-60.00	09f	2020-10-29 19:03:13.616855	2020-10-29 19:03:13.616855
6894	1	1	8	2	\N	2020-07-25	-20.00	698	2020-10-29 19:03:13.618066	2020-10-29 19:03:13.618066
6895	1	8	38	2	\N	2020-07-22	-30.57	074	2020-10-29 19:03:13.619167	2020-10-29 19:03:13.619167
6896	1	8	37	2	\N	2020-07-22	-2.00	c53	2020-10-29 19:03:13.620692	2020-10-29 19:03:13.620692
6897	5	1	5	2	\N	2020-07-27	-88.33	6ee	2020-10-29 19:03:13.621891	2020-10-29 19:03:13.621891
6898	5	4	14	2	\N	2020-07-27	-462.46	089	2020-10-29 19:03:13.622987	2020-10-29 19:03:13.622987
6899	5	4	14	2	\N	2020-07-27	-247.00	4d5	2020-10-29 19:03:13.624126	2020-10-29 19:03:13.624126
6900	2	2	1	1	\N	2020-07-29	7336.53	ad7	2020-10-29 19:03:13.62532	2020-10-29 19:03:13.62532
6901	2	10	51	3	\N	2020-07-29	-3000.00	983	2020-10-29 19:03:13.62661	2020-10-29 19:03:13.62661
6902	5	10	51	4	\N	2020-07-29	3000.00	983	2020-10-29 19:03:13.627722	2020-10-29 19:03:13.627722
6903	5	5	20	2	\N	2020-07-29	-124.54	928	2020-10-29 19:03:13.628801	2020-10-29 19:03:13.628801
6904	5	5	20	2	\N	2020-07-29	-89.97	f9f	2020-10-29 19:03:13.629997	2020-10-29 19:03:13.629997
6905	5	1	5	2	\N	2020-07-29	-77.43	d1e	2020-10-29 19:03:13.631077	2020-10-29 19:03:13.631077
6906	5	4	10	2	\N	2020-07-30	-490.73	29a	2020-10-29 19:03:13.632208	2020-10-29 19:03:13.632208
6907	5	4	12	2	\N	2020-07-30	-89.99	e7f	2020-10-29 19:03:13.633243	2020-10-29 19:03:13.633243
6908	2	9	-1	3	\N	2020-07-30	-50.00	27c	2020-10-29 19:03:13.634349	2020-10-29 19:03:13.634349
6909	5	9	-1	4	\N	2020-07-30	50.00	27c	2020-10-29 19:03:13.635483	2020-10-29 19:03:13.635483
6910	2	10	51	3	\N	2020-07-30	-1000.00	169	2020-10-29 19:03:13.637016	2020-10-29 19:03:13.637016
6911	6	10	51	4	\N	2020-07-30	1000.00	169	2020-10-29 19:03:13.638155	2020-10-29 19:03:13.638155
6912	2	10	51	3	\N	2020-07-30	-500.00	857	2020-10-29 19:03:13.639373	2020-10-29 19:03:13.639373
6913	4	10	51	4	\N	2020-07-30	500.00	857	2020-10-29 19:03:13.640435	2020-10-29 19:03:13.640435
6914	5	2	-1	4	\N	2020-08-01	1500.00	5bc	2020-10-29 19:03:13.641666	2020-10-29 19:03:13.641666
6915	6	10	51	4	\N	2020-08-01	1000.00	039	2020-10-29 19:03:13.642835	2020-10-29 19:03:13.642835
6916	2	2	-1	4	\N	2020-08-01	1000.00	d56	2020-10-29 19:03:13.64394	2020-10-29 19:03:13.64394
6917	6	10	52	1	\N	2020-08-01	4.90	15b	2020-10-29 19:03:13.644989	2020-10-29 19:03:13.644989
6918	6	10	52	1	\N	2020-08-01	2.00	15b	2020-10-29 19:03:13.645993	2020-10-29 19:03:13.645993
6919	5	8	40	2	\N	2020-07-30	-170.17	598	2020-10-29 19:03:13.646993	2020-10-29 19:03:13.646993
6920	5	1	5	2	\N	2020-07-30	-151.01	b5c	2020-10-29 19:03:13.647999	2020-10-29 19:03:13.647999
6921	1	2	-1	4	\N	2020-08-01	4900.00	d94	2020-10-29 19:03:13.649026	2020-10-29 19:03:13.649026
6922	1	7	30	2	\N	2020-07-30	-29.99	8b6	2020-10-29 19:03:13.650077	2020-10-29 19:03:13.650077
6923	1	1	6	2	\N	2020-07-30	-102.30	c12	2020-10-29 19:03:13.651157	2020-10-29 19:03:13.651157
6924	1	8	41	2	\N	2020-07-30	-20.41	af0	2020-10-29 19:03:13.652338	2020-10-29 19:03:13.652338
6925	1	8	42	2	\N	2020-07-30	-88.00	f82	2020-10-29 19:03:13.653837	2020-10-29 19:03:13.653837
6926	1	8	40	2	\N	2020-07-30	-12.00	750	2020-10-29 19:03:13.654967	2020-10-29 19:03:13.654967
6927	1	3	9	2	\N	2020-07-30	-85.00	0c6	2020-10-29 19:03:13.656135	2020-10-29 19:03:13.656135
6928	1	1	4	2	\N	2020-07-30	-9.50	23d	2020-10-29 19:03:13.657343	2020-10-29 19:03:13.657343
6929	1	2	1	1	\N	2020-08-01	0.00	809	2020-10-29 19:03:13.65849	2020-10-29 19:03:13.65849
6930	1	9	50	3	\N	2020-08-03	-4500.00	918	2020-10-29 19:03:13.659618	2020-10-29 19:03:13.659618
6931	1	9	48	2	\N	2020-08-03	-50.00	756	2020-10-29 19:03:13.660698	2020-10-29 19:03:13.660698
6932	5	4	13	2	\N	2020-08-05	-70.00	c18	2020-10-29 19:03:13.661877	2020-10-29 19:03:13.661877
6933	1	8	41	2	\N	2020-08-10	-25.19	af0	2020-10-29 19:03:13.663013	2020-10-29 19:03:13.663013
6934	1	3	9	2	\N	2020-08-08	-19.00	3ea	2020-10-29 19:03:13.664148	2020-10-29 19:03:13.664148
6935	1	3	9	2	\N	2020-08-08	-11.00	3ea	2020-10-29 19:03:13.6654	2020-10-29 19:03:13.6654
6936	1	1	6	2	\N	2020-08-08	-31.00	c65	2020-10-29 19:03:13.666508	2020-10-29 19:03:13.666508
6937	1	8	41	2	\N	2020-08-08	-24.88	af0	2020-10-29 19:03:13.667617	2020-10-29 19:03:13.667617
6938	5	1	5	2	\N	2020-08-10	-174.73	6ee	2020-10-29 19:03:13.669146	2020-10-29 19:03:13.669146
6939	5	1	5	2	\N	2020-08-10	-70.79	e7e	2020-10-29 19:03:13.670858	2020-10-29 19:03:13.670858
6940	5	1	5	2	\N	2020-08-08	-92.95	6ee	2020-10-29 19:03:13.672052	2020-10-29 19:03:13.672052
6941	5	9	50	3	\N	2020-08-04	-3000.00	039	2020-10-29 19:03:13.673153	2020-10-29 19:03:13.673153
6942	6	10	51	4	\N	2020-08-04	3000.00	039	2020-10-29 19:03:13.674239	2020-10-29 19:03:13.674239
6943	6	9	50	3	\N	2020-07-31	-1000.00	f2e	2020-10-29 19:03:13.675259	2020-10-29 19:03:13.675259
6944	2	5	23	2	\N	2020-08-04	-100.96	df9	2020-10-29 19:03:13.676388	2020-10-29 19:03:13.676388
6945	5	8	40	2	\N	2020-08-12	-202.73	a6f	2020-10-29 19:03:13.67755	2020-10-29 19:03:13.67755
6946	5	5	19	2	\N	2020-08-13	-360.00	3ac	2020-10-29 19:03:13.678729	2020-10-29 19:03:13.678729
6947	5	1	5	2	\N	2020-08-14	-174.90	6ee	2020-10-29 19:03:13.67991	2020-10-29 19:03:13.67991
6948	5	1	5	2	\N	2020-08-13	-64.35	6ee	2020-10-29 19:03:13.680995	2020-10-29 19:03:13.680995
6949	1	5	19	2	\N	2020-08-13	-70.99	2e3	2020-10-29 19:03:13.682089	2020-10-29 19:03:13.682089
6950	2	1	6	2	\N	2020-08-16	-13.00	07e	2020-10-29 19:03:13.683084	2020-10-29 19:03:13.683084
6951	2	4	15	2	\N	2020-08-17	-25.00	de2	2020-10-29 19:03:13.684168	2020-10-29 19:03:13.684168
6952	5	1	5	2	\N	2020-08-18	-69.18	6ee	2020-10-29 19:03:13.685245	2020-10-29 19:03:13.685245
6953	5	1	5	2	\N	2020-08-19	-18.00	353	2020-10-29 19:03:13.686476	2020-10-29 19:03:13.686476
6954	5	2	-1	4	\N	2020-08-20	5100.00	25d	2020-10-29 19:03:13.687673	2020-10-29 19:03:13.687673
6955	5	9	50	3	\N	2020-08-20	-3800.00	d02	2020-10-29 19:03:13.68874	2020-10-29 19:03:13.68874
6956	6	10	51	4	\N	2020-08-20	3800.00	d02	2020-10-29 19:03:13.689824	2020-10-29 19:03:13.689824
6957	1	8	41	2	\N	2020-08-20	-15.80	8be	2020-10-29 19:03:13.69103	2020-10-29 19:03:13.69103
6958	1	5	19	2	\N	2020-08-20	-170.00	2e8	2020-10-29 19:03:13.692194	2020-10-29 19:03:13.692194
6959	1	8	41	2	\N	2020-08-20	-2.00	baa	2020-10-29 19:03:13.69343	2020-10-29 19:03:13.69343
6960	1	8	41	2	\N	2020-08-20	-18.74	8be	2020-10-29 19:03:13.694638	2020-10-29 19:03:13.694638
6961	1	8	41	2	\N	2020-08-20	-14.05	af0	2020-10-29 19:03:13.69574	2020-10-29 19:03:13.69574
6962	1	1	8	2	\N	2020-08-20	-20.70	6dc	2020-10-29 19:03:13.696968	2020-10-29 19:03:13.696968
6963	5	5	18	2	\N	2020-08-20	-53.74	846	2020-10-29 19:03:13.69805	2020-10-29 19:03:13.69805
6964	5	1	5	2	\N	2020-08-20	-221.15	e7e	2020-10-29 19:03:13.699062	2020-10-29 19:03:13.699062
6965	2	1	6	2	\N	2020-08-21	-49.00	9cb	2020-10-29 19:03:13.700089	2020-10-29 19:03:13.700089
6966	2	1	6	2	\N	2020-08-23	-84.00	81d	2020-10-29 19:03:13.701201	2020-10-29 19:03:13.701201
6967	2	1	6	2	\N	2020-08-23	-27.00	81d	2020-10-29 19:03:13.702453	2020-10-29 19:03:13.702453
6968	5	1	6	2	\N	2020-08-23	-18.00	81d	2020-10-29 19:03:13.704235	2020-10-29 19:03:13.704235
6969	5	10	51	3	\N	2020-08-25	-1000.00	d41	2020-10-29 19:03:13.705565	2020-10-29 19:03:13.705565
6970	6	10	51	4	\N	2020-08-25	1000.00	d41	2020-10-29 19:03:13.70677	2020-10-29 19:03:13.70677
6971	5	1	5	2	\N	2020-08-25	-50.11	6d9	2020-10-29 19:03:13.707886	2020-10-29 19:03:13.707886
6972	2	1	6	2	\N	2020-08-26	-20.00	19e	2020-10-29 19:03:13.709084	2020-10-29 19:03:13.709084
6973	2	6	24	2	\N	2020-08-27	-159.99	15f	2020-10-29 19:03:13.710164	2020-10-29 19:03:13.710164
6974	5	5	20	2	\N	2020-08-27	-59.45	291	2020-10-29 19:03:13.711261	2020-10-29 19:03:13.711261
6975	5	1	5	2	\N	2020-08-27	-157.85	463	2020-10-29 19:03:13.712286	2020-10-29 19:03:13.712286
6976	5	8	40	2	\N	2020-08-27	-40.00	124	2020-10-29 19:03:13.713288	2020-10-29 19:03:13.713288
6977	2	6	24	2	\N	2020-08-28	-79.99	79d	2020-10-29 19:03:13.714419	2020-10-29 19:03:13.714419
6978	2	6	24	2	\N	2020-08-28	-99.99	784	2020-10-29 19:03:13.71546	2020-10-29 19:03:13.71546
6979	5	1	5	2	\N	2020-08-28	-104.20	8e2	2020-10-29 19:03:13.716597	2020-10-29 19:03:13.716597
6980	2	2	1	1	\N	2020-08-28	7336.53	859	2020-10-29 19:03:13.717636	2020-10-29 19:03:13.717636
6981	2	10	51	3	\N	2020-08-28	-1000.00	375	2020-10-29 19:03:13.718791	2020-10-29 19:03:13.718791
6982	4	10	51	4	\N	2020-08-28	1000.00	375	2020-10-29 19:03:13.720411	2020-10-29 19:03:13.720411
6983	2	10	51	3	\N	2020-08-28	-3000.00	877	2020-10-29 19:03:13.721775	2020-10-29 19:03:13.721775
6984	6	10	51	4	\N	2020-08-28	3000.00	877	2020-10-29 19:03:13.722841	2020-10-29 19:03:13.722841
6985	2	10	51	3	\N	2020-08-28	-2000.00	efb	2020-10-29 19:03:13.723916	2020-10-29 19:03:13.723916
6986	5	10	51	4	\N	2020-08-28	2000.00	efb	2020-10-29 19:03:13.724921	2020-10-29 19:03:13.724921
6987	5	4	10	2	\N	2020-08-28	-608.15	159	2020-10-29 19:03:13.726195	2020-10-29 19:03:13.726195
6988	5	4	13	2	\N	2020-08-28	-49.90	a32	2020-10-29 19:03:13.727399	2020-10-29 19:03:13.727399
6989	5	4	11	2	\N	2020-08-28	-108.92	e44	2020-10-29 19:03:13.728511	2020-10-29 19:03:13.728511
6990	1	2	-1	4	\N	2020-08-31	10.00	e0f	2020-10-29 19:03:13.72969	2020-10-29 19:03:13.72969
6991	1	9	44	3	\N	2020-08-31	-120.00	092	2020-10-29 19:03:13.730825	2020-10-29 19:03:13.730825
6992	1	7	30	2	\N	2020-08-31	-29.99	fd5	2020-10-29 19:03:13.731966	2020-10-29 19:03:13.731966
6993	1	8	41	2	\N	2020-08-31	-15.36	af0	2020-10-29 19:03:13.733009	2020-10-29 19:03:13.733009
6994	1	1	4	2	\N	2020-08-31	-3.99	4d2	2020-10-29 19:03:13.734103	2020-10-29 19:03:13.734103
6995	1	2	-1	4	\N	2020-08-31	10400.00	dd1	2020-10-29 19:03:13.735209	2020-10-29 19:03:13.735209
6996	1	9	47	2	\N	2020-08-31	-7.50	b73	2020-10-29 19:03:13.736392	2020-10-29 19:03:13.736392
6997	1	5	19	2	\N	2020-08-31	-150.00	2e8	2020-10-29 19:03:13.738016	2020-10-29 19:03:13.738016
6998	1	9	46	2	\N	2020-08-31	-23.99	e9b	2020-10-29 19:03:13.739854	2020-10-29 19:03:13.739854
6999	1	7	27	2	\N	2020-08-31	-134.00	534	2020-10-29 19:03:13.74109	2020-10-29 19:03:13.74109
7000	1	1	8	2	\N	2020-08-31	-11.70	cfc	2020-10-29 19:03:13.742153	2020-10-29 19:03:13.742153
7001	1	8	38	2	\N	2020-08-31	-30.57	074	2020-10-29 19:03:13.743298	2020-10-29 19:03:13.743298
7002	5	1	5	2	\N	2020-08-31	-12.95	07d	2020-10-29 19:03:13.744427	2020-10-29 19:03:13.744427
7003	5	8	40	2	\N	2020-09-01	-210.67	a6f	2020-10-29 19:03:13.745573	2020-10-29 19:03:13.745573
7004	6	10	52	1	\N	2020-09-01	4.52	15b	2020-10-29 19:03:13.746662	2020-10-29 19:03:13.746662
7005	6	10	52	1	\N	2020-09-01	1.87	15b	2020-10-29 19:03:13.747709	2020-10-29 19:03:13.747709
7006	1	9	50	3	\N	2020-09-01	-9900.00	b48	2020-10-29 19:03:13.748716	2020-10-29 19:03:13.748716
7007	5	2	-1	4	\N	2020-09-01	1500.00	dd2	2020-10-29 19:03:13.749752	2020-10-29 19:03:13.749752
7008	6	10	51	4	\N	2020-09-01	1000.00	dd2	2020-10-29 19:03:13.750952	2020-10-29 19:03:13.750952
7009	1	2	-1	4	\N	2020-09-01	5800.00	dd2	2020-10-29 19:03:13.752124	2020-10-29 19:03:13.752124
7010	1	9	45	2	\N	2020-09-01	-18.00	f64	2020-10-29 19:03:13.753591	2020-10-29 19:03:13.753591
7011	1	5	19	2	\N	2020-09-01	-100.96	14a	2020-10-29 19:03:13.754755	2020-10-29 19:03:13.754755
7012	1	9	50	3	\N	2020-09-01	-5000.00	039	2020-10-29 19:03:13.75581	2020-10-29 19:03:13.75581
7013	2	5	18	2	\N	2020-09-02	-47.76	2ea	2020-10-29 19:03:13.756878	2020-10-29 19:03:13.756878
7014	2	6	24	2	\N	2020-09-02	-79.99	903	2020-10-29 19:03:13.758024	2020-10-29 19:03:13.758024
7015	2	6	24	1	\N	2020-09-02	159.99	d91	2020-10-29 19:03:13.75905	2020-10-29 19:03:13.75905
7016	2	1	5	2	\N	2020-09-01	-49.10	47b	2020-10-29 19:03:13.760064	2020-10-29 19:03:13.760064
7017	5	5	20	2	\N	2020-09-02	-68.97	20c	2020-10-29 19:03:13.761054	2020-10-29 19:03:13.761054
7018	5	1	5	2	\N	2020-09-02	-167.15	6ee	2020-10-29 19:03:13.762058	2020-10-29 19:03:13.762058
7019	5	10	51	3	\N	2020-09-02	-2000.00	b11	2020-10-29 19:03:13.763069	2020-10-29 19:03:13.763069
7020	6	10	51	4	\N	2020-09-02	2000.00	b11	2020-10-29 19:03:13.764081	2020-10-29 19:03:13.764081
7021	5	8	40	2	\N	2020-09-05	-134.62	00b	2020-10-29 19:03:13.765071	2020-10-29 19:03:13.765071
7022	5	8	40	2	\N	2020-09-11	-186.26	00b	2020-10-29 19:03:13.766076	2020-10-29 19:03:13.766076
7023	5	8	40	2	\N	2020-09-12	-175.22	00b	2020-10-29 19:03:13.76707	2020-10-29 19:03:13.76707
7024	1	1	4	2	\N	2020-09-12	-32.10	23d	2020-10-29 19:03:13.768056	2020-10-29 19:03:13.768056
7025	1	1	6	2	\N	2020-09-13	-47.00	c65	2020-10-29 19:03:13.769101	2020-10-29 19:03:13.769101
7026	1	9	46	2	\N	2020-09-13	-77.99	452	2020-10-29 19:03:13.770461	2020-10-29 19:03:13.770461
7027	1	1	6	2	\N	2020-09-10	-50.00	359	2020-10-29 19:03:13.771562	2020-10-29 19:03:13.771562
7028	1	1	4	2	\N	2020-09-07	-14.97	b80	2020-10-29 19:03:13.772614	2020-10-29 19:03:13.772614
7029	1	3	9	2	\N	2020-09-07	-45.32	c8b	2020-10-29 19:03:13.773655	2020-10-29 19:03:13.773655
7030	1	8	40	2	\N	2020-09-05	-2.00	baa	2020-10-29 19:03:13.774778	2020-10-29 19:03:13.774778
7031	1	9	46	2	\N	2020-09-05	-159.00	aca	2020-10-29 19:03:13.7759	2020-10-29 19:03:13.7759
7032	1	5	19	2	\N	2020-09-05	-150.00	2e8	2020-10-29 19:03:13.777193	2020-10-29 19:03:13.777193
7033	1	9	48	2	\N	2020-09-13	-50.00	44a	2020-10-29 19:03:13.778301	2020-10-29 19:03:13.778301
7034	5	8	40	2	\N	2020-09-12	-36.20	96a	2020-10-29 19:03:13.779953	2020-10-29 19:03:13.779953
7035	5	8	40	2	\N	2020-09-06	-36.20	96a	2020-10-29 19:03:13.781081	2020-10-29 19:03:13.781081
7036	5	9	45	2	\N	2020-09-13	-101.18	506	2020-10-29 19:03:13.782247	2020-10-29 19:03:13.782247
7037	5	1	5	2	\N	2020-09-11	-17.20	6ee	2020-10-29 19:03:13.783344	2020-10-29 19:03:13.783344
7038	5	1	6	2	\N	2020-09-10	-101.50	1d6	2020-10-29 19:03:13.784504	2020-10-29 19:03:13.784504
7039	5	5	19	2	\N	2020-09-10	-8.00	e5e	2020-10-29 19:03:13.785703	2020-10-29 19:03:13.785703
7040	5	1	5	2	\N	2020-09-10	-9.40	641	2020-10-29 19:03:13.787025	2020-10-29 19:03:13.787025
7041	5	7	27	2	\N	2020-09-10	-53.00	594	2020-10-29 19:03:13.788366	2020-10-29 19:03:13.788366
7042	5	7	27	2	\N	2020-09-10	-48.00	b66	2020-10-29 19:03:13.789701	2020-10-29 19:03:13.789701
7043	5	1	5	2	\N	2020-09-10	-124.91	6ee	2020-10-29 19:03:13.790919	2020-10-29 19:03:13.790919
7044	5	1	8	2	\N	2020-09-10	-31.50	99d	2020-10-29 19:03:13.792253	2020-10-29 19:03:13.792253
7045	5	1	5	2	\N	2020-09-10	-20.31	7e3	2020-10-29 19:03:13.793533	2020-10-29 19:03:13.793533
7046	5	4	13	2	\N	2020-09-10	-70.00	d5d	2020-10-29 19:03:13.794623	2020-10-29 19:03:13.794623
7047	5	7	27	2	\N	2020-09-10	-500.00	1ac	2020-10-29 19:03:13.795616	2020-10-29 19:03:13.795616
7048	5	9	45	2	\N	2020-09-10	-84.53	608	2020-10-29 19:03:13.796636	2020-10-29 19:03:13.796636
7049	5	1	5	2	\N	2020-09-10	-100.05	e7e	2020-10-29 19:03:13.797793	2020-10-29 19:03:13.797793
7050	2	5	20	2	\N	2020-09-14	-5.00	902	2020-10-29 19:03:13.79896	2020-10-29 19:03:13.79896
7051	5	1	5	2	\N	2020-09-14	-163.97	6ee	2020-10-29 19:03:13.800122	2020-10-29 19:03:13.800122
7052	2	5	20	2	\N	2020-09-14	-1.00	c41	2020-10-29 19:03:13.801362	2020-10-29 19:03:13.801362
7053	2	1	8	2	\N	2020-09-12	-5.00	29d	2020-10-29 19:03:13.802666	2020-10-29 19:03:13.802666
7054	2	6	24	1	\N	2020-09-03	99.99	771	2020-10-29 19:03:13.804304	2020-10-29 19:03:13.804304
7055	2	5	23	2	\N	2020-09-17	-17.98	58d	2020-10-29 19:03:13.805637	2020-10-29 19:03:13.805637
7056	2	5	23	2	\N	2020-09-17	-12.49	ede	2020-10-29 19:03:13.806792	2020-10-29 19:03:13.806792
7057	2	8	37	2	\N	2020-09-17	-2.00	32e	2020-10-29 19:03:13.80789	2020-10-29 19:03:13.80789
7058	5	1	5	2	\N	2020-09-17	-149.06	9e4	2020-10-29 19:03:13.808991	2020-10-29 19:03:13.808991
7059	5	8	40	2	\N	2020-09-17	-15.00	50d	2020-10-29 19:03:13.810131	2020-10-29 19:03:13.810131
7060	2	8	41	2	\N	2020-09-19	-41.40	0fc	2020-10-29 19:03:13.811553	2020-10-29 19:03:13.811553
7061	2	8	41	1	\N	2020-09-19	18.00	a6b	2020-10-29 19:03:13.812892	2020-10-29 19:03:13.812892
7062	2	8	41	2	\N	2020-09-19	-10.65	10c	2020-10-29 19:03:13.814327	2020-10-29 19:03:13.814327
7063	2	3	9	2	\N	2020-09-19	-12.00	a57	2020-10-29 19:03:13.81558	2020-10-29 19:03:13.81558
7064	2	4	15	2	\N	2020-09-19	-25.00	f80	2020-10-29 19:03:13.816796	2020-10-29 19:03:13.816796
7065	2	6	24	1	\N	2020-09-19	79.99	2cb	2020-10-29 19:03:13.81802	2020-10-29 19:03:13.81802
7066	2	9	-1	2	\N	2020-09-19	-3.97	4ed	2020-10-29 19:03:13.819303	2020-10-29 19:03:13.819303
7067	5	9	45	1	\N	2020-09-21	41.99	09f	2020-10-29 19:03:13.820768	2020-10-29 19:03:13.820768
7068	1	8	40	2	\N	2020-09-22	-140.00	383	2020-10-29 19:03:13.821898	2020-10-29 19:03:13.821898
7069	1	8	40	2	\N	2020-09-22	-1448.00	250	2020-10-29 19:03:13.823284	2020-10-29 19:03:13.823284
7070	1	8	38	2	\N	2020-09-22	-21.73	8be	2020-10-29 19:03:13.825098	2020-10-29 19:03:13.825098
7071	1	8	41	2	\N	2020-09-22	-30.57	074	2020-10-29 19:03:13.82722	2020-10-29 19:03:13.82722
7072	1	9	-1	2	\N	2020-09-19	-7.94	9bd	2020-10-29 19:03:13.829787	2020-10-29 19:03:13.829787
7073	1	1	5	2	\N	2020-09-19	-294.04	e5f	2020-10-29 19:03:13.831583	2020-10-29 19:03:13.831583
7074	1	5	19	2	\N	2020-09-19	-150.00	2e8	2020-10-29 19:03:13.832967	2020-10-29 19:03:13.832967
7075	1	8	40	2	\N	2020-09-19	-138.57	a6f	2020-10-29 19:03:13.834164	2020-10-29 19:03:13.834164
7076	1	1	8	2	\N	2020-09-16	-17.00	cfc	2020-10-29 19:03:13.835265	2020-10-29 19:03:13.835265
7077	1	5	22	2	\N	2020-09-16	-57.00	9da	2020-10-29 19:03:13.837454	2020-10-29 19:03:13.837454
7078	1	9	46	2	\N	2020-09-16	-799.00	9f3	2020-10-29 19:03:13.839906	2020-10-29 19:03:13.839906
7079	1	2	-1	4	\N	2020-09-14	11303.79	5bc	2020-10-29 19:03:13.841308	2020-10-29 19:03:13.841308
7080	5	9	50	3	\N	2020-09-23	-2050.61	51d	2020-10-29 19:03:13.842777	2020-10-29 19:03:13.842777
7081	1	2	2	4	\N	2020-09-23	2050.61	51d	2020-10-29 19:03:13.844008	2020-10-29 19:03:13.844008
7082	5	2	-1	4	\N	2020-09-23	3000.00	8ec	2020-10-29 19:03:13.845166	2020-10-29 19:03:13.845166
7083	6	9	50	3	\N	2020-09-23	-3000.00	8ec	2020-10-29 19:03:13.846576	2020-10-29 19:03:13.846576
7084	2	9	45	2	\N	2020-09-25	-31.00	892	2020-10-29 19:03:13.848666	2020-10-29 19:03:13.848666
7085	2	2	1	1	\N	2020-09-26	8238.46	0b0	2020-10-29 19:03:13.849918	2020-10-29 19:03:13.849918
7086	5	1	5	2	\N	2020-09-25	-211.09	6ee	2020-10-29 19:03:13.851171	2020-10-29 19:03:13.851171
7087	5	5	20	2	\N	2020-09-26	-38.08	38e	2020-10-29 19:03:13.852405	2020-10-29 19:03:13.852405
7088	5	5	20	2	\N	2020-09-26	-13.00	ee9	2020-10-29 19:03:13.854026	2020-10-29 19:03:13.854026
7089	5	1	5	2	\N	2020-09-26	-96.68	99d	2020-10-29 19:03:13.855606	2020-10-29 19:03:13.855606
7090	5	1	5	2	\N	2020-09-26	-24.14	d3a	2020-10-29 19:03:13.857227	2020-10-29 19:03:13.857227
7091	5	1	5	2	\N	2020-09-26	-4.45	193	2020-10-29 19:03:13.85883	2020-10-29 19:03:13.85883
7092	2	10	51	3	\N	2020-09-27	-4000.00	fb7	2020-10-29 19:03:13.86017	2020-10-29 19:03:13.86017
7093	6	10	51	4	\N	2020-09-27	4000.00	fb7	2020-10-29 19:03:13.861561	2020-10-29 19:03:13.861561
7094	2	10	51	3	\N	2020-09-27	-2000.00	efb	2020-10-29 19:03:13.862764	2020-10-29 19:03:13.862764
7095	5	10	51	4	\N	2020-09-27	2000.00	efb	2020-10-29 19:03:13.865011	2020-10-29 19:03:13.865011
7096	5	4	10	2	\N	2020-09-27	-493.88	d3d	2020-10-29 19:03:13.867154	2020-10-29 19:03:13.867154
7097	5	4	13	2	\N	2020-09-27	-49.90	59a	2020-10-29 19:03:13.868844	2020-10-29 19:03:13.868844
7098	5	4	12	2	\N	2020-09-27	-216.16	815	2020-10-29 19:03:13.870611	2020-10-29 19:03:13.870611
7099	5	4	12	2	\N	2020-09-27	-145.02	93b	2020-10-29 19:03:13.872154	2020-10-29 19:03:13.872154
7100	1	5	19	2	\N	2020-09-24	-150.00	2e8	2020-10-29 19:03:13.873895	2020-10-29 19:03:13.873895
7101	1	1	8	2	\N	2020-09-24	-9.00	d93	2020-10-29 19:03:13.875321	2020-10-29 19:03:13.875321
7102	1	9	46	2	\N	2020-09-27	-2000.00	777	2020-10-29 19:03:13.876639	2020-10-29 19:03:13.876639
7103	2	9	-1	2	\N	2020-09-28	-100.75	ba4	2020-10-29 19:03:13.878526	2020-10-29 19:03:13.878526
7104	2	1	6	2	\N	2020-09-28	-8.49	de7	2020-10-29 19:03:13.880451	2020-10-29 19:03:13.880451
7105	1	9	50	3	\N	2020-10-01	-1600.00	376	2020-10-29 19:03:13.881943	2020-10-29 19:03:13.881943
7106	1	9	50	3	\N	2020-10-01	-1000.00	14c	2020-10-29 19:03:13.883949	2020-10-29 19:03:13.883949
7107	6	2	-1	4	\N	2020-10-01	1000.00	14c	2020-10-29 19:03:13.88627	2020-10-29 19:03:13.88627
7108	1	9	50	3	\N	2020-10-01	-1500.00	bab	2020-10-29 19:03:13.888124	2020-10-29 19:03:13.888124
7109	5	2	-1	4	\N	2020-10-01	1500.00	bab	2020-10-29 19:03:13.889656	2020-10-29 19:03:13.889656
7110	1	8	41	2	\N	2020-09-30	-49.82	af0	2020-10-29 19:03:13.891001	2020-10-29 19:03:13.891001
7111	1	8	41	2	\N	2020-09-30	-11.66	8be	2020-10-29 19:03:13.892178	2020-10-29 19:03:13.892178
7112	1	7	30	2	\N	2020-09-30	-29.99	fd5	2020-10-29 19:03:13.893196	2020-10-29 19:03:13.893196
7113	1	9	47	2	\N	2020-10-01	-15.00	32d	2020-10-29 19:03:13.894391	2020-10-29 19:03:13.894391
7114	6	10	52	1	\N	2020-10-01	1.05	15b	2020-10-29 19:03:13.895955	2020-10-29 19:03:13.895955
7115	6	10	52	1	\N	2020-10-01	0.44	15b	2020-10-29 19:03:13.898831	2020-10-29 19:03:13.898831
7116	5	1	5	2	\N	2020-09-29	-145.23	6ee	2020-10-29 19:03:13.900528	2020-10-29 19:03:13.900528
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: expense_tracker; Owner: expense_tracker_group
--

COPY expense_tracker.users (id_user, user_login, user_name, user_password, password_salt, active, insert_date, update_date) FROM stdin;
1	jkowalski	Janusz Kowalski	b8dc82c15ae882bbe7e04659a60e3cba	123$	1	2020-10-29 19:02:13.944409	2020-10-29 19:02:13.944409
2	gkowalska	Gra??yna Kowalska	3c37f9d5ca7960423885c668a4058b21	123$	1	2020-10-29 19:02:15.297408	2020-10-29 19:02:15.297408
\.


--
-- Name: bank_account_owner_id_ba_own_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.bank_account_owner_id_ba_own_seq', 3, true);


--
-- Name: bank_account_types_id_ba_type_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.bank_account_types_id_ba_type_seq', 6, true);


--
-- Name: transaction_bank_accounts_id_trans_ba_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.transaction_bank_accounts_id_trans_ba_seq', 6, true);


--
-- Name: transaction_category_id_trans_cat_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.transaction_category_id_trans_cat_seq', 10, true);


--
-- Name: transaction_subcategory_id_trans_subcat_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.transaction_subcategory_id_trans_subcat_seq', 53, true);


--
-- Name: transaction_type_id_trans_type_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.transaction_type_id_trans_type_seq', 4, true);


--
-- Name: transactions_id_transaction_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.transactions_id_transaction_seq', 7116, true);


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: expense_tracker; Owner: expense_tracker_group
--

SELECT pg_catalog.setval('expense_tracker.users_id_user_seq', 2, true);


--
-- Name: bank_account_owner bank_account_owner_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.bank_account_owner
    ADD CONSTRAINT bank_account_owner_pkey PRIMARY KEY (id_ba_own);


--
-- Name: bank_account_types bank_account_types_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.bank_account_types
    ADD CONSTRAINT bank_account_types_pkey PRIMARY KEY (id_ba_type);


--
-- Name: transaction_bank_accounts transaction_bank_accounts_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_bank_accounts
    ADD CONSTRAINT transaction_bank_accounts_pkey PRIMARY KEY (id_trans_ba);


--
-- Name: transaction_category transaction_category_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_category
    ADD CONSTRAINT transaction_category_pkey PRIMARY KEY (id_trans_cat);


--
-- Name: transaction_subcategory transaction_subcategory_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_subcategory
    ADD CONSTRAINT transaction_subcategory_pkey PRIMARY KEY (id_trans_subcat);


--
-- Name: transaction_type transaction_type_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_type
    ADD CONSTRAINT transaction_type_pkey PRIMARY KEY (id_trans_type);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id_transaction);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- Name: bank_account_types bank_account_types_id_ba_own_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.bank_account_types
    ADD CONSTRAINT bank_account_types_id_ba_own_fkey FOREIGN KEY (id_ba_own) REFERENCES expense_tracker.bank_account_owner(id_ba_own);


--
-- Name: transaction_bank_accounts transaction_bank_accounts_id_ba_own_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_bank_accounts
    ADD CONSTRAINT transaction_bank_accounts_id_ba_own_fkey FOREIGN KEY (id_ba_own) REFERENCES expense_tracker.bank_account_owner(id_ba_own);


--
-- Name: transaction_bank_accounts transaction_bank_accounts_id_ba_typ_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_bank_accounts
    ADD CONSTRAINT transaction_bank_accounts_id_ba_typ_fkey FOREIGN KEY (id_ba_typ) REFERENCES expense_tracker.bank_account_types(id_ba_type);


--
-- Name: transaction_subcategory transaction_subcategory_id_trans_cat_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transaction_subcategory
    ADD CONSTRAINT transaction_subcategory_id_trans_cat_fkey FOREIGN KEY (id_trans_cat) REFERENCES expense_tracker.transaction_category(id_trans_cat);


--
-- Name: transactions transactions_id_trans_ba_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions
    ADD CONSTRAINT transactions_id_trans_ba_fkey FOREIGN KEY (id_trans_ba) REFERENCES expense_tracker.transaction_bank_accounts(id_trans_ba);


--
-- Name: transactions transactions_id_trans_cat_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions
    ADD CONSTRAINT transactions_id_trans_cat_fkey FOREIGN KEY (id_trans_cat) REFERENCES expense_tracker.transaction_category(id_trans_cat);


--
-- Name: transactions transactions_id_trans_subcat_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions
    ADD CONSTRAINT transactions_id_trans_subcat_fkey FOREIGN KEY (id_trans_subcat) REFERENCES expense_tracker.transaction_subcategory(id_trans_subcat);


--
-- Name: transactions transactions_id_trans_type_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions
    ADD CONSTRAINT transactions_id_trans_type_fkey FOREIGN KEY (id_trans_type) REFERENCES expense_tracker.transaction_type(id_trans_type);


--
-- Name: transactions transactions_id_user_fkey; Type: FK CONSTRAINT; Schema: expense_tracker; Owner: expense_tracker_group
--

ALTER TABLE ONLY expense_tracker.transactions
    ADD CONSTRAINT transactions_id_user_fkey FOREIGN KEY (id_user) REFERENCES expense_tracker.users(id_user);


--
-- PostgreSQL database dump complete
--





-----------QUERIES--------------





--1--
select bao.owner_name,
  bao.owner_desc,
  bat.ba_type,
  bat.ba_desc,
  bat.active,
  tba.bank_account_name,
  bao.user_login 
from expense_tracker.bank_account_owner bao 
left join expense_tracker.bank_account_types bat 
on bao.id_ba_own =bat.id_ba_own 
left join expense_tracker.transaction_bank_accounts tba 
on bat.id_ba_type = tba.id_ba_typ 
where bao.owner_name = 'Janusz Kowalski';

--2--

select tc.category_name,
  ts.subcategory_name 
from expense_tracker.transaction_category tc
left join expense_tracker.transaction_subcategory ts 
on tc.id_trans_cat = ts.id_trans_cat 
where tc.active  in ('1','True','y','Y') 
and ts.active in ('1','True','y','Y')
order by tc.id_trans_cat asc;



--3--

select t.*,
  tc.category_name 
from expense_tracker.transactions t 
left join expense_tracker.transaction_category tc 
on t.id_trans_cat = tc.id_trans_cat 
where tc.category_name = 'JEDZENIE'
and extract (year from t.transaction_date) = 2016;

--4--


insert into expense_tracker.transaction_subcategory (id_trans_cat,subcategory_name,subcategory_description)
values (1,'nowe jedzenie','nowe')

with ds as (

	select t.*,
	  tc.category_name 
	from expense_tracker.transactions t 
	left join expense_tracker.transaction_category tc 
	on t.id_trans_cat =tc.id_trans_cat 
	where tc.category_name = 'JEDZENIE'
	and extract (year from t.transaction_date) = 2016
)
update ds
set id_trans_subcat = 54
where id_trans_subcat =-1         -- error ds does not exists
	
---------

update expense_tracker.transactions t
set id_trans_subcat = 54
from expense_tracker.transactions tr 
left join expense_tracker.transaction_category tc 
on tr.id_trans_cat =tc.id_trans_cat 
where tc.category_name = 'JEDZENIE'
and extract (year from tr.transaction_date) = 2016
and tr.id_trans_subcat=-1         --updating all records not only those with -1

--5--

select tc.category_name,
  ts.subcategory_name, 
  tt.transaction_type_name,
  t.transaction_date,
  t.transaction_value
from expense_tracker.transactions t 
left join expense_tracker.transaction_bank_accounts tba 
on t.id_trans_ba =tba.id_trans_ba 
left join expense_tracker.transaction_category tc 
on t.id_trans_cat =tc.id_trans_cat 
left join expense_tracker.transaction_subcategory ts 
on t.id_trans_subcat =ts.id_trans_subcat 
left join expense_tracker.transaction_type tt 
on t.id_trans_type = tt.id_trans_type 
where tba.bank_account_name = 'OSZCZ - Janusz i Gra??ynka'
and extract (year from t.transaction_date) = 2020
