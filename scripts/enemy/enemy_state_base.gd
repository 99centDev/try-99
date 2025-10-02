class_name EnemyStateBase
extends StateBase

var animated_sprite: AnimatedSprite2D

var enemy: CharacterBody2D:
	set(value):
		controlled_node = value
	get:
		return controlled_node

func start():
	super()
	animated_sprite = enemy.get_node("AnimatedSprite2D")

func update_animation(state: String) -> void:
	# For now, we don't have enemy animations, so we'll just pass.
	pass
