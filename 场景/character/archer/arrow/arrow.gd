extends Area2D

var vec_x = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if vec_x < 0:
		scale.x = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	position.x += vec_x
	attack_check()

func attack_check():
	var arr = $".".get_overlapping_bodies()
	for i in arr:
		if i.is_in_group("player"):
			i.take_hit(10)
			queue_free()
	


func _on_timer_timeout():
	queue_free()
