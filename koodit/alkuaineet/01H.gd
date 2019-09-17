extends Sprite

var texture_path='res://kuvat/alkuaineet/'
var extension='.png'


# Called when the node enters the scene tree for the first time.
func _ready():
	var element=name
	print(texture_path+element+extension)
	var element_texture=load(texture_path+element+extension)
	texture=element_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
