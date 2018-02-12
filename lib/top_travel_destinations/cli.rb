require 'pry'

class TopTravelDestinations::CLI

	# def initialize(countries)
	# 	Country.scrape_country
	# end

	def call
		puts "Top 10 Travel Destinations"
		
		TopTravelDestinations::Country.scrape_country
		list
		
		# puts <<~DOC
		# 	1. Chile
		# 	2. China
		# 	3. Japan
		# 	4. Thailand
		# 	5. England
		# DOC
		

		puts "What country would you like to visit? PLease pick a number:"
	end

	def list
		TopTravelDestinations::Country.all.each.with_index(1) do |country, i|
			puts "#{i}. #{country.name}"
		end
	end


end
