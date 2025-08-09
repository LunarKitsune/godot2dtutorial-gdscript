extends CanvasLayer

func _process(delta):
	#rememebr the button is T
	if Input.is_action_just_pressed("MenuToggleDebug"):
		if visible == true:
			visible= false
		else:
			visible = true
