#!/opt/local/bin/ruby2.0 -w
# SONG
# Copyright Mark Keane, All Rights Reserved, 2010

class Song
	attr_accessor :name, :album, :artist, :time, :genre, :id, :in_libs
	def initialize(name, album, artist, time, genre, id, in_libs)
		@name = name
		@album = album
		@time = time
		@artist = artist
    @genre = genre
		@id = id
		@in_libs = in_libs
	end
	
	def to_s
		puts "<< #{@name} >> by #{@artist} in their album #{@album}.\n"
	end	
		
	def isa?
		instance_of?(Song)
	end
	
	def play_song
		no = rand(10)
		no.times {print "#{@name} do be do..."}
		puts "\n"
	end

end