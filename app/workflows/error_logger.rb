class ErrorLogger
  attr_reader :logs, :historic_data_errors

  def initialize logs
    @logs = logs
    @historic_data_errors = {}
  end

  def report
    logs
  end

  def nil_symbol symbol
    historic_data_errors[:symbols_return_nil] ||= []
    historic_data_errors[:symbols_return_nil] << symbol
  end

  def nil_symbols_report
    historic_data_errors[:symbols_return_nil]
  end
end
