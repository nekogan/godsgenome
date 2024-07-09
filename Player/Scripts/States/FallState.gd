extends State
class_name FallState

@export var player: Player

func Enter():
	player.GRAVITY = 400

func Update(_delta):
	player.anim_sprite.play("fall")
	if player.ledge_raycast.is_colliding():
		Transitioned.emit(self, "WallLand")

	if player.is_on_floor():
		Transitioned.emit(self, "Land")

	if player.fall_speed > 300:
		player.health = 0

func Physics_update(_delta):
	calc_fall_speed()

func Exit():
	player.ledge_raycast.enabled = false

func calc_fall_speed():
	if player.fall_speed < player.velocity.y:
		player.fall_speed = player.velocity.y
