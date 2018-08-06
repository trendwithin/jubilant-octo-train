class ErrorLoggerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.error_logger_mailer.reporter.subject
  #
  def reporter error_report
    @header = "ErrorLogger Report Concluded"
    @report = error_report

    mail to: "to@example.org"
    mail from: 'noreply@trendwithin.com'
    mail subject: 'Error Report'
  end
end
