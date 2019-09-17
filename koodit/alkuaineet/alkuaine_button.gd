extends Button

var alkuaine

func _ready():
	alkuaine=get_parent()
	pass # Replace with function body.

func _process(delta):
	if is_hovered():
		alkuaine.laheta_signaali_mouse_over()

func _pressed():
	alkuaine.laheta_signaali_pressed()
	
