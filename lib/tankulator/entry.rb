module Tankulator
	class Entry
		attr_accessor :distance_travelled
		attr_accessor :driver
		attr_accessor :category
		attr_accessor :odometer_start
		attr_accessor :odometer_end

		@distance_travelled
		@odometer_start
		@odometer_end
		@driver
		@category

		def to_s
			"#{@distance_travelled} KM traveled by driver #{@driver}"
		end
	end
end
