module MaintenanceAndErrorsHelper
  def invalid_symbols_error_log(response)
    if File.file?(response)
      render plain: response
    else
      render partial: 'maintenance_and_errors/reports/file_not_found'
    end
  end
end
