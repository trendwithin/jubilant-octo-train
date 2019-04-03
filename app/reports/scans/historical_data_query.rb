class Scans::HistoricalDataQuery
  def  data_for_period_length_of period
    sql = <<~HEREDOC
      SELECT
        t1.symbol, t1.market_close_date, count(*), t1.rno
      FROM (
        SELECT
          symbol, market_close_date, count(*),
          ROW_NUMBER() OVER (PARTITION BY symbol order by market_close_date) as rno
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
          symbol, market_close_date
        ORDER BY
          symbol, market_close_date
        ) t1
      WHERE t1.rno <= 500
      GROUP BY t1.symbol, t1.market_close_date, t1.rno
       ORDER BY t1.symbol, t1.market_close_date;
    HEREDOC

    ActiveRecord::Base.connection.execute(sql)
  end
end
