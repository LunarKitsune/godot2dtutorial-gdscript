extends CharacterBody2D

@export var hp:int
@export var maxHp:int
@export var speed:float
@export var attack_power:int

## Player targets for slime to find
var targets: Array[Node2D]


func _ready():
	$HealthManager.emit_signal("On_Health_initialization",maxHp, hp)
	pass

func _process(delta):
	pass

func _physics_process(delta):
	Get_Target_Direction()
	
	if not $Slime/EntityAnimationPlayer.current_animation == "hurt":
		if(velocity.length() > 0 or velocity.length() < 0):
			$Slime.play_animation("walk")
		else:
			$Slime.play_animation("idle")
		
	move_and_slide()
	

func On_Target_Detected(target_body:Node2D):
	if target_body not in targets and target_body.is_in_group("CharacterPlayable"):
		targets.append(target_body)
	
func On_Target_Lost(target_body:Node2D):
	if target_body.is_in_group("CharacterPlayable"):
		targets.erase(target_body)

func Get_Closest_Target() -> Node2D:
	
	var targetEntity: Node2D
	var currentDistance: float
	var distanceFrom: float = 1000
	
	for target in targets:
		currentDistance = global_position.distance_to(target.position) < distanceFrom
		if currentDistance < distanceFrom:
			targetEntity = target
			distanceFrom = currentDistance
	return targetEntity

func Get_Target_Direction():
	if (targets.size() >= 1):
		var targetEntity:Node2D = Get_Closest_Target()
		var direction:Vector2 = global_position.direction_to(targetEntity.global_position)
		velocity = speed * direction
	else:
		velocity *= 0


func On_Target_Hit(target_body:Node2D) ->void:
	if(target_body.has_method("Take_Damage") and target_body.is_in_group("CharacterPlayable")):
		target_body.Take_Damage(attack_power)

func Destroy_Mob():
	queue_free()


func Take_Damage(damageTaken:int):
	hp -= damageTaken
	$Slime.play_animation("hurt", true, "walk")
	$HealthManager.emit_signal("On_Health_Change",hp)
	
	if hp <= 0:
		Destroy_Mob()
		
		
