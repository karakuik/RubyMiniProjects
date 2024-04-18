require 'net/http'

def get_robots_txt(url, user_agent = 'Ruby/Webscraper')
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')

  request = Net::HTTP::Get.new('/robots.txt')
  request['User-Agent'] = user_agent

  response = http.request(request)

  if response.code.to_i == 200
    response.body
  else
    "Error: #{response.code} - #{response.message}"
  end
end

# Example usage with custom user-agent
url = 'https://www.example.com'
custom_user_agent = 'Rdogg via Test38'
robots_txt_content = get_robots_txt(url, custom_user_agent)
puts robots_txt_content
