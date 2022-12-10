extends Spatial


var speed = 10
var direction = Vector3(1, 0, 0)
var previous_direction = Vector3.ZERO
var second_previous_direction = Vector3.ZERO

var allDir = [Vector3(1, 0, 0), Vector3(0, 0, -1), Vector3(0, 0, 1), Vector3(-1, 0, 0)]
var avaDir = allDir

# Called when the node enters the scene tree for the first time.
func _ready():
	$Rays/Back.add_exception(get_node_or_null("/root/Game/Player"))
	$Rays/Left.add_exception(get_node_or_null("/root/Game/Player"))
	$Rays/Right.add_exception(get_node_or_null("/root/Game/Player"))
	$Rays/Forward.add_exception(get_node_or_null("/root/Game/Player"))


func _physics_process(delta):
	avaDir = []
	for x in allDir:
		avaDir.append(x)
	if $Rays/Back.is_colliding():
		avaDir.remove(avaDir.find(Vector3(-1, 0, 0), 0))
	if $Rays/Forward.is_colliding():
		avaDir.remove(avaDir.find(Vector3(1, 0, 0), 0))
	if $Rays/Left.is_colliding():
		avaDir.remove(avaDir.find(Vector3(0, 0, -1), 0))
	if $Rays/Right.is_colliding():
		avaDir.remove(avaDir.find(Vector3(0, 0, 1), 0))
	if avaDir.size() > 0:
		if not avaDir.has(direction):
			pickDir()
	else:
		direction = -direction
	
	translate(direction * speed * delta)
	
func pickDir():
	var rand = randi() % avaDir.size()
	second_previous_direction = previous_direction
	previous_direction = direction
	if avaDir[rand] == -previous_direction:
		rand = randi() % avaDir.size()
		if avaDir[rand] == -second_previous_direction:
			rand = randi() % avaDir.size()
	if avaDir[rand] == -previous_direction:
		rand = randi() % avaDir.size()
	direction = avaDir[rand]


func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://End_Screen.tscn")
