extends CharacterBody2D

@onready var win_popup = $"../../UI/win_info"
@onready var lose_popup = $"../../UI/lose_info"

var SPEED = 250
var default_position: Vector2

func _ready() -> void:
	default_position = global_position

func _physics_process(_delta) -> void:
	if win_popup.visible:
		return
	elif lose_popup.visible:
		return
	
	velocity.x = 0
	var input = Input.get_axis("ui_up", "ui_down")
	velocity.y = input * SPEED
	
	move_and_slide()

func reset_position():
	global_position = default_position
