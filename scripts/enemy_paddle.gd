extends CharacterBody2D

var SPEED = 250
var ball: CharacterBody2D = null
var default_position: Vector2

func _ready():
	ball = get_node("/root/Main/Gameplay/ball")
	default_position = global_position

func _physics_process(_delta) -> void:
	if $"../../UI/win_popup".visible:
		return
	elif $"../../UI/lose_popup".visible:
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
