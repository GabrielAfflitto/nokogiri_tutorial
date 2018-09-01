require 'pry'
require 'httparty'
require 'nokogiri'
require 'json'
require 'csv'
require 'openssl'

page = HTTParty.get('https://newyork.craigslist.org/search/pet')

parse_page = Nokogiri::HTML(page)

pets_array = []


parse_page.css('.content').css('.rows').css('.result-row').css('.hdrlnk').map do |a|
  post_name = a.text
  pets_array.push(post_name)
end

CSV.open('pets.csv', 'w') do |csv|
	csv << pets_array
end

# Pry.start(binding)
