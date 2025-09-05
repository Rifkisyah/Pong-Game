extends CanvasLayer

@onready var win_popup = $win_info
@onready var lose_popup = $lose_info
@onready var overlay = $"bg-overlay"
@onready var paused_menu = $"paused-menu"

func _ready() -> void:
	win_popup.visible = false
	lose_popup.visible = false
	overlay.visible = false
	paused_menu.visible = false
