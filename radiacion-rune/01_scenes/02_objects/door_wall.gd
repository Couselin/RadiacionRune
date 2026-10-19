extends Area2D
class_name DoorWall

@export var images: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = images[0]
	pass


func open_door_wall():
	$Sprite2D.texture = images[1]
	set_collision_layer_value(1, false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
