#!/opt/local/bin/ruby2.0 -w
# TEST
# Copyright Mark Keane, All Rights Reserved, 2010

def test(item)
	unless item == "yes"
	  puts "hello"
	end
end

test("yes")