extends Area2D

@onready var parent = get_parent()

func _on_body_entered(body):
	if body is Player:
		parent.player_behind = true
		body.can_kill = true

func _on_body_exited(body):
	if body is Player:
		parent.player_behind = false
		body.can_kill = false
