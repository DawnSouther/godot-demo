extends BaseState

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready
var player = $"../../AnimationPlayer"
@onready
var archer = $"../.."

func enter():
	player.play("run")

func do():
	if !is_instance_valid($"../../RightDownCast".get_collider()):
		archer.direct = Vector2.LEFT
		$"../../AnimatedSprite2D".flip_h = true
	elif !is_instance_valid($"../../LeftDownCast".get_collider()):
		archer.direct = Vector2.RIGHT
		$"../../AnimatedSprite2D".flip_h = false
	if (is_instance_valid($"../../LeftAttachCheck".get_collider()) 
		|| is_instance_valid($"../../RightAttachCheck".get_collider())):
		get_parent().change_state("Attack")
		return
	archer.velocity = archer.direct * SPEED
	archer.velocity.y = gravity
	archer.move_and_slide()
