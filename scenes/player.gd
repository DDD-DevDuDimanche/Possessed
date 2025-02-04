extends CharacterBody2D

signal fireball(pos, direction)

var can_shoot: bool = true
@export var player_speed: int = 200

func _process(_delta):
	var directions = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = directions * player_speed
	move_and_slide()
	
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("Shoot") and can_shoot:
		var fireball_markers = $FireballStartPosition.get_children()
		var selected_fireball = fireball_markers[randi() % fireball_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		can_shoot = false
		$Timer.start()
		fireball.emit(selected_fireball.global_position, player_direction)

func _on_timer_timeout():
	can_shoot = true
