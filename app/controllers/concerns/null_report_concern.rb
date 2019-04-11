module NullReportConcern
  extend ActiveSupport::Concern

  private

  def fresh_new_highs_report report
    return ['No New Highs'] if report.nil?
    report
  end
end
