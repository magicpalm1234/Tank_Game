extends Node2D

signal restart_pressed
signal main_menu_pressed
signal enemy_died
signal new_enemy

var amount_of_enemies := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	$Enemy.rotation_degrees = 2
	tween.tween_property($Enemy, "position", Vector2(176,1), 1)
	await tween.finished
	$Enemy.rotation_degrees = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $Buggy.health <= 0:
		lose()
	
	if amount_of_enemies <= 0:
		win()
	$Label.text = str("Enemies:  2 / ",amount_of_enemies)
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

func _on_enemy_died() -> void:
	amount_of_enemies -= 1


func _on_new_enemy() -> void:
	amount_of_enemies += 1
