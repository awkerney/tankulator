module Tankulator
	class Entry
		attr_accessor :distance_travelled
		attr_accessor :driver
		attr_accessor :category

		@distance_travelled
		@odometer_start
		@odometer_end
		@driver
		@category

		def initialize(line)
			pieces = line.split ','
			@odometer_start = pieces[0].to_f
			@odometer_end = pieces[1].to_f
			@distance_travelled = @odometer_end - @odometer_start

			if pieces[2].chomp!.eql?('b')
				@category = 'b'
				@driver = 'b'
			else
				categoryAndDriver = pieces[2].split(':')
				@category = categoryAndDriver[0]
				@driver = categoryAndDriver[1]
			end
		end

		def to_s
			"#{@distance_travelled} KM traveled by driver #{@driver}"
		end
	end
end