#!/opt/local/bin/ruby2.0 -w
# READER
# Copyright Mark Keane, All Rights Reserved, 2011

class Reader
	#initialise an obj variable to hold hash table from song_to_lib
	def initialize()
		@hash_lib = Hash.new
	end
	
	#method that returns value of @hash-table instance variable  
	def get_hash_table
		@hash_lib
	end
	
	#read in the songs
	def read_in_songs(csv_file_name)

	 songs = []

    CSV.foreach(csv_file_name, :headers => true) do |row|
		 songname, artist, album, time,genre, id = row[0],row[1], row[2], row[3], row[4], row[5]
	 	 unless (songname =~ /#/)
	 	 	 songs << Song.new(songname,album,artist,time.to_f,genre,id,nil)
	 	 end
    end

	  songs
  end
	   
	#read in the song->library file
	def read_in_libraries(csv_file_name, songs)

    CSV.foreach(csv_file_name, :headers => true) do |row|
		  song_id, libraries = row[0], row[1]

	 	  unless (song_id =~ /#/)

      libs_array = libraries.split

     	song_object = (songs.select {|songa| songa.id == song_id}).first
      # SONG OBJECT HERE SHOULD BE THE FIRST RECORD FROM EACH FILE

	 	 	song_object.in_libs = Library.convert_to_libs(libs_array)

	 	 	@hash_lib[song_id] = libs_array
	 	  end
	    end
	    @hash_lib
	end
end
