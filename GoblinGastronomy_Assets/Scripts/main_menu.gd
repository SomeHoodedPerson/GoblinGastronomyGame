extends Control

var kitchenTest = ("res://scenes/kitchen_test.tscn")

@onready var levelPanel = $CanvasLayer/CenterContainer/LevelSelect

func _ready() -> void:
	# Show the level panel
	levelPanel.hide()

func _on_start_pressed() -> void:
	# Show the level panel
	levelPanel.show()
	
func _on_level_close_pressed() -> void:
	# Closes the level panel
	levelPanel.hide()
	
func _on_exit_pressed() -> void:
	# This closes the game
	get_tree().quit()
	
	
func _on_level_button_1_pressed() -> void:
	# This generates the Alarm set
	GlobalVar.levelGen(0)
	get_tree().change_scene_to_file(kitchenTest)
	
func _on_level_button_2_pressed() -> void:
	# This generates the Salad Set
	GlobalVar.levelGen(1)
	get_tree().change_scene_to_file(kitchenTest)
	
