require 'nokogiri'
require 'open-uri'
require 'pp' #not used but handy for looking at nokogiri tree

# LOAD_URI takes an array of uri's and a flag ("actor" or "film") and searches each one
# for actors in a film or films in which the actor occurs. It gathers up the results 
# in an array that is flattened, cleaned of nils and duplicates.

#def load_uris(uri_array, flag)
#	puts "\nURI Array has #{uri_array.size} items"
#	uri_array.collect {|uri| load_uri(uri, flag)}.flatten.compact.uniq
#end
#
## LOAD_URI takes a single uri and a flag ("actor" or "film") and searches the page it opens.
## It returns a list of films or actors depending on the flag given; does simple error handling.
#
#def load_uri(uri, flag)
#   puts "\nChecking the following: #{strip_out_name(uri)}"
#   begin
#  	  doc = open(uri)
#  	  rescue OpenURI::HTTPError => the_error
#  	  puts "Error, found bad status code: #{the_error}"
#   end
#   if the_error.instance_of?(OpenURI::HTTPError)
#	   then puts "...so, we are not doing #{uri}"
#   else doc = Nokogiri::HTML(open(uri))
#   		if flag == "actor" then out = find_films_by_actor(doc)
#   		elsif flag == "film" then out = find_actors_in_film(doc) end
#   end
#   out
#end
 
# FIND_FILMS_BY_ACTOR takes a parsed web page about an actor and searches for links in it that contain "film)"
# If it finds one it puts it onto the out array and then strips off the http-crap so that
# you just have the film name as a string; its is limited in that not all film names
# have the "(film)" tag on them.

# OLD METHOD
def find_films_by_actor(doc, out = [])
	#puts "Entering find_films_by_actor with #{find_name_title(doca)}."
  doca = Nokogiri::HTML(open(doc))
	all_links = doca.search('//a[@href]')
	all_links.each do |link|
		link_info = link['href']
		if link_info.include?("(film)") && !(link_info.include?("Category:") || link_info.include?("php"))
			then out << link_info
    end
	  end
	out.uniq.collect {|link| strip_out_name(link)}
  puts out
end

## NEW METHOD FINAL ATTEMPT

def find_films_by_actor_new(doca, out = [])
  doc = Nokogiri::HTML(open(doca))

  table = doc.at('#Filmography').parent.next_element
  films = table.search('tr')[1..-1].map{ |tr|
    tds = tr.search('td')
    year = tds.shift.text

    movie = tds.shift
    movie_url = movie.at('a')['href']
    movie_title = movie.at('a').text

    role = tds.shift.text

    {
        year: year,
        movie_url: movie_url,
        movie_title: movie_title,
        role: role
    }
  }
  
  puts films.map{|h|h[:movie_url]}

end

## NEW METHOD
#def find_films_by_actor(doca, out = [])
#  doc = Nokogiri::HTML(open(doca))
#  puts "Entering find_films_by_actor with #{find_name_title(doca)}."
#  all_links = doc.search('//a[@href]')
#  all_links.each do |link|
#    link_info = link['href']
#    if link.ancestors("p").text.downcase.include?("film"))
#    then out << link_info
#    end
#  end
#  out.uniq.collect {|link| strip_out_name(link)}
#end

###NEW METHOD ATTEMPT TWO
#
#def find_films_by_actor_old(doca, out = [])
#  all_tables = doca.search("//tr")
#  all_tables.each do |tr_node|
#    tr_childs_less_newline_nodes = tr_node.children.select {|node| !(node.inner_text == "\n")}
#    link_node = tr_childs_less_newline_nodes[1]
#    notes_node = tr_childs_less_newline_nodes[3]
#    hello = link_node.inner_text
#    if hello.include?("href=") &&  !((notes_node.inner_text.include?("series")) ||  (notes_node.inner_text.include?("episode")))
#      then valid_links = tr_childs_less_newline_nodes[1]
#        valid_links.each {|node| if node['href'] then out << node['href'] end}
#    end
#  end
#  out.uniq.collect {|link| strip_out_name(link)}
#  puts out
#end



 
# FIND_ACTORS_IN_FILM takes a parsed web page about a film and searches for links that are actor refs.
# It does this by finding a table element that starts with "Starring" and finds some children
# nodes in the list that turn out to be the actors starring in the film.
# If it finds one it puts it onto the out array and then strips off the http-crap so that
# you just have the actors name as a string.

