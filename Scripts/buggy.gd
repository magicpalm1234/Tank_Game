extends CharacterBody2D

class_name Tank

@export var empty_bullet: PackedScene
#@export var bullet: Bullet
@onready var camera: Camera2D = $"../Camera2D"
@onready var tank_barrel: AnimatedSprite2D = $TankBarrel
var reloaded := true # has reloaded variable
var max_elevation := -30.0 # max rotation for the barrel
var min_elevation := 15.0 # min rotation for the barrel
var health := 100.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("shoot_with_tank"): # makes you shoot when you press lmb
		shoot()
	
	tank_barrel.look_at(get_global_mouse_position()) # makes the barrel face the mouse
	if tank_barrel.rotation_degrees <= max_elevation:
		tank_barrel.rotation_degrees = max_elevation
	
	if tank_barrel.rotation_degrees >= min_elevation:
		tank_barrel.rotation_degrees = min_elevation
	

func die(): # die code
	queue_free()


func reload(time): # reload code
	await get_tree().create_timer(1).timeout # time before the bullet gets thrown out
	var new_empty_bullet = empty_bullet.instantiate()
	add_sibling(new_empty_bullet)
	new_empty_bullet.position = position - Vector2(7,9)
	new_empty_bullet.linear_velocity = Vector2(randf_range(-50, -100), randf_range(-50, -100)) # random throw range
	new_empty_bullet.rotation_degrees = 30
	
	await get_tree().create_timer(time).timeout # reload time in seconds
	reloaded = true

func shoot(): # shoot code
	if reloaded == true: # only shoot chen you have reloaded
		tank_barrel.play("Shoot")
		camera_shake(10)
		knockback(4)
		$CollisionShape2D.disabled = true
		
		var new_bullet = preload("res://Scenes/bullet.tscn").instantiate() # spawning the bullet
		add_sibling(new_bullet)
		new_bullet.position = tank_barrel.position
		new_bullet.z_index = 1
		
		
		new_bullet.show()
		new_bullet.speed = 1000
		new_bullet.rotation_degrees = tank_barrel.rotation_degrees
		
		reloaded = false
		reload(2)
		await get_tree().create_timer(0.1).timeout
		$CollisionShape2D.disabled = false

func take_damage(amount):
	health -= amount
	camera_shake(amount / 2)
	if health <= 0:
		die()

func camera_shake(shake_amount): # shakes the camera in a randomly generated way
	var tween = create_tween()
	
	for shake in shake_amount: # how many times it changes position
		tween.tween_property(camera, "offset", Vector2(randf_range(-5, 5),randf_range(-5, 5)), 0.01)
	tween.tween_property(camera, "offset", Vector2(0,0), 0.1)
	

func knockback(knockback_amount):
	var tween = create_tween()
	
	tween.tween_property(self, "position", Vector2(-knockback_amount,0), 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	
	rotation_degrees = -1
	tween.tween_property(self, "position", Vector2(knockback_amount,0), 1)
	await tween.finished
	rotation_degrees = 0
