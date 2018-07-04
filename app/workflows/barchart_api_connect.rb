require 'json'

class BarchartApiConnect < MechanizeConnect
  
  def parse_page_response_body_JSON
    JSON.parse(agent.page.body)
  end
end
