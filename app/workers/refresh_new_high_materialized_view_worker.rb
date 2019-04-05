class RefreshNewHighMaterializedViewWorker < ProcessWorker
  def process
    FirstOneHundredTwentySixPeriodNewHighReport.refresh
    FirstSixtyThreePeriodNewHighReport.refresh
    FirstTwoHundredFiftyPeriodNewHighReport.refresh
    FirstFiveHundredPeriodNewHighReport.refresh
  end
end
