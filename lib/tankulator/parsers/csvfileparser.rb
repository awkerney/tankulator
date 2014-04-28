module Tankulator
	module Parsers
		require 'date'
		
		class CSVFileParser < Parser
			def parsed_tank
				if @tank == nil
					@tank = GasTank.new
					self.read_tank_information
					self.read_tank_drivers
					self.read_tank_entries
				end
				@tank
			end
			
			def read_tank_information
				@tank.start_date = Date.parse @input_file.readline
				@tank.end_date = Date.parse @input_file.readline
				@tank.cost = @input_file.readline.to_f.round(2)
				@tank.total_distance_confirmation = @input_file.readline
			end
			
			def read_tank_entries
				while !@input_file.eof?
					entry_line = @input_file.readline
					puts entry_line
				end
			end
		
			def read_tank_drivers
				all_aliases = Hash.new
				drivers_line = @input_file.readline
				aliases = drivers_line.split ','
				aliases.each do |piece|
					alias_components = piece.split ':'
					all_aliases[alias_components[0].chomp] = alias_components[1].chomp
				end
				@tank.driver_aliases = all_aliases
			end
		end
		
	end
end
