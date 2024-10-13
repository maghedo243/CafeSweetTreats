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
	queue_free()
