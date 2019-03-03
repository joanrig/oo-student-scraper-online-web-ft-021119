require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :students


  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    @@students =[]

    doc.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |stu|
        name = stu.css(".student-name").text
        location = stu.css(".student-location").text
        profile_url = "#{stu.attr("href")}"
        student = {name: name, location: location, profile_url: profile_url}
        @@students << student
      end
    end
    @@students
  end




  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open profile_url)
    student = {}
    students = []

    social = doc.css(".social-icon-container a").map {|icon| icon.attribute("href").value}
    social.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      else
        student[:blog] = link
      end
      #binding.pry
    end

    doc.css(".profile-quote").each do |quote|
      student[:profile_quote] = quote.text
    end

    #binding.pry

    bio_info = doc.css(".description-holder p").each do |bio|
      student[:bio] = bio.text
    end

    students << student
    students[0]

  end



end
