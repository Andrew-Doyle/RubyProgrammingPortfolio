require 'csv'

CSV.foreach('library.csv', :headers => true, :row_sep => :auto, :col_sep => ",") do |row|
  songname, artist, album, time, id = row[0],row[1], row[2], row[3], row[4]
  puts songname, artist, album, time, id
end

CSV.foreach('song_to_lib.csv', :headers => true, :col_sep => ",", :skip_blanks => true) do |row|
  song_id, libraries = row[0], row[1]
  puts song_id, libraries
end