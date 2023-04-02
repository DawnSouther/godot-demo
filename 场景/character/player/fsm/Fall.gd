extends BaseState

@onready
var player: CharacterBody2D = $"../.."
@onready
var aniPlayer: AnimationPlayer = $"../../AnimationPlayer"

const SPEED = 200

func enter():
	aniPlayer.play("fall")

func do():
	if player.is_on_floor():
		get_parent().change_state("Idle")
		return
	var vec: Vector2 = Vector2.ZERO
	vec.x = Input.get_axis("ui_left","ui_right")
	player.velocity.x = vec.x * SPEED
	player.velocity.y += 2
	player.move_and_slide()
