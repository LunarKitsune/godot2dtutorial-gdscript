extends Node2D

var GDRand:RandomNumberGenerator

@export var game_over_scene:PackedScene

func _ready():
	$GameOver.visible=true
	pass


func Spawn_Mobs():
	pass
	
	
func On_Player_Deleted(Target:Node)->void:
	if(Target.is_in_group("CharacterPlayables")):
		$GameOver.global_position = $PlayerHappyBoo.global_position
		$GameOver.visible = false
	pass
