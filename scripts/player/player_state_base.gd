class_name PlayerStateBase 
extends StateBase

var animated_sprite: AnimatedSprite2D

var last_direction := "down"
@export var speed = 100

var player: CharacterBody2D:
	set(value):
		controlled_node = value
	get:
		return controlled_node

func start():
	super()
	animated_sprite = player.get_node("AnimatedSprite")


func get_direction_input() -> Vector2:
	var input_direction := Input.get_vector("left", "right", "up", "down")
	if input_direction != Vector2.ZERO:
		if abs(input_direction.x) > abs(input_direction.y):
			last_direction = "right" if input_direction.x > 0 else "left"
		else:
			last_direction = "down" if input_direction.y > 0 else "up"
	return input_direction

func update_animation(state: String) -> void:
	animated_sprite.play(state + "_" + last_direction)

func get_last_direction_vector() -> Vector2:
	match last_direction:
		"up": return Vector2.UP
		"down": return Vector2.DOWN
		"left": return Vector2.LEFT
		"right": return Vector2.RIGHT
	return Vector2.ZERO
