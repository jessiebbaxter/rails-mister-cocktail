require 'open-uri'
require 'json'

puts 'Cleaning database...'
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
	{ name: "FIGURATI: A LAMBRUSCO COCKTAIL", description: "This low-abv sipper was made for brunch." },
	{ name: "BRANDY COCKTAIL: THE WORLD, REVERSED", description: "A unique combo of brandy, Branca Menta and amaro." },
	{ name: "IRISH WHISKEY COCKTAIL: ROAD TO TRALEE", description: "Warm up with whiskey, banana liqueur and bitters." },
	{ name: "DEAD RABBIT’S REAL IRISH PUNCH", description: "Perfect for your next fall gathering. " },
	{ name: "DEATH & CO.’S IDEAL MARTINI RECIPE", description: "From the beautiful new book, Cocktail Codex." },
	{ name: "CORPSE REVIVER #2", description: "A classic cocktail with a name that could wake the dead." },
	{ name: "TEA COCKTAIL: SING LIKE A BEE", description: "Earl Grey-infused gin pairs perfectly with honey and citrus." },
	{ name: "SALTY STEPHEN", description: "Sweet vermouth shines in this punchy riff on the Bitter Giuseppe." },
	{ name: "THE OFFERING: A TEQUILA COCKTAIL", description: "Spiced pear shrub, aged tequila and Cardamaro make for a perfect blend of fall flavors." },
	{ name: "ORCHARD THIEF: A FALL COCKTAIL", description: "A spiced apple shrub anchors this whiskey cocktail from NYC." }
]

Cocktail.create(cocktails)

puts 'Finished!'