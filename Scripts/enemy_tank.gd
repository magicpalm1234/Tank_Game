extends Enemy

@export var explotions: PackedScene
@export var bullet: PackedScene


var reloaded := true

func _ready() -> void:
	super._ready()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not get_tree().paused:
		await get_tree().create_timer(3.0).timeout
		shoot()


func reload(reload_time): # reload code
	await get_tree().create_timer(reload_time).timeout # reload time of three seconds
	reloaded = true


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
			reload(randi_range(2,4))

func die():
	var new_ricochet_paritcles = preload("res://Scenes/ricochet_particles.tscn").instantiate()
	add_sibling(new_ricochet_paritcles)
	
	new_ricochet_paritcles.amount = 100
	new_ricochet_paritcles.rotation_degrees = 90
	new_ricochet_paritcles.position = position
	new_ricochet_paritcles.emitting = true
	
	
	var new_explotions = preload("res://Scenes/explosions.tscn").instantiate()
	add_sibling(new_explotions)
	
	new_explotions.emitting = true
	new_explotions.position = position
	await new_explotions.finished
	
	super.die()
