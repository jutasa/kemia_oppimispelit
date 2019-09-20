extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var kysytty_jakso =randi() % 7+1
	var kysytty_ryhma
	if kysytty_jakso<2:
		kysytty_ryhma=1+17*(randi() % 2)
	elif kysytty_jakso<4:
		kysytty_ryhma=randi()%8+1
		if kysytty_ryhma>2:
			kysytty_ryhma += 10
	else:
		kysytty_ryhma=randi() % 18+1
	var node_kysymys = get_node("../teksti_kysymys")
	node_kysymys.text="ryhmässä "+str(kysytty_ryhma)+" ja jaksossa "+str(kysytty_jakso)
	
	var node_jarjestelma=get_node("../jaksollinen_jarjestelma")
	node_jarjestelma.kysytty_ryhma=kysytty_ryhma
	node_jarjestelma.kysytty_jakso=kysytty_jakso