extends BaseState

@onready
var player: CharacterBody2D = $"../.."
@onready
var aniPlayer: AnimationPlayer = $"../../AnimationPlayer"

const JUMP_VELOCITY = -400.0

func enter():
	aniPlayer.play("idle")

func do():
	if !player.is_on_floor():
		get_parent().change_state("Fall")
	var vec: Vector2 = Vector2.ZERO
	vec.x = Input.get_axis("ui_left","ui_right")
	if vec.x != 0:
		get_parent().change_state("Run")
		return
	elif Input.is_action_just_released("Jump"):
		get_parent().change_state("Jump")
		return
	elif Input.is_action_just_released("Attack"):
		get_parent().change_state("Attack")
		return
	player.velocity = Vector2(0,1)
	player.move_and_slide()
