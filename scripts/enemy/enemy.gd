class_name Enemy
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var hurt_timer: Timer = $HurtTimer
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D

func _ready():
	hurt_timer.timeout.connect(_on_hurt_timer_timeout)

func _on_hurtbox_area_entered(area):
	state_machine.change_to("Hurt")

func _on_hurt_timer_timeout():
	if state_machine.current_state.name == "Hurt":
		state_machine.current_state._on_hurt_timer_timeout()
