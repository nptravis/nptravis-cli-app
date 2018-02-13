class TopTravelDestinations::CLI

	# def initialize(countries)
	# 	Country.scrape_country
	# end

	def call
		menu1
	end

	def menu1
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
		puts "or you can type 'exit' anytime"

		input = nil
		while input != "exit"
			input = gets.strip

			if input == "exit"
				goodbye
				break
			elsif input.to_i > 0 && input.to_i < 5
				menu2(input.to_i)
			else
				puts "Please enter a valid number or 'exit'"
			end
		end
	end

	def menu2(input)
		@menu2 = input
		case input
			when 1
				puts
				puts "Top 10 Countries"
				puts "----------------"
				all = TopTravelDestinations::Country.scrape
				menu3(all)
			when 2
				puts
				puts "Top 10 Cities"
				puts "----------------"
				all = TopTravelDestinations::City.scrape
				menu3(all)
			when 3
				puts
				puts "Top 10 Regions"
				puts "----------------"
				all = TopTravelDestinations::Region.scrape
				menu3(all)
			when 4
				puts
				puts "Top 10 Best Values"
				puts "----------------"
				all = TopTravelDestinations::Value.scrape
				menu3(all)
			end
	end

	def menu3(all)
		all.each.with_index(1) {|object,i| puts "#{i}. #{object.name}"}
		puts "Please choose a number 1 - 10"
		puts "Or, you can type 'main menu' or 'exit'"
		input = nil
		while input != "exit"
			input = gets.strip

			if input == 'back'
				menu2(@menu2)
			elsif input == 'main menu'
				menu1
			elsif input.to_i > 0 && input.to_i < 11
				object = all[input.to_i-1]
				puts
				puts object.name
				puts "-------------"
				puts object.description
				puts "-------------"
				puts "for more information visit: #{object.url}"
				puts
				puts"type 'back', 'main menu' or 'exit'"
			else
				puts "Please enter a valid number"
			end
		end
	end

	def goodbye
		puts "Thanks for coming, safe travels!"
	end

end
