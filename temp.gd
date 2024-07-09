extends Node
 #Переменные для области видимости
#var fov_center = Vector2(0,0)
#var fov_angle_from = -5
#var fov_angle_to = 5
#var fov_radius: int = 140
#
#var fov_zone = Area2D.new()
#var shape_zone = CollisionPolygon2D.new()
#var points_arc = PackedVector2Array()
#
## Рисует окружность по заданным параметрам
#func circle_arc_poly(center, radius, angle_from, angle_to):
	#points_arc = []
	#var nb_points = 8
	#points_arc.push_back(center)
	#for i in range(nb_points):
		#var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points)
		#var params = PhysicsRayQueryParameters2D.new()
		#params.from = self.global_position
		#params.to = angle_to
		#params.exclude = []
		#params.collision_mask = 1
		#var result = space_state.intersect_ray(params)
		#if result:
			#points_arc.append(result.position)
		#else:
			#points_arc.append(angle_to)
		##points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	#shape_zone.polygon = points_arc
#
## Добавляет Node "область видимости"
#func add_fov_area():
	##circle_arc_poly(fov_center, fov_radius, fov_angle_from, fov_angle_to)
	#fov_zone.collision_layer = 8
	#fov_zone.collision_mask = 4
	#fov_zone.add_child(shape_zone)
	#
	#fov_zone.area_entered.connect(fov_area_entered)
	#fov_zone.area_exited.connect(fov_area_exited)
#
	#add_child(fov_zone)
#
#func fov_area_entered(area):
	#if area.name == "HitBox":
		#target = area.get_parent()
#
#func fov_area_exited(area):
	#if area.name == "HitBox":
		#target = null






#func circle_arc_poly(center, radius, angle_from, angle_to):
	#print(points_arc)
	#points_arc = []
	#var nb_points = 16
	#points_arc.push_back(center)
	#for i in range(nb_points + 1):
		#var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		#points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	#shape_zone.polygon = points_arc
	








#var zone_rotate = -3.1
#@onready var space_state = get_world_2d().direct_space_state
#var FOV_increment = 2 * PI / 60
#
#func get_FOV_cone(from:Vector2,radius,width:float,angle):
	#var start_angle = angle - width/2
	#var end_angle = angle + width/2
	#var points = raycast_arc(from,radius,start_angle,end_angle)
	#points.append(from)
	#$FovArea/FOV.polygon = points
#
#var result
#func raycast_arc(from:Vector2,radius,start_angle,end_angle):
	#var angle = start_angle
	#var points = PackedVector2Array()
	#while angle < end_angle:
		#var offset = Vector2(radius,0).rotated(angle)
		#var to = from + offset
		#var params = PhysicsRayQueryParameters2D.create(global_position, global_position + Vector2(0,50))
		#result = space_state.intersect_ray(params)
		#if result:
			#points.append(result.position)
		#else:
			#points.append(to)
		#angle += FOV_increment
	#return points
