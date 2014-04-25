class Tankulator::GasTank
	attr_accessor :start_date
	attr_accessor :end_date
	attr_accessor :cost
	attr_accessor :total_distance_confirmation
	
	@start_date
	@end_date
	@cost
	@total_distance_confirmation

	@aliases
	@entries
	@drivers
	@total_distance

	def initialize
		@entries = Array.new
		@drivers = Hash.new
	end

	def cost=(newValue)
		@cost = newValue.to_f.round(2)
	end
	
	def add_entry(newEntry)
		@entries << newEntry
	end

	def total_distance
		sum = 0.00
		@entries.each { |entry| sum += entry.distance_travelled.to_f.round(2) }
		sum
	end
	
	def driver_summaries
		@entries.each do |entry|
			if @drivers.has_key? entry.driver
				@drivers[entry.driver] += entry.distance_travelled
			else
				@drivers[entry.driver] = entry.distance_travelled
			end
		end
		
		puts '-' * 30
		puts '--Total Driving--'
		@total_distance = 0.0
		@drivers.each do |drivername, distance|
			distance = distance.round(1)
			drivername = @aliases[drivername] unless !@aliases.has_key? drivername
			puts "\t#{drivername}: #{distance} KM"
			@total_distance += distance
		end
		@total_distance = @total_distance.round(1)
		puts (@total_distance == @total_distance_confirmation.to_f.round(1)) ? "Total Distance Driven: #{@total_distance} KM [✓]" : "Total Distance Driven: #{@total_distance} KM [☹]"
		
		compute_money_owing()
	end
	
	def driver_aliases=(aliases)
		@aliases = Hash.new
		parts = aliases.split ','
		parts.each do |piece|
			alias_components = piece.split ':'
			@aliases[alias_components[0].chomp] = alias_components[1].chomp
		end
	end
	
	def to_s
		"--Tank Summary--\n\tStart Date: #{@start_date}\tEnd Date: #{@end_date}\tCost: $#{@cost}\n\tTotal Distance: #{self.total_distance.round(1)} KM\n\tNumber of Entries: #{@entries.count}"
	end
	
	private
	def compute_money_owing
		puts '-' * 30
		puts "--Money Owed--"
		total_money = 0.00
		@drivers.each do |driver, distance|
			percent_of_kilometers = distance / @total_distance
			percent_of_kilomters = percent_of_kilometers.round(2)
			money_owed = @cost * percent_of_kilometers
			money_owed = money_owed.round(2)
			driver = @aliases[driver] unless !@aliases.has_key?(driver)
			
			puts "\t#{driver}: $#{money_owed} (#{(percent_of_kilometers * 100).round(2)}%)"
			total_money += money_owed
		end
		total_money = total_money.round(2)
		puts (total_money == @cost) ? "Total Cost: $#{@cost} [✓]" : "Total Cost: $#{@cost} [☹]"
	end
end