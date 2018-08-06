require 'json'

class BarchartApiConnector < MechanizeConnector

  def parse_page_response_body_JSON
    JSON.parse(agent.page.body)
  end
end
