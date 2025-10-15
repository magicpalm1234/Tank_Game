extends CharacterBody2D

class_name Bullet

@export var enemy: Enemy

@onready var tank_barrel: AnimatedSprite2D = $"../TankBarrel"
@export var tank: Tank
var speed := 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	
	velocity = direction * speed
	
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if enemy:
		enemy.position = Vector2(1,1)
