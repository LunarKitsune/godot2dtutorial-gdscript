extends Node2D

func play_animation(animationName:String = "default", queueAnimation:bool = false, queuedAnimation = "default"):
	%AnimationPlayer.play(animationName)
	if(queueAnimation):
		%AnimationPlayer.queue(queueAnimation)
		
func stop_animation():
	%AnimationPlayer.stop()
	
func resume_current_animation():
	%AnimationPlayer.play(%AnimationPlayer.current_animation)
