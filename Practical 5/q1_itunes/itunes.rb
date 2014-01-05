#!/opt/local/bin/ruby2.0 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2013
#--------------------------------------------ORIGINAL ---------------------------------------------------------
#This is the top level
#require_relative 'predicate'
#require_relative 'actor'
#require_relative 'album'
#require_relative 'library'
#require_relative 'song'
#require_relative 'reader'
#require_relative 'utilities'
#require_relative 'error'
#
#
#require 'csv'
#
#reader = Reader.new
#song_csv_file_name = ARGV[0]
#libraries_csv_file_name = ARGV[1]
#
#puts "\nProcessing Songs from file #{song_csv_file_name}"
#songs = reader.read_in_songs(song_csv_file_name)
#songs.each {|song| p song}
#
#puts "\nProcessing Libraries from file #{libraries_csv_file_name}"
#reader.read_in_libraries(libraries_csv_file_name)  #delete songs as arg
#puts reader.get_hash_table
#puts "\n"
#Song.list.each {|song| p song}
#
#puts "\nBuilding Libraries..."
#libs = Library.build_all
#libs.each {|lib| lib.to_s}
#
#puts "\nBuilding Albums..."
#albs = Album.build_all
#Album.list.each {|alb| alb.to_s}
#
#puts "\nBuilding Actors..."
#actors = Actor.build_all
#Actor.list.each {|actor| actor.to_s}
#puts "\n\n"
#
#jim = Tuneuts.fetch("lib1_owner")
#new_song = Tuneuts.fetch("pony")
#puts jim
#puts new_song
#puts "\nJim buys pony so now lib1 has a new song..."
#jim.buys_song(new_song)
#Tuneuts.fetch("lib1").to_s
#p " "
#Tuneuts.fetch(libs.first).to_s

#--------------------------------------------FROM PDF ---------------------------------------------------------
#require 'actor','album’,'library’,'song','reader','utilities','csv',
#    'error'

require_relative 'actor'
require_relative 'album'
require_relative 'library'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'
require 'csv'
reader = Reader.new
#song_csv_file_name = ARGV[0]
#libraries_csv_file_name = ARGV[1]
song_csv_file_name = 'library.csv'
libraries_csv_file_name = 'song_to_lib.csv'


puts "\nProcessing Songs from file #{song_csv_file_name}"
songs = reader.read_in_songs(song_csv_file_name)
puts "\nProcessing Libraries from file #{libraries_csv_file_name}"
lib_names = reader.read_in_libraries(libraries_csv_file_name, songs)
puts "\nBuilding Libraries..."
libs = Library.build_all
puts "\nBuilding Albums..."
albs = Album.build_all(songs)
puts "\nBuilding Actors..."
actors = Actor.build_all(libs)
jim = Tuneuts.fetch("lib1_owner", actors)
new_song = Tuneuts.fetch("pony", songs)
puts jim
puts new_song
puts "\nJim buys pony so now lib1 has a new song..."
jim.buys_song(new_song)


# song = songs.first
# p song.name 
# p "isa song?"
# p song.isa?(Song)
# p song.name 
# p "isa album?"
# p song.isa?(Album)
#  album = albs.first
# p album.name
# p "isa album?"
# p album.isa?(Album)
# p testa = 12


=begin
1) if you get this error 

$ ruby library.csv song_to_lib.csv
library.csv:1: syntax error, unexpected ',', expecting $end
"Songname","Artist","Album","Time","Id"

YOU have forgotten to say: ruby itunes.rb library.csv song_to_lib.csv

2) if you get this error

$ ruby itunes.rb

Processing Songs from file 
/opt/local/lib/ruby1.9/1.9.1/csv.rb:1330:in `initialize': can't convert nil into String (TypeError)
	from /opt/local/lib/ruby1.9/1.9.1/csv.rb:1330:in `open'
	from /opt/local/lib/ruby1.9/1.9.1/csv.rb:1330:in `open'
	from /opt/local/lib/ruby1.9/1.9.1/csv.rb:1196:in `foreach'
	from /Users/mkeane/Desktop/Teaching/Ruby:2011/RubyWeek6  (Oct 20th)/RubyLect6.progs/iTunesv2/reader.rb:20:in `read_in_songs'
	from itunes.rb:21:in `<main>'
	
YOU again have forgotten to say: ruby itunes.rb library.csv song_to_lib.csv
YOU have forgotten the two .csv files
=end

