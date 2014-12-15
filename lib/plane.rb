class Plane

	def initialize
		@status = "flying"
	end

	def plane_status
		@status
	end

	def flying
		@status = "flying"
	end

	def land
		@status = "grounded"
	end

	def take_off
		@status = "flying"
	end

end