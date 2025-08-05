extends Area2D

@export var speed: float
@export var damage_power:int
@export var bulletSize:float

@export var bullet_range:float
var originPosition: Vector2

func _ready():
	originPosition = position
	
	#makes bullet be independant of gun
	top_level = true
	


func _process(delta):
	pass
	


func _physics_process(delta):
	Push_Bullet(delta)
	On_Range_Exit()


func Rotate_Bullet() ->Vector2:
	return Vector2.RIGHT.rotated(rotation)
	


func Push_Bullet(delta:float) ->void:
	position += Rotate_Bullet() * speed * delta
	


func Destroy_Bullet()->void:
	queue_free()
	

func On_Target_Collision(targetBody:Node2D) ->void:
	Destroy_Bullet()
	if targetBody.has_method("Take_Damage") and targetBody.is_in_group("EnemyMob"):
		targetBody.Take_Damage(damage_power)


func On_Range_Exit() ->void:
	if(position.distance_to(originPosition) >= bullet_range):
		Destroy_Bullet()
