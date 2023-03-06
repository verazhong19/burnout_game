extends Control
onready var code_button = $code
onready var git_button = $git
onready var art_button = $art
onready var model_button = $model
onready var engine_button = $engine
onready var task = $"../Task"
onready var validation = $"../Validation"

func _ready():
	code_button.connect("pressed", self, "_button_pressed",[code_button])
	git_button.connect("pressed", self, "_button_pressed", [git_button])
	art_button.connect("pressed", self, "_button_pressed", [art_button])
	model_button.connect("pressed", self, "_button_pressed", [model_button])
	engine_button.connect("pressed", self, "_button_pressed", [engine_button])
	
func _button_pressed(button):
#	checkTask()
#	print(button.text)
	if(task.text == button.text):
		print("correct task")
		validation.text = "correct task"
	else:
		print("wrong task")
		validation.text = "wrong task"
