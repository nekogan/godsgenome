extends State
class_name EnemyHurt

@export var parent: Enemy

func Update(_delta):
	parent.anim_sprite.play("hurt")

func _on_animated_sprite_2d_animation_finished():
	if parent.current_animation == "hurt":
		Transitioned.emit(self, parent.sm.prev_state.name)

func _on_died():
	Transitioned.emit(self, "Death")
