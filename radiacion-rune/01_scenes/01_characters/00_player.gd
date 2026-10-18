extends Node2D
class_name Player

var goUp: bool = true
var goDown: bool = true
var goRight: bool = true
var goLeft: bool = true
var previous_position: Vector2
var new_position: Vector2
var max_movements := 999
var movements := 0

var collectedCandy: int = 0

signal bandDirections(from: Vector2, to: Vector2, current_position: Vector2)
signal collectOneCandy(int)

func _ready() -> void:
	pass

func set_player(given_pos: Vector2, level_max_movement: int) -> void:
	position = given_pos
	print(position)
	max_movements = level_max_movement


func create_band() -> void:
	if previous_position == Vector2.ZERO:
		bandDirections.emit(Vector2.ZERO, (new_position - position) / 64, position)
	else:
		bandDirections.emit((previous_position - position) / 64, (new_position - position) / 64, position)
	previous_position = position
	position = new_position
	movements += 1
	
	
func _process(_delta: float) -> void:
	if movements < max_movements:
		if Input.is_action_just_pressed("right") and goRight==true:
			new_position = position + Vector2(64, 0)
			create_band()
		if Input.is_action_just_pressed("left") and goLeft==true:
			new_position = position - Vector2(64, 0)
			create_band()
		if Input.is_action_just_pressed("up") and goUp==true:
			new_position = position - Vector2(0, 64)
			create_band()
		if Input.is_action_just_pressed("down") and goDown==true:
			new_position = position + Vector2(0, 64)
			create_band()



#VISION SHAPES DETECT COLLISIONS AROUND PLAYER (ONLY IN LAYER 1)
func _on_vision_right_area_entered(_area) -> void:
	goRight = false
	pass 
func _on_vision_left_area_entered(_area) -> void:
	goLeft = false
	pass 
func _on_vision_up_area_entered(_area) -> void:
	goUp = false
	pass 
func _on_vision_down_area_entered(_area) -> void:
	goDown = false
	pass 

func _on_vision_right_area_exited(_area) -> void:
	goRight = true
	pass
func _on_vision_left_area_exited(_area) -> void:
	goLeft = true
	pass 
func _on_vision_up_area_exited(_area) -> void:
	goUp = true
	pass 
func _on_vision_down_area_exited(_area) -> void:
	goDown = true
	pass 

func _on_vision_right_body_entered(_body) -> void:
	goRight = false
	pass 
func _on_vision_left_body_entered(_body) -> void:
	goLeft = false
	pass 
func _on_vision_up_body_entered(_body) -> void:
	goUp = false
	pass 
func _on_vision_down_body_entered(_body) -> void:
	goDown = false
	pass 

func _on_vision_right_body_exited(_body) -> void:
	goRight = true
	pass
func _on_vision_left_body_exited(_body) -> void:
	goLeft = true
	pass 
func _on_vision_up_body_exited(_body) -> void:
	goUp = true
	pass 
func _on_vision_down_body_exited(_body) -> void:
	goDown = true
	pass 

#NENE AREA CAN DETECT THINGS FROM OTHER LAYERS (LIKE CANDIES IN LAYER2)
func _on_nene_area_area_entered(area: Area2D) -> void:
	print(area)
	if area.is_in_group("candy"):
		collectedCandy += 1
		collectOneCandy.emit(collectedCandy)
		area.queue_free()
	if area.get_collision_layer_value(8):
		get_tree().change_scene_to_file("res://01_scenes/04_screens/level_success.tscn")
