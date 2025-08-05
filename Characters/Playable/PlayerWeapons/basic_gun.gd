extends Area2D

@export var fire_rate:float
@export var ammo_count:int
@export var ammo_count_max:int
@export var bulletType:PackedScene
@export var range:float

var ready_to_fire:bool = true
var rate_fire_limiter:Timer

var shooting_point_ref:Node2D

func _ready():
	
	rate_fire_limiter = $FireRate
	rate_fire_limiter.one_shot = true
	rate_fire_limiter.wait_time = .5


func _process(delta):
	pass
	
func _physics_process(delta):
	shooting_point_ref = $WeaponPivot/Pistol/BulletSpawnPoint
	Point_Rotation()
	Check_fire_ready()
	Fire_Projectile()


func Point_Rotation() -> void:
	look_at(get_global_mouse_position())


func Fire_Projectile() -> void:
	if Input.is_action_just_pressed("p_weapon_fire") and ready_to_fire:
		rate_fire_limiter.start()
		ready_to_fire = false
		var created_bullet = bulletType.instantiate()
		created_bullet.global_transform = shooting_point_ref.global_transform
		shooting_point_ref.add_child(created_bullet)
	
func On_Range_Exited(projectile_range:Area2D) -> void:
	pass

func Check_fire_ready() -> void:
	if rate_fire_limiter.is_stopped():
		ready_to_fire = true
