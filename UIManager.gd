extends CanvasLayer

signal add_cubes(amount: int)

@onready var add_100_button: Button = $Add100Button
@onready var add_1000_button: Button = $Add1000Button

func _ready():
	add_100_button.pressed.connect(_on_add_100_cubes_pressed)
	add_1000_button.pressed.connect(_on_add_1000_cubes_pressed)

func _on_add_100_cubes_pressed():
	emit_signal("add_cubes", 100)
	
func _on_add_1000_cubes_pressed():
	emit_signal("add_cubes", 1000)
