extends CharacterBody2D

class_name Bullet

@export var enemy: Enemy

@export var explotion: PackedScene

@export var tank: Tank
@export var speed := 100.0
@export var damage := 50

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		destroy()

func destroy():
	$BulletTexture.hide()
	$SmokeTrail.hide()
	speed = 0
	
	var new_explotion = explotion.instantiate()
	add_child(new_explotion)
	
	await new_explotion.animation_finished
	
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
