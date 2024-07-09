extends Node

var player: Player
var player_health: int = 2
var player_position: Vector2
var current_scene: Node

func _process(_delta):
	current_scene = get_tree().get_current_scene()
	if player is Player:
		player_position = player.global_position
		current_scene = player.get_parent()

func get_enemies_on_scene():
	var enemies_data = []
	var scene_tree = current_scene.get_tree()
	var enemies = scene_tree.get_nodes_in_group("enemies")
	for enemy in enemies:
		var enemy_data = {}
		enemy_data["name"] = enemy.name
		enemy_data["position.x"] = enemy.global_position.x
		enemy_data["position.y"] = enemy.global_position.y
		enemies_data.append(enemy_data)
	return enemies_data

func create_data():
	var data = {}
	var scene_data = {
		"current_scene": current_scene
	}
	var player_data = {
		"health": player_health,
		"position.x": player_position.x,
		"position.y": player_position.y
	}
	data["1.scene_data"] = scene_data
	data["2.player_data"] = player_data
	data["3.enemies_data"] = get_enemies_on_scene()
	return data

func save_data():
	var file = FileAccess.open_encrypted_with_pass("user://save_game.dat", FileAccess.WRITE, "youneverhackme")
	file.store_line(JSON.stringify(create_data(),"\t"))
	print(JSON.stringify(create_data(), "\t"))

func load_data():
	var file = FileAccess.open_encrypted_with_pass("user://save_game.dat", FileAccess.READ, "youneverhackme")
	var content = file.get_as_text()
	print(content)
	#return content
