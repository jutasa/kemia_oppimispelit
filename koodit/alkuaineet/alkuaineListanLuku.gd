extends Node2D

const NUMERO=0
const MERKKI=1
const NIMI=2
const MASSA=3
const TYYPPI=4

func _ready():
	find_sprite_and_write_data()
	#read_elementary_list()

func find_sprite_and_write_data():
	#get nodes
	var element_nodes=get_tree().get_nodes_in_group("elements")
	
	#read file and write data to right nodes
	var file = File.new()
	var line
	file.open("res://tekstit/alkuaineet.csv",1)
	print("file opened")
	var luku=1
	while true:
		line = file.get_line()
		
		#if file is at the end
		if file.eof_reached():
			break
			
		var colums=line.split(":")
		for node in element_nodes:
			var element_number=int(node.name.substr(0,3))
			if element_number==int(colums[NUMERO]):
				node.set_numero(colums[NUMERO])
				node.set_merkki(colums[MERKKI])
				node.set_nimi(colums[NIMI])
				node.set_massa(colums[MASSA])
				node.set_tyyppi(colums[TYYPPI])
				break
	file.close()
	print("file closed")


func _on_alkuaine_pressed(alkuaine_nimi, alkuaine_merkki, alkuaine_numero, alkuaine_massa):
	get_node("Label_nimi").text=alkuaine_nimi
	get_node("Label_merkki").text=alkuaine_merkki
	get_node("Label_numero").text=str(alkuaine_numero)
	get_node("Label_massa").text=str(alkuaine_massa)

func _on_alkuaine_mouse_over(signal_numero):
	var alkuaineet = get_tree().get_nodes_in_group("elements")
	for alkuaine in alkuaineet:
		if alkuaine.numero == signal_numero:
			alkuaine.set_color(alkuaine.default_color.lightened(0.5))
		else:
			alkuaine.set_color(alkuaine.default_color)


func _on_CheckBox_toggled(button_pressed):
	var taulukko = get_node("alkuaineet_taulukko")
	var iso=Vector2(1.0, 1.0)
	var pieni=Vector2(0.5,0.5)
	if button_pressed:
		taulukko.set_scale(pieni)
	else:
		taulukko.set_scale(iso)
