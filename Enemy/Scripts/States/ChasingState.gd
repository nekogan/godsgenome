extends State
class_name EnemyChasing

@export var parent: Enemy

func Update(_delta):
	if parent.wall_ray_cast.is_colliding():
		parent.target = null

	parent.anim_sprite.play("walk")

	if parent.attackzone_target is Player:
		Transitioned.emit(self, "Attack") 

	if !parent.target is Player:
		Transitioned.emit(self, "Idle")

func Physics_update(_delta):
	if parent.target is Player:
		parent.velocity = parent.global_position.direction_to(parent.target.global_position) * parent.WALK_SPEED

func _on_died():
	Transitioned.emit(self, "Death")

func _on_hurt():
	Transitioned.emit(self, "Hurt")
