extends State
class_name Run

@export var player: Player

func Update(_delta):
	player.noise_area._set_radius(60)
	player.update_facing_direction()
	player.anim_sprite.play("run")

	if player.horizontal_direction == 0:
		Transitioned.emit(self, "Idle")

	if player.velocity.y > 0:
		Transitioned.emit(self, "Fall")

	if Input.is_action_just_released("run"):
		Transitioned.emit(self, "Walk")

	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "Jump")

	if Input.is_action_pressed("aim"):
		Transitioned.emit(self, "Aim")

func Physics_update(_delta):
	player.velocity.x = player.horizontal_direction * player.RUN_SPEED
