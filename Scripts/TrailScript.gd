extends Line2D

export(int) var length = 10
var point := Vector2()

func _process(delta):
	global_position = get_parent().global_position
	global_scale = get_parent().global_scale
	global_rotation = 0.0
	
	print(global_position)
	print(get_parent().global_position)
	
	
	point = get_parent().global_position
	
	add_point(point)
	while get_point_count() > length:
		remove_point(0)
