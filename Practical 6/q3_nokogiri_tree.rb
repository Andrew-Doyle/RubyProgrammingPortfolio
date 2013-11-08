require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://www.skysports.com/football"))

document = Nokogiri::XML(doc,&:noblanks)
puts document
puts doc.to_xhtml( indent:3, indent_text:"_" )