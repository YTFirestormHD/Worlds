extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for limit in get_tree().get_nodes_in_group("cam_limit"):
		if limit as CollisionShape2D:
			print("grrr")
			var border = limit.shape as RectangleShape2D
			var half = border.size/2
			var center = limit.global_position
		
			limit_left = int(center.x - half.x)
			limit_right = int(center.x + half.x)
			limit_top = int(center.y - half.x)
			limit_bottom = int(center.y + half.x)
			
			print(CameraAttributes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
