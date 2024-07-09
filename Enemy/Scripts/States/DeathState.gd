extends State
class_name EnemyDeath

@export var parent: Enemy

func Enter():
	parent.velocity = Vector2(0,0)

func Update(_delta):
	parent.anim_sprite.play("death")

func _on_animated_sprite_2d_animation_finished():
	if parent.current_animation == "death":
		parent.queue_free()
