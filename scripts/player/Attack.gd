extends PlayerStateBase

const ATTACK_OFFSET = 10

func start() -> void:
	super()
	update_animation("attack")
	player.attack_duration.start(player.attack_duration_time)

	var knockback_direction = Vector2.ZERO
	match player.last_direction:
		"up":
			player.attack_area.position = Vector2(0, -ATTACK_OFFSET)
			player.attack_area_shape.rotation_degrees = 0
			knockback_direction = Vector2.UP
		"down":
			player.attack_area.position = Vector2(0, ATTACK_OFFSET)
			player.attack_area_shape.rotation_degrees = 0
			knockback_direction = Vector2.DOWN
		"left":
			player.attack_area.position = Vector2(-ATTACK_OFFSET, 0)
			player.attack_area_shape.rotation_degrees = 90
			knockback_direction = Vector2.LEFT
		"right":
			player.attack_area.position = Vector2(ATTACK_OFFSET, 0)
			player.attack_area_shape.rotation_degrees = 90
			knockback_direction = Vector2.RIGHT

	player.velocity = -knockback_direction * player.knockback_strength
	
	player.attack_area_shape.disabled = false

func end() -> void:
	player.attack_area.position = Vector2.ZERO
	player.attack_area_shape.rotation_degrees = 0
	player.attack_area_shape.disabled = true

func on_physics_process(delta: float) -> void:
	player.move_and_slide()

	if player.attack_duration.is_stopped():
		var input_direction = get_direction_input()
		if input_direction != Vector2.ZERO:
			state_machine.change_to("Run")
		else:
			state_machine.change_to("Idle")
	
func on_input(event):
	pass
