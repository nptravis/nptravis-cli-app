class TopTravelDestinations::CLI
# 	black
# light_black
# red
# light_red
# green
# light_green
# yellow
# light_yellow
# blue
# light_blue
# magenta
# light_magenta
# cyan
# light_cyan
# white
# light_white
# default

	def call
		menu1
		goodbye
	end

	def menu1
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
		puts "	Please choose a number 1-4 or 'exit'".colorize(:green)

		while true
			input = gets.strip
			if input == "exit"
				break
			elsif input.to_i > 0 && input.to_i < 5
				@first_input = input.to_i
				menu2
			else
				puts "Please enter a valid number or 'exit'".colorize(:green)
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
				all = TopTravelDestinations::Country.scrape
			when 2
				puts
				puts "	Top 10 Cities".colorize(:yellow)
				puts "	----------------"
				all = TopTravelDestinations::City.scrape
			when 3
				puts
				puts "	Top 10 Regions".colorize(:yellow)
				puts "	----------------"
				all = TopTravelDestinations::Region.scrape
			when 4
				puts
				puts "	Top 10 Best Values".colorize(:yellow)
				puts "	----------------"
				all = TopTravelDestinations::Value.scrape
		end
			
		all.each.with_index(1) {|object,i| puts "	#{i}. #{object.name}".colorize(:light_cyan)}
		
		puts "	Please choose a number 1 - 10".colorize(:green)
		puts "	Or you can type 'main menu'".colorize(:green)
		
		while true
			input = gets.strip
	
			if input == "main menu"
				menu1
			elsif input.to_i > 0 && input.to_i < 11
				menu3(all, input)
			else
				puts "	Please enter a valid number or 'main menu'".colorize(:green)
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
		puts "	Type 'back' or 'main menu'".colorize(:green)
	
		while true
			input = gets.strip
			
			if input == "back"
				menu2
			elsif input == 'main menu'
				menu1
			else
				puts "	Please enter either 'back' or 'main menu'".colorize(:green)
			end
		end
	end

	def goodbye
		puts "	Thanks for coming, safe travels!".colorize(:yellow)
	end

end
