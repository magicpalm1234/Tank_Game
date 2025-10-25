extends CharacterBody2D

class_name Bullet

@export var tank: Tank
@export var speed := 100.0
@export var damage := randi_range(30, 60)


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
			explode()
		if miss_chance > 0.9:
			ricochet(-100, -145)

func ricochet(min_ricochet_angle, max_ricochet_angle):
	var new_ricochet_paritcles = preload("res://Scenes/ricochet_particles.tscn").instantiate()
	add_sibling(new_ricochet_paritcles)
	new_ricochet_paritcles.position = position
	new_ricochet_paritcles.emitting = true
	
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
