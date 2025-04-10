extends Marker2D
@onready var obsDrag = preload("res://entities/drag_object.tscn")
@onready var obsChop = preload("res://entities/chop_object.tscn")

# Item Types
# 0 = drag
# 1 = Chop


# This code spawns in the items for the chopping board and adding bowl minigames
func _spawn(type, img):
	# this decides what type of item to add (Chopable or Dragable object)
	var newThing
	if (type == 0):
		newThing = obsDrag.instantiate()
	elif (type == 1):
		newThing = obsChop.instantiate()
	else:
		newThing = obsChop.instantiate()
	
	# This sets the position and sprite of the ingrediant
	newThing.sprNum = img
	newThing.global_position = self.global_position
	
	# This adds the item
	self.add_child(newThing)
	
