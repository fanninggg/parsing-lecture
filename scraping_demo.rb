require 'open-uri'
require 'nokogiri'

puts "Which ingredient to search for?"
print "> "

ingredient = gets.chomp
url = "https://www.bbcgoodfood.com/search/recipes?query=#{ingredient}"

html_file = open(url).read
p html_file.class
html_doc = Nokogiri::HTML(html_file)
p html_doc.class

html_doc.search('.teaser-item__title a').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end

