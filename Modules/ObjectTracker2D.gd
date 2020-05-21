tool
extends Node2D
class_name ObjectTracker2D

export var tracker:NodePath setget set_tracker
export var target:NodePath setget set_target
export var active:bool setget set_active
export var debug:bool
export var use_global_position:bool = true
export var rotate_tracker:bool = false
export(float, 0.01, 1, 0.01) var rotation_step:float = 0.3
export(float, 0.01, 1, 0.01) var position_step:float = 0.9

func set_tracker(value):
	tracker = value
	update()
	update_nodes()

func set_target(value):
	target = value
	update()
	update_nodes()

var tracker_node:Node2D
var target_node:Node2D

func set_active(value):
	active = value
	if active:
		update_nodes()
	update()
	set_physics_process(active)

func update_nodes():
	if active and is_inside_tree() and tracker and target:
		tracker_node = get_node(tracker)
		target_node = get_node(target)

func _ready():
	update_nodes()

func _process(delta):
	if not is_tracking() or Engine.is_editor_hint():
		# avoid changing nodes while the editor is open
		return
	update()
	
	if use_global_position:
		var distance = (tracker_node.global_position - target_node.global_position)
		if distance.length_squared() <= 0.1:
			tracker_node.global_position = target_node.global_position
			return
		
		if rotate_tracker:
			var heading = distance.normalized()
			tracker_node.rotation = lerp_angle(tracker_node.rotation, heading.angle() - PI/2, rotation_step)
		
		tracker_node.global_position = lerp(tracker_node.global_position, target_node.global_position, position_step)

func _draw():
	if is_tracking() and (debug or Engine.is_editor_hint()):
		var local_t = get_global_transform()

		draw_line(local_t.xform_inv(tracker_node.global_position), local_t.xform_inv(target_node.global_position), Color.aliceblue, 2)

func is_tracking():
	return active and target_node != null and tracker_node != null
