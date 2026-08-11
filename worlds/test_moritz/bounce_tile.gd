class_name BounceTile
extends InteractiveTile


@export var bounce_force: float = 300.0


func interact(player: CharacterBody2D) -> void:
	player.velocity.y = -bounce_force


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
