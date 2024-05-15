extends Area2D

@export var attack = 0
@export var health = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackText.text = str(attack)
	$HealthText.text = str(health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
