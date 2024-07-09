extends State
class_name ClimbState

@export var player: Player

var frame
var pos

func Enter():
	pos = player.get_position()
	player.set_position(Vector2(pos.x, pos.y - 3))
	player.coll.set_disabled(true)

func Update(_delta):
	player.anim_sprite.play("climb")
	frame = player.anim_sprite.get_frame()

func Physics_update(_delta):
	pos = player.get_position()

func Exit():
	player.coll.set_disabled(false)
	player.GRAVITY = 450
	player.ledge_raycast.enabled = true

func _is_animation_finished():
	if player.current_animation == "climb":
		if player.crouch_raycast1.is_colliding() or player.crouch_raycast2.is_colliding():
			Transitioned.emit(self, "CrouchIdle")
		else:
			Transitioned.emit(self, "Idle")

func _on_frame_changed():
	var anim = player.anim_sprite.get_animation()

	if anim == "climb":
		match frame:
			1:
				player.set_position(Vector2(pos.x + (2 * player.facing), pos.y - 2))
			2:
				player.set_position(Vector2(pos.x + (2 * player.facing), pos.y - 6))
			3:
				player.set_position(Vector2(pos.x + (6 * player.facing), pos.y - 6))
