extends Area2D

@onready var parent = get_parent()

func _on_area_entered(area):
	if area.collision_layer == 8 and area.name.to_lower() == "hurtbox":
		DataManager.player_health -= 1
