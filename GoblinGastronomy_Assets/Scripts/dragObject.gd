extends RigidBody2D

@export var images: Array[Texture2D]

@onready var sprite = $objSprite

var dragging: bool = false
var offs = Vector2(0,0)
var sprNum = 0

# Used Gwizz's Drag object code here
# "Godot 4 Object Drag Tutorial" https://www.youtube.com/watch?v=3ThOxFZcie0

func _ready() -> void:
	# Sets this on the top layer, which means this doesn't move with the parent
	# Also adds 1 to the item total for the step
	top_level = true
	GlobalVar.itemTotal += 1
	#print(str(sprNum) + " Drag")
	
	# This sets the texture to whats sprite number is required
	sprite.texture = images[sprNum]

func _process(_delta: float) -> void:
	# If the minigame step is running...
	if GlobalVar.running == true:
	# Moves the object with the mouse and offset by its position
		if (dragging == true):
			position = get_global_mouse_position()  - offs

func _on_obj_touch_button_down() -> void:
	# If the minigame step is running...
	if GlobalVar.running == true:
		# Checks if the object has been click and dragged
		dragging = true
		# Also makes an offset value
		offs = get_global_mouse_position() - self.global_position

func _on_obj_touch_button_up() -> void:
	# If the minigame step is running...
	if GlobalVar.running == true:
		# Checks if the object has been let go
		dragging = false
