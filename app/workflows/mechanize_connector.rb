require 'mechanize'

class MechanizeConnector < Mechanize
  attr_reader :url

  def initialize url
    super
    @url = url
  end

  def mechanize_connector_fetch_page max_attempts = 5
    tries ||= 0
    self.get url

    rescue SocketError => se
      if (tries += 1) <= max_attempts
        retry
      else
        raise se
      end

    rescue Mechanize::ResponseCodeError => mrce
      if (tries += 1) <= max_attempts
        retry
      else
        raise mrce
      end
  end
end
