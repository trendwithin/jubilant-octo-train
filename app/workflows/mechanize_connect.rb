require 'mechanize'

class MechanizeConnect
  attr_reader :agent, :url

  def initialize url
    @agent = Mechanize.new
    @url = url
  end

  def fetch_page_body max_attempts = 5
    tries ||= 0
    agent.get url

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
