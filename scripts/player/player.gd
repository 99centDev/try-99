class_name Player
extends CharacterBody2D

@onready var animated_strite: AnimatedSprite2D = $AnimatedStrite
@onready var dash_duration: Timer = $dash_duration
@onready var dash_cooldown: Timer = $dash_cooldown

@export var speed = 100
@export var dash_speed = 250
@export var dash_duration_time = 0.25  
@export var dash_cooldown_time = 0.6  

var last_direction = "down"
var is_dashing = false
var can_dash = true
var dash_direction = Vector2.ZERO

func _ready() -> void:
	dash_duration.wait_time = dash_duration_time
	dash_duration.one_shot = true
	dash_duration.timeout.connect(_on_dash_duration_timeout)

	dash_cooldown.wait_time = dash_cooldown_time
	dash_cooldown.one_shot = true
	dash_cooldown.timeout.connect(_on_dash_cooldown_timeout)

func get_movement_direction() -> Vector2:
	var input_direction := Input.get_vector("left", "right", "up", "down")
	if input_direction != Vector2.ZERO:
		if abs(input_direction.x) > abs(input_direction.y):
			last_direction = "right" if input_direction.x > 0 else "left"
		else:
			last_direction = "down" if input_direction.y > 0 else "up"
	return input_direction
	
func get_last_direction_vector() -> Vector2:
	match last_direction:
		"up": return Vector2.UP
		"down": return Vector2.DOWN
		"left": return Vector2.LEFT
		"right": return Vector2.RIGHT
	return Vector2.ZERO

func update_animation(state: String) -> void:
	animated_strite.play(state + "_" + last_direction)

func _on_dash_duration_timeout() -> void:
	is_dashing = false
	velocity = Vector2.ZERO
	dash_cooldown.start()

func _on_dash_cooldown_timeout() -> void:
	can_dash = true
