extends KinematicBody2D

var Bullet = preload("res://Bullet.tscn")

var speed = 300

func _ready():
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if GlobalVariables.bulletInstanceCount < 50:
			var BulletInstance = Bullet.instance()
			BulletInstance.position = Vector2(position.x + 70 ,position.y)
			get_tree().get_root().add_child(BulletInstance)
#The code above is for the players shooting the bullet. the 'if input' statement is for the game to read if the chosen button is pressed it fires the bullet. 
#the global varaibale is how the game reads how many bullets can be spawned in when the chosen button is pressed.
#The bulletinstance.postition is the game is told where the bullet is spawned in where the player is to load the bullet and have it shoot in that direction.

func  _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -speed * delta))
	elif Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, speed * delta))
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta,  0))
#The code above is how to game reads the arrow keys are presed and moves in the direction is pressed. 
#For example 'ui_up' is the term for the up arrow key and when its pressed the player can move up. 

func _colliding(area):
	if area.is_in_group("left"):
		print("left")
		position.x=90
	if area.is_in_group("right"):
		print("right")
		position.x=900
	if area.is_in_group("up"):
		print("up")
		position.y=90
	if area.is_in_group("down"):
		print("down")
		position.y=500
#The func_colliding(area) code is the players collison box reacting the to the games borders code and stops the player from moving through the collison boxes.

func _not_colliding(area):
	pass
