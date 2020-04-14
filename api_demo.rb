require 'json'
require 'open-uri'

puts "Which username?"
print "> "

username = gets.chomp

url = "https://api.github.com/users/#{username}"

user_serialized = open(url).read
user = JSON.parse(user_serialized)
# user is the name of the hash
p "#{user['name']} has #{user['public_repos']} repos"
