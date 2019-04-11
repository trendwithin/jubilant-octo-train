class ReportsController < ApplicationController
  def fresh_new_highs
    @sixty_three_period = fresh_new_highs_report FirstSixtyThreePeriodNewHighReport.all
    @one_hundred_twenty_six_period = fresh_new_highs_report FirstOneHundredTwentySixPeriodNewHighReport.all
    @two_hundred_fifty_period = fresh_new_highs_report FirstTwoHundredFiftyPeriodNewHighReport.all
    @five_hundred_period = fresh_new_highs_report FirstFiveHundredPeriodNewHighReport.all
  end
end
