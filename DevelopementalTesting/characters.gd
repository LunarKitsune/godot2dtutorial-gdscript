extends Node2D

func Turn_On_Game_Over():
	if !is_instance_valid($Characters/CharacterBody2D):
		$GameOver.visible = true
		$GameOver/Camera2D.enabled = true
		print("Hit")
