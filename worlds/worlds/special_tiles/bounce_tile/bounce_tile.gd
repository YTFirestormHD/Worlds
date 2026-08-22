class_name BounceTile
extends InteractiveTile



@export var bounce_force: float = 450.0

@onready var collision_shape: CollisionShape2D = $StaticBody2D/CollisionShape2D


func interact(player: CharacterBody2D) -> void:
	

	player.velocity.y = (-bounce_force) #change player velocity to move upward
	
	$AnimatedSprite2D.play("bounce")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	
	$AnimatedSprite2D.frame = 0

func _on_animated_sprite_2d_frame_changed() -> void:
	
	match $AnimatedSprite2D.frame:
		0:
			collision_shape.shape.size.y = 16
			collision_shape.position.y = 0
		1:
			collision_shape.shape.size.y = 22
			collision_shape.position.y = -3
		2:
			collision_shape.shape.size.y = 24
			collision_shape.position.y = -4
		3:
			collision_shape.shape.size.y = 22
			collision_shape.position.y = -3
		4:
			collision_shape.shape.size.y = 20
			collision_shape.position.y = -2
		5:
			collision_shape.shape.size.y = 17
			collision_shape.position.y = -0.5
