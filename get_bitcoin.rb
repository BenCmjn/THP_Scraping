require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_btc_course()
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  prices = []

  page.xpath('//a[@class="price"]').each do |price|
    prices << price.text.gsub(' ','')

    prices[0].gsub("\n","")
  end
  puts "1 bitcoin vaut : #{prices[0..10]}"
  sleep(5)
end


loop { get_btc_course }
