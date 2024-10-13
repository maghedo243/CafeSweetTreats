extends CanvasLayer

signal on_fadeout_finished
signal on_fadein_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(name):
	if name == "long_fade_to_black":
		on_fadeout_finished.emit()
		animation_player.play("long_fade_to_normal")
	elif name == "long_fade_to_normal":
		on_fadein_finished.emit()
		color_rect.visible = false
		

func transition():
	color_rect.visible = true
	animation_player.play("long_fade_to_black")

	
