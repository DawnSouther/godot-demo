extends BaseState

@onready
var archer = $"../.."
var attack = false

func enter():
	if !attack:
		attack = true
		$"../../AnimationPlayer".play("attack")
	
func exit():
	attack = false
	
func arrow_check():
	if $"../../AnimatedSprite2D".animation == "attack":
		var arrow = preload("res://场景/character/archer/arrow/arrow.tscn").instantiate()
		
		if archer.direct == Vector2.LEFT:
			arrow.position = $"../../L".global_position
		else:
			arrow.position = $"../../R".global_position
		arrow.vec_x = archer.direct.x
		get_parent().add_child(arrow)


func _on_animated_sprite_2d_animation_finished():
	if $"../../AnimatedSprite2D".animation == "attack":
		get_parent().change_state("Run")

