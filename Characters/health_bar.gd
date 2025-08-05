extends Node2D

signal On_Health_Change(current_hp:int)
signal On_Health_initialization(hp:int, maxh_p:int)

func _ready():
	pass
	

func Update_Health_Bar(current_hp:int):
	$ProgressBar.value = current_hp
	
func Initialize_Progress_Bar_Stats(hp:int,max_hp:int):
	$ProgressBar.max_value = max_hp
	$ProgressBar.value = hp
	#$ProgressBar.modulate = Color(.009,.074,0.00,1.00)
