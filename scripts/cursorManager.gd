extends CanvasLayer

export(Texture) var empty_cursor=null
export(Texture) var default_cursor=null

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass

func _process(delta):
	var mouseLoc=$Sprite.get_global_mouse_position()
	if(mouseLoc.x<=107 || mouseLoc.x>=256-11 || mouseLoc.y>=150-16 ||mouseLoc.y<=1):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		$Sprite.global_position=$Sprite.get_global_mouse_position() 
	if(mouseLoc.x<=107 ):
		$Sprite.global_position.x=107
	if(mouseLoc.x>=256-11):
		$Sprite.global_position.x=256-11
	if(mouseLoc.y>=150-16 ):
		$Sprite.global_position.y=150-16
	if(mouseLoc.y<=1):
		$Sprite.global_position.y=1
	
