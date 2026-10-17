extends Node2D

@export var initialPosition: Node2D

signal initial_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_pos.emit(initialPosition)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
