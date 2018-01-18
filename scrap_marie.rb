require 'rubygems'
require 'nokogiri'
require 'open-uri'

cities = []

def get_all_the_urls_of_val_doise_townhalls()
   page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
   cityTab = []

   page.xpath('//a[@class="lientxt"]').each do |name|
        cityTab << name.text
   end
       puts cityTab.length
       get_the_email_of_a_townhal_from_its_webpage(cityTab)
end

def get_the_email_of_a_townhal_from_its_webpage(cities)
    cities.each do |city|
        url_cities = city.downcase.gsub(' ', '-')
         page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{url_cities}.html"))
        puts page.css('p:contains("@")').text.gsub(' ','')
    end 

end 

get_all_the_urls_of_val_doise_townhalls()