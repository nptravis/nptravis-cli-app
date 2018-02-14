class TopTravelDestinations::CLI

	def call
		menu1
	end

	def menu1
		puts
		puts
		puts "	Top 10 Travel Destinations for 2018".colorize(:yellow)
		puts "	-----------------------------------".colorize(:light_yellow)
		puts "	You can search by:".colorize(:magenta)
		puts <<-DOC.colorize(:light_cyan)
	1. Top 10 Countries
	2. Top 10 Cities
	3. Top 10 Regions
	4. Top 10 Best Value
		DOC
		puts "	Please choose a number 1-4".colorize(:green)
		puts "	You can type 'exit' at anytime".colorize(:green)

		
		while true
			input = gets.strip
			if input == "exit"
				goodbye
				break
			elsif input.to_i > 0 && input.to_i < 5
				@first_input = input.to_i
				menu2
				break
			else
				puts "Please enter a valid number or type 'exit'".colorize(:red)
			end
		end
	end

	def menu2
		all = []
		case @first_input
			when 1
				puts
				puts "	Top 10 Countries".colorize(:yellow)
				puts "	----------------"
				if !@countries
					@countries = TopTravelDestinations::Country.scrape
				end
				all = @countries
			when 2
				puts
				puts "	Top 10 Cities".colorize(:yellow)
				puts "	----------------"
				if !@cities
					@cities = TopTravelDestinations::City.scrape
				end
				all = @cities
			when 3
				puts
				puts "	Top 10 Regions".colorize(:yellow)
				puts "	----------------"
				if !@regions
					@regions = TopTravelDestinations::Region.scrape
				end
				all = @regions
			when 4
				puts
				puts "	Top 10 Best Values".colorize(:yellow)
				puts "	----------------"
				if !@values
					@values = TopTravelDestinations::Value.scrape
				end
				all = @values
		end
			
		all.each.with_index(1) {|object,i| puts "	#{i}. #{object.name}".colorize(:light_cyan)}
		puts
		puts "	Please choose a number 1 - 10".colorize(:green)
		puts "	Or 'back'".colorize(:green)
		puts "	You can type 'main menu' or 'exit' at anytime".colorize(:green)
		
		while true
			input = gets.strip
			if input == "exit"
				goodbye
				break
			elsif input == "back"
				menu1
				break
			elsif input == "main menu"
				menu1
				break
			elsif input.to_i > 0 && input.to_i < 11
				menu3(all, input)
				break
			else
				puts "	Please enter a valid number".colorize(:red)
			end
		end
	end

	def menu3(all, input)
		object = all[input.to_i-1]
		puts
		puts "	" + object.name.colorize(:light_cyan)
		puts "	---------------------------------------"
		puts "	" + object.description.colorize(:light_cyan)
		puts "	---------------------------------------"
		puts "	for more information visit: #{object.url}".colorize(:light_yellow)
		puts
		puts "	Or 'back'".colorize(:green)
		puts "	You can type 'main menu' or 'exit' at anytime".colorize(:green)
	
		while true
			input = gets.strip
			
			if input == "exit"
				goodbye
				break
			elsif input == "back"
				menu2
				break
			elsif input == 'main menu'
				menu1
				break
			else
				puts "	Please enter either 'back', 'main menu' or 'exit'".colorize(:red)
			end
		end
	end

	def goodbye
		puts "	Thanks for coming, safe travels!".colorize(:yellow)
	end

end
