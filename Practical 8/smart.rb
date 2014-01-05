smart = lambda do |first, *second, &block|
  puts "first = #{first.inspect}"
  puts "second = #{second.inspect}"
  block.call
end

smart.call(8,9,10,17) {puts "in first block"}