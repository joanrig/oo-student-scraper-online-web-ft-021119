require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
      html = open('./fixtures/student-site/index.html')
      doc = Nokogiri::HTML(html)
      students =[]

      doc.css("div.roster-cards-container").each do |card|
        card.css(".student-card a").each do |info|
        binding.pry
        #get name and city
        # doc.css("div.card-text-container").each do |info|
        #   @name = info.children.text.split[0..1].join(" ")
        #   @location = info.children.text.split[2..3].join(" ").delete(",")
            #binding.pry
        end
      end

        #get profile link
        link_end = student_info.css("div.student-card").xpath('//div/a/@href').first.value
        @profile = "./fixtures/student-site/#{link_end}"
        binding.pry

        #populate student hash, save to student array
        student = {:name => @name, :location => @location, :profile_url => @profile}
        student_array << student
        #binding.pry

    end

  def self.scrape_profile_page(profile_url)

  end

end
