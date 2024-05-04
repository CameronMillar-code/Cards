extends Node2D

var card_instance = load("res://Card.tscn")
var hand_left = 200
var hand_right = 940
var card_array = []
var max_hand_size = 10
#scalars for the width of the hand, so the cards group together
var hand_widths = [0.5, 0.55, 0.57, 0.6, 0.65, 0.67, 0.7, 0.75, 0.78, 0.8]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept") and len(card_array) < max_hand_size:
		var card_instance_node = card_instance.instantiate()
		card_instance_node.position = Vector2(550, 750)
		add_child(card_instance_node)
		card_array.append(card_instance_node)
		
	if event.is_action_pressed("ui_cancel") and len(card_array) > 0:
		var deleted = card_array.pop_back()
		deleted.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	hand_right = get_viewport().size.x * hand_widths[len(card_array)-1]
	hand_left = get_viewport().size.x - hand_right
	var spacing = (hand_right - hand_left) / (len(card_array)+1)
	for i in range(len(card_array)):
		if card_array[i].dragging == false and (card_array[i].position.y > get_viewport().size.y - 400 or card_array[i].playable == false):
			card_array[i].position = card_array[i].position.lerp(
				Vector2(
				hand_left + (i+1)*spacing, 
				get_viewport().size.y - 100),
				0.5
			)
