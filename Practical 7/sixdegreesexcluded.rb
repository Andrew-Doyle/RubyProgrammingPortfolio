#!/opt/local/bin/ruby1.9 -w
#  SIXTOP
#  Created by Mark Keane on 27/09/2011.
#  Copyright (c) 2011 Mark Keane. All rights reserved.

require 'nokogiri'
require 'open-uri'
require_relative 'urihacker'
require_relative 'wikiloader'
require_relative 'wikisearcher'
require_relative 'sixdegrees'

# Makes sure all the uri-hacking methods can be applied to strings.

class String
	include Urihacker
end

# LOAD_WEB_PAGE: Core loading method, callled in sixdegrees class, it first attempts
# to load a page using Wikiloader, which returns a true or false, if the page is loadable
# it goes off and downloads the page, parses it with nokogiri and depending on the :actor/:film
# flag, it goes and searches the parse for other film-links or actor links.  This array of 
# links is cleaned (removing nils and duplicates) and finally we make sure its full http uri.

def load_web_page(uri, flag, out = [])
	load_ok_flag = if uri.nil? then false else WikiLoader.get_page?(uri) end
	if !load_ok_flag 
		then "just pass on..."
	elsif load_ok_flag && flag == :actor
		then doc_parse = Nokogiri::HTML(open(uri))
			 search_obj = WikiSearcher.new(doc_parse)
			 new_actors = search_obj.find_films_by_actor
			 p new_actors.uniq.compact
			 out.concat(new_actors)
	elsif load_ok_flag && flag == :film
		then doc_parse = Nokogiri::HTML(open(uri))
			 search_obj = WikiSearcher.new(doc_parse)
			 new_films = search_obj.find_actors_in_film
			 p new_films.uniq.compact
			 out.concat(new_films)
	end
	out.uniq.compact.collect {|name| name.add_full_uri}
end

# We create an instance of SixDegree class to start the search.  
# Then we start the search process using check_level.

sixo = Sixdegrees.new("Tom_Cruise", "Mark_Keane")
sixo.check_level
