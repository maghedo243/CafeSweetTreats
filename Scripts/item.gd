extends Area2D
class_name Item

var bounceDistance = 0
var bounceSpeed = 0
var bouncingDir = "up"
var ogPosition = position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_item_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match bouncingDir:
		"down" when bounceDistance > 0:
			position.y += bounceSpeed * delta
			if position.y >= ogPosition.y + bounceDistance:
				bouncingDir = "up"
		"up" when bounceDistance > 0:
			position.y -= bounceSpeed * delta
			if position.y <= ogPosition.y - bounceDistance:
				bouncingDir = "down"

func collected():
	push_error("ERROR: collected() NOT DEFINED")
	
func _on_item_entered(body: Node2D):
	if body.name == "Player":
		body.collectedItem(name)
		collected()
