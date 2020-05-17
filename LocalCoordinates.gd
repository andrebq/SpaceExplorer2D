tool
extends Node2D

export(float, 10, 200, 0.5) var gizmo_size = 10 setget set_gizmo_size;

func set_gizmo_size(value):
	gizmo_size = value
	update()

func _ready():
	visible = false
	pass

func _draw():
	draw_line(Vector2.DOWN * gizmo_size, Vector2.UP * gizmo_size, Color.green, 2, true)
	draw_line(Vector2.LEFT * gizmo_size, Vector2.RIGHT * gizmo_size, Color.red, 2, true)
	
	draw_circle(Vector2.UP * gizmo_size, 3, Color.green)
	draw_circle(Vector2.RIGHT * gizmo_size, 3, Color.red)
