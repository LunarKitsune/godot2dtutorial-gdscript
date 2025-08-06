extends Node2D

func play_animation(animationName:String = "default",
 queueAnimation:bool = false, queuedAnimation:String = "default"):
	
	%EntityAnimationPlayer.play(animationName)
	if(queueAnimation):
		%EntityAnimationPlayer.queue(queuedAnimation)


func stop_animation():
	%EntityAnimationPlayer.stop()
