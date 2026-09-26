extends Node

var play_tmls = []
var current_tml
enum used_tmls {tml_past,tml_present,tml_future}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_tml = "tml_present"
	#current_tml = used_tmls["tml_present"]
	play_tmls = get_tree().get_nodes_in_group("play_tmls")
	print(play_tmls)
	update_tml()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_tml():
	for i in play_tmls:
		if i.name == current_tml:
			i.enabled = true
		else:
			i.enabled = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact_e"):
		match current_tml:
			"tml_present":
				current_tml = "tml_future"
			"tml_future":
				current_tml = "tml_past"
			"tml_past":
				current_tml = "tml_present"
	if event.is_action_pressed("interact_q"):
		match current_tml:
			"tml_present":
				current_tml = "tml_past"
			"tml_future":
				current_tml = "tml_present"
			"tml_past":
				current_tml = "tml_future"
	update_tml()
