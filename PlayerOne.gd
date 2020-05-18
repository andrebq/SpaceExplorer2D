extends Node

var velocity = Vector2.ZERO

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("Forward"):
		velocity = Vector2.UP * 10
	elif Input.is_action_pressed("Backward"):
		velocity = Vector2.DOWN * 10

	if Input.is_action_pressed("Left"):
		velocity = velocity + Vector2.LEFT * 10
	elif Input.is_action_pressed("Right"):
		velocity = velocity + Vector2.RIGHT * 10
	
	if velocity != Vector2.ZERO:
		update_position(delta)

func update_position(delta:float):
	print("update pos")
	$TargetPosition.global_position = $PlayableSpacecraft.global_position + velocity
