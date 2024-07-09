extends State
class_name PushIdle

@export var character: CharacterBody2D

func Enter():
	character.anim_sprite.position.y += 2
	character.anim_sprite.position.x -= 6

func Update(_delta):
	if character.wall_raycast.is_colliding():
		character.anim_sprite.play("push_idle")
	if Input.is_action_just_pressed("action"):
		Transitioned.emit(self, "Idle")
	if character.horizontal_direction != 0:
		Transitioned.emit(self, "Push")

func Exit():
	character.anim_sprite.position.y -= 2
	character.anim_sprite.position.x += 6
