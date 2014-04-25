module Tankulator
	# Starts running everything
	# Returns nothing
	def self.run
		require 'tankulator/entry'
		require 'tankulator/gastank'
		
		if ARGV.count == 0
			puts "USAGE: tankulator <filename>"
			#print 'Please enter the name of the file read from: '
			#inputFileName = gets.chomp
		else
			inputFileName = ARGV[0]
			
			if File.exists?(inputFileName)
				newTank = GasTank.new
				puts 'Reading file input...'

				inputFile = File.open(inputFileName, 'r')
				# Read in tank information
				# the first four lines are as follows
				newTank.start_date = inputFile.readline # start date
				newTank.end_date = inputFile.readline # end date
				newTank.cost = inputFile.readline.to_f # cost of tank
				newTank.total_distance_confirmation = inputFile.readline # total distance
				newTank.driver_aliases = inputFile.readline # make printing drivers a bit better

				# read in the rest of the lines until we hit the end of the file
				begin
					while
						newTank.add_entry(Entry.new(inputFile.readline))
					end
				rescue EOFError
						#puts "All lines read"
				end

				inputFile.close()
				puts newTank
				newTank.driver_summaries
			else
				puts 'That file does not exist. Exiting.'
			end
		end
	end
end