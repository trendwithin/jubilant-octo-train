require 'watir'

class WatirConnector
  def self.browser
    Watir::Browser.new :chrome, headless: true
  end
end
