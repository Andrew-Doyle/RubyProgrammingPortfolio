#!/opt/local/bin/ruby2.0 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2013
require_relative 'predicate'

class Library
	@@libraries = []
    include Pred
	attr_accessor :name, :songs, :owner
	def initialize(name, songs)
		@name = name
		@songs = songs
		@owner = name + "_owner"
	end
	
	def to_s
		puts "\nLibrary Named << #{@name} >> owned by #{@owner} has following songs:\n"
		@songs.each {|song| song.to_s}
	end	

	def self.list
		@@libraries
	end
	
	def self.list_add=(val)
		@@libraries << val
	end
	
	def self.make_library(name, songs = [])
		Library.new(name, songs)
	end
	
	#def self.build_all
	#	Library.list.each do |library|
	#		Song.list.each do |song|
	#			if song.in_libs.include?(library)
	#				then library.songs << song
	#			end
	#		  end
	#		end
	#	Library.list
	#end

  def self.build_all
    lib_objs = ObjectSpace.each_object(Library).to_a
    songs = ObjectSpace.each_object(Song).to_a
    lib_objs.each do |library|
      songs.each do |song|
        if song.in_libs.include?(library)
        then library.songs << song
        end
      end
    end
    lib_objs
  end
	
	def self.convert_to_libs(lib_array, out_array = [])
		lib_array.each do |lib_name|
			known_obj = (Library.list.select {|kn_lib| kn_lib.name == lib_name}).first
		  if  known_obj 
		  	then out_array << known_obj
		  else  new_lib = make_library(lib_name)
		  		Library.list_add = new_lib
		  		out_array <<  new_lib
		  end
		end
		out_array
	end
end
# 
# libo = Library.make_library("foo")
# p Library.list
# p Library.list_add = libo
# p Library.list
# p libo

# p Library.convert_to_libs(["apple","lib1","lib2"])
