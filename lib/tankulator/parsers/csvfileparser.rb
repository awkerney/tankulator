module Tankulator
	module Parsers
		require 'date'
				
		class CSVFileParser < Parser
			def tank_information
				if @tank == nil
					@tank = GasTank.new
					self.read_tank_information
				end
				return @tank
			end
			
			def read_tank_information
				lines = @input_file.readlines(4)
				start_date = Date.parse(lines[0])
				end_date = Date.parse(lines[1])
				cost = lines[2]
				distance = lines[3]
			end
		end
		
	end
end