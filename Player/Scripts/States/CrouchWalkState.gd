extends State
class_name CrouchWalk

@export var player: Player

func Enter():
	player.shape.height = 22
	player.coll.position.y = 5

func Update(_delta):
	player.noise_area._set_radius(0)
	player.update_facing_direction()
	player.anim_sprite.play("crouch_walk")
	
	if !Input.is_anything_pressed() and (!player.crouch_raycast1.is_colliding() and !player.crouch_raycast2.is_colliding()):
		Transitioned.emit(self, "Idle")

	if !Input.is_action_pressed("down") and (!player.crouch_raycast1.is_colliding() and !player.crouch_raycast2.is_colliding()):
		Transitioned.emit(self, "Walk")
		
	if player.horizontal_direction == 0:
		Transitioned.emit(self, "CrouchIdle")

func Physics_update(_delta):
	player.velocity.x = player.horizontal_direction * player.PUSH_SPEED

func Exit():
	player.shape.height = 28
	player.coll.position.y = 2
