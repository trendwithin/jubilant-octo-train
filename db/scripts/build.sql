DROP TABLE IF EXISTS stock_data_master;

CREATE TABLE stock_data_master (
  market_close_date date,
  company_name text,
  symbol text,
  open text,
  high text,
  low text,
  close text,
  volume text,
  net_change text,
  industry text
);
COPY stock_data_master FROM '/Users/Strawman/2018-Dev/proper-projects/scanner/db/make/../data_files/import_development_stock_data.csv' WITH DELIMITER ',' HEADER CSV;
DROP TABLE IF EXISTS stock_symbols cascade;
DROP TABLE IF EXISTS sectors cascade;
DROP TABLE IF EXISTS industries cascade;
DROP TABLE IF EXISTS historic_prices cascade;

SELECT DISTINCT split_part(industry, '-', 1) AS name
INTO sectors
FROM stock_data_master;

ALTER TABLE sectors
add id serial primary key,
add created_at timestamp without time zone DEFAULT NOW(),
add updated_at timestamp without time zone DEFAULT NOW();

SELECT DISTINCT split_part(industry, '-', 2) AS name
INTO industries
FROM stock_data_master;

ALTER TABLE industries
add id serial primary key,
add created_at timestamp without time zone DEFAULT NOW(),
add updated_at timestamp without time zone DEFAULT NOW();

CREATE TABLE stock_symbols(
  id serial primary key,
  symbol text,
  company_name text,
  sector_id int,
  industry_id int,
  created_at timestamp without time zone DEFAULT NOW(),
  updated_at timestamp without time zone DEFAULT NOW()
);

INSERT INTO stock_symbols (
  symbol,
  company_name,
  sector_id,
  industry_id
)

SELECT
DISTINCT symbol,
company_name,
sectors.id as sector_id,
industries.id as industry_id
FROM
stock_data_master
INNER JOIN sectors
on sectors.name = split_part(industry, '-', 1)
INNER JOIN industries
on industries.name = split_part(industry, '-', 2)
;


CREATE TABLE historic_prices(
  id serial primary key,
  market_close_date date,
  open decimal,
  high decimal,
  low decimal,
  close decimal,
  volume int,
  net_change decimal,
  created_at timestamp without time zone DEFAULT NOW(),
  updated_at timestamp without time zone DEFAULT NOW(),
  stock_symbol_id int
);
INSERT INTO historic_prices (
  market_close_date,
  open,
  high,
  low,
  close,
  volume,
  net_change,
  stock_symbol_id
)
SELECT
  market_close_date,
  open::decimal,
  high::decimal,
  low::decimal,
  close::decimal,
  volume::int,
  net_change::decimal,
  stock_symbols.id as stock_symbol_id
FROM stock_data_master
INNER JOIN stock_symbols
on stock_symbols.symbol = stock_data_master.symbol
;

DROP TABLE IF EXISTS stock_data_master;
