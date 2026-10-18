extends Control


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://01_scenes/03_levels/01_level1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://01_scenes/03_levels/02_level2.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://01_scenes/03_levels/03_level3.tscn")


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://01_scenes/03_levels/04_level4.tscn")


func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://01_scenes/03_levels/99_test.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://01_scenes/04_screens/main_menu.tscn")
