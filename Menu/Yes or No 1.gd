extends Control

func _ready():
	for button in $"Yes or No 2/Yes or No 3".get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])

func _on_button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
