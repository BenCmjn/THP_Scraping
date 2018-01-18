require 'rubygems'
require 'nokogiri'
require 'open-uri'

#----------------------------------
#Méthode pour récupérer les Nombre de cryptos à traiter :
def get_all_cryptos
	# Hey Nokogiri, va sur la page de coinmarketcap.com où y'a toutes les datas
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	# Je prépare un tableau pour ce que tu va aspirer, vide pour l'instant
	crypto_list = []
	# Nokogiri, prend les liens <a> avec la classe "currency-name-container"
	page.xpath('//a[@class="currency-name-container"]').each do |crypto| 
		# Pour chaque crypto, on va les rajouter dans mon tableau
		crypto_list << crypto
	end #Très bien. Donne-moi LA TAILLE cette p***** de liste
	return crypto_list.length
end # Merci, tu as fait du très bon travail


#----------------------------------
#Méthode pour récupérer les Noms de cryptos :
def get_crypto_name(x)
	# Hey Nokogiri, va sur la page de coinmarketcap.com où y'a toutes les datas
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	# Je prépare un tableau de noms pour les cryptos, vide pour l'instant
	name_list = []
	# Nokogiri, prend les liens <a> avec la classe "currency-name-container"
	page.xpath('//a[@class="currency-name-container"]').each do |name| 
		# Pour chaque nom, on va les rajouter dans mon tableau
		name_list << name.text
	end
	# Fini ? Donne-moi cette p***** de liste
	 return name_list[0..x]
end # Merci, tu as fait du très bon travail


#----------------------------------
#Méthode pour récupérer les prix :
def get_crypto_price(x)
	# Hey Nokogiri, va sur la page de coinmarketcap.com où y'a toutes les datas
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	# Je prépare un tableau de prix pour les cryptos, vide pour l'instant
	price_list = [] 

	page.xpath('//a[@class="price"]').each do |price|
		# Pour chaque nom, on va les rajouter dans mon tableau
		price_list << price.text
	end
	# Fini ? Donne-moi cette p***** de liste
	return price_list[0..x]
end # Merci, tu as fait du très bon travail


#----------------------------------
# On va utiliser ces méthodes : 
# puts get_crypto_price()

# puts get_crypto_name(10)


# DÉMARRAGE DU PROGRAMME !!!!!

#Début de la boucle :
loop {
puts "Hello! Je suis sur ce site de blog chienne…
	\n …attend, je regarde combien il y a de crypto à pécho…"
# Combien y a t'il de cryptos à afficher ?
puts "Il y en a #{get_all_cryptos} à afficher !
	\n …attend un peu mon ami je vais te donner leurs prix…"

# On va mettre le nombre total des cryptos chopés dans "num"
num = get_all_cryptos

# On va prendre les noms d'un coté, et les prix de l'autre,
# et on va en faire un HASH (.to_h) :
h = get_crypto_name(num).zip(get_crypto_price(num)).to_h

# Affichons le :
puts h
# Voilà, soyons fier de nous mon petit Nokogiri :
puts "\n Voilà, je reviens dans une heure…
	\n (Tu peux faire ctrl+C pour quitter)"
#Faisons une pause et recommeçons dans une heure (3600 sec) :
sleep(3600)

}# Fin de la boucle













