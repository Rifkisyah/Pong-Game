extends Button

@onready var paused_menu = $"../.."
@onready var overlay = $"../../../bg-overlay"
@onready var burger_menu = $"../../../HUD/burger-menu"

func _pressed() -> void:
	paused_menu.visible = false
	overlay.visible = false
	
	print(paused_menu.visible)
	
	var new_normal_texture := StyleBoxTexture.new()
	new_normal_texture.texture = preload("res://assets/images/burger-menu.png")
	burger_menu.add_theme_stylebox_override("normal", new_normal_texture)
	
	get_tree().paused = false
