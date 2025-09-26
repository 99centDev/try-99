extends PlayerStateBase

func on_physics_process(delta: float) -> void:
	player.velocity = Vector2.ZERO
	#update_animation("idle")
	player.move_and_slide()
	
func on_input(event):
	var input_direction = get_direction_input()
	if input_direction != Vector2.ZERO:
		state_machine.change_to("Run")
