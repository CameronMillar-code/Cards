extends Area2D

var cardID
var playable = false
var dragging = false
var previous_mouse_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_drag(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		viewport.set_input_as_handled()
		previous_mouse_position = event.position
		dragging = true

func _input(event):
	if not dragging:
		return
	if event.is_action_released("ui_click"):
		previous_mouse_position = Vector2()
		dragging = false
	if dragging and event is InputEventMouseMotion:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


