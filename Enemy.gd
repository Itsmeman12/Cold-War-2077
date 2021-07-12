extends KinematicBody2D

var Bullet = preload("res://Menu/EnemyBullet.tscn")

var speed = 150

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	print("here")
	if area.is_in_group("left"):
		get_parent().global_position.y += -10
		get_parent().speed = get_parent().speed * 1

func _process(delta):
		yield(get_tree().create_timer(3.0), "timeout")
		if GlobalVariables.enemyBulletInstanceCount < 3:
			var BulletInstance = Bullet.instance()
			BulletInstance.position = Vector2(global_position.x -70,global_position.y)
			get_tree().get_root().add_child(BulletInstance)
