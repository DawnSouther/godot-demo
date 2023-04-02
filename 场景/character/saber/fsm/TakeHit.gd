extends BaseState

@onready
var player: CharacterBody2D = $"../.."
@onready
var aniPlayer: AnimationPlayer = $"../../AnimationPlayer"
@onready
var aniSprite: AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter():
	if player.health > 0:
		aniPlayer.play("take_hit")
	else:
		aniPlayer.play("death")


func _on_animated_sprite_2d_animation_finished():
	if aniSprite.animation == "take_hit":
		get_parent().change_state("Run")
	if aniSprite.animation == "death":
		player.queue_free()
