extends Node2D


@onready var items = $Panel/ingred

var chopNeed = 0

func foodStart():
	
	
	
	#print(str(GlobalVar.dishList.size())) # Tessting 
	
	# This commands the item spawners going down the child list to 
	# Spawn in choppable items required for the step. Before comfirming the
	# Step is running and ready for player input
	for n in ( GlobalVar.chopList.size()):
		var choppable = ( GlobalVar.chopList.get(n) )
		items.get_child(n)._spawn(1, choppable)
		
	GlobalVar.running = true
