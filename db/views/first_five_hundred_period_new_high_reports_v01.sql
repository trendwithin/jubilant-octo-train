SELECT symbol
  FROM
  (
    SELECT  *,
    MAX(high) FILTER(WHERE rno <= 500) OVER (PARTITION BY symbol) as max,
    MAX(high) OVER(PARTITION BY symbol) AS second_max
    FROM
    (
      SELECT *, ROW_NUMBER() OVER(PARTITION BY symbol Order By market_close_date DESC) as rno
      FROM
        stock_symbols
      INNER JOIN
        historic_prices
      ON
        stock_symbols.id = stock_symbol_id
      WHERE symbol IN
      (
        SELECT
          symbol
        FROM
          stock_symbols 
        INNER JOIN
          historic_prices
        ON
          stock_symbols.id = stock_symbol_id
        GROUP BY symbol
        HAVING COUNT(symbol) >= 500 )
    ) t
    WHERE t.rno <= 500
  ) t2
WHERE (t2.rno = 1 AND t2.close = max)
OR
(t2.rno = 250 AND t2.close = second_max)
;
