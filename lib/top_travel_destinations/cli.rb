class TopTravelDestinations::CLI

	# def initialize(countries)
	# 	Country.scrape_country
	# end

	def call
		puts "Top 10 Travel Destinations"
		
		TopTravelDestinations::Country.scrape_country
		list_all

		input = nil
		while input != "exit"
			puts "What country would you like to visit? Please enter the number, or enter 'exit' to leave program"
			input = gets.strip
			if valid?(input)
				input = input.to_i - 1
				display_country(input)
				break
			end
		end
	end

	def list_all
		TopTravelDestinations::Country.all.each.with_index(1) do |country, i|
			puts "#{i}. #{country.name}"
		end
	end

	def display_country(index)
		country = TopTravelDestinations::Country.all[index]
		country.scrape_country_data
		puts country.name
		puts "--------------"
		puts country.blurb
		puts "--------------"
		puts "Top 10 sights"
		puts country.list_sights
	end

	def valid?(input)
		true
	end


end
