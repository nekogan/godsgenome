extends CharacterBody2D
class_name Player

signal died

@export var sm : StateMachine

@onready var anim_sprite = $AnimatedSprite2D
@onready var noise_area = $NoiseArea
@onready var ledge_raycast = $LedgeRayCast
@onready var crouch_raycast1 = $CrouchRayCast1
@onready var crouch_raycast2 = $CrouchRayCast2
@onready var door_raycast = $DoorRayCast
@onready var coll = $CollisionShape2D
@onready var shape = coll.get_shape()

@onready var space_state = get_world_2d().direct_space_state

var health: int

var horizontal_direction
var fall_speed: float = 0.0
var GRAVITY: int = 400

const jump_velocity = -110
const WALK_SPEED = 30
const RUN_SPEED = WALK_SPEED * 1.8
const PUSH_SPEED = WALK_SPEED / 2.5
const AIM_WALK_SPEED = 20

var can_kill: bool = false
var door: Area2D

func _ready():
	DataManager.player = self
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	SceneManager.on_trigger_player_spawn.connect(_on_spawn)

func _process(_delta):
	get_animation_info()
	health = DataManager.player_health
	if door_raycast.is_colliding() and Input.is_action_pressed("action"):
		var collider = door_raycast.get_collider().get_parent()
		collider.open = true
	death()

func _physics_process(delta):
	horizontal_direction = (
		Input.get_action_strength("right") - Input.get_action_strength("left")
	)
	# Add the gravity.
	if !is_on_floor():
		velocity.y += GRAVITY * delta * 1.8
	move_and_slide()

var facing: int = 1

func update_facing_direction():
	if Input.is_action_pressed("right"):
		ledge_raycast.scale.x = 1
		anim_sprite.flip_h = false
		facing = 1
	elif Input.is_action_pressed("left"):
		ledge_raycast.scale.x = -1
		anim_sprite.flip_h = true
		facing = -1

var current_animation
var current_frame

func get_animation_info():
	current_animation = anim_sprite.get_animation()
	current_frame = anim_sprite.get_frame()

func death():
	if health <= 0:
		DataManager.player = null
		died.emit()

func _on_spawn(pos: Vector2):
	global_position = pos
