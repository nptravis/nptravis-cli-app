class TopTravelDestinations::Country
	attr_accessor :name, :description, :url

	@@all = []

	def self.scrape
		doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
		
		i = 1
		while i <= 10
			object = self.new
			object.name = doc.css("##{i} h1").text.split(".")[1].strip
			object.description = doc.css("##{i} p").first.text.strip
			@@all << object
			i+=1
		end
		@@all
	end

end