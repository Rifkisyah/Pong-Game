extends Button

@onready var win_popup = $"../.."
@onready var overlay = $"../../../bg-overlay"

func _pressed() -> void:
	if win_popup.visible:
		win_popup.visible = false
		overlay.visible = false
