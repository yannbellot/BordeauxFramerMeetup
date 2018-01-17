###
Page d'accueil Home
###

# Affichage de la vidéo #
video_1 = new VideoLayer # Création d'un calque de type vidéo
	video: "video/code-scroll.mp4" # Lien vers le fichier vidéo
	parent: home # Le calque vidéo s'affiche dans la page Home
	backgroundColor: "transparent"
	x: Align.center
	y: Screen.height/2.7
	scale: 1.8

video_1.player.autoplay = true # Lancement automatique de la vidéo

# Évènement : clic de souris sur la flèche bas
down_button.onClick (event, layer) ->
	page.snapToPage(section_1) # Afficher à la page section_1

###
Composant Page
###

# Création du composant Page
page = new PageComponent
	y: 40
	width: Screen.width
	height: Screen.height-40
	scrollHorizontal: false

# Insertion des pages dans le composant Page
page.addPage(home)
page.addPage(section_1, "bottom")
page.addPage(section_2, "bottom")
page.addPage(section_3, "bottom")

###
Interaction avec le menu
###

# Repositionnement et redimmensionnement par défault du menu
menu.height = 0
menu.x = 0
menu.placeBefore(page) # Placé par dessus le composant Page

# Affichage du menu
hamburger.onClick (event, layer) -> # Évènement : clic de souris sur le hamburger

# Animation du menu au premeir clic : le menu se déploie
	menu.animate
		height: Screen.height
		options:
			time: 1
			curve: Bezier.ease

# Animation du menu au premeir clic : le menu se rétracte
	menu.animate
		height: 0
		options:
			time: 0.5
			curve: Bezier.ease

# Évènement : clic de souris sur l'item de menu Design 
link_design.onClick (event, layer) ->
	page.snapToPage(section_1) # Afficher à la page section_1
	# Rétractation du menu
	menu.animate
		height: 0
		options:
			time: 0.5
			curve: Bezier.ease

# idem pour les autres items de menu...
link_home.onClick (event, layer) ->
	page.snapToPage(home)
	menu.animate
		height: 0
		options:
			time: 0.5
			curve: Bezier.ease

link_code.onClick (event, layer) ->
	page.snapToPage(section_2)
	menu.animate
		height: 0
		options:
			time: 0.5
			curve: Bezier.ease

link_collaborate.onClick (event, layer) ->
	page.snapToPage(section_3)
	menu.animate
		height: 0
		options:
			time: 0.5
			curve: Bezier.ease

###
Interaction avec le header
###

# Évènement : clic de souris sur l'item du Header See feature
see_features.onClick (event, layer) ->
	page.snapToPage(section_1) # Afficher à la page section_1

###
Gestion de la popin Vidéo
###

# Repositionnement et redimmensionnement par défault de la popin
popin_video.x = 0
popin_video.y = 0
popin_video.placeBefore(page)
popin_video.visible = false # La popin est invisible (hidden)
popin_video.opacity = 0

# Affichage de la vidéo
video_2 = new VideoLayer
	video: "video/code-scroll.mp4"
	parent: popin_video
	backgroundColor: "transparent"
	x: Align.center
	y: Align.center
	scale: 2.8

# Évènement : clic de souris sur le boutton Watch video
video_button.onClick (event, layer) ->
	popin_video.visible = true # Affichage de la popin
	popin_video.animate
		opacity: 1
		options:
			time: 1
			curve: Bezier.ease
	video_2.player.play() # Lancement de la vidéo

# Évènement : clic de souris sur la croix de fermeture de la popin
close_popin.onClick (event, layer) ->
	popin_video.visible = false

###
Chatbot - BONUS !!
###

question.visible = false
responde.visible = false
close_chatbox.visible = false

chatbot.placeBefore(page)

chatbot.animate
	y: Screen.height-120
	options:
		time: 1
		curve: Spring(damping: 0.27)
		delay: 1.00

call.onClick (event, layer) ->
	question.visible = true
	responde.visible = true
	close_chatbox.visible = true

	responde.animate
		options:
			time: 1
			curve: Spring(damping: 0.29)
	
	question.animate
		y: responde.x-40
		options:
			time: 1
			curve: Spring(damping: 0.29)
	
	close_chatbox.animate
		y: responde.x-80
		options:
			time: 1
			curve: Spring(damping: 0.29)

close_chatbox.onClick (event, layer) ->

	chatbot.animate
		y: Screen.height+100
		options:
			time: 0.3
			curve: Bezier.ease
	





