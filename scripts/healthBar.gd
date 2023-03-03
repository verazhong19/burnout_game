extends Node

var currentHealth
var newHealth
var currentTaskTime
var newTaskTime
var timer = 1
onready var damage_button = $damage_button
onready var task = get_node("/root/TaskManager")
var taskTimer = 1
var taskActive =  false
onready var taskLabel= $Task
onready var assigner = $AssignedBy
onready var message = $Message
onready var due = $Due


func _ready():
	damage_button.connect("pressed", self, "_button_pressed")
	print(task.availableTasks[0]["task"])

	
func _process(delta):
	var full=190
	currentHealth = get_node("TextureProgress").get_value()
	if currentHealth <full:
		timer -= delta
		if timer < 0:
			#print('heal!')
			passiveHeal()
			timer = 1
	
	if currentHealth == 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
	
	if taskActive == true:	
		taskTimer -= delta
		if taskTimer < 0:
			taskInProgress()
			taskTimer = 1
	

func _button_pressed():
	setDamage()
	taskLabel.text = task.availableTasks[0]["task"]
	assigner.text = task.availableTasks[0]["assignedBy"]
	message.text = task.availableTasks[0]["message"]


	

func setDamage():
	currentHealth = get_node("TextureProgress").get_value()
	newHealth = get_node("TextureProgress").set_value(currentHealth - 40)

func passiveHeal():
	currentHealth = get_node("TextureProgress").get_value()
	newHealth = get_node("TextureProgress").set_value(currentHealth + 10)
	
func taskRun():
	taskActive = true
	
func taskInProgress():
	currentTaskTime = get_node("ProgressBar").get_value()
	newTaskTime = get_node("ProgressBar").set_value(currentTaskTime + 1)

