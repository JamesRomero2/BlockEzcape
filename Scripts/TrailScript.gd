extends Node2D

export var MAX_LENGTH: float = 5.0
export var THICKNESS: float = 2.0

var points: Array = []
var frame: int = 0

func _physics_process(_delta):
	if frame % 3 == 0:
		points.push_front(global_position)
		if points.size() > MAX_LENGTH:
			points.pop_back()
	
	frame += 1
	
	update()
	
func _draw():
	if points.size() < 2:
		return
		
	var antialias: bool = false
	var c = modulate
	var s: float = float(points.size())
	var adjusted: Array = PoolVector2Array()
	var colors: Array = PoolColorArray()
	
	for i in range(s):
		adjusted.append(points[i] - global_position)
		c.a = lerp(1.0, 0.0, i/s)
		colors.append(c)
		
	draw_set_transform(Vector2(0,0), -get_parent().rotation, Vector2(1,1))
	draw_polyline_colors(adjusted, colors, THICKNESS, antialias)
