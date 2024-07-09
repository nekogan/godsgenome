extends State
class_name LandState

@export var player: Player

func Enter():
	player.ledge_raycast.enabled = true
	player.anim_sprite.play("land")
	player.velocity.x = 0
	
func Update(_delta):
	if player.health == 0:
		Transitioned.emit(self, "Death")
		player.fall_speed = 0
	if !player.anim_sprite.is_playing() and player.is_on_floor():
		if player.horizontal_direction != 0 and Input.is_action_pressed("run"):
			Transitioned.emit(self, "Run")
		if player.horizontal_direction != 0:
			Transitioned.emit(self, "Walk")
		elif player.horizontal_direction == 0:
			Transitioned.emit(self, "Idle")
