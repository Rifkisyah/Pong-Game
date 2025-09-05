extends CharacterBody2D

@onready var win_popup = $"../../UI/win_info"
@onready var lose_popup = $"../../UI/lose_info"

var SPEED = 250
var ball: CharacterBody2D = null
var default_position: Vector2

func _ready():
	ball = get_node("/root/Main/Gameplay/ball")
	default_position = global_position

func _physics_process(_delta) -> void:
	if win_popup.visible:
		return
	elif lose_popup.visible:
		return
	
	if ball.is_played:
		var direction_y = ball.global_position.y - global_position.y
		if direction_y != 0:
			direction_y = direction_y / abs(direction_y)
			
		velocity.y = direction_y * SPEED
		velocity.x = 0
		
		move_and_slide()
		
func reset_position():
	global_position = default_position
