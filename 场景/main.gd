extends Node

func _on_title_start():
	var res = preload("res://场景/map/map.tscn").instantiate()
	res.connect("victory", Callable($title, "victory"))
	res.connect("failed", Callable($title, "failed"))
	add_child(res)
