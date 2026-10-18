extends TextureButton

@export var button_text := 'Texto de ejemplo'
@export var size_text := 10


func _ready() -> void:
	$ButtonText.text = button_text
	$ButtonText.label_settings.font_size = size_text
