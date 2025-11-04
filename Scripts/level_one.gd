extends Node2D

signal restart_pressed
signal main_menu_pressed
signal enemy_died

var enemy_tank = preload("res://Scenes/enemy.tscn")


var open_spawn_point1 = true
var open_spawn_point2 = true
var open_spawn_point3 = true

var amount_of_enemies := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_tank()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Buggy.health <= 0:
		lose()
	
	if amount_of_enemies <= 0:
		win()
	$Label.text = str("Enemies: ",amount_of_enemies)
	get_children()
	

func win():
	var new_win_screen = preload("res://Scenes/win_screen.tscn").instantiate()
	add_child(new_win_screen)
	get_tree().paused = true

func lose():
	var new_lose_screen = preload("res://Scenes/lose_screen.tscn").instantiate()
	add_child(new_lose_screen)
	get_tree().paused = true

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_enemy_died(enemy) -> void:
	var chance_of_new_enemy = randf()
	if chance_of_new_enemy <= 0.5:
		new_tank()
	
	if enemy.is_in_group("enemy_spawn1"):
		open_spawn_point1 = true
		amount_of_enemies -= 1
	
	if enemy.is_in_group("enemy_spawn2"):
		open_spawn_point2 = true
		amount_of_enemies -= 1
	
	if enemy.is_in_group("enemy_spawn3"):
		open_spawn_point3 = true
		amount_of_enemies -= 1


func new_tank() -> void:
	var new_enemy_tank = enemy_tank.instantiate()
	
	var randspawn = randi_range(1,3)
	
	var spawn_pos_1 = Vector2(180,1)
	var spawn_pos_2 = Vector2(120,1)
	var spawn_pos_3 = Vector2(60,1)
	
	add_child(new_enemy_tank)
	new_enemy_tank.add_to_group("enemy")
	
	if randspawn == 1:
		if open_spawn_point1 == true:
			var tween = create_tween()
			open_spawn_point1 = false
			new_enemy_tank.add_to_group("enemy_spawn1")
			amount_of_enemies += 1
			
			new_enemy_tank.position.y = 1
			new_enemy_tank.position.x = 300
			new_enemy_tank.rotation_degrees = 1
			tween.tween_property(new_enemy_tank, "position", spawn_pos_1,1.5)
			await tween.finished
			new_enemy_tank.rotation_degrees = 0
			
		else:
			new_enemy_tank.queue_free()
	
	elif randspawn == 2:
		if open_spawn_point2 == true:
			var tween = create_tween()
			open_spawn_point2 = false
			new_enemy_tank.add_to_group("enemy_spawn2")
			amount_of_enemies += 1
			
			new_enemy_tank.position.y = 1
			new_enemy_tank.position.x = 300
			new_enemy_tank.rotation_degrees = 1
			tween.tween_property(new_enemy_tank, "position", spawn_pos_2,2.25)
			await tween.finished
			new_enemy_tank.rotation_degrees = 0
			
		else:
			new_enemy_tank.queue_free()
	
	elif randspawn == 3:
		if open_spawn_point3 == true:
			var tween = create_tween()
			open_spawn_point3 = false
			new_enemy_tank.add_to_group("enemy_spawn3")
			amount_of_enemies += 1
			
			new_enemy_tank.position.y = 1
			new_enemy_tank.position.x = 300
			new_enemy_tank.rotation_degrees = 1
			tween.tween_property(new_enemy_tank, "position", spawn_pos_3,3)
			await tween.finished
			new_enemy_tank.rotation_degrees = 0
			
			
		else:
			new_enemy_tank.queue_free()
	







pass
