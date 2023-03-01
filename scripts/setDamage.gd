extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentHealth
var newHealth
var timer = 1
onready var damage_button = $damage_button

func _ready():
	damage_button.connect("pressed", self, "_button_pressed")
	
func _process(delta):
	currentHealth = get_node("TextureProgress").get_value()
	if currentHealth <100:
		timer -= delta
		if timer < 0:
			print('heal!')
			passiveHeal()
			timer = 1

	if currentHealth == 0:
		get_tree().change_scene("res://GameOver.tscn")

func _button_pressed():
	setDamage()
	

func setDamage():
	currentHealth = get_node("TextureProgress").get_value()
	newHealth = get_node("TextureProgress").set_value(currentHealth - 10)

func passiveHeal():
	currentHealth = get_node("TextureProgress").get_value()
	newHealth = get_node("TextureProgress").set_value(currentHealth + 1)



	
