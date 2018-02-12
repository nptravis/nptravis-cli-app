require 'pry'

class TopTravelDestinations::CLI

	def call
		puts "Top 10 Travel Destinations"
		puts <<~DOC
			1. Chile
			2. China
			3. Japan
			4. Thailand
			5. England
		DOC
		puts "What country would you like to visit? PLease pick a number"
	end


end
