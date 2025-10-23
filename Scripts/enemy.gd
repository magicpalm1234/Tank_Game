extends Node2D

@export var explotions: PackedScene
@export var bullet: PackedScene

@export var health: float
var reloaded := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not get_tree().paused:
		await get_tree().create_timer(3.0).timeout
		shoot()

func reload(): # reload code
	await get_tree().create_timer(3.0).timeout # reload time of three seconds
	reloaded = true

func take_damage(amount):
	health -= amount
	if health <= 0:
		die()


func shoot():
	if reloaded == true:
		if not get_tree().paused:
			$AnimatedSprite2D2.play("Shooting")
			var new_bullet = preload("res://Scenes/bullet.tscn").instantiate()
			add_child(new_bullet)
		
			new_bullet.damage = randi_range(10, 30)
			new_bullet.rotation_degrees = 180
			new_bullet.speed = -1000
			new_bullet.position = Vector2(-15,-5)
		
			reloaded = false
			reload()


func die():
	var new_explotions = explotions.instantiate()
	add_sibling(new_explotions)
	new_explotions.emitting = true
	new_explotions.position = position
	queue_free()
