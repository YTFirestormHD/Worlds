extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	#print("soon dead")
	body.velocity = Vector2i(0,0)
	body.global_position = GLOBAL.latest_safe_pos
	#print("dead")
