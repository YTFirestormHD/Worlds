extends Node2D
@onready var timer: Timer = $dash_duration
@onready var cooldown: Timer = $dash_cd



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func start_dash(duration):
	if not on_cooldown():
		timer.start(duration)

func start_cooldown():
	cooldown.start(0.75)

func is_dashing():
	return !timer.is_stopped()

func on_cooldown():
	return !cooldown.is_stopped()
