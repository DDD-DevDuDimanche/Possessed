extends ParentLevel

func _on_door_player_entered_door():
	get_tree().change_scene_to_file("res://scenes/level_bedroom.tscn")
