file1 = File.open("spam1.txt","rb")
file1_contents = file1.read

file2 = File.open("spam2.txt","rb")
file2_contents = file2.read

file3 = File.open("spam3.txt","rb")
file3_contents = file3.read

file4 = File.open("spam4.txt","rb")
file4_contents = file4.read

file5 = File.open("spam5.txt","rb")
file5_contents = file5.read

file6 = File.open("not_spam1.txt","rb")
file6_contents = file6.read

file7 = File.open("not_spam2.txt","rb")
file7_contents = file7.read

file8 = File.open("not_spam3.txt","rb")
file8_contents = file8.read

file9 = File.open("not_spam4.txt","rb")
file9_contents = file9.read

file10 = File.open("not_spam5.txt","rb")
file10_contents = file10.read

file1 = File.open("spam1.txt","rb")
file1_contents = file1.read

file1 = file1_contents.split(' ')
file2 = file2_contents.split(' ')
file3 = file3_contents.split(' ')
file4 = file4_contents.split(' ')
file5 = file5_contents.split(' ')
file6 = file6_contents.split(' ')
file7 = file7_contents.split(' ')
file8 = file8_contents.split(' ')
file9 = file9_contents.split(' ')
file10 = file10_contents.split(' ')

freqs1 = Hash.new(0)
file1.each { |word| freqs1[word] +=1}

freqs2 = Hash.new(0)
file2.each { |word| freqs2[word] +=1}

freqs3 = Hash.new(0)
file3.each { |word| freqs3[word] +=1}

freqs4 = Hash.new(0)
file4.each { |word| freqs4[word] +=1}

freqs5 = Hash.new(0)
file5.each { |word| freqs5[word] +=1}

freqs6 = Hash.new(0)
file6.each { |word| freqs6[word] +=1}

freqs7 = Hash.new(0)
file7.each { |word| freqs7[word] +=1}

freqs8 = Hash.new(0)
file8.each { |word| freqs8[word] +=1}

freqs9 = Hash.new(0)
file9.each { |word| freqs9[word] +=1}

freqs10 = Hash.new(0)
file10.each { |word| freqs10[word] +=1}

bad_words = %w{business fund funds account transfer money}
is_spam1 = freqs1.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam2 = freqs2.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam3 = freqs3.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam4 = freqs4.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam5 = freqs5.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam6 = freqs6.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam7 = freqs7.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam8 = freqs8.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam9 = freqs9.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

is_spam10 = freqs10.any? do |word, freq|
  (freq > 2 && bad_words.include?(word)) || (word == 'Iraq' && freq > 1)
end

if is_spam1
  puts "File 1 is suspected as spam mail - suspicious word frequency"
else
  puts "File 1 does not appear to be spam email"
end

if is_spam2
  puts "File 2 is suspected as spam mail - suspicious word frequency"
else
  puts "File 2 does not appear to be spam email"
end

if is_spam3
  puts "File 3 is suspected as spam mail - suspicious word frequency"
else
  puts "File 3 does not appear to be spam email"
end

if is_spam4
  puts "File 4 is suspected as spam mail - suspicious word frequency"
else
  puts "File 4 does not appear to be spam email"
end

if is_spam5
  puts "File 5 is suspected as spam mail - suspicious word frequency"
else
  puts "File 5 does not appear to be spam email"
end

if is_spam6
  puts "File 6 is suspected as spam mail - suspicious word frequency"
else
  puts "File 6 does not appear to be spam email"
end

if is_spam7
  puts "File 7 is suspected as spam mail - suspicious word frequency"
else
  puts "File 7 does not appear to be spam email"
end

if is_spam8
  puts "File 8 is suspected as spam mail - suspicious word frequency"
else
  puts "File 8 does not appear to be spam email"
end

if is_spam9
  puts "File 9 is suspected as spam mail - suspicious word frequency"
else
  puts "File 9 does not appear to be spam email"
end

if is_spam10
  puts "File 10 is suspected as spam mail - suspicious word frequency"
else
  puts "File 10 does not appear to be spam email"
end



