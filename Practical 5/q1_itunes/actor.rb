#!/opt/local/bin/ruby2.0 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2013

class Actor
	@@actors = []
    #include Pred
	attr_accessor :name, :lib, :id
	def initialize(name, owns_lib)
		@name = name + "_owner"
		@lib = owns_lib
		@id = name.object_id
	end
	
	def self.list
		@@actors
	end	
		
	def self.list_add=(val)
		@@actors << val
	end
	
	def to_s
		puts "Actor #{@name} has ID: #{@id}.\n"
	end	
	
	#def self.build_all
	#	Library.list.each {|lib_item| Actor.list_add = Actor.new(lib_item.name, lib_item)}
	#	Actor.list
	#end

  def self.build_all
    actors = []
    libs = ObjectSpace.each_object(Library).to_a
    libs.each {|lib_item| actors << Actor.new(lib_item.name, lib_item)}
    #p actors
    actors
  end
	
	def buys_song(song)
		actors_lib = @lib 
		song.in_libs = song.in_libs << actors_lib
		actors_lib.songs << song
	end
	
end

# pers = Actor.new("mark", "lib1")
# poo = Actor.new("marko", "lib2")
# Actor.list << poo
# Actor.list << pers
# p Actor.list
