extends Area2D

var parent

func _ready():
	var sprite = Sprite.new()
	sprite.texture = load("res://pics/circle.png") # could use preload
	sprite.set_scale(Vector2(0.1,0.1))
	sprite.set_name("Sprite")
	sprite.hide()
	self.add_child(sprite)
	var circle_shape = CircleShape2D.new()
	circle_shape.set_radius(10)
	var collision_shape = CollisionShape2D.new()
	collision_shape.shape = circle_shape
	self.add_child(collision_shape)
	parent = get_parent()
	
func _draw():
	draw_circle(Vector2(0,0), 10, Color(0,0,1,1))
	
func test():
	print(get_overlapping_areas())
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		self.on_click()
	

func on_click():
	parent.new_dot = false
	parent.clicked_dot = self
	parent.set_process(true)
	print(self)
		

