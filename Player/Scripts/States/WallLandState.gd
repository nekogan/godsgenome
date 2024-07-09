extends State
class_name WallLand

@export var player: Player

func Enter():
	player.GRAVITY = 0
	player.velocity.y = 0

func Update(_delta):
	player.anim_sprite.play("wall_land")
	if Input.is_action_just_pressed("down"):
		Transitioned.emit(self, "Fall")
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "Climb")
