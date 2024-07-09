extends State
class_name Detection

@export var parent: Enemy

var roar_radius: int = 150

func Enter():
	make_roar()

func Update(_delta):
	parent.anim_sprite.play("detect")

func make_roar():
	if parent.can_roar:
		var current_scene_tree = parent.get_parent().get_tree()
		var enemies = current_scene_tree.get_nodes_in_group("enemies")
		for enemy in enemies:
			if (parent.global_position.x - enemy.global_position.x) < roar_radius:
				enemy.target = parent.target

func _on_animated_sprite_2d_animation_finished():
	if parent.current_animation == "detect":
		if parent.target is Player:
			Transitioned.emit(self, "Chasing")
		else:
			Transitioned.emit(self, "Idle")

func Exit():
	parent.can_roar = false
