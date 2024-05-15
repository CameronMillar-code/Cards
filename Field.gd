extends Node

var minion_instance = load("res://minion.tscn")
var friendly_minions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_released("ui_click"):
		for i in range(len($Hand.card_array)):
			if $Hand.card_array[i].position.y < get_viewport().size.y - 400:
				$Hand._remove_card(i)
				var minion_instance_node = minion_instance.instantiate()
				minion_instance_node.position.x = 137* len(friendly_minions)
				add_child(minion_instance_node)
				friendly_minions.append(minion_instance_node)
				break
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
			
