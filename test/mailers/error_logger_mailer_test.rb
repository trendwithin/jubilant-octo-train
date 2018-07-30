require 'test_helper'

class ErrorLoggerMailerTest < ActionMailer::TestCase
  test "reporter" do
    report = {hash: { error: ['logger'] }}
    mail = ErrorLoggerMailer.reporter report
    assert_equal "Error Report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["noreply@trendwithin.com"], mail.from
    assert_match "Error Alert!", mail.body.encoded
    assert_match "report", mail.body.encoded
  end

end
