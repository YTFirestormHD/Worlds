extends CharacterBody2D

const DASH = preload("uid://rjovi5t557ct")
const NORMAL_SPEED = 250.0
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 750


var passed_frames = 0
var buffered_jump
var speed
var dash
var latest_direction


func _ready():
	dash = DASH.instantiate()
	add_child(dash)
	latest_direction = 1


func _physics_process(delta: float) -> void:
	if buffered_jump:
		passed_frames += 1
	if passed_frames == 4:
		buffered_jump = false
		passed_frames = 0
	 
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if (buffered_jump or Input.is_action_pressed("ui_accept")) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("dash"):
		dash.start_dash(0.2)
		
	var direction := Input.get_axis("ui_left", "ui_right")
	var movement = true if Input.is_action_pressed("any_movement") else false
	
	if dash.is_dashing():
		speed = DASH_SPEED
		dash.start_cooldown()
		direction = latest_direction
	else:
		speed = NORMAL_SPEED
	
	if direction == 0 and latest_direction and movement:
		direction = latest_direction
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		latest_direction = -1.0
	elif event.is_action_pressed("ui_right"):
		latest_direction = 1.0
	
	if event.is_action("ui_accept"):
		buffered_jump = true
