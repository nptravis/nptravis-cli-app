class TopTravelDestinations::Country
	attr_accessor :name, :sights, :blurb, :articles

	@@all = []

	def initialize(name)
		@name = name
		@sights = []
	end

	def self.scrape_country
		doc = Nokogiri::HTML(open("https://www.lonelyplanet.com/best-in-travel/countries"))
		
		i = 1
		
		while i < 11
			nam = doc.css("section.marketing-section article[id='#{i}'] h1").text
			blurb = "a nice spot"
			country = self.new(nam.split(".")[1].strip)
			i+=1
			@@all << country
		end
	
	end

	def self.all
		@@all
	end

	def scrape_country_data
		url = "https://www.lonelyplanet.com/" + self.name.downcase
		doc = Nokogiri::HTML(open(url))
		@blurb = doc.css("span.js-intro-narrative p").text
		# sights = doc.css("div.SightsList-wrap")
		# binding.pry

	end

	def list_sights
		# @sights.collect.with_index(1) {|sight,i| "#{i}. #{sight}"}
		puts "Cool Sights!"
	end


end