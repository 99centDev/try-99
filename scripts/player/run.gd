extends PlayerStateBase

func on_physics_process(delta: float) -> void:
	var input_direction = get_direction_input()
	player.velocity = input_direction * 100
	update_animation("run")
	player.move_and_slide()
			
func on_input(event):
	var input_direction = get_direction_input()
	if input_direction == Vector2.ZERO:
		state_machine.change_to("Idle")
