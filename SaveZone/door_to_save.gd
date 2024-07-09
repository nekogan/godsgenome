extends Area2D

@export var level_tag: String
@onready var spawn = $Spawn
@onready var lbl = $Label
var player: Player

func _ready():
	if SceneManager.door_tag != null:
		_on_level_spawn()

func _process(_delta):
	if player != null and Input.is_action_just_pressed("action"):
		SceneManager.switch_scene(level_tag)

func _on_level_spawn():
	SceneManager.trigger_player_spawn(spawn.global_position)

func _on_body_entered(body):
	if body is Player:
		player = body
		lbl.text = "Нажми Е"

func _on_body_exited(body):
	if body is Player:
		player = null
		lbl.text = ""
