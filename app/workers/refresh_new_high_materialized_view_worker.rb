class RefreshNewHighMaterializedViewWorker < ProcessWorker
  def perform
    FirstSixtyThreePeriodNewHighReport.refresh
    FirstOneHundredTwentySixPeriodNewHighReport.refresh
    FirstTwoHundredFiftyPeriodNewHighReport.refresh
    FirstFiveHundredPeriodNewHighReport.refresh
  end
end
