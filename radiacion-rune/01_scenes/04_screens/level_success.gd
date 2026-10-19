extends Control

var levelsPath: Array =[
	"res://01_scenes/03_levels/99_test.tscn",
	"res://01_scenes/03_levels/01_level1.tscn",
	"res://01_scenes/03_levels/02_level2.tscn",
	"res://01_scenes/03_levels/03_level3.tscn",
	"res://01_scenes/03_levels/04_level4.tscn"
]

func _on_level_selection_button_pressed():
	get_tree().change_scene_to_file("res://01_scenes/04_screens/level_selection.tscn")


func _on_replay_button_pressed():
	var levelNumber = Global.last_level
	get_tree().change_scene_to_file(levelsPath[levelNumber])
