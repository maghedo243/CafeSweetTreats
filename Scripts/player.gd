extends CharacterBody2D

var speed = 200
var atBackDoor = false;
var atFrontDoor = false;
var movable = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if movable:
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
		
	velocity = velocity.normalized() * speed
	
	if self.velocity.y < 0 and atBackDoor:
		call_deferred("sceneChange")
	elif self.velocity.y > 0 and atFrontDoor:
		call_deferred("sceneChange")


func _on_back_door_trigger_body_entered(body: Node2D) -> void:
	if body == self:
		atBackDoor = true;
		
func _on_back_door_trigger_body_exited(body: Node2D) -> void:
	if body == self:
		atBackDoor = false;

func _on_front_door_trigger_body_entered(body: Node2D) -> void:
	if body == self:
		atFrontDoor = true;

func _on_front_door_trigger_body_exited(body: Node2D) -> void:
	if body == self:
		atFrontDoor = false;

func sceneChange():
	if atBackDoor:
		#TransitionScreen.transition()
		#await TransitionScreen.on_fadeout_finished
		get_tree().change_scene_to_file("res://Scenes/the_back.tscn")
	elif atFrontDoor:
		#TransitionScreen.transition()
		#await TransitionScreen.on_fadeout_finished
		get_tree().change_scene_to_file("res://Scenes/alternate_cafe.tscn")
		
func collectedItem(name):
	if name == "SweetTreat":
		movable = false
		TransitionScreen.transition()
		await TransitionScreen.on_fadeout_finished
		get_tree().change_scene_to_file("res://Scenes/the_alternate_back.tscn")
		await TransitionScreen.on_fadeout_finished
		movable = true
		
	
