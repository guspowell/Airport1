require_relative 'weather.rb'

class Airport

	include Weather

	DEFAULT_CAPACITY = 6

	def initialize
		@planes = []
		@weather = conditions
	end

	def plane_count
		@planes.count
	end

	def accept(plane)
		if stormy?
			raise "too stormy to land"
		elsif full?
			raise "sorry the airport is full"
		else
			plane.land
			@planes << plane
		end
	end

	def launch(plane)
		raise "too stormy to take off" if stormy?
		plane.take_off
		@planes.delete(plane)
	end

	def full?
		plane_count == DEFAULT_CAPACITY
	end

	def next_day
		@weather = conditions
	end

end