require 'open-uri'
require 'nokogiri'
require 'net/http'
require 'uri'

url = URI.parse('https://www.youtube.com')

response = Net::HTTP.get_response(url)

if response.is_a?(Net::HTTPSuccess)
  html = response.body

  doc = Nokogiri::HTML(html)

  titles = doc.css('h1').map(&:text)
  links = doc.css('a').map { |link| link['href'] }

  puts "Titles: #{titles}"
  puts "Links: #{links}"

else
  puts "Failed to fetch, Status Code: #{response.code}."
end
