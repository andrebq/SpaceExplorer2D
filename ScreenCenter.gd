tool
extends Position2D


func _ready():
	pass # Replace with function body.

func _process(_delta):
	var center = get_viewport_rect().size / 2;
	self.position = center
