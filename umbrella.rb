require "http"
require "json"

pp "howdy"
pp "Where are you located?"
user_location = gets.chomp.gsub(" ", "%20")

user_location
maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

res = HTTP.get(maps_url)
raw_response = res.to_s
parsed_response = JSON.parse(raw_response)
results = parsed_response.fetch("results")
geo = results.at(0).fetch("geometry")
location = geo.fetch("location")
pp lat = location.fetch("lat")
pp lng = location.fetch("lng")
