extends State
class_name BackKill

@export var player: Player

func Enter():
	player.hurt_box.position = Vector2(20 * player.facing, player.hurt_box.position.y)
	player.hurt_box.disabled = false

func Update(_delta):
	player.anim_sprite.play("back_kill")

func _on_animated_sprite_2d_animation_finished():
	if player.current_animation == "back_kill":
		player.hurt_box.disabled = true
		Transitioned.emit(self, "Idle")
