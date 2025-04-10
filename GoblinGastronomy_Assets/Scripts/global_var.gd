extends Node

# Ingredients
# 0 Emoty bowl
# 1 Pepper Bowl
# 2 Crisp Bowl
# 3 Lemon Vingear Bowl
# 4 Nettle Bowl
#



# Steps
# 0 Chopping
# 1 Adding
#

var dishList = [] # The dish's ingrediants
var addList = [] # The items that get added to the bowl
var chopList = [] # The items that get chopped
var steps = [] # What type of minigame each step has and how many

var scoreMax = 0 # The maxinum score for all the steps together
var scoreTotal = 0 # The total score the player has from the steps added up
var scoreStep = 0 # The total score for the step done

var timeRemain = 0 # How much time remains, used to calculate score

var running = false # Checks if the step / minigame is running, so the timer doesn't go down
var itemTotal = 0 # Item total needed to be interected with (Chopping or Adding)
var itemFin = 0 # Items finished for the step

var dishNum = 0 # THe dish that is being made

func _ready() -> void:
	# Sets the basic dish to load as the salad level
	levelGen(1)

func levelGen(ham):
	# This chart resets all values to 0 or empty
	dishList = []
	steps = 0
	scoreMax = 0
	scoreTotal = 0
	scoreStep = 0
	itemFin = 0
	itemTotal = 0
	
	# Checks what dish has been selected
	dishNum = ham
	
	if (ham == 1):
		print("Salad")
		dishList = [5, 2, 4, 3]
		chopList = [1, 2, 3]
		steps = [0, 1]
	else:
		print("alarm")
		dishList = [0]
		chopList = [0]
		steps = [0, 1]
	
