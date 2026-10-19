extends TextureRect
class_name GameUI

@export var text: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = text
	pass # Replace with function body.

func update_text(new_text: String):
	$Label.text = new_text
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
