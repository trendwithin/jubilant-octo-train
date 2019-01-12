class MaintenanceAndErrorsController < ApplicationController
  before_action :authenticate_user!

  def invalid_symbols
    error_logger = ErrorLogger.new('')
    file = error_logger.fetch_invalid_symbol_file
    error_logger.file_error_report
    @response = error_logger.read_file file
  end
end
