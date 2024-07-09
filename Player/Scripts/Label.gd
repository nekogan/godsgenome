extends Label

@onready var parent = get_parent()

func _process(_delta):
	if parent.can_kill:
		text = "Убить(ЛКМ)"
	elif parent.door_raycast.is_colliding():
		text = "Е открыть"
	else:
		text = ""
