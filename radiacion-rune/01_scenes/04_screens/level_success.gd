extends Control



func _on_level_selection_button_pressed():
	get_tree().change_scene_to_file("res://01_scenes/04_screens/level_selection.tscn")


func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://01_scenes/03_levels/01_level1.tscn")
