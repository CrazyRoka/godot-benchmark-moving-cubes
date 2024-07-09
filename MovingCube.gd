extends MeshInstance3D

var destination: Vector3

func _ready():
	set_new_destination()

func set_new_destination():
	destination = Vector3(randf_range(-10, 10), randf_range(-10, 10), randf_range(-10, 10))

func move_towards_destination(delta: float):
	if position.distance_to(destination) < 0.1:
		set_new_destination()
	position = position.move_toward(destination, delta)
