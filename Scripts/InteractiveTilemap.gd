extends Node2D

onready var PuzzleBoardTileMap: TileMap = $PuzzleBoard
onready var InteractablesTileMap: TileMap = $Interactables

var NODESCALE: Vector2 =  self.scale
var interactableNodes: Dictionary = {
#	FORMAT
#	TILE INDEX : SCENE ABSOLUTE PATH
	1: preload("res://GameObjects/InteractableItems/Key.tscn"),
	2: preload("res://GameObjects/InteractableItems/Door.tscn"),
	5: preload("res://GameObjects/Entity/Player.tscn")
}

func _ready():
	for cellPosition in InteractablesTileMap.get_used_cells():
		var cell: int = InteractablesTileMap.get_cellv(cellPosition)
		if interactableNodes.has(cell):
			var objectNode: Node = interactableNodes[cell].instance()
			objectNode.position = InteractablesTileMap.map_to_world(cellPosition)
			add_child(objectNode)
			InteractablesTileMap.set_cellv(cellPosition, -1)
