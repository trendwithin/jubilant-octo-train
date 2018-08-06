class ErrorLogger
  attr_reader :logs
  def initialize logs
    @logs = logs
  end

  def report
    logs
  end
end
