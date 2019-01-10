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

  def error_data_file_exists? file_date, file_name
    File.exists?(Rails.root.join('log', 'custom_log', "#{file_date}_" + "#{file_name}"))
  end

  def create_error_data_file file_date, file_name
    file = "#{file_date}_#{file_name}"
    Logger.new(File.join(Rails.root, 'log', 'custom_log', "#{file}"))
  end

  def format_prepend_date(current_time = Time.now)
    current_time.strftime("%m_%d_%Y")
  end
end
