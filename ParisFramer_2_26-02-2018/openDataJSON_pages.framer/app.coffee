# Variables
pageCount = 50
gutter = 10

getData = "https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&rows="+pageCount+"&facet=typeemplacement&facet=domanialite&facet=arrondissement&facet=libellefrancais&facet=genre&facet=espece"

data = JSON.parse Utils.domLoadDataSync getData

# Card List
rows = data.records.length

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width / 1.4
	height: Screen.height / 1.1
	scrollVertical: false
	clip: false

# Loop to create pages
for index in [0...rows]
	page = new Layer
		size: pageScroller.size
		x: (pageScroller.width + gutter) * index
		backgroundColor: "#00AAFF"
		hueRotate: index * 20
		parent: pageScroller.content
	descriptions = new TextLayer
		text: index+"/ Espèce=" + data.records[index].fields.libellefrancais + ". H=" + data.records[index].fields.hauteurenm + "m"+". Localisation=" + data.records[index].fields.arrondissement
		parent: page
		y: 10
		x: 10
		width: page.width-20
		color: "white"
		fontSize: 24

	page.onClick ->
		pageScroller.snapToPage(this)

