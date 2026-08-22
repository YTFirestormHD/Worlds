class_name BounceTile_test
extends InteractiveTile_test


@export var bounce_force: float = 300.0


func interact(player: CharacterBody2D) -> void:
	player.velocity.y = (-bounce_force*2)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
