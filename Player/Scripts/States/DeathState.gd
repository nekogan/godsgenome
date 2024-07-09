extends State
class_name Death

@export var player: Player

func Update(_delta):
	player.anim_sprite.play("death")

func _on_animated_sprite_2d_animation_finished():
	if player.current_animation == "death":
		get_tree().change_scene_to_file("res://GUI/Tscn's/main_menu.tscn")

func Exit():
	player.health = 2
	#player.global_position = str_to_var(player.load_dat())
