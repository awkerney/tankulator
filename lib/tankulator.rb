# Require all of the Ruby files in the given directory. (Stolen from Jekyll's source code)
#
# path - The String relative path from here to the directory.
#
# Returns nothing.
def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

# Ruby Standard Library Requirements
require 'date'

# Internal Requirements
require 'tankulator/entry'
require 'tankulator/gastank'

require_all 'tankulator/parsers'

module Tankulator
	# Starts running everything
	# Returns nothing
	def self.run(args)
		inputFileName = args[0]
		
		if File.exists?(inputFileName)
			# newTank = GasTank.new
			# puts 'Reading file input...'
			# 
			# inputFile = File.open(inputFileName, 'r')
			# # Read in tank information
			# # the first four lines are as follows
			# newTank.start_date = Date.parse(inputFile.readline) # start date
			# newTank.end_date = Date.parse(inputFile.readline) # end date
			# newTank.cost = inputFile.readline.to_f # cost of tank
			# newTank.total_distance_confirmation = inputFile.readline # total distance
			# newTank.driver_aliases = inputFile.readline # make printing drivers a bit better
			# 
			# # read in the rest of the lines until we hit the end of the file
			# begin
			# 	while
			# 		newTank.add_entry(Entry.new(inputFile.readline))
			# 	end
			# rescue EOFError
			# 		#puts "All lines read"
			# end
			# 
			# inputFile.close()
			# puts newTank
			# newTank.driver_summaries
			# 
			# puts "*" * 60
			# puts "*" * 60
			# puts "*" * 60
			csvParser = Tankulator::Parsers::CSVFileParser.new(inputFileName)
			csvTank =  csvParser.parsed_tank
			puts csvTank
			csvTank.driver_summaries
			
		else
			puts 'That file does not exist. Exiting.'
		end
	end
end
