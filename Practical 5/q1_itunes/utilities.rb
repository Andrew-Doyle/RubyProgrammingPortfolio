#!/opt/local/bin/ruby2.0 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2013
# This is fairly crap...does not deal with other types like nil or 12

## --------------------------- ORIGINAL ----------------------------
#module Tuneuts
#
#   #will fetch object give string that is its name
#   def self.fetch(item, out = [])
#      all = Song.list + Actor.list + Album.list + Library.list
#	  case
#		when item.instance_of?(String)
#		   all.each do |obj|
#			 if obj.name.downcase == item.downcase
#				   then	out << obj end end
#		     if (out.length > 1)
#		   	      then MyErr.new("multiple_answer_error", item, "fetch").do_it end
#		when item.isa?(Song) || item.isa?(Library)  || item.isa?(Album) || item.isa?(Actor)
#			 all.each {|obj| if obj.eql?(item) then out << obj end}
#		else MyErr.new("weird_item", item, "fetch").do_it
#	  end
#	  out.first
#   end
#
#end

## --------------------------- NEW ----------------------------
module Tuneuts
#will fetch object give item-string that is its name.
  def self.fetch(item, search_set, out = [])
    out = search_set.select {|obj| item.downcase == obj.name.downcase}
    if (out.length == 1) then "fine"
    elsif (out.length > 1)
        then MyErr.new("multiple_answer_error", item, "fetch").do_it
    else MyErr.new("weird_item", item, "fetch").do_it
      end
    out.first
  end
end
