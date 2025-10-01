extends PlayerStateBase

const ATTACK_OFFSET = 10

func start() -> void:
	super()
	player.velocity = Vector2.ZERO
	update_animation("attack")
	player.attack_duration.start(player.attack_duration_time)
	
	match player.last_direction:
		"up":
			player.attack_area.position = Vector2(0, -ATTACK_OFFSET)
		"down":
			player.attack_area.position = Vector2(0, ATTACK_OFFSET)
		"left":
			player.attack_area.position = Vector2(-ATTACK_OFFSET, 0)
		"right":
			player.attack_area.position = Vector2(ATTACK_OFFSET, 0)
	
	player.attack_area_shape.disabled = false

func end() -> void:
	player.attack_area.position = Vector2.ZERO
	player.attack_area_shape.disabled = true

func on_physics_process(delta: float) -> void:
	if player.attack_duration.is_stopped():
		var input_direction = get_direction_input()
		if input_direction != Vector2.ZERO:
			state_machine.change_to("Run")
		else:
			state_machine.change_to("Idle")
	
func on_input(event):
	pass
