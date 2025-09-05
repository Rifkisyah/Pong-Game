extends Button

@onready var enemy_point_label = $"../../../HUD/enemy-point-label"
@onready var player_point_label = $"../../../HUD/player-point-label"

func _pressed() -> void:  
	player_point_label.text = str(0)
	enemy_point_label.text = str(0)
	
	var player = get_node("/root/Main/Gameplay/player-paddle")
	var enemy = get_node("/root/Main/Gameplay/enemy-paddle")
	var ball = get_node("/root/Main/Gameplay/ball")
	
	player.reset_position()
	enemy.reset_position()
	ball.is_played = false
	self.release_focus()
