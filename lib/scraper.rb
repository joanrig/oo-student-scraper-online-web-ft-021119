require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    doc = Nokogiri::HTML(html)  
    name_city = doc.css("div.card-text-container")
    name_city.each do |info|
      name = info.children.text.split[0..1].join(" ")
      location = info.children.text.split[2..3].join(" ").delete(",")
    end
      x = doc.css("div.roster-text-container")[0]

  end

  def self.scrape_profile_page(profile_url)

  end

end
