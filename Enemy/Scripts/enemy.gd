class_name Enemy
extends CharacterBody2D

signal died
signal hurt

@onready var sm = $StateMachine
@onready var anim_sprite = $AnimatedSprite2D
@onready var dngZone = $DangerZone
@onready var coll = $CollisionShape2D
@onready var hbox = $HitBox
@onready var wall_ray_cast = $WallRayCast
@onready var back = $Back
@onready var fov = $Fov
@onready var space_state = get_world_2d().direct_space_state

var GRAVITY = 400
var player_behind = false

const WALK_SPEED = 25
const RUN_SPEED = WALK_SPEED * 1.8

var target: Player
var attackzone_target: Player
var can_roar: bool = false

func _process(_delta):
	get_animation_info()
	hurting()
	death()

func _physics_process(delta):
	if target is Player:
		if target.global_position.x < self.global_position.x and facing == 1:
			_set_facing(-1)
		elif target.global_position.x > self.global_position.x and facing == -1:
			_set_facing(1)
	update_facing_direction()
	# Add the gravity.
	if !is_on_floor():
		velocity.y += GRAVITY * delta * 2.5
	move_and_slide()

var health: int = 2: set = _set_damage

func _set_damage(value: int):
	is_hurting = true
	health -= value

var is_hurting: bool

func hurting():
	if is_hurting:
		velocity = Vector2(0,0)
		hurt.emit()
		is_hurting = false

##-1 = ЛЕВО; 1 = ПРАВО
@export var facing: int: set = _set_facing

func _set_facing(value: int):
	facing = value

# Определяет куда смотрит
func update_facing_direction():
	if facing == -1: # Смотрит на ЛЕВО
		fov.target_position.x = -75
		anim_sprite.flip_h = false
		wall_ray_cast.target_position.x = -15
		dngZone.position.x = -5
		back.position.x = 11
	elif facing == 1: # Смотрит на ПРАВО
		fov.target_position.x = 75
		anim_sprite.flip_h = true
		wall_ray_cast.target_position.x = 15
		dngZone.position.x = 5
		back.position.x = -11

var current_frame
var current_animation

func get_animation_info():
	current_frame = anim_sprite.get_frame()
	current_animation = anim_sprite.get_animation()


func death():
	if health <= 0:
		died.emit()
