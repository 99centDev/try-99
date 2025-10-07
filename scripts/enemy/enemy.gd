class_name Enemy
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var hurt_timer: Timer = $HurtTimer
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D

@export var knockback_speed = 120

var knockback_direction = Vector2.ZERO

func _ready():
	hurt_timer.timeout.connect(_on_hurt_timer_timeout)

func _on_hurtbox_area_entered(area):
	state_machine.change_to("Hurt")
	var player = area.get_owner()
	knockback_direction = (global_position - player.global_position).normalized()

func _physics_process(delta):
	if state_machine.current_state and state_machine.current_state.name == "Hurt":
		velocity = knockback_direction * knockback_speed
		move_and_slide()

func _on_hurt_timer_timeout():
	if state_machine.current_state and state_machine.current_state.name == "Hurt":
		state_machine.current_state._on_hurt_timer_timeout()
