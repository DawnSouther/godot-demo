extends BaseState

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direct: Vector2 = Vector2.RIGHT

@onready
var player = $"../../AnimationPlayer"
@onready
var archer = $"../.."
@onready
var a1: Area2D = $"../../AttackCheck/A1"

func enter():
	player.play("run")

func do():
	if !is_instance_valid($"../../RightDownCast".get_collider()):
		direct = Vector2.LEFT
		$"../../AttackCheck".scale.x = -1
		$"../../AnimatedSprite2D".flip_h = true
	elif !is_instance_valid($"../../LeftDownCast".get_collider()):
		direct = Vector2.RIGHT
		$"../../AttackCheck".scale.x = 1
		$"../../AnimatedSprite2D".flip_h = false
	var arr = a1.get_overlapping_bodies()
	if arr.size() > 0:
		for i in arr:
			if i.is_in_group("player"):
				get_parent().change_state("Attack")
				return
	archer.velocity = direct * SPEED
	archer.velocity.y = gravity
	archer.move_and_slide()
