extends Node

export var camera: NodePath setget set_camera
onready var camera_node:Camera2D = get_node(camera)

export var target: NodePath setget set_target
onready var target_node:Node2D = get_node(target)

func set_camera(value):
	camera = value
	if is_inside_tree():
		camera_node = get_node(camera) as Camera2D

func set_target(value):
	target = value
	if is_inside_tree():
		target_node = get_node(target) as Node2D

func _process(delta):
	if target_node and camera_node:
		camera_node.position = lerp(camera_node.position, target_node.position, 0.9)
