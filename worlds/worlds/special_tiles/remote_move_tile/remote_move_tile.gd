extends CollisionShape2D


func interact(player: CharacterBody2D) -> void:
	print("hiiii")
	while player.global_position.distance_to(self.global_position):
		print("so true")
	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
