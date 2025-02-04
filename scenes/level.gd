extends Node2D
class_name ParentLevel

var fireball_scene: PackedScene = preload("res://scenes/fireball.tscn")

func _on_player_fireball(pos, direction):
	var fireball = fireball_scene.instantiate() as Area2D
	fireball.position = pos
	fireball.rotation_degrees = rad_to_deg(direction.angle()) + 90
	fireball.direction = direction
	$Projectiles.add_child(fireball)
