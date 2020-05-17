extends Position2D

export var mouse_position: NodePath

func _ready():
	pass

func _input(event):
	if mouse_position and event.is_action("Click"):
		position = (get_node(mouse_position) as Position2D).position
