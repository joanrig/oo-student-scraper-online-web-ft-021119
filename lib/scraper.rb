require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :students


  def self.scrape_index_page(index_url)
<<<<<<< HEAD
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

=======
    html = open('./fixtures/student-site/index.html')
    doc = Nokogiri::HTML(html)
    students =[]

    doc.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        profile_url = "#{student.attr("href")}"
        student = {name: name, location: location, profile_url: profile_url}
        students << student
        #binding.pry
      end
    end
    students
    #binding.pry
  end

    ## => {:twitter=>"http://twitter.com/flatironschool",
      # :linkedin=>"https://www.linkedin.com/in/flatironschool",
      # :github=>"https://github.com/learn-co,
      # :blog=>"http://flatironschool.com",
      # :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
      # :bio=> "I'm a school"


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

>>>>>>> bfacca5bea228c7bf5c7cea025f35a3f65085c3c
    doc.css(".profile-quote").each do |quote|
      student[:profile_quote] = quote.text
    end

<<<<<<< HEAD
    #binding.pry

    bio_info = doc.css(".description-holder p").each do |bio|
      student[:bio] = bio.text
    end

    students << student
    students[0]
=======
    bio_info = doc.css("div.bio-content content-holder")
    bio_info.css(".description-holder p").each do |bio|
      student[:bio] = "#{bio.text}"
    end
  end
>>>>>>> bfacca5bea228c7bf5c7cea025f35a3f65085c3c




    student
  end


<<<<<<< HEAD

=======
>>>>>>> bfacca5bea228c7bf5c7cea025f35a3f65085c3c
end
