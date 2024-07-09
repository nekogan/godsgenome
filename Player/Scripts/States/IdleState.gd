extends State
class_name Idle

@export var player: Player

func Update(_delta):
	player.noise_area._set_radius(0)
	if player.can_kill and Input.is_action_pressed("attack"):
		Transitioned.emit(self, "BackKill")

	player.anim_sprite.play("idle")
	if player.horizontal_direction != 0:
		Transitioned.emit(self, "Walk")

	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "Jump")

	if Input.is_action_pressed("aim"):
		Transitioned.emit(self, "Aim")

	if Input.is_action_pressed("down") or (player.crouch_raycast1.is_colliding() and player.crouch_raycast2.is_colliding()):
		Transitioned.emit(self, "CrouchIdle")

func _on_player_died():
	Transitioned.emit(self, "Death")
