module Weather

	def conditions
		@weather = ["sunny", "sunny", "sunny", "stormy"].sample
	end

	def stormy?
		if @weather == "stormy"
			@stormy = true
		else
			@stormy = false
		end
	end


end