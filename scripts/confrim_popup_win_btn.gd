extends Button

@onready var win_popup = $"../../.."
@onready var lose_popup = $"../../../../lose_popup"

func _on_pressed() -> void:
	if win_popup.visible:
		win_popup.hide()
	elif lose_popup.visible:
		lose_popup.hide()
