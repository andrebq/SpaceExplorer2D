extends Node

export var spacecraft:NodePath setget set_spacecraft
onready var spacecraft_node:PlayableSpacecraft = get_node(spacecraft) as PlayableSpacecraft

export(float, 0, 1000, 10) var linear_speed:float = 100
export(float, 0, 360, 1) var angular_speed:float = 10

func set_spacecraft(value):
	spacecraft = value
	spacecraft_node = null

func update_node():
	if is_inside_tree() and not spacecraft_node:
		spacecraft_node = get_node(spacecraft)

func _ready():
	pass # Replace with function body.

func _process(delta):
	update_node()
	
	if not spacecraft_node:
		return
		
	if Input.is_action_pressed("Forward"):
		spacecraft_node.velocity = Vector2.UP * linear_speed
	else:
		spacecraft_node.velocity = Vector2.ZERO
	
	if Input.is_action_pressed("Left"):
		spacecraft_node.angular_speed = deg2rad(-angular_speed)
	elif Input.is_action_pressed("Right"):
		spacecraft_node.angular_speed = deg2rad(angular_speed)
	else:
		spacecraft_node.angular_speed = 0
