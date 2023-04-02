extends CharacterBody2D

var health = 30
var direct: Vector2 = Vector2.RIGHT

func _ready():
	add_to_group("monster")

func take_hit(value: int):
	health = health - value
	$FSM.change_state("TakeHit")