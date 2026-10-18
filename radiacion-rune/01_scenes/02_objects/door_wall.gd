extends Area2D

@export var images: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = images[0]
	pass


func open_door_wall():
	$Sprite2D.texture = images[1]
	set_collision_layer_value(1, false)
	set_collision_layer_value(4, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
