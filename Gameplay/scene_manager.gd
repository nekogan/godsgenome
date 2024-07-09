extends Node

const basement_save_zone = "res://SaveZone/SaveZone.tscn"
const basement = "res://Scenes/Basement.tscn"

signal on_trigger_player_spawn

var door_tag

func switch_scene(scene_tag: String):
	if scene_tag != null:
		get_tree().change_scene_to_file(select_scene(scene_tag))

func trigger_player_spawn(pos: Vector2):
	on_trigger_player_spawn.emit(pos)

func select_scene(tag: String):
	match tag:
		"basement_save_zone":
			door_tag = "basement_save_zone"
			return basement_save_zone
		"basement":
			door_tag = "basement"
			return basement
