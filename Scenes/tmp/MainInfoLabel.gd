extends Label

func _process(_delta):
	var format_txt = "Current Scene: %s
		FPS: %d
		Current State: %s
		Previos State: %s
		Здоровье: %s"
	if DataManager.player is Player:
		var txt = format_txt % [DataManager.current_scene.name,
			Engine.get_frames_per_second(),
			DataManager.player.sm.current_state.name,
			DataManager.player.sm.prev_state,
			var_to_str(DataManager.player_health)]
		text = txt
