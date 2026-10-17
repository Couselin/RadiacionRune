extends Control


func _on_exit_pressed():
	get_tree().quit()


func _on_select_level_pressed():
	get_tree().change_scene_to_file("res://01_scenes/04_screens/level_selection.tscn")
