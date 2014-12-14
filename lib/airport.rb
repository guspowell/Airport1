class Airport

	DEFAULT_CAPACITY = 50

	def initialize
		@planes = []
	end

	def plane_count
		@planes.count
	end

	def accept(plane)
		raise "sorry the airport is full" if full? 
		@planes << plane
	end

	def launch(plane)
		@planes.delete(plane)
	end

	def full?
		plane_count == DEFAULT_CAPACITY
	end

end