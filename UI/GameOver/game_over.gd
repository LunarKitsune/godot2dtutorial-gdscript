extends CanvasLayer

signal Throw_Death_Message(message:String)

func Build_Death_Message(PlayerKiller:String) -> void:
	var death_msg:String = "Player died to: {str}"
	death_msg.format("str", PlayerKiller)
	$Control/DeathDescript.text = death_msg
