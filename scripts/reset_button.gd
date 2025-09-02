extends Button

func _pressed() -> void:  
	$"../enemy-point-label".text = str(0)
	$"../player-point-label".text = str(0)
	
	var player = get_node("/root/Main/Gameplay/player-paddle")
	var enemy = get_node("/root/Main/Gameplay/enemy-paddle")
	var ball = get_node("/root/Main/Gameplay/ball")
	
	player.reset_position()
	enemy.reset_position()
	ball.is_played = false
	self.release_focus()
