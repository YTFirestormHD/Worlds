class_name BounceTile
extends InteractiveTile



@export var bounce_force: float = 500.0

@onready var collision_shape: CollisionShape2D = $StaticBody2D/CollisionShape2D


func interact(player: CharacterBody2D) -> void:
	

	player.velocity.y = (-bounce_force) #change player velocity to move upward
	
	$AnimatedSprite2D.play("bounce")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#usually, resources are shaped by instances of a scene
	#this means, that if the collision shape of one tile is changed,
	#the  collision shapes of all tiles will be changed
	#to prevent this we need to duplicate the collision shape
	collision_shape.shape = collision_shape.shape.duplicate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	
	#return to default texture after playing animation
	$AnimatedSprite2D.frame = 0

func _on_animated_sprite_2d_frame_changed() -> void:
	
	#while playing the animation, the collision shape needs to take different sizes
	#according to the current frame
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
