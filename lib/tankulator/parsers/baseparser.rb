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
		
		def initialize
			print "Please enter the name of the input file: "
			filename = gets.chomp
			initialize_with_filename(filename)
		end # end self.initialize	
		
		def tank_information
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		def tank_entries
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		def drivers
		end
		
		protected
		def read_tank_information
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		def read_tank_entries
			raise NotImplementedError, 'Abstract implementation should be overridden in a subclass'
		end
		
		def read_drivers
		end
	end
end