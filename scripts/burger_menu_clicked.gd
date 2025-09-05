extends Button

@onready var paused_menu = $"../../paused-menu"
@onready var overlay = $"../../bg-overlay"

func _pressed() -> void:
	paused_menu.visible = true
	overlay.visible = true
	
	var new_normal_texture := StyleBoxTexture.new()
	new_normal_texture.texture = preload("res://assets/images/burger-menu-hover.png")
	add_theme_stylebox_override("normal", new_normal_texture)
	
	get_tree().paused = true
