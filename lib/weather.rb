module Weather

	def conditions
		@weather = [*1..4].sample == 1 ? "stormy" : "sunny"
	end

	def stormy?
		@weather == "stormy"
	end


end