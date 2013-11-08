require 'nokogiri'
require 'open-uri'
require 'pp'
doc = Nokogiri::HTML(open("http://www.conserveturtles.org/seaturtleinformation.php?page=whycareaboutseaturtles"))
pp doc