extends Node3D

@onready var cube_template: MeshInstance3D = $CubeTemplate
@onready var ui: CanvasLayer = $UI
@onready var cube_counter: Label = $UI/CubeCountLabel
@onready var ui_manager: CanvasLayer = $UI

var cubes: Array = []

func _ready():
	cube_template.visible = false
	ui_manager.connect("add_cubes", Callable(self, "add_cubes"))

func _process(delta: float):
	move_cubes(delta)

func move_cubes(delta: float):
	for cube in cubes:
		cube.move_towards_destination(delta)

func add_cubes(amount: int):
	for i in range(amount):
		var new_cube: MeshInstance3D = cube_template.duplicate()
		new_cube.visible = true
		new_cube.position = Vector3(randf_range(-10, 10), randf_range(-10, 10), randf_range(-10, 10))
		new_cube.set_new_destination()
		add_child(new_cube)
		cubes.append(new_cube)
	
	cube_counter.update_count(cubes.size())
