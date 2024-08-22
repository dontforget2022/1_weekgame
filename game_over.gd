extends Control
func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		Transition.load_scene("res://scenes/room.tscn")
	$CenterContainer/VBoxContainer/Label2.text = "Score:" + str(GlobalData.score)	
