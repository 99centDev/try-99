class_name EnemyStateHurt
extends EnemyStateBase

func start():
	super()
	update_animation("hurt")
	enemy.velocity = Vector2.ZERO
	enemy.hurt_timer.start(0.15)

func _on_hurt_timer_timeout():
	state_machine.change_to("Idle")

func end():
	pass
