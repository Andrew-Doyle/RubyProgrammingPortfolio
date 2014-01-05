#!/opt/local/bin/ruby2.0 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2013
# --------------- ORIGINAL -----------------------------
#class Album
#	@@albums = []
#	include Pred
#	attr_accessor :name, :tracks, :length, :artist, :id
#	def initialize(name, tracks, length, artist)
#		@name = name
#		@tracks = tracks
#		@length = length
#		@artist = artist
#		@id = name.object_id
#	end
#
#	def to_s
#		puts "The album #{@name} by #{@artist} has #{@tracks.size} song(s) playing for #{@length} minutes. \n"
#	end
#
#	def self.list
#		@@albums
#	end
#
#	def self.list_add=(val)
#		@@albums << val
#	end
#
#	def self.make_album(name,tracks = [], length=[], artist=[])
#		Album.new(name, tracks, length, artist)
#	end
#
#	def update_album
#		name = self.name
#		song_array = Song.list
#		self.tracks = song_array.select {|song| song.album == name}
#		self.length = (self.tracks.collect {|song| song.time}).inject {|l,r| l+r}
#		self.artist = (self.tracks.collect {|song| song.artist}).uniq
#		self
#	end
#
#	def self.build_all
#		songs = Song.list
#		album_names = (songs.collect {|song| song.album}).uniq
#		album_names.each {|album_name| self.list_add = make_album(album_name)}
#		self.list.each {|album_obj| album_obj.update_album}
#		self.list
#	end
#end

# --------------- FROM PDF -----------------------------

#albumv3.rb
class Album
  attr_accessor :name, :tracks, :length, :artist, :id
  def initialize(name, tracks, length, artist)
    ! @name = name
    ! @tracks = tracks
    ! @length = length
    ! @artist = artist
    ! @id = name.object_id
  end
  def to_s
    puts "The album #{@name} by #{@artist} has #{@tracks.size}
song(s) playing for #{@length} minutes. \n"
    end
    def update_album(songs)
      ! name = self.name
      ! self.tracks = songs.select {|song| song.album == name}
      ! self.length = (self.tracks.collect {|song| song.time}).inject {|l,r| l+r}
      ! self.artist = (self.tracks.collect {|song| song.artist}).uniq
      ! self
    end
    def self.build_all(songs, out = [])
      ! album_names = (songs.collect {|song| song.album}).uniq
      ! album_names.each {|album_name| out << Album.new(name, [], [], [])}
      ! out.each {|album_obj| album_obj.update_album(songs)}
      ! out
    end
  end
#p Album.list << Album.make_album("test")