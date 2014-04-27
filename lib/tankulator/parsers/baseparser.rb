module Tankulator
	class BaseParser
		@input_file
	
		def self.initialize_with_filename(filename)
			if File.exists?(filename)
				if File.readable?(filename)
					@input_file = filename
				else
					puts "Can't read file! Please make sure it is readable then try again."
				end
			else
				puts "File doesn't exist! Please check your spelling and try again."
			end
		end # end self.initialize_with_filename
		
		def self.initialize
			print "Please enter the name of the input file: "
			filename = gets.chomp
			self.initialize_with_filename(filename)
		end # end self.initialize
		
	end
	
end