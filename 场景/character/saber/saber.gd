extends CharacterBody2D

var health = 30

func _ready():
	add_to_group("monster")

func take_hit(value: int):
	health = health - value
	$FSM.change_state(2)
