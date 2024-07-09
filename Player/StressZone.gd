extends Area2D

@onready var parent = get_parent()
var increment = 2 * PI / 30

func _physics_process(_delta):
	if parent.stress_level < 100.0:
		if enemy_counter > 0:
			parent.stress_level += enemy_counter * parent.stress_mod_enemy
		else:
			parent.stress_level += parent.stress_mod_no_enemy

	set_area(raycast_arc(global_position, 60, increment, 2 * PI))

func raycast_arc(from: Vector2, radius, start_angle, end_angle):
	var points = PackedVector2Array()
	var angle = start_angle
	while angle < end_angle:
		var offset = Vector2(radius,0).rotated(angle)
		var to = from + offset
		var params = PhysicsRayQueryParameters2D.create(from, to, 3)
		var result = parent.space_state.intersect_ray(params)
		if result:
			points.append(to_local(result.position))
		else:
			points.append(to_local(to))
		angle += increment
	return points

func set_area(points: PackedVector2Array):
	$CollisionPolygon2D.polygon = points

var enemy_counter: int = 0

func _on_body_entered(body):
	if body is Enemy:
		enemy_counter = get_overlapping_bodies().size()
