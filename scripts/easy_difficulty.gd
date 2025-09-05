extends Button

@onready var difficulty_title = $"../../../difficulty-title"
@onready var difficulty_menu = $"../.."

func _pressed() -> void:
	difficulty_title.visible = false
	difficulty_menu.visible = false
	
	var gameplay_scene = load("res://scenes/gameplay.tscn") as PackedScene
	var gameplay_instance = gameplay_scene.instantiate()
	get_tree().root.add_child(gameplay_instance)
	
	var ball = gameplay_instance.get_node("Gameplay/ball")
	ball._set_difficulty("Easy")
