extends Label

var text_font
var default_font_size
var default_text_width=70.0

# Called when the node enters the scene tree for the first time.
func _ready():
	text_font=get_font("font")
	default_font_size=text_font.size


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_text(value):
	var new_text=str(value)
	text_font.size=default_font_size
	while (text_font.get_string_size(new_text)[0]>default_text_width):
		#print("shrinking text")
		text_font.size-=1
	text=new_text
	#print(text_font.size)