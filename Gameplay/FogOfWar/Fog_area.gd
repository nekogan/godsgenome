extends Area2D

@onready var parent = get_parent()

func _process(_delta):
	if parent.find_child("Door").open:
		parent.process_mode = Node.PROCESS_MODE_PAUSABLE
		$AnimationPlayer.play("fade_in")

func _on_animation_finished(_anim_name):
	queue_free()
