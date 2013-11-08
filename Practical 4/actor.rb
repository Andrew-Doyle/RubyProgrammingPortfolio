#!/opt/local/bin/ruby2.0 -w
# ACTOR
# Copyright Mark Keane, All Rights Reserved, 2013

class Actor
	attr_accessor :name, :lib, :id
	def initialize(name, owns_lib)
		@name = name + "_owner"
		@lib = owns_lib
		@id = name.object_id
	end
	
	def to_s
		puts "Actor #{@name} has ID: #{@id}.\n"
	end	
	
	def isa?
		instance_of?(Actor)
	end
	
	def self.build_all
		actors = []
		libs = ObjectSpace.each_object(Library).to_a 
		libs.each {|lib_item| actors << Actor.new(lib_item.name, lib_item)}
    #p actors
		actors
	end
	
	def buys_song(song)
    #p song
		actors_lib = @lib 
		song.in_libs = song.in_libs << actors_lib
		actors_lib.songs << song
	end
	
end

# p Actor.new("john", "lib1")
# #<Actor:0x2745c @id=80680, @lib="lib1", @name="john_owner">
