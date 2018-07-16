SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: daily_high_lows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.daily_high_lows (
    id bigint NOT NULL,
    one_month_high integer NOT NULL,
    one_month_low integer NOT NULL,
    three_month_high integer NOT NULL,
    three_month_low integer NOT NULL,
    six_month_high integer NOT NULL,
    six_month_low integer NOT NULL,
    fifty_two_week_high integer NOT NULL,
    fifty_two_week_low integer NOT NULL,
    all_time_high integer NOT NULL,
    all_time_low integer NOT NULL,
    year_to_date_high integer NOT NULL,
    year_to_date_low integer NOT NULL,
    market_close_date date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: daily_high_lows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.daily_high_lows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: daily_high_lows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.daily_high_lows_id_seq OWNED BY public.daily_high_lows.id;


--
-- Name: fifty_two_week_highs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fifty_two_week_highs (
    id bigint NOT NULL,
    symbol text,
    market_close_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fifty_two_week_highs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fifty_two_week_highs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fifty_two_week_highs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fifty_two_week_highs_id_seq OWNED BY public.fifty_two_week_highs.id;


--
-- Name: historic_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.historic_prices (
    id integer NOT NULL,
    market_close_date date,
    open numeric,
    high numeric,
    low numeric,
    close numeric,
    volume integer,
    net_change numeric,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    stock_symbol_id integer
);


--
-- Name: historic_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.historic_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: historic_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.historic_prices_id_seq OWNED BY public.historic_prices.id;


--
-- Name: industries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.industries (
    name text,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: industries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.industries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.industries_id_seq OWNED BY public.industries.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sectors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sectors (
    name text,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sectors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sectors_id_seq OWNED BY public.sectors.id;


--
-- Name: stock_symbols; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_symbols (
    id integer NOT NULL,
    symbol text,
    company_name text,
    sector_id integer,
    industry_id integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: stock_symbols_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stock_symbols_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stock_symbols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stock_symbols_id_seq OWNED BY public.stock_symbols.id;


--
-- Name: daily_high_lows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daily_high_lows ALTER COLUMN id SET DEFAULT nextval('public.daily_high_lows_id_seq'::regclass);


--
-- Name: fifty_two_week_highs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fifty_two_week_highs ALTER COLUMN id SET DEFAULT nextval('public.fifty_two_week_highs_id_seq'::regclass);


--
-- Name: historic_prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historic_prices ALTER COLUMN id SET DEFAULT nextval('public.historic_prices_id_seq'::regclass);


--
-- Name: industries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.industries ALTER COLUMN id SET DEFAULT nextval('public.industries_id_seq'::regclass);


--
-- Name: sectors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectors ALTER COLUMN id SET DEFAULT nextval('public.sectors_id_seq'::regclass);


--
-- Name: stock_symbols id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_symbols ALTER COLUMN id SET DEFAULT nextval('public.stock_symbols_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: daily_high_lows daily_high_lows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daily_high_lows
    ADD CONSTRAINT daily_high_lows_pkey PRIMARY KEY (id);


--
-- Name: fifty_two_week_highs fifty_two_week_highs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fifty_two_week_highs
    ADD CONSTRAINT fifty_two_week_highs_pkey PRIMARY KEY (id);


--
-- Name: historic_prices historic_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historic_prices
    ADD CONSTRAINT historic_prices_pkey PRIMARY KEY (id);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: stock_symbols stock_symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_symbols
    ADD CONSTRAINT stock_symbols_pkey PRIMARY KEY (id);


--
-- Name: index_daily_high_lows_on_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_daily_high_lows_on_market_close_date ON public.daily_high_lows USING btree (market_close_date);


--
-- Name: index_fifty_two_week_highs_on_symbol_and_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_fifty_two_week_highs_on_symbol_and_market_close_date ON public.fifty_two_week_highs USING btree (symbol, market_close_date);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180605123924'),
('20180606230119'),
('20180710172534'),
('20180712185902');


