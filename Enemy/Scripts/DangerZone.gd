extends Area2D

@onready var parent = get_parent()

func _on_body_entered(body):
	if body is Player:
		parent.attackzone_target = body

func _on_body_exited(body):
	if body is Player:
		parent.attackzone_target = null
