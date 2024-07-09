extends Area2D

@onready var parent = get_parent()
var increment = 2 * PI / 90

func _physics_process(_delta):
	set_area(raycast_arc(global_position, _radius, increment, 2 * PI))

var _radius: float = 0.0: set = _set_radius
func _set_radius(value: float):
	_radius = value

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

func _on_body_entered(body):
	var groups = body.get_groups()
	for i in range(groups.size()):
		var group = groups[i]
		if group == "enemies":
			if body.target == null:
				body.target = parent
				body.can_roar = true
