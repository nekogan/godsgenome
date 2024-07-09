extends Area2D

@onready var parent = get_parent()

func _on_area_entered(area):
	if area.name == "HurtBox":
		if parent.player_behind:
			parent._set_damage(2)
		else:
			parent._set_damage(1)
