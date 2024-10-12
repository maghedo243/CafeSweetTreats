extends CharacterBody2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		
	velocity = velocity.normalized() * speed


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body == self:
		call_deferred("sceneChange")

func sceneChange():
	get_tree().change_scene_to_file("res://the_back.tscn")
