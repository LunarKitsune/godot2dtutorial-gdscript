extends CharacterBody2D

@export var hp:int
@export var max_hp:int
@export var speed:float

var invincibility_on:bool = false
const invincibilityRate:float = 5.0

func _ready():
	hp = 30
	max_hp =30
	speed = 300
	$HealthManager.emit_signal("On_Health_initialization",hp,max_hp)
	
	


func _process(delta):
	
	if(velocity.length() > 0 || velocity.length() < 0):
		$HappyBoo.play_animation("walk")
	else:
		$HappyBoo.play_animation("idle")
		
	if($InvincibilityTimer.is_stopped()):
		invincibility_on = false


func _physics_process(delta):
	velocity = Get_Input()
	move_and_slide()


func Get_Input() -> Vector2:
	var inputDirection: Vector2 = Input.get_vector("p_move_left","p_move_right","p_move_up","p_move_down")
	return inputDirection * speed


func Take_Damage(damageTaken:int) ->void:
	if not invincibility_on:
		hp -= damageTaken
		$HealthManager.emit_signal("On_Health_Change", hp)
		$InvincibilityTimer.emit_signal("activate_timer")
		invincibility_on = true
		if(hp <= 0):
			visible = false
			process_mode = Node.PROCESS_MODE_DISABLED
			


func On_Weapon_Pickup() -> void:
	pass
