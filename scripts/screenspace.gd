extends Area2D

func _on_screenspace_body_exited(body):
	if body.position.x > 64 :
		body.position.x = 0
	if body.position.x < 0 :
		body.position.x = 64
	if body.position.y > 64 :
		body.position.y = 7
	if body.position.y < 7 :
		body.position.y = 64
