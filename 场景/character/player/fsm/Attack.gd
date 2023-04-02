extends BaseState

@onready
var aniPlayer: AnimationPlayer = $"../../AnimationPlayer"
@onready
var aniSprite: AnimatedSprite2D = $"../../AnimatedSprite2D"

var attack_index = 0

func enter():
	$Timer.stop()
	if attack_index == 0:
		aniPlayer.play("attack1")
	elif attack_index == 1:
		aniPlayer.play("attack2")
	else:
		aniPlayer.play("attack3")

func exit():
	aniPlayer.stop()

func attack_check():
	var check = []
	if attack_index == 0:
		check = ($"../../AttackCheck/A1" as Area2D).get_overlapping_bodies()
	elif attack_index == 1:
		check = ($"../../AttackCheck/A2" as Area2D).get_overlapping_bodies()
	else:
		check = ($"../../AttackCheck/A3" as Area2D).get_overlapping_bodies()
	for i in check:
		if i.is_in_group("monster"):
			i.take_hit(10)


func _on_timer_timeout():
	attack_index = 0


func _on_animated_sprite_2d_animation_finished():
	if aniSprite.animation.left(6) == "attack":
		attack_index += 1
		if attack_index == 3:
			attack_index = 0
		$Timer.start(0.5)
		get_parent().change_state("Idle")
