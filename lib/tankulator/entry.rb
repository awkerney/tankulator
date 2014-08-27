module Tankulator
	class Entry
		attr_accessor :driver
		attr_accessor :category
		attr_accessor :odometer_start
		attr_accessor :odometer_end

		@distance_travelled
		@odometer_start
		@odometer_end
		@driver
		@category

		def distance_travelled
			@odometer_end - @odometer_start
		end

		def to_s
			"#{@distance_travelled} KM traveled by driver #{@driver}"
		end
	end
end
