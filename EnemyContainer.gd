extends Spatial


var width = 20
var height = 12

var enemy = preload("res://Enemy.tscn")
var Enemy = null
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if Enemy != null:
		Enemy.queue_free()
	Enemy = enemy.instance()
	Enemy.translation = (Vector3(randi() % width * 2, 1, randi() % height * 2))
	print(Vector3(randi() % width, -1, randi() % height))
	print(true)
	add_child(Enemy)
	
