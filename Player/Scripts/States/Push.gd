extends State
class_name PushState

@export var character: CharacterBody2D

func Update(_delta):
	character.anim_sprite.play("push")
	if Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		Transitioned.emit(self, "PushIdle")

func Physics_update(_delta):
	character.velocity.x = character.horizontal_direction * character.PUSH_SPEED
