# Preview all emails at http://localhost:3000/rails/mailers/error_logger_mailer
class ErrorLoggerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/error_logger_mailer/reporter
  def reporter
    ErrorLoggerMailer.reporter
  end

end
