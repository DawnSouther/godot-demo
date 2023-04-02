extends TextureRect

signal start

func victory():
	show()
	$CenterContainer/VBoxContainer/Label.text = "赢了！！！"

func failed():
	show()
	$CenterContainer/VBoxContainer/Label.text = "输了！！！"

func _on_button_pressed():
	hide()
	emit_signal("start")


func _on_button_2_pressed():
	get_tree().exit()
