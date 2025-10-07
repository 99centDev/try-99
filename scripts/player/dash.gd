extends PlayerStateBase

func start() -> void:
	super()
	player.collision_shape.disabled = true
	# TODO: Add a dash animation and sound
	# animated_sprite.play("dash_" + last_direction)
	
	var dash_vector = get_direction_input()
	if dash_vector == Vector2.ZERO:
		dash_vector = get_last_direction_vector()
	
	player.velocity = dash_vector.normalized() * player.dash_speed
	player.dash_duration.start(player.dash_duration_time)
	player.move_and_slide()

func end() -> void:
	player.collision_shape.disabled = false


func on_physics_process(_delta: float) -> void:
	player.move_and_slide()
	
	if player.dash_duration.is_stopped():
		player.velocity = Vector2.ZERO
		player.dash_cooldown.start(player.dash_cooldown_time)
		
		var input_direction = get_direction_input()
		if input_direction != Vector2.ZERO:
			state_machine.change_to("Run")
		else:
			state_machine.change_to("Idle")

func on_input(_event: InputEvent) -> void:
	pass
