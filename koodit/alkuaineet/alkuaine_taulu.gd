extends Node2D

signal alkuaine_pressed(alkuaine_nimi,alkuaine_merkki,alkuaine_numero,alkuaine_massa,alkuaine_ryhma,alkuaine_jakso)
signal alkuaine_mouse_over(alkuaine_numero)

const COLOR_EPAMETALLI=Color(255/255.0,246/255.0,164/255.0)
const COLOR_METALLI=Color(163/255.0,210/255.0,255/255.0)
const COLOR_PUOLIMETALLI=Color(180/255.0,255/255.0,160/255.0)
const COLOR_JALOKAASU=Color(255/255.0,180/255.0,160/255.0)
const COLOR_GREY=Color(0.5,0.5,0.5)
const METALLI="m"
const EPAMETALLI="em"
const PUOLIMETALLI="pm"
const JALOKAASU="j"

var default_color=Color(0.7,0.7,0.7)
var merkki =""
var nimi =""
var numero=-1
var massa=0.0
var tyyppi = null
var jakso=-1
var ryhma=-1

func _ready():
	add_to_group("elements")
	connect("alkuaine_pressed",get_node("../.."),"_on_alkuaine_pressed")
	connect("alkuaine_mouse_over",get_node("../.."),"_on_alkuaine_mouse_over")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#setters
func set_merkki(value):
	merkki=str(value)
	get_node("merkki").set_text(merkki)

func set_nimi(value):
	nimi=str(value)
	get_node("nimi").set_text(nimi)

func set_numero(value):
	numero=int(value)
	get_node("numero").set_text(numero)

func set_massa(value):
	massa=float(value)
	get_node("massa").set_text(massa)

func set_jakso(value):
	jakso=int(value)

func set_ryhma(value):
	ryhma=int(value)


func set_tyyppi(value):
	tyyppi=value
	if value==METALLI:
		default_color=COLOR_METALLI
	elif value==EPAMETALLI:
		default_color=COLOR_EPAMETALLI
	elif value==PUOLIMETALLI:
		default_color=COLOR_PUOLIMETALLI
	elif value==JALOKAASU:
		default_color=COLOR_JALOKAASU
	else:
		default_color=COLOR_GREY
	set_color(default_color)

func set_color(new_color):
	get_node("tausta").color = new_color
	get_node("reuna").default_color = new_color.darkened(0.3)
	

#getters

func get_jakso():
	return jakso

func get_ryhma():
	return ryhma

func laheta_signaali_pressed():
	emit_signal("alkuaine_pressed",nimi,merkki,numero,massa,ryhma,jakso)

func laheta_signaali_mouse_over():
	emit_signal("alkuaine_mouse_over",numero)