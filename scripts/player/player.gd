class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var dash_duration: Timer = $dash_duration
@onready var dash_cooldown: Timer = $dash_cooldown
@onready var attack_duration: Timer = $attack_duration
@onready var attack_area: Area2D = $AttackArea
@onready var attack_area_shape: CollisionShape2D = $AttackArea/CollisionShape2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export var speed = 100
@export var dash_speed = 250
@export var dash_duration_time = 0.14
@export var dash_cooldown_time = 0.6
@export var attack_duration_time = 0.2
@export var knockback_strength = 0

var last_direction := "down"
