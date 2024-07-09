extends State
class_name EnemyIdle

@export var parent: Enemy

func Enter():
	parent.velocity = Vector2(0,0)

func Update(_delta):
	parent.anim_sprite.play("idle")
	if parent.target is Player:
		Transitioned.emit(self, "Detection")

func _on_enemy_died():
	Transitioned.emit(self, "Death")
