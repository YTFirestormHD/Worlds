class_name RemoteMoveTile
extends InteractiveTile


func interact(player: CharacterBody2D) -> void:
	#print(player.global_position.distance_to(self.global_position))
	await Input.is_action_just_pressed("dash")
	print("test")
	#while player.global_position.distance_to(self.global_position) < 20:	
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
