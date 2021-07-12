extends KinematicBody2D

var speed = -400

func _ready():
	GlobalVariables.enemyBulletInstanceCount += 1
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(delta * speed, 0))
	if (collidedObject):

		if "The Jet" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			GlobalVariables.TheJetInstanceCount -= 1
			print (GlobalVariables.TheJetInstanceCount)
			if GlobalVariables.TheJetInstanceCount == 0:
				get_tree().change_scene("res://Menu/Lose.tscn")
		queue_free()
