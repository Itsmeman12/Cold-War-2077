extends KinematicBody2D

var speed = 400

func _ready():
	GlobalVariables.bulletInstanceCount += 1
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(delta * speed, 0))
	if (collidedObject):

		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			GlobalVariables.score += 100
			print(GlobalVariables.score)
			GlobalVariables.enemyInstanceCount -=1
			print (GlobalVariables.enemyInstanceCount)
			if GlobalVariables.enemyInstanceCount == 0:
				get_tree().change_scene("res://Menu/Win.tscn")
		queue_free()
