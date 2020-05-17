extends Area2D


export var starting_point: NodePath
export var look_to: NodePath setget set_look_to
export var debug: bool

var heading: Vector2

func set_look_to(value):
	look_to = value
	look_to_node = null

var look_to_node:Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if starting_point:
		self.global_position = (get_node(starting_point) as Node2D).global_position

func _physics_process(delta):
	refresh_nodes()
	if look_to_node:
		var distance = (self.global_position - look_to_node.global_position)
		var heading = distance.normalized()
		rotation = lerp_angle(rotation, heading.angle() - PI/2, 0.3)
		
		global_position = lerp(global_position, look_to_node.global_position, 0.9 * delta)

func refresh_nodes():
	if not look_to_node and look_to:
		look_to_node = get_node(look_to) as Node2D
	
	
