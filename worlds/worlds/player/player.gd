extends CharacterBody2D
@onready var Jump_buffer: Timer = $Jump_buffer
@onready var dash: Node2D = $Dash
@onready var airjump: Node2D = $Airjump

const NORMAL_SPEED = 200.0
const JUMP_VELOCITY = -440.0
const JUMP_BREAK = 0.6
const JUMP_SLOWDOWN = 0.9
const DASH_SPEED = 700


var passed_frames = 0
var buffered_jump
var speed
var latest_dir
var dash_dir
var double_jump


func _ready():
	latest_dir = 1


func _physics_process(delta: float) -> void:
	var dashing = dash.is_dashing()
	buffered_jump = not Jump_buffer.is_stopped()
	var can_jump = true if (is_on_floor() and not is_on_ceiling()) else false
	var can_doublejump = true if not (is_on_floor() or is_on_ceiling()) else false
	var moving = true if Input.is_action_pressed("any_movement") else false 
	var direction = Input.get_axis("ui_left", "ui_right") if moving else 0.0
	var gravity = get_gravity() * delta
	
	if not (dashing or is_on_floor()):
		if velocity.y < 0:
			velocity += gravity * JUMP_SLOWDOWN
		else:
			velocity += gravity
		
		if Input.is_action_just_released("ui_accept") and velocity.y < 0:
			velocity.y *= JUMP_BREAK
		
	elif is_on_floor():
		double_jump = true
		dash.reset_cooldown()
	

	if (Input.is_action_just_pressed("ui_accept") or buffered_jump):
		dash.stop_dash() 
		if can_jump:
			normal_jump()
		elif can_doublejump and double_jump:
			#print("hop")
			normal_jump()
			double_jump = false
	
	if direction == 0 and moving:
		direction = latest_dir
	
	if Input.is_action_just_pressed("dash"):
		dash.start_dash(.2)
		dash_dir = latest_dir
	
	
	if dashing:
		velocity.y = 0
		velocity.x = dash_dir * DASH_SPEED
	elif direction:
		velocity.x = direction * NORMAL_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, NORMAL_SPEED)
	
	move_and_slide()
	global_position.x = round(global_position.x)
	global_position.y = round(global_position.y)
	latest_dir = direction if moving else latest_dir

func normal_jump():
	velocity.y = JUMP_VELOCITY


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		latest_dir = -1
	elif event.is_action_pressed("ui_right"):
		latest_dir = 1
	
	if event.is_action_pressed("ui_accept"):
		if Jump_buffer.is_stopped() and not is_on_floor():
			Jump_buffer.start()
			#print("hop")
