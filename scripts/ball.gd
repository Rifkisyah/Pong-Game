extends CharacterBody2D

@onready var enemy_point_label = $"../../UI/HUD/enemy-point-label"
@onready var player_point_label = $"../../UI/HUD/player-point-label"
@onready var win_popup = $"../../UI/win_popup"
@onready var lose_popup = $"../../UI/lose_popup"

var SPEED = 500
var is_played = false
var enemy_point = 0
var player_point = 0
var player_paddle
var enemy_paddle
var service = 1

func _ready() -> void:
	reset_ball()
	
func reset_ball():
	is_played = false
	velocity = Vector2.ZERO
	
func _physics_process(delta: float) -> void:
	if win_popup.visible:
		return
	elif lose_popup.visible:
		return
		
	player_paddle = get_node("/root/Main/Gameplay/player-paddle")
	enemy_paddle = get_node("/root/Main/Gameplay/enemy-paddle")
	
	if not is_played:
		if service == 1:
			global_position = player_paddle.global_position + Vector2(5, 0)
			if Input.is_action_just_pressed("ui_accept"):
				velocity = Vector2(-1, 0).normalized()
				is_played = true
		elif service == 2:
			global_position = enemy_paddle.global_position + Vector2(-5, 0)
			if Input.is_action_just_pressed("ui_accept"):
				velocity = Vector2(-1, 0).normalized()
				is_played = true
	else:
		var collision = move_and_collide(velocity * SPEED * delta)
		if collision:
			var collider = collision.get_collider()
			velocity = velocity.bounce(collision.get_normal().normalized())
			
			if collider is StaticBody2D:
				var collision_shape = collision.get_collider_shape_index()
				var collision_id: int = collider.shape_find_owner(collision_shape)
				var collision_node: Node = collider.shape_owner_get_owner(collision_id)
				
				enemy_point_label.text = str(enemy_point)
				player_point_label.text = str(player_point)
				if collision_node:
					match collision_node.name:
						"player-wall":
							lose_popup.show()
							player_paddle.reset_position()
							enemy_paddle.reset_position()
							is_played = false
							global_position = player_paddle.global_position + Vector2(5, 0)
							enemy_point += 1
							enemy_point_label.text = str(enemy_point)
							service = 1
							
						"enemy-wall":
							win_popup.show()
							player_paddle.reset_position()
							enemy_paddle.reset_position()
							is_played = false
							global_position = enemy_paddle.global_position + Vector2(-5, 0)
							player_point += 1
							player_point_label.text = str(player_point)
							service = 2
