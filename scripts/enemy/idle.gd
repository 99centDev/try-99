class_name EnemyStateIdle
extends EnemyStateBase

func start():
	super()
	update_animation("idle")

func on_physics_process(_delta):
	enemy.velocity = Vector2.ZERO
