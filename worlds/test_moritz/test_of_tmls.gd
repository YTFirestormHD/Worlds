extends Node2D
@onready var tml_1: TileMapLayer = $TileMapLayer
@onready var tml_2: TileMapLayer = $TileMapLayer2

var locked = false
var locked_timer = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tml_1.visible = true
	tml_2.visible = false


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("interact_e") and not locked:
		locked = true
		if tml_1.visible == true:
			tml_1.visible = false
			tml_2.visible = true
			tml_1.collision_enabled = tml_1.visible
			tml_2.collision_enabled = tml_2.visible
		else:
			tml_1.visible = true
			tml_2.visible = false
			tml_1.collision_enabled = tml_1.visible
			tml_2.collision_enabled = tml_2.visible
		print("success")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if locked:
		locked_timer += 1
	if locked_timer == 60:
		locked = false
		locked_timer = 0
