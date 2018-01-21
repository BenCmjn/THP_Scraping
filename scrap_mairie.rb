require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Ce qui va suivre est une réaction en chaîne :

# Étape 1 --------------------------------------
def get_all_the_urls_of_val_doise_townhalls()
  # On va utiliser Nokogiri pour parcourir la page "val d'oise" de "annuaire-des-mairies.com"
  page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
  # On va créer un 1er tableau à remplir
  cityTab = []
  # Dans lequel on va mettre les liens (<a>) qu'on utilisera dans la 2e méthode…
  page.xpath('//a[@class="lientxt"]').each do |name|
    cityTab << name.text
  end
  puts cityTab.length # On va afficher le nombre de villes (pages à scraper)
  get_the_email_of_a_townhal_from_its_webpage(cityTab) # on appelle la prochaine méthode.
end # Le contenu du tableau "cityTab" devient le paramètre de la prochaine méthode.

# Étape 2 --------------------------------------
# Prochaine méthode : "cities" est le paramètre qui 
def get_the_email_of_a_townhal_from_its_webpage(cities)
  cities.each do |city|
    url_cities = city.downcase.gsub(' ', '-') # On clean ce qu'on scrap,
    # pour pouvoir l'insérer dans cet url, que Nokogiri va scrapper, une fois de plus
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{url_cities}.html"))
    # et on récupère les <p> contenant des "@" puisque un email est forcément avec un "@" ;)
    # puts page.css('p:contains("@")').text.gsub(' ','')
    page.xpath('//a[xpath="/html/body/table/tbody/tr[3]/td/table/tbody/tr[1]/td[1]/table[4]/tbody/tr[2]/td/table/tbody/tr[5]/td[2]/p"]')
    
  end

end
#------------------------ Fin des méthodes ------------

# GOGOGOGO !
get_all_the_urls_of_val_doise_townhalls()
#------------------------ Fin du programme ------------
