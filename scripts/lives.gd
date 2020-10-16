extends Node2D

var livesLost = 0

func removeLife() :
	livesLost = livesLost+1
	get_node("life"+str(livesLost)).modulate.a = 0.5
