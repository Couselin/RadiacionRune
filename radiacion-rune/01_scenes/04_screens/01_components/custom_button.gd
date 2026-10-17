extends TextureButton

@export var button_text := 'Texto de ejemplo'



func _ready() -> void:
	$ButtonText.text = button_text
	$ButtonText.set_deferred("size", size)
