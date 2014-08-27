module Tankulator
	module Parsers
		require 'date'
		require 'yaml'

		class YAMLFileParser < Parser
			def initialize_with_filename(filename)
				if File.exists?(filename)
					if File.readable?(filename)
						@input_yaml = Psych.load(File.open(filename))
					else
						puts "Can't read file! Please make sure it is readable then try again."
					end
				else
					puts "File doesn't exist! Please check your spelling and try again."
				end
			end

			def read_tank_information
				@tank.start_date = @input_yaml['start_date']
				@tank.end_date = @input_yaml['end_date']
				@tank.cost = @input_yaml['cost']
				@tank.total_distance_confirmation = @input_yaml['total_distance']
			end

			def read_tank_drivers
				aliases = Hash.new

				@input_yaml['drivers'].each do |driver|
					aliases[driver] = driver
				end

				@tank.driver_aliases = aliases
			end

			def read_tank_entries
				entries = @input_yaml['entries']
				entries.each do |entry|
					newEntry = Entry.new
					newEntry.odometer_start = entry['start']
					newEntry.odometer_end = entry['end']
					newEntry.driver = entry['driver']
					newEntry.category = entry['category']
					@tank.add_entry newEntry
				end
			end
		end
	end
end