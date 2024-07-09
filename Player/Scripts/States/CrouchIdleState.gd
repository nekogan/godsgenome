extends State
class_name CrouchIdle

@export var player: Player

func Enter():
	player.shape.height = 22
	player.coll.position.y = 5

func Update(_delta):
	player.noise_area._set_radius(0)
	player.anim_sprite.play("crouch_idle")
	
	if player.horizontal_direction != 0:
		Transitioned.emit(self, "CrouchWalk")
		
	if Input.is_action_just_released("down") and (!player.crouch_raycast1.is_colliding() and !player.crouch_raycast2.is_colliding()):
		Transitioned.emit(self, "Idle")
	
	if player.can_kill and Input.is_action_pressed("attack"):
		Transitioned.emit(self, "BackKill")

func Exit():
	player.shape.height = 28
	player.coll.position.y = 2
