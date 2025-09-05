extends Button

@onready var lose_popup = $"../.."
@onready var overlay = $"../../../bg-overlay"

func _pressed() -> void:
	if lose_popup.visible:
		lose_popup.visible = false
		overlay.visible = false
