extends Node

var currentHealth
var newHealth
var currentTaskTime
var newTaskTime
var timer = 10
onready var damage_button = $damage_button
var taskTimer = 1
var taskActive =  false
var full=190

func _ready():
	damage_button.connect("pressed", self, "_button_pressed")

	
func _process(delta):
	currentHealth = get_node("TextureProgress").get_value()
	if currentHealth <full:
		timer -= delta
		if timer < 0:
			print('heal!')
			passiveHeal()
			timer = 1
	
	if currentHealth == 0:
		get_tree().change_scene("res://GameOver.tscn")
	
	if taskActive == true:	
		taskTimer -= delta
		if taskTimer < 0:
			taskInProgress()
			taskTimer = 1
	

func _button_pressed():
	setDamage()


	

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


	
