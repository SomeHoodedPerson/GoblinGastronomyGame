extends Panel

@onready var gradeIcon = $Control/gradeIcon
@onready var gradeLabe = $gradeText
@export var images: Array[Texture2D]
@export var words: Array[String]
var grade = 0

func calculateStep():
	var time = GlobalVar.timeRemain
	# These are the grades thresholds for each time amount
	if (time > 25):
		grade = 0 # Gobtastic
	elif (time > 20):
		grade = 1 # Great
	elif (time > 15):
		grade = 2 # Good
	elif (time > 10):
		grade = 3 # Garbage
	else:
		grade = 4 # Gobshite
		
	
	# It adds the time to the score for the step,
	# Changes the sprite to the approriate grade
	# and changes the text to the grade's set words.
	GlobalVar.scoreStep += time
	gradeIcon.texture = images[grade]
	gradeLabe.text = words[grade]
	
	
