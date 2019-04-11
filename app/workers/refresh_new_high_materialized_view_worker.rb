class RefreshNewHighMaterializedViewWorker < ProcessWorker
  def process
    FirstSixtyThreePeriodNewHighReport.refresh
    FirstOneHundredTwentySixPeriodNewHighReport.refresh
    FirstTwoHundredFiftyPeriodNewHighReport.refresh
    FirstFiveHundredPeriodNewHighReport.refresh
  end
end
