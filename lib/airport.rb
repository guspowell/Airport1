require_relative 'weather.rb'

class Airport

	include Weather

	DEFAULT_CAPACITY = 6

	attr_reader :planes

	def initialize
		@planes = []
		@weather = conditions
	end


	def plane_count
		@planes.count
	end

	def accept(plane)
		clear_for_landing
		plane.land
		@planes << plane
	end


	def launch(plane)
		raise "too stormy to take off" if stormy?
		plane.take_off
		@planes.delete(plane)
	end

	def full?
		plane_count >= DEFAULT_CAPACITY
	end

	def next_day
		@weather = conditions
	end

	def clear_for_landing
		raise "too stormy to land" if stormy?		
		raise "sorry the airport is full"if full?	
	end

end