extends PlayerStateBase

func on_physics_process(delta: float) -> void:
	player.velocity = Vector2.ZERO
	update_animation("idle")
	player.move_and_slide()
	
func on_input(event):
	if Input.is_action_just_pressed("dash") and player.dash_cooldown.is_stopped():
		state_machine.change_to("Dash")
		return
		
	var input_direction = get_direction_input()
	if input_direction != Vector2.ZERO:
		state_machine.change_to("Run")
