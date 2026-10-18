extends Node2D
class_name Player

var goUp: bool = true
var goDown: bool = true
var goRight: bool = true
var goLeft: bool = true

var collectedCandy: int = 0

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("right") and goRight==true:
		position.x = position.x + 64
	if Input.is_action_just_pressed("left") and goLeft==true:
		position.x = position.x - 64
	if Input.is_action_just_pressed("up") and goUp==true:
		position.y = position.y - 64
	if Input.is_action_just_pressed("down") and goDown==true:
		position.y = position.y + 64
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
