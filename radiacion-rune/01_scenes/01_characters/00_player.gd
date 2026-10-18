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
	if area.is_in_group("candy"):
		collectedCandy += 1
		print(collectedCandy)
		area.queue_free()
	pass
