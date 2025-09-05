extends Button

@onready var desk_sprite = $"../../../../desk-sprite"
@onready var gameplay_sprite = $"../../../../Gameplay"
@onready var hud = $"../../../HUD"
@onready var paused_menu = $"../.."

func _pressed() -> void:
	desk_sprite.visible = false
	gameplay_sprite.hide()
	hud.visible = false
	paused_menu.visible = false
	
	var menu_scene = load("res://scenes/menu.tscn") as PackedScene
	var menu_instance = menu_scene.instantiate()
	get_tree().root.add_child(menu_instance)
