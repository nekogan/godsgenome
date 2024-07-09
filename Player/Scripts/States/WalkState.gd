extends State
class_name WalkState

@export var player: Player

func Update(_delta):
	player.noise_area._set_radius(40)
	player.update_facing_direction()
	player.anim_sprite.play("walk")

	if player.velocity.y > 0 and not player.is_on_floor():
		Transitioned.emit(self, "Fall")

	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "Jump")

	if Input.is_action_pressed("run"):
		Transitioned.emit(self, "Run")

	if Input.is_action_pressed("aim"):
		Transitioned.emit(self, "Aim")

	if Input.is_action_pressed("down"):
		Transitioned.emit(self, "CrouchWalk")

	if player.horizontal_direction == 0:
		Transitioned.emit(self, "Idle")

func Physics_update(_delta):
	player.velocity.x = player.horizontal_direction * player.WALK_SPEED
