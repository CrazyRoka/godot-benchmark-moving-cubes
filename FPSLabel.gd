extends Label

func _process(delta: float):
	text = "FPS: " + str(Engine.get_frames_per_second())
