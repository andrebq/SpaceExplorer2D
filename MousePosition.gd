extends Position2D

export var camera: NodePath
export var screen_size: NodePath
export var debug: bool

onready var camera_node = get_node(camera) as Camera2D
onready var screen_size_node = get_node(screen_size) as Position2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _input(event):
	if event is InputEventMouseMotion:
		position = event.position
		position = position - screen_size_node.position + camera_node.position

func _draw():
	if debug:
		draw_circle(Vector2.ZERO, 2, Color.aquamarine)
