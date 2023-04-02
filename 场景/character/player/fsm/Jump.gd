extends BaseState

@onready
var player: CharacterBody2D = $"../.."
@onready
var aniPlayer: AnimationPlayer = $"../../AnimationPlayer"
@onready
var aniSprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready
var attackCheck: Node2D = $"../../AttackCheck"

const SPEED = 200.0
const JUMP_SPEED = -200
var isJumping = false

func enter():
	aniPlayer.play("jump")
	isJumping = true
	player.velocity.y = JUMP_SPEED

func do():
	if isJumping:
		if player.velocity.y > 0:
			get_parent().change_state("Fall")
			return
	var vec: Vector2 = Vector2.ZERO
	vec.x = Input.get_axis("ui_left","ui_right")
	player.velocity.x = vec.x * SPEED
	player.velocity.y += 4
	player.move_and_slide()

func exit():
	isJumping = false
	player.velocity.y = 0
