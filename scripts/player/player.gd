class_name Player
extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var dash_duration: Timer = $dash_duration
@onready var dash_cooldown: Timer = $dash_cooldown

@export var speed = 100
@export var dash_speed = 250
@export var dash_duration_time = 0.18
@export var dash_cooldown_time = 0.6  

var last_direction := "down"  
