# Utilisation d'une BDD JSON

getData = "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows=10&facet=typeemplacement&facet=domanialite&facet=arrondissement&facet=libellefrancais&facet=genre&facet=espece"

data = JSON.parse Utils.domLoadDataSync getData

arbre.x = Align.center
arbre.y = Align.center


# Card List
rows = data.records.length

# Loop to create row layers
for index in [0...rows]
	print "Espece: " + data.records[index].fields.libellefrancais + ". Diam.=" + data.records[index].fields.circonferenceencm + "m. Localisation: " + data.records[index].fields.arrondissement
	arbre.scale = 4/data.records[2].fields.circonferenceencm