extends TileMap

signal victory
signal failed

const INIT_POSITION = Vector2(575, 248)

@onready
var player: CharacterBody2D = $player

func _on_area_2d_body_entered(body:Node2D):
	if body == player:
		player.position = INIT_POSITION


func _on_player_death():
	emit_signal("failed")
	queue_free()


func _on_left_entry_body_entered(body:Node2D):
	if body == player:
		player.position = INIT_POSITION