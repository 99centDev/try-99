class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var dash_duration: Timer = $dash_duration
@onready var dash_cooldown: Timer = $dash_cooldown

@export var speed = 100
@export var dash_speed = 250
@export var dash_duration_time = 0.25  
@export var dash_cooldown_time = 0.6  


var is_dashing = false
var can_dash = true
var dash_direction = Vector2.ZERO

func _ready() -> void:
	dash_duration.wait_time = dash_duration_time
	dash_duration.one_shot = true
	dash_duration.timeout.connect(_on_dash_duration_timeout)

	dash_cooldown.wait_time = dash_cooldown_time
	dash_cooldown.one_shot = true
	dash_cooldown.timeout.connect(_on_dash_cooldown_timeout)



func _on_dash_duration_timeout() -> void:
	is_dashing = false
	velocity = Vector2.ZERO
	dash_cooldown.start()

func _on_dash_cooldown_timeout() -> void:
	can_dash = true
