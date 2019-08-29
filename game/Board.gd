extends Node2D

#var NrPlayers = 2
var colors = ["black", "white"]
var turn = 0

var circle = preload("res://pics/circle.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func create_sprite():
	var tex = Sprite.new()
	tex.set_texture(circle)
	tex.set_scale(Vector2(0.2,0.2))
	return tex
	
func add_dot(position):
	var dot = Node2D.new()
	dot.set_name(colors[turn])
	dot.position = position
	var tex = create_sprite()
	dot.add_child(tex)
	add_child(dot)

func _input(event):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		if event.pressed:
			
			add_dot(event.position)

		