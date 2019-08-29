extends Node2D

var dot_class = preload("res://Dot.tscn")

#var NrPlayers = 2
var colors = ["black", "white"]
var turn = 0
var dots = []
var new_dot = true
var pos = Vector2(0,0)
var clicked_dot




func _ready():
	set_process(false)
	set_physics_process(false)

func add_dot(position):
	new_dot = false
	var dot = dot_class.instance()
	dot.position = position
	var label = load("res://Info.tscn")
	var test = label.instance()
	dot.add_child(test)
	self.add_child(dot)
	print ("add dot")

func _input(event):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		new_dot = true
		pos = event.position
		set_process(true)


func _process(delta):
	set_process(false)
	
	if new_dot:
		add_dot(pos)
	
	
		