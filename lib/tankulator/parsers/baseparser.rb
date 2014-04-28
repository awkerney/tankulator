module Tankulator
	# This is intended to be an abstract class
	# The only methods that don't throw exceptions are the initialize methods
	class Parser
		require 'tankulator/entry'
		require 'tankulator/gastank'
		
		def initialize_with_filename(filename)
			if File.exists?(filename)
				if File.readable?(filename)
					@input_file = File.open(filename, 'r')
				else
					puts "Can't read file! Please make sure it is readable then try again."
				end
			else
				puts "File doesn't exist! Please check your spelling and try again."
			end
		end
		
		def initialize(filename = nil)
			if filename == nil
				print "Please enter the name of the input file: "
				file_name = gets.chomp
				initialize_with_filename(file_name)
			else
				initialize_with_filename(filename)
			end
		end # end self.initialize	
		
		# Returns the tank created by parsing the input file
		def parsed_tank
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		protected
		def read_tank_information
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		def read_tank_entries
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		def read_tank_drivers
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
	end
end