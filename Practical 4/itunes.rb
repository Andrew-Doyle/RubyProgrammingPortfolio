#!/opt/local/bin/ruby2.0 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

#This is the top level

require_relative 'actor'
require_relative 'album'
require_relative 'library'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require 'csv'
require_relative 'error'

reader = Reader.new

def read_information(songs)
  repeat = ''

  #CREATING LIST OF UNIQUE ARTISTS
  artists = []
  songs.each { |member|
           artists << member.artist
  }

  artists.uniq!

  #CREATING LIST OF UNIQUE ALBUMS
  albums = []
  songs.each { |member|
    albums << member.album
  }

  albums.uniq!

  #CREATING LIST OF UNIQUE GENRES
  genres = []
  songs.each { |member|
    genres << member.genre
  }

  genres.uniq!


  while repeat != 0
    puts "\n-----------------------------------------------------------------------------------------------------------"
    puts "\nWhat do you want to view?"
    puts "\n"
    puts "Artists               | 0"
    puts "Albums                | 1"
    puts "Genres                | 2"
    puts "All song Information  | 3"
    puts "Exit                  | 4"
    userchoice = gets.chomp
    choice = userchoice.to_i

    case

      ########################### BROWSING ALL ARTISTS #################################
      when choice == 0 then

        puts "\n------------ LIST OF ARTISTS --------------------"
        puts artists

      ########################### BROWSING ALL ALBUMS #################################
      when choice == 1 then
        puts "\n------------ LIST OF ALBUMS --------------------"
        puts albums

      ########################### BROWSING ALL GENRES #################################
      when choice == 2 then
        puts "\n------------ LIST OF GENRES --------------------"
        puts genres

      ########################### BROWSING EVERYTHING #################################
      when choice == 3 then
        format = '%-80s %-50s %-100s %-6s %-20s'
        puts format % ['SONG NAME', 'ARTIST', 'ALBUM', 'LENGTH','GENRE']
        puts format % ['---------', '------', '-----', '------','------']
        songs.each {|member|
          puts format % [member.name, member.artist, member.album,member.time,member.genre]
        }

        #writing the information to file
        File.open("music_library.txt", "w") do |file|
          file.puts format % ['SONG NAME', 'ARTIST', 'ALBUM', 'LENGTH','GENRE']
          file.puts format % ['---------', '------', '-----', '------','------']
          songs.each { |member|
            file.puts format % [member.name, member.artist, member.album,member.time,member.genre]
          }
        end

        puts "\n" + 'The music library has been written to the file music_library.txt'

      # LET THE USER EXIT THE PROGRAM
      when choice == 4 then
        puts "\nThanks..Have a great day!"
        exit + 2
    end

    puts "\nDo you want to check information again?"
    puts "Exit          | 0"
    puts "Check Again   | 1"
    repeat = gets.chomp
    repeat = repeat.to_i #users choice on whether to repeat program - this is the condition for the loop
    #Say thanks
    if repeat == 0 then
      puts "\nThanks..Have a great day!"
    end
  end
end

all_songs = 'library.csv'

who_owns_songs = 'song_to_lib.csv'

puts "\nProcessing Songs from file #{all_songs}"
songs = reader.read_in_songs(all_songs)

puts "\nProcessing Libraries from file #{who_owns_songs}"
reader.read_in_libraries(who_owns_songs, songs)
 
puts "\nBuilding Libraries..."
libs = Library.build_all
 
puts "\nBuilding Albums..."
albs = Album.build_all

puts "\nBuilding Actors..."
actors = Actor.build_all
  
jim = Tuneuts.fetch("lib1_owner")
new_song = Tuneuts.fetch("dogs")
puts "\nJim buys the song \"dogs\" so now lib1 has a new song..."
jim.buys_song(new_song)

Tuneuts.fetch("lib5").to_s
#new_song.play_song

read_information(songs)

# Call like this:
# markkean% ruby1.9 itunes.rb library.csv song_to_lib.csv


