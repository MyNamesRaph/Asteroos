extends KinematicBody2D

var speed = 500;
var velocity = Vector2()
onready var poly = $Polygon2D
onready var timer = $Timer
var isDead = false
var fadeOut = 1.0

func create(pos, dir) :
	position = pos
	velocity = Vector2(speed,0).rotated(dir)

func _process(delta):
	if isDead :
		fadeOut -= 0.2
	poly.modulate.a = fadeOut
	if fadeOut <= 0 :
		queue_free()
	
func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision :
		if collision.collider.is_in_group("asteroid") :
			collision.collider.explode()
			queue_free()
			
func _on_Timer_timeout():
	isDead = true
