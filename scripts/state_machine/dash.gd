#class_name Dash
#extends PlayerState
#
#func enter() -> void:
	#player.is_dashing = true
	#player.can_dash = false
	#player.update_animation("run") # TODO: Animación de rodar
	#
	#var dash_direction = player.get_direction_input()
	#if dash_direction == Vector2.ZERO:
		#dash_direction = player.get_last_direction_vector()
	#
	#player.velocity = dash_direction.normalized() * player.dash_speed
	#player.dash_duration.start()
#
#func process_physics(delta: float) -> void:
	#pass
#
#func exit() -> void:
	#player.is_dashing = false
	#player.velocity = Vector2.ZERO
	#player.dash_cooldown.start()