#def find_actors_in_film(doca, out = [])
#	puts "Entering find_actors_in_film with #{find_name_title(doca)}."
# 	all_tables = doca.search("//tr")
# 	all_tables.each do |tr_node|
#	  tr_childs_less_newline_nodes = tr_node.children.select {|node| !(node.inner_text == "\n")}
#	  starring_node = tr_childs_less_newline_nodes[0]
#	  if starring_node.inner_text == "Starring"
#	    then rest_of_childs = tr_childs_less_newline_nodes[1].children
#		     rest_of_childs.each {|node| if node['href'] then out << node['href'] end}
#	  end
#	end
#  	out.uniq.collect {|link| strip_out_name(link)}
#end
#
#
## FIND_NAME_TITLE finds the part of the wikipedia page with its title.
#
#def find_name_title(doca)
#    if !doca.nil?
#      then title = doca.search("//title").inner_text
#		   title.gsub(" - Wikipedia, the free encyclopedia", "") end
#end

# STRIP_OUT_NAME takes the various forms in which links appear in wikipedia pages
# and removes the http-wiki crap and gives you back the name of the actor or film.

def strip_out_name(name, nameout = [])
	 case 
		when name =~ /^http:\/\/en.wikipedia.org\/wiki\//
             nameout = name.gsub(/http:\/\/en.wikipedia.org\/wiki\//, "")
		when name =~ /^en.wikipedia.org\/wiki\//
			 nameout = name.gsub(/en.wikipedia.org\/wiki\//, "")
		when name =~ /^\/wiki\//
			 nameout = name.gsub(/\/wiki\//, "")
		when name !=~ URI::regexp || name.nil?
			 print "URI is not right in STRIP_OUT_NAME: "; p "#{@in_uri}"
	 end
	 nameout
end

#****************************   DE DATA   *****************************   
uri1 = "http://en.wikipedia.org/wiki/Mark_Keane"						  #one that isnt an actor/film
uri2 = "http://en.wikipedia.org/wiki/Close_Encounters_of_the_Third_Kind"  #one that is a film
uri3 = "http://en.wikipedia.org/wiki/Melinda_Dillon"					  #one that is an actor
uri4 = "http://en.wikipedia.org/wiki/Flubbeo"							  #one that's not a valid wiki page
uri5 = "http://en.wikipedia.org/wiki/Kevin_Bacon"						  #one that's not a valid wiki page
uri6 = "http://en.wikipedia.org/wiki/Richard_Dreyfuss"					  # another actor
uri7 = "http://en.wikipedia.org/wiki/Bound_for_Glory_(film)"			  # another film
uri8 = "http://en.wikipedia.org/wiki/The_Man_Who_Loved_Women_(film)"      # yet another film
#****************************   DE DATA   *****************************   

#actor_uris = [uri1,uri3,uri4,uri5,uri6]     # URIs that are and are not actors.
#film_uris = [uri1,uri2,uri4,uri7,uri8]      # URIs that are and are not films.

actor_uris = [uri1,uri3,uri4,uri5,uri6]     # URIs that are and are not actors.
film_uris = [uri1,uri2,uri4,uri7,uri8]      # URIs that are and are not films.

puts "New find_films_by_actor results:"
puts "\n"
find_films_by_actor_new(uri6)
puts "\n"
puts "Original find_films_by_actor results"
puts "\n"
find_films_by_actor(uri6)
#DE DATA
#p load_uris(actor_uris, "actor")
#p load_uris(film_uris, "film")

#url = "http://en.wikipedia.org/wiki/Richard_Dreyfuss"
#doc = Nokogiri::HTML(open(url))
#all_links = doc.search("//a[@href]")
#all_links.each do |link|
#  link.ancestors("p").text.downcase.include?("film") ? puts(link['href']) : nil
#end

#doc = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/Richard_Dreyfuss'))
#
#table = doc.at('#Filmography').parent.next_element
#films = table.search('tr')[1..-1].map{ |tr|
#  tds = tr.search('td')
#  year = tds.shift.text
#
#  movie = tds.shift
#  movie_url = movie.at('a')['href']
#  movie_title = movie.at('a').text
#
#  role = tds.shift.text
#
#  {
#      year: year,
#      movie_url: movie_url,
#      movie_title: movie_title,
#      role: role
#  }
#}
#
#puts films.map{|h|h[:movie_url]}