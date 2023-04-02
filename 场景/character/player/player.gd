class_name Player
extends CharacterBody2D

@export
var health = 100

signal death

func _ready():
	add_to_group("player")
	$CanvasLayer/TextureProgressBar.max_value = health

func take_hit(value: int):
	health = health - value
	$CanvasLayer/TextureProgressBar.value = health
	$FSM.change_state("Take_hit")
