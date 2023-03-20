extends Node

var currentHealth
var newHealth
var currentTaskTime
var newTaskTime
var timer = 1
onready var damage_button = $damage_button
var taskTimer = 1
var taskActive =  false
onready var task = get_node("/root/TaskManager")
onready var taskLabel = $Task
onready var assigner = $AssignedBy
onready var message = $Message
var taskSeed
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var totalActiveTasks
var activeTasks = []

var regMouse = preload("res://assets/cursor/cursor.png")
var hoverMouse = preload("res://assets/cursor/hover.png")


func _ready():
	damage_button.connect("pressed", self, "_button_pressed")

	
func _process(delta):
	var full=190
	currentHealth = get_node("TextureProgress").get_value()
	if currentHealth <full:
		timer -= delta
		if timer < 0:
			#print('heal!')
			passiveHeal()
			timer = 1
	hover()
	
	if currentHealth <= 0:
		print('die!')
		get_tree().change_scene("res://scenes/GameOver.tscn")
	
		
		
func _button_pressed():
	setDamage()
	assignTask()
	print(activeTasks)
	for task in activeTasks:
			var task_key = task["task"]
			var label = Label.new()
			label.text = task_key
			$VBoxContainer.add_child(label)
	
	
func hover():
	var buttons=get_node("Tasks")
	if(buttons.get_node("code").is_hovered() ||buttons.get_node("git").is_hovered() ||buttons.get_node("art").is_hovered() ||buttons.get_node("model").is_hovered() ||buttons.get_node("engine").is_hovered() || buttons.get_node("mailbox").is_hovered()):
		get_node("cursorManager/Sprite").set_texture(hoverMouse)
	else:
		get_node("cursorManager/Sprite").set_texture(regMouse)
	

	
func assignTask():
	taskSeed = rng.randi_range(0, task.availableTasks.size()-1)
	activeTasks.append(task.availableTasks[taskSeed])
	taskActive = true
	taskLabel.text = task.availableTasks[taskSeed]["task"]
	assigner.text = task.availableTasks[taskSeed]["assignedBy"]
	message.text = task.availableTasks[taskSeed]["message"]


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


	
	
