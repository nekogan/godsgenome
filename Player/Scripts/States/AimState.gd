extends State
class_name Aim

@export var player: Player

func Update(_delta):
	player.anim_sprite.play("aim")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "Attack")
	if Input.is_action_just_released("aim"):
		Transitioned.emit(self, "Idle")
	if player.velocity.y > 0:
		Transitioned.emit(self, "Fall")

func Physics_update(_delta):
	player.velocity.x = player.horizontal_direction * player.AIM_WALK_SPEED
	if player.velocity.x != 0:
		player.noise_area._set_radius(60)
	else:
		player.noise_area._set_radius(0)
