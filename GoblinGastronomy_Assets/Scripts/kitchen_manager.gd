extends Node

var stepsCur = 0
@onready var stepsObj = $steps
@onready var side = $CC/Control/Side
@onready var center = $CC/Control/center

@onready var gradePanel = $CC/Control/gradePanel
@onready var winPanel = $CC/Control/winPanel
@onready var timer = $TimerSys

@onready var texter = $instLabel

var ingredients: Array = []




func _ready() -> void:
	# This hides all the panels 
	winPanel.hide()
	gradePanel.hide()
	
	organizeSteps()
	bringStep()
	
	

func _process(_delta: float) -> void:
	if ((GlobalVar.itemFin ==  GlobalVar.itemTotal) && (GlobalVar.running == true)):
		GlobalVar.running = false
		stepDone()
		
		
	
# This showcases the grading panel when the timer stops
func stepDone():
	#GlobalVar.running = false
	timer.timerStop()
	gradePanel.show()
	gradePanel.calculateStep()
	
	
# This controls when the steps change
func stepChange():
	# This changes the step, adding one to the current step, setting 
	# the finished and total items to 0 and the score of the step to 0.
	# Then it organizes and moves the step needed
	stepsCur += 1
	GlobalVar.itemTotal = 0
	GlobalVar.itemFin = 0
	GlobalVar.scoreStep = 0
	organizeSteps()
	bringStep()
	
		
func organizeSteps():
	# This organizes the minigame areas by moving them to a spot off to the side
	for o in range (stepsObj.get_child_count()):
		stepsObj.get_child(o).hide()
		stepsObj.get_child(o).global_position = side.global_position
	
func bringStep():
	# This hids the grading panel
	gradePanel.hide()
	# This checks if there are still steps to do
	if stepsCur < GlobalVar.steps.size():
		# It moves on to the next step if there are more to be done
		# What type of minigame the step has is gotten from the Global Variables
		var stepNum = GlobalVar.steps[stepsCur]
		if ( stepNum == 0):
			# This brings out the chopping step to the center and starts it
			stepsObj.get_child(0).global_position = center.global_position
			stepsObj.get_child(0).foodStart()
			stepsObj.get_child(0).show()
			texter.text = "Click on the items to chop!"
			timer.timerStart()
		elif ( stepNum == 1):
			# This brings out the adding step to the center and starts it
			stepsObj.get_child(1).global_position = center.global_position
			stepsObj.get_child(1).foodStart()
			stepsObj.get_child(1).show()
			texter.text = "Drag the items into the bowl!"
			timer.timerStart()
		else:
			# TIf callout is unknown, it will go to chopping task and activate it
			stepsObj.get_child(0).global_position = center.global_position
			stepsObj.get_child(0).foodStart()
			stepsObj.get_child(0).show()
			texter.text = "Click on the items to chop!"
			timer.timerStart()
	else:
		# Shows the win panel if all steps are done
		
		winPanel.show()
		winPanel.calculateTotal()
		
	
	



func _on_pro_pressed() -> void:
	# On the Progression button on the grade panel is pressed.
	# It adds the step score  to the dish score before changing the step
	GlobalVar.scoreTotal += GlobalVar.scoreStep
	stepChange()
