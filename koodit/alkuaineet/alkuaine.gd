extends Sprite

var nimi=""
var merkki=""
var numero=-1
var massa=0.0

var texture_path='res://kuvat/alkuaineet/'
var extension='.png'


# Called when the node enters the scene tree for the first time.
func _ready():
	#lisää elements ryhmään
	#add_to_group("elements")
	#kuvan lataus
	var element=name
	#print(texture_path+element+extension)
	var element_texture=load(texture_path+element+extension)
	texture=element_texture



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
