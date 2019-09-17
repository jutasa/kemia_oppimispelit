extends LineEdit

var teksti_naytto

func _ready():
	teksti_naytto = get_node("../teksti_naytto")
	connect("text_entered",self,"_on_text_entered")
	

# warning-ignore:unused_argument
func _on_text_entered(new_text):
	teksti_naytto.text("tuli")