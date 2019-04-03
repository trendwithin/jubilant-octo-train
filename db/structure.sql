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
-- Name: all_time_highs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.all_time_highs (
    id bigint NOT NULL,
    symbol text,
    market_close_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: all_time_highs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.all_time_highs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: all_time_highs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.all_time_highs_id_seq OWNED BY public.all_time_highs.id;


--
-- Name: all_time_lows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.all_time_lows (
    id bigint NOT NULL,
    symbol text,
    market_close_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: all_time_lows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.all_time_lows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: all_time_lows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.all_time_lows_id_seq OWNED BY public.all_time_lows.id;


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
-- Name: fifty_two_week_lows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fifty_two_week_lows (
    id bigint NOT NULL,
    symbol text,
    market_close_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fifty_two_week_lows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fifty_two_week_lows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fifty_two_week_lows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fifty_two_week_lows_id_seq OWNED BY public.fifty_two_week_lows.id;


--
-- Name: five_period_leaders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.five_period_leaders (
    id bigint NOT NULL,
    positive integer,
    negative integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: five_period_leaders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.five_period_leaders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: five_period_leaders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.five_period_leaders_id_seq OWNED BY public.five_period_leaders.id;


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
-- Name: market_monitors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.market_monitors (
    id bigint NOT NULL,
    market_close_date date NOT NULL,
    up_four_pct_daily integer NOT NULL,
    down_four_pct_daily integer NOT NULL,
    up_twenty_five_pct_quarter integer NOT NULL,
    down_twenty_five_pct_quarter integer NOT NULL,
    up_twenty_five_pct_month integer NOT NULL,
    down_twenty_five_pct_month integer NOT NULL,
    up_thirteen_pct_six_weeks integer NOT NULL,
    down_thirteen_pct_six_weeks integer NOT NULL,
    up_fifty_pct_month integer NOT NULL,
    down_fifty_pct_month integer NOT NULL,
    total_stocks integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: market_monitors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.market_monitors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: market_monitors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.market_monitors_id_seq OWNED BY public.market_monitors.id;


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
-- Name: tradeable_universes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tradeable_universes (
    id bigint NOT NULL,
    three_month integer,
    six_month integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tradeable_universes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tradeable_universes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tradeable_universes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tradeable_universes_id_seq OWNED BY public.tradeable_universes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    role character varying DEFAULT 'user'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: all_time_highs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.all_time_highs ALTER COLUMN id SET DEFAULT nextval('public.all_time_highs_id_seq'::regclass);


--
-- Name: all_time_lows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.all_time_lows ALTER COLUMN id SET DEFAULT nextval('public.all_time_lows_id_seq'::regclass);


--
-- Name: daily_high_lows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daily_high_lows ALTER COLUMN id SET DEFAULT nextval('public.daily_high_lows_id_seq'::regclass);


--
-- Name: fifty_two_week_highs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fifty_two_week_highs ALTER COLUMN id SET DEFAULT nextval('public.fifty_two_week_highs_id_seq'::regclass);


--
-- Name: fifty_two_week_lows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fifty_two_week_lows ALTER COLUMN id SET DEFAULT nextval('public.fifty_two_week_lows_id_seq'::regclass);


--
-- Name: five_period_leaders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.five_period_leaders ALTER COLUMN id SET DEFAULT nextval('public.five_period_leaders_id_seq'::regclass);


--
-- Name: historic_prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historic_prices ALTER COLUMN id SET DEFAULT nextval('public.historic_prices_id_seq'::regclass);


--
-- Name: industries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.industries ALTER COLUMN id SET DEFAULT nextval('public.industries_id_seq'::regclass);


--
-- Name: market_monitors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.market_monitors ALTER COLUMN id SET DEFAULT nextval('public.market_monitors_id_seq'::regclass);


--
-- Name: sectors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectors ALTER COLUMN id SET DEFAULT nextval('public.sectors_id_seq'::regclass);


--
-- Name: stock_symbols id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_symbols ALTER COLUMN id SET DEFAULT nextval('public.stock_symbols_id_seq'::regclass);


--
-- Name: tradeable_universes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tradeable_universes ALTER COLUMN id SET DEFAULT nextval('public.tradeable_universes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: stock_symbols stock_symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_symbols
    ADD CONSTRAINT stock_symbols_pkey PRIMARY KEY (id);


--
-- Name: two_years_of_data_reports; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.two_years_of_data_reports AS
 SELECT row_to_json(jt.*) AS row_to_json
   FROM ( SELECT t1.symbol,
            t1.market_close_date,
            t1.open,
            t1.high,
            t1.low,
            t1.close,
            t1.volume
           FROM ( SELECT stock_symbols.symbol,
                    historic_prices.market_close_date,
                    historic_prices.open,
                    historic_prices.high,
                    historic_prices.low,
                    historic_prices.close,
                    historic_prices.volume,
                    count(*) AS count,
                    row_number() OVER (PARTITION BY stock_symbols.symbol ORDER BY historic_prices.market_close_date DESC) AS rno
                   FROM (public.stock_symbols
                     JOIN public.historic_prices ON ((stock_symbols.id = historic_prices.stock_symbol_id)))
                  WHERE (stock_symbols.symbol IN ( SELECT stock_symbols_1.symbol
                           FROM (public.stock_symbols stock_symbols_1
                             JOIN public.historic_prices historic_prices_1 ON ((stock_symbols_1.id = historic_prices_1.stock_symbol_id)))
                          GROUP BY stock_symbols_1.id
                         HAVING (count(*) >= 500)))
                  GROUP BY stock_symbols.symbol, historic_prices.market_close_date, historic_prices.open, historic_prices.high, historic_prices.low, historic_prices.close, historic_prices.volume
                  ORDER BY stock_symbols.symbol, historic_prices.market_close_date) t1
          WHERE (t1.rno <= 500)
          GROUP BY t1.symbol, t1.market_close_date, t1.open, t1.high, t1.low, t1.close, t1.volume
          ORDER BY t1.symbol, t1.market_close_date) jt
  WITH NO DATA;


--
-- Name: all_time_highs all_time_highs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.all_time_highs
    ADD CONSTRAINT all_time_highs_pkey PRIMARY KEY (id);


--
-- Name: all_time_lows all_time_lows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.all_time_lows
    ADD CONSTRAINT all_time_lows_pkey PRIMARY KEY (id);


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
-- Name: fifty_two_week_lows fifty_two_week_lows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fifty_two_week_lows
    ADD CONSTRAINT fifty_two_week_lows_pkey PRIMARY KEY (id);


--
-- Name: five_period_leaders five_period_leaders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.five_period_leaders
    ADD CONSTRAINT five_period_leaders_pkey PRIMARY KEY (id);


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
-- Name: market_monitors market_monitors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.market_monitors
    ADD CONSTRAINT market_monitors_pkey PRIMARY KEY (id);


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
-- Name: tradeable_universes tradeable_universes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tradeable_universes
    ADD CONSTRAINT tradeable_universes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_all_time_highs_on_symbol_and_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_all_time_highs_on_symbol_and_market_close_date ON public.all_time_highs USING btree (symbol, market_close_date);


--
-- Name: index_all_time_lows_on_symbol_and_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_all_time_lows_on_symbol_and_market_close_date ON public.all_time_lows USING btree (symbol, market_close_date);


--
-- Name: index_daily_high_lows_on_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_daily_high_lows_on_market_close_date ON public.daily_high_lows USING btree (market_close_date);


--
-- Name: index_fifty_two_week_highs_on_symbol_and_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_fifty_two_week_highs_on_symbol_and_market_close_date ON public.fifty_two_week_highs USING btree (symbol, market_close_date);


--
-- Name: index_fifty_two_week_lows_on_symbol_and_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_fifty_two_week_lows_on_symbol_and_market_close_date ON public.fifty_two_week_lows USING btree (symbol, market_close_date);


--
-- Name: index_five_period_leaders_on_positive_and_negative; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_five_period_leaders_on_positive_and_negative ON public.five_period_leaders USING btree (positive, negative);


--
-- Name: index_historic_prices_on_market_close_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_historic_prices_on_market_close_date ON public.historic_prices USING btree (market_close_date);


--
-- Name: index_historic_prices_on_stock_symbol_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_historic_prices_on_stock_symbol_id ON public.historic_prices USING btree (stock_symbol_id);


--
-- Name: index_stock_symbols_on_symbol; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stock_symbols_on_symbol ON public.stock_symbols USING btree (symbol);


--
-- Name: index_tradeable_universes_on_three_month_and_six_month; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tradeable_universes_on_three_month_and_six_month ON public.tradeable_universes USING btree (three_month, six_month);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: historic_prices fk_rails_1c59e2b330; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.historic_prices
    ADD CONSTRAINT fk_rails_1c59e2b330 FOREIGN KEY (stock_symbol_id) REFERENCES public.stock_symbols(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180605123924'),
('20180606230119'),
('20180710172534'),
('20180712185902'),
('20180716194259'),
('20180717171000'),
('20180801185936'),
('20180918204931'),
('20181030195946'),
('20181114182419'),
('20181115214837'),
('20190321231721'),
('20190322142521'),
('20190325232733'),
('20190325232925'),
('20190327192317');


