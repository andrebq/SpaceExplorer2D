extends KinematicBody2D
class_name PlayableSpacecraft

export var debug: bool

export var velocity:Vector2 = Vector2.ZERO
export var angular_speed:float = 0
export(float, 0, 1, 0.01) var drag_coeficient:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = PI/2

func _physics_process(delta):
	print("as: ", angular_speed, " ", rotation)
	rotation += angular_speed * delta
	var _collision = move_and_collide(velocity.rotated(rotation) * delta, true)

