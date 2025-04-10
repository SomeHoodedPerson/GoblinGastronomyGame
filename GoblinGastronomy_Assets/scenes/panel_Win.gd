extends Panel

@onready var gradeIcon = $gradeIcon
@export var images: Array[Texture2D]
@export var gradeImg: Array[Texture2D]
@onready var texter = $Label
@onready var sprt = $TextureRect
var max = 1
var score = 1
var grade = 1


func calculateTotal():
	
	# This sets variables to the max score and total score for the run.
	@warning_ignore("shadowed_global_identifier")
	max = GlobalVar.scoreMax
	score = GlobalVar.scoreTotal
	grade = 1
	
	# Writes the score out of max score as well as set the dish sprite
	texter.text = ("score: " + str(score) + " / " + str(max))
	sprt.texture = images[GlobalVar.dishNum]
	
	# These are the grade thresholds which is the max score divided by 5.
	
	var devi = (max / 5)
	if (score > (devi * 4)):
		# Score > 4/5 of max? Gobtastic
		grade = 0
	elif (score > (devi * 3)):
		# Score > 3/5 of max? Great
		grade = 1
	elif (score > (devi * 2)):
		# Score > 2/5 of max? Good
		grade = 2
	elif (score > (devi)):
		# Score > 1/5 of max? Garbage
		grade = 3
	else:
		# Score < 1/5 of max? Gobshite
		grade = 4
		
	# Sets the appropriate grade sprite depending on the score
	gradeIcon.texture = gradeImg[grade]
