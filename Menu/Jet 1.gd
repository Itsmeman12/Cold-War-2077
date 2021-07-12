extends Control

onready var ScoreLabel = $Jet2/Jet3/Score

func _ready():
	for button in $"Jet2/Jet3/Button".get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])
	GlobalVariables.score = 0
	set_physics_process(true)
	
func _on_button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)

func _physics_process(delta):
	ScoreLabel.text = str(GlobalVariables.score)
	if GlobalVariables.score > GlobalVariables.highscore:
		GlobalVariables.highscore = GlobalVariables.score
