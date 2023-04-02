extends BaseState

func enter():
	if $Timer.is_stopped():
		$"../../AnimationPlayer".play("attack1")
	else:
		$"../../AnimationPlayer".play("attack2")
	
func attack1_check():
	for i in $"../../AttackCheck/A1".get_overlapping_bodies():
		if i.is_in_group("player"):
			i.take_hit(10)

func attack2l_check():
	for i in $"../../AttackCheck/A2l".get_overlapping_bodies():
		if i.is_in_group("player"):
			i.take_hit(10)

func attack2r_check():
	for i in $"../../AttackCheck/A2r".get_overlapping_bodies():
		if i.is_in_group("player"):
			i.take_hit(10)


func _on_animated_sprite_2d_animation_finished():
	if $"../../AnimatedSprite2D".animation == "attack1":
		$Timer.start(0.25)
	if $"../../AnimatedSprite2D".animation == "attack1" || $"../../AnimatedSprite2D".animation == "attack2":
		get_parent().change_state("Run")
