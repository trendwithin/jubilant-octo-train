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
