extends Node2D

@export var images: Array[Texture2D]
@export var imagesChop: Array[Texture2D]

@onready var sprite = $objSprite
@onready var part = $particle 
var hpMax = 3
var hp = hpMax
var sprNum = 0

var chopped = false

func _ready() -> void:
	top_level = true
	# This sets the texture to whats sprite number is required
	GlobalVar.itemTotal += 1
	#print("Hi I'm choppy!")
	print(str(sprNum) + " Chop")
	sprite.texture = images[sprNum]

func _on_button_pressed() -> void:
	# These are testing print functions...
	#print(str(GlobalVar.itemTotal) + " Items Total")
	#print(str(GlobalVar.itemFin) + " Items FInish")
	
	#This Checks if the chop item is chopped yet and the step is running
	if (GlobalVar.running == true && chopped == false):
		#print("Le Chop, " + str(hp))
		
		#If the hp is more than 0 when clicked, it will remove 1 hp and activate the particles
		if (hp > 0):
			hp -= 1
			part.emitting = true
			
		#print("Chop Fin")
		# If the hp is 0 or lower, it changes the sprite to the chopped version
		# Setting it as being chopped, and adding 1 to the items finished for the step
		if hp <= 0:
			sprite.texture = imagesChop[sprNum]
			GlobalVar.itemFin += 1
			chopped = true
