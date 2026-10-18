extends Node2D
class_name Player

var goUp: bool = true
var goDown: bool = true
var goRight: bool = true
var goLeft: bool = true
var previous_position: Vector2
var new_position: Vector2

var collectedCandy: int = 0

signal bandDirections(from: Vector2, to: Vector2, current_position: Vector2)


func _ready() -> void:
	pass

func set_player(given_pos) -> void:
	position = given_pos
	print(position)


func create_band() -> void:
	if previous_position == Vector2.ZERO:
		print("Direccion anterior: " + str(Vector2.ZERO))
		print("Direccion nueva: "+str((new_position - position) / 64))
		print("///////////////////")
		bandDirections.emit(Vector2.ZERO, (new_position - position) / 64, position)
	else:
		print("Direccion anterior: " + str((previous_position - position) / 64) )
		print("Direccion nueva: "+str((new_position - position) / 64))
		print("///////////////////")
		bandDirections.emit((previous_position - position) / 64, (new_position - position) / 64, position)
	previous_position = position
	position = new_position
	
	
func _process(_delta: float) -> void:
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
	pass




func _on_vision_right_area_entered(_area: Area2D) -> void:
	goRight = false
	pass 
func _on_vision_left_area_entered(_area: Area2D) -> void:
	goLeft = false
	pass 
func _on_vision_up_area_entered(_area: Area2D) -> void:
	goUp = false
	pass 
func _on_vision_down_area_entered(_area: Area2D) -> void:
	goDown = false
	pass 


func _on_vision_right_area_exited(_area: Area2D) -> void:
	goRight = true
	pass
func _on_vision_left_area_exited(_area: Area2D) -> void:
	goLeft = true
	pass 
func _on_vision_up_area_exited(_area: Area2D) -> void:
	goUp = true
	pass 
func _on_vision_down_area_exited(_area: Area2D) -> void:
	goDown = true
	pass 
	



func _on_nene_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("candy"):
		collectedCandy += 1
		print(collectedCandy)
		area.queue_free()
	pass
