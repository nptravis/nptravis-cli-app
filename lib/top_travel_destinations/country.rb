class TopTravelDestinations::Country
	attr_accessor :name, :sights, :blurb, :articles

	@@all = []

	def initialize(name)
		@name = name
	end

	def self.scrape_country
		
		doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
		
		i = 1
		
		while i < 11
			nam = doc.css("section.marketing-section article[id='#{i}'] h1").text
			country = self.new(nam.split(".")[1].strip)
			i+=1
			@@all << country
		end
	
	end

	def self.all
		@@all
	end


end