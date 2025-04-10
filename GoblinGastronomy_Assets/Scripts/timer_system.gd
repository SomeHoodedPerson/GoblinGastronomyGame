extends Control

@onready var clock = $Timer
@onready var bar = $ProgressBar

@export var timerMax = 30

var timeLeft = 30

func _ready() -> void:
	# This sets the timer's maxinium score to the timerMax variable
	bar.max_value = timerMax
	
	
	
func timerStop():
	# This stops the clock and sets what times remain as the score
	clock.stop()
	GlobalVar.timeRemain =  timeLeft
	

func timerStart():
	# When the timer starts it sets the score potiental as the timer maxnium
	# Starts the clock, sets the time left as the timer max, and reset the bar.
	GlobalVar.scoreMax += timerMax
	clock.start()
	timeLeft = timerMax
	bar.value = timeLeft
	
	

func _on_timer_timeout() -> void:
	# Each second lowers the score by one
	# And updates the progressbar 
	if (timeLeft > 0):
		timeLeft -= 1
		bar.value = timeLeft
