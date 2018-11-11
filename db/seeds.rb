require 'open-uri'
require 'json'

puts 'Cleaning database...'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts 'Creating ingredients...'

data = JSON.load(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"))

data["drinks"].each do |ingredient|
	Ingredient.create(name: ingredient["strIngredient1"])
end

puts 'Creating cocktails...'

cocktails = [
	{ name: "MEZCAL COCKTAIL: DJ LISA", description: "Mezcal finds its perfect matches in citrus and cinnamon." },
	{ name: "FIGURATI: LAMBRUSCO COCKTAIL", description: "This low-abv sipper was made for brunch." },
	{ name: "BRANDY COCKTAIL: THE WORLD", description: "A unique combo of brandy, Branca Menta and amaro." },
	{ name: "IRISH WHISKEY COCKTAIL", description: "Warm up with whiskey, banana liqueur and bitters." },
	{ name: "DEAD RABBIT’S IRISH PUNCH", description: "Perfect for your next fall gathering. " },
	{ name: "DEATH & CO.’S IDEAL MARTINI", description: "From the beautiful new book, Cocktail Codex." },
	{ name: "CORPSE REVIVER #2", description: "A classic cocktail with a name that could wake the dead." },
	{ name: "TEA COCKTAIL: LIKE A BEE", description: "Earl Grey-infused gin pairs perfectly with honey and citrus." },
	{ name: "SALTY STEPHEN", description: "Sweet vermouth shines in this punchy riff on the Bitter Giuseppe." },
	{ name: "THE OFFERING: TEQUILA DREAM", description: "Spiced pear shrub, aged tequila and Cardamaro." },
	{ name: "ORCHARD THIEF: FALL COCKTAIL", description: "A spiced apple shrub anchors this whiskey cocktail from NYC." }
]

Cocktail.create(cocktails)

puts 'Adding photos'

images = [
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541794149/huan-minh-612444-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798504/adam-jaime-119551-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798501/jens-theess-28249-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798500/lindsay-cotter-465400-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798500/rawpixel-735374-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798498/kyryll-ushakov-1057516-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798498/christine-trant-679690-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798496/ash-edmonds-491898-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798494/melissa-walker-horn-483815-unsplash.jpg",
	"https://res.cloudinary.com/dswcvx3gy/image/upload/v1541798494/karly-gomez-360069-unsplash.jpg"
]

Cocktail.all.each do |cocktail|
	cocktail.remote_photo_url = images.sample
	cocktail.save
end

puts 'Finished!'


