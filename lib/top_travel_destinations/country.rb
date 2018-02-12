require 'nokogiri'
require 'pry'

class TopTravelDestinations::Country
	attr_accessor :name, :sights, :blurb, :articles

	@@all = []

	def self.scrape_country
		country = self.new
		country.name = "Chile"
		@@all << country
	end

	def self.all
		@@all
	end


end