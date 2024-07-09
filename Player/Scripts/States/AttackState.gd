extends State
class_name Attack

@export var player: Player
var hurtbox


func Enter():
	hurtbox = load("res://Player/hurt_box.tscn").instantiate()
	hurtbox.position.x += 20 * player.facing
	player.add_child(hurtbox)
	
	player.noise_area._set_radius(60)
	player.velocity = Vector2(0,0)

func Update(_delta):
	player.anim_sprite.play("attack")

func _on_animated_sprite_2d_animation_finished():
	if player.current_animation == "attack":
		if Input.is_action_pressed("aim"):
			Transitioned.emit(self, "Aim")
		else:
			Transitioned.emit(self, "Idle")

func Exit():
	hurtbox.queue_free()
	player.noise_area._set_radius(0)

