extends KinematicBody2D

export var debug: bool

export var velocity:Vector2 = Vector2.ZERO
export(float, 0, 1, 0.01) var drag_coeficient:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	var _collision = move_and_collide(velocity, true)
	rotation = velocity.angle() + PI/2
