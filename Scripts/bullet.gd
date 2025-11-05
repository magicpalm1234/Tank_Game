extends CharacterBody2D

class_name Bullet

@export var speed := 100.0
@export var damage := randi_range(30, 50)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	
	if get_parent().is_in_group("enemy"):
		direction = Vector2.LEFT.rotated(rotation)
	
	velocity = direction * speed
	
	
	move_and_slide()


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	var miss_chance = randf_range(0,1)
	if body.has_method("take_damage"):
		if miss_chance <= 0.9:
			body.take_damage(damage)
			$Sound/Shootexplosion.pitch_scale = randf_range(0.8, 1.2)
			$Sound/Shootexplosion.play()
			explode()
		if miss_chance > 0.9:
			$Sound/Shootexplosion.pitch_scale = randf_range(1, 1.5)
			$Sound/Shootexplosion.play()
			ricochet(-100, -145)

func ricochet(min_ricochet_angle, max_ricochet_angle):
	rotation_degrees = randf_range(min_ricochet_angle, max_ricochet_angle)
	speed /= 3


func explode():
	$BulletTexture.hide()
	$SmokeTrail.hide()
	speed = 0
	collision_mask = 0
	
	var new_explosion = preload("res://Scenes/explosion.tscn").instantiate()
	add_child(new_explosion)
	
	await new_explosion.animation_finished
	
	destroy()


func destroy():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
