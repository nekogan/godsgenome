extends State
class_name EnemyAttack

@export var parent: Enemy

var hurtbox

func Update(_delta):
	parent.anim_sprite.play("hit")

	if !parent.attackzone_target is Player:
		Transitioned.emit(self, "Chasing")

func _on_died():
	Transitioned.emit(self, "Death")

func _on_hurt():
	Transitioned.emit(self, "Hurt")

func _on_frame_changed():
	if parent.current_animation == "hit":
		match parent.current_frame:
			5:
				hurtbox = load("res://Enemy/hurt_box.tscn").instantiate()
				hurtbox.position.x += 10 * parent.facing
				parent.add_child(hurtbox)
			7:
				hurtbox.queue_free()

