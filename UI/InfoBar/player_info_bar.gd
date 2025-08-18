extends CanvasLayer

signal Detect_HP_Change(damageTaken:int)
signal Set_HP_Bar(HPValue:int)

func _ready():
	Detect_HP_Change.connect(Update_HP_Diplay)
	Set_HP_Bar.connect(Set_HP_Display)

func Update_HP_Diplay(hpChange:int):
	$MarginContainer/HealthDisplayGui/Vertical_Organizer/Heath_Progress_Visual.value -= hpChange
	

func Set_HP_Display(HPInfo:int):
	$MarginContainer/HealthDisplayGui/Vertical_Organizer/Heath_Progress_Visual.max_value = HPInfo
