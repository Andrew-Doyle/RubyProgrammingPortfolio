#!/opt/local/bin/ruby1.9 -w
# UPDATED FOR CATEGORIES
# Copyright Mark Keane, All Rights Reserved, 2010

class Testo
	@@classglob = []
	Const = 0
	attr_accessor :one, :two
	
	def initialize(one, two)
		@one = one
		@two = two
	end
	
	def self.get_val
		@@classglob
	end
	
	def get_val
		@@classglob
	end
	
	def self.add_val=(val)
		@@classglob << val
	end
	
	def add_val=(val)
		@@classglob << val
	end
end

eg = Testo.new(3, 4)
eg.add_val = "lll"

puts eg.one
puts eg.two
puts eg.get_val

p Testo.get_val
puts Testo.add_val = "ddd"
p Testo.get_val

p eg.get_val

p Testo::Const

