extends Button

var menu = ("res://scenes/main_menu.tscn")

func _pressed() -> void:
	# This changes the scene/level to the main menu
	get_tree().change_scene_to_file(menu)
