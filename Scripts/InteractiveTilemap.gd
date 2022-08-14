extends Node2D

onready var PuzzleBoardTileMap = $PuzzleBoard
onready var InteractablesTileMap = $Interactables

const keyNode = preload("res://GameObjects/InteractableItems/Key.tscn")

var NODESCALE =  self.scale

func _ready():
	for cellPosition in InteractablesTileMap.get_used_cells():
		var cell = InteractablesTileMap.get_cellv(cellPosition)
		if cell == 0:
			var object = keyNode.instance()
			object.position = InteractablesTileMap.map_to_world(cellPosition)
			add_child(object)
			InteractablesTileMap.set_cellv(cellPosition, -1)



#export(Dictionary) var Tile_Scenes := {
#	0: preload("res://GameObjects/InteractableItems/Key.tscn")
#}
#
#var halfCellSize := Vector2()
#
#func _ready():
#	halfCellSize = cell_size * get_parent().scale
#	print(halfCellSize)
#	yield(get_tree(), "idle_frame")
#	_replaceTilesWithScene()
#
#func _replaceTilesWithScene(scene_dictionary: Dictionary = Tile_Scenes):
#	for tile_pos in get_used_cells():
#		var tile_id = get_cell(tile_pos.x, tile_pos.y)
#
#		if scene_dictionary.has(tile_id):
#			var object_scene = scene_dictionary[tile_id]
#			_replaceTilesWithObject(tile_pos, object_scene)
#
#func _replaceTilesWithObject(tile_pos: Vector2, object_scene: PackedScene, parent: Node = get_tree().current_scene):
#	if get_cellv(tile_pos) != INVALID_CELL:
#		set_cellv(tile_pos, -1)
#		update_bitmask_region()
#
#	if object_scene:
#		var object = object_scene.instance()
#		var object_pos = map_to_world(tile_pos) + halfCellSize
#
#		parent.add_child(object)
#		object.global_position = object_pos
