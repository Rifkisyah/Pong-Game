extends Button

@onready var enemy_point_label = $"UI/HUD/enemy-point-label"
@onready var player_point_label = $"UI/HUD/player-point-label"

func _ready() -> void:
	var button = Button.new()
	button.pressed.connect(_button_pressed)
	add_child(button)
	action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS

func _button_pressed():
	var ball = get_node("/root/Node2D/ball")
	ball.is_played = false
	ball.enemy_point = 0
	ball.player_point = 0
	
	var player_paddle = get_node("/root/Node2D/player-paddle")
	player_paddle.reset_position()
