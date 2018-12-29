require 'json'

class BarchartApiConnector < MechanizeConnector
  def initialize url = ''
    super
  end

  def parse_page_response_body_JSON
    JSON.parse(self.page.body)
  end
end
