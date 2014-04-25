# By Adam Kerney
# Tankulator
# It basically just calculates between a given set of people who used how much
# The format for the input file is as follows:
=begin
march 28, 2014
april 8, 2014
47.56
481.0
sa:Stacey & Adam,jk:Jay & Kamea,b:Business
0.0,4.7,p:sa
4.7,18.6,b
18.6,43.0,p:jk
43.0,137.2,p:sa
137.2,157.2,p:jk
157.2,173.1,p:sa
173.1,192.2,b
192.2,213.3,p:sa
213.3,257.5,p:sa
257.5,275.5,b
275.5,295.6,p:jk
295.6,315.8,p:sa
315.8,350.1,b
350.1,372.3,p:jk
372.3,388.0,b
388.0,410.3,p:sa
410.3,452.6,p:jk
452.6,481.0,p:sa
=end

# To explain the format:
# The first 5 lines are purely informational
# Line 1 is the start date
# Line 2 is the end date
# Line 3 is the cost of the tank
# Line 4 is the distance travelled according to your odometer or trip meter
# Line 5 maps the abbreviations to full names, that way you can just pick an abbreviation
# for each driver instead of typing their full name on each applicable line
# Line 6 and onward are the entries
# The first value is the odometer start value 
# The second value is the odometer end value
# The third value is the category and driver
# The category is either 'p' for personal or 'b' for business

inputFileName = ''
if ARGV.count == 0
	print 'Please enter the name of the file read from: '
	inputFileName = gets.chomp
else
	inputFileName = ARGV[0]
end

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
