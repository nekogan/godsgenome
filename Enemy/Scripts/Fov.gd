extends RayCast2D

# TODO:
# Таймер задать на 3 секунды
# Добавить таймер 
# Если !self.is_colliding() and timer.finish and parent.target != null

@onready var parent = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if self.is_colliding():
		if get_collider() is Player and parent.target == null:
			parent.can_roar = true
			parent.target = get_collider()
		elif !(get_collider() is Player) and parent.target != null:
			parent.target = null
