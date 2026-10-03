extends Node2D
@onready var tml_past: TileMapLayer = $tml_past
@onready var tml_present: TileMapLayer = $tml_present

const PLAYER_SCENE = preload("res://worlds/player/player.tscn")
var player: Node2D

var locked = false
var locked_timer = 0
var start_pos = Vector2i(301,244)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = PLAYER_SCENE.instantiate()
	player.global_position = start_pos
	add_child(player)
	tml_past.enabled = true
	tml_present.enabled = false


func _input(event: InputEvent) -> void:
	pass
	#if Input.is_action_pressed("interact_e") and not locked:
	#	locked = true
	#	tml_past.enabled = tml_present.enabled
	#	tml_present.enabled = not tml_past.enabled


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if locked:
		locked_timer += 1
	if locked_timer == 60:
		locked = false
		locked_timer = 0


func death_bottom(body: Node2D) -> void:
	player.velocity.y = 0
	#print("Entered node")
	player.global_position = start_pos
	#print(player.global_position)
	pass # Replace with function body.
