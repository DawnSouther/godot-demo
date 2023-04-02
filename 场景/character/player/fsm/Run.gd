extends BaseState

@onready
var player: CharacterBody2D = $"../.."
@onready
var aniPlayer: AnimationPlayer = $"../../AnimationPlayer"
@onready
var aniSprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready
var attackCheck: Node2D = $"../../AttackCheck"

const SPEED = 300.0

func enter():
	aniPlayer.play("run")

func do():
	if !player.is_on_floor():
		get_parent().change_state("Fall")
	elif Input.is_action_just_released("Jump"):
		get_parent().change_state("Jump")
		return
	elif Input.is_action_just_released("Attack"):
		get_parent().change_state("Attack")
		return
	var vec: Vector2 = Vector2.ZERO
	vec.x = Input.get_axis("ui_left","ui_right")
	if vec.x == 0:
		get_parent().change_state("Idle")
		return
	elif vec.x > 0:
		aniSprite.flip_h = false;
		attackCheck.scale.x = 1
	else:
		aniSprite.flip_h = true;
		attackCheck.scale.x = -1
	player.velocity = vec * SPEED
	player.move_and_slide()
