extends Node2D

func play_animation(animationName:String = "default", queueAnimation:bool = false, queuedAnimation = "default"):
	%EntityAnimationPlayer.play(animationName)
	if(queueAnimation):
		%EntityAnimationPlayer.queue(queueAnimation)
		
func stop_animation():
	%EntityAnimationPlayer.stop()
	
func resume_current_animation():
	%EntityAnimationPlayer.play(%EntityAnimationPlayer.current_animation)
