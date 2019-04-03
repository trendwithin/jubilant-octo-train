select row_to_json(jt)
FROM (
  SELECT
    t1.symbol, t1.market_close_date, t1.open, t1.high, t1.low, t1.close, t1.volume
  FROM (
    SELECT
      symbol, market_close_date, open, high, low, close, volume, count(*),
      ROW_NUMBER() OVER (PARTITION BY symbol order by market_close_date desc) as rno
    FROM stock_symbols
    INNER JOIN
      historic_prices
    ON
      stock_symbols.id = stock_symbol_id
    WHERE symbol in (
      SELECT
        symbol
      FROM
        stock_symbols
      INNER JOIN historic_prices on stock_symbols.id = stock_symbol_id
      GROUP BY
        stock_symbols.id
      HAVING
        COUNT(*) >= 500
      )
    GROUP BY
      symbol, market_close_date, open, high, low, close, volume
    ORDER BY
      symbol, market_close_date
    ) t1
  WHERE t1.rno <= 500 AND market_close_date >= now()::date
  GROUP BY t1.symbol, t1.market_close_date, t1.open, t1.high, t1.low, t1.close, t1.volume
  ORDER BY t1.symbol, t1.market_close_date
)jt;
