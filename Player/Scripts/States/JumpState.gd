extends State
class_name Jump

@export var player: Player

func Enter():
	player.velocity.y = player.jump_velocity
	if player.sm.current_state.name.to_lower() == "walk":
		player.velocity.x = player.horizontal_direction * (player.WALK_SPEED * 1.5)
	if player.sm.current_state.name.to_lower() == "run":
		player.velocity.x = player.horizontal_direction * (player.RUN_SPEED * 1.5)

func Update(_delta):
	player.anim_sprite.play("jump")
	if player.velocity.y > 0:
		Transitioned.emit(self, "Fall")
