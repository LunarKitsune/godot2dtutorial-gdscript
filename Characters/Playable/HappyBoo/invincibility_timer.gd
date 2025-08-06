extends Timer

signal activate_timer

func _ready():
	wait_time = 2.5
	autostart = false
	one_shot = true

func Play_Timer() ->void:
	start()
