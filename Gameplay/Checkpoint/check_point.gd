extends Area2D

@onready var lbl = $Label

var is_player_enter: bool

func _process(_delta):
	if is_player_enter and Input.is_action_just_pressed("action"):
		DataManager.save(var_to_str(global_position))

func _on_body_entered(body):
	if body is Player:
		lbl.text = "Сохраниться\nE"
		is_player_enter = true

func _on_body_exited(body):
	if body is Player:
		is_player_enter = false
		lbl.text = ""
