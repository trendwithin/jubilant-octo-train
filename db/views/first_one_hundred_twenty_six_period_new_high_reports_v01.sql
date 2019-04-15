SELECT
  symbol
FROM
(
  SELECT  *,
    MAX(close) FILTER(WHERE rno <= 126) OVER (PARTITION BY symbol) as max,
    MAX(close) FILTER(WHERE rno BETWEEN 2 AND 126) OVER(PARTITION BY symbol) AS second_max
  FROM
    (
      SELECT *,
        ROW_NUMBER() OVER(PARTITION BY symbol Order By market_close_date DESC) as rno
      FROM
        stock_symbols
      INNER JOIN
        historic_prices
      ON
        stock_symbols.id = stock_symbol_id
      WHERE
        symbol
      IN
        (
          SELECT
            symbol
          FROM
            stock_symbols
          INNER JOIN
            historic_prices
          ON
            stock_symbols.id = stock_symbol_id
          GROUP BY
            symbol
          HAVING
            COUNT(symbol) >= 126 )
       ) t
    WHERE t.rno <= 126
  ) t2
WHERE
  (t2.rno = 126 AND t2.close = second_max)
AND
  (max > second_max)
;
