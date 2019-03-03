require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open('./fixtures/student-site/index.html')
    doc = Nokogiri::HTML(html)

    students = doc.css("div.roster-cards-container")
    name_city = students.css("div.card-text-container")
    name_city.each do |info|
      name = info.children.text.split[0..1].join(" ")
      location = info.children.text.split[2..3].join(" ").delete(",")
    binding.pry
    end

      [0]

  end

  def self.scrape_profile_page(profile_url)

  end

end
