class TopTravelDestinations::CLI

	# def initialize(countries)
	# 	Country.scrape_country
	# end

	def call
		puts "Top 10 Travel Destinations"
		puts "--------------------------"
		puts "You can search by:"
		puts <<~DOC 
		1. Top 10 Countries
		2. Top 10 Cities
		3. Top 10 Regions
		4. Top 10 Best Value
		DOC
		puts "Please choose a number 1-4:"
		puts "Or, you can type 'exit' at anytime"

		input = nil
		while input != "exit"
			input = gets.strip
			case input
			when "1"
				puts
				puts "Top 10 Countries"
				puts "----------------"
				all = TopTravelDestinations::Country.scrape
				display(all)
			when "2"
				puts
				puts "Top 10 Cities"
				puts "----------------"
				all = TopTravelDestinations::City.scrape
				display(all)
			when "3"
				puts
				puts "Top 10 Regions"
				puts "----------------"
				all = TopTravelDestinations::Region.scrape
				display(all)
			when "4"
				puts
				puts "Top 10 Best Values"
				puts "----------------"
				all = TopTravelDestinations::Value.scrape
				display(all)
			else
				puts "please enter a valid number or type 'exit'"
			end
		end
	end

	def display(all)
		all.each.with_index(1) {|object,i| puts "#{i}. #{object.name}"}
		puts "Please choose a number 1 - 10"
		puts "Or, you can type 'exit' at anytime"
	end

end
