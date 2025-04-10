extends Node2D

@onready var items = $ingred


var bowlItems: Array = []

func foodStart():
	# This commands the item spawners going down the child list to 
	# Spawn in choppable items required for the step. Before comfirming the
	# Step is running and ready for player input
	for n in ( GlobalVar.dishList.size()):
		var addable = ( GlobalVar.dishList.get(n) )
		# This adds the ingredent to the board
		items.get_child(n)._spawn(0, addable)
	GlobalVar.running = true
	#print("am running adder")
		

func _on_detect_body_entered(body: Node2D) -> void:
	
	# This deletes dragable object upon contact and adds to the items finished
	if body.is_in_group("dragItem"):
		# Increasesn the amount of finished items
		GlobalVar.itemFin += 1 
		# This deletes the ingredient when it is dragged onto it
		body.queue_free()
		
