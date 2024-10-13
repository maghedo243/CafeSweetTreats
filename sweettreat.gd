extends Item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	bounceDistance = 5
	bounceSpeed = 15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	
func collected():
	#get_tree().change_scene_to_file("res://Scenes/the_alternate_back.tscn")
	queue_free()
