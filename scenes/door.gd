extends StaticBody2D

signal player_entered_door

func _on_area_2d_body_entered(body):
	player_entered_door.emit()
