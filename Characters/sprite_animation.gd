extends Node

class_name SpriteAnimation

var anim : AnimatedSprite2D
var lock : bool = false

func _init(animation : AnimatedSprite2D):
	anim = animation
	anim.connect("animation_finished", Callable(self, "_on_animated_sprite_2d_animation_finished"))

# direction: vector2
func update_direction(direction : Vector2):
	if direction.x > 0:
		anim.flip_h = false
	elif direction.x < 0:
		anim.flip_h = true

func set_state(state : String):
	anim.play(state)
	lock = true

func tick(direction : Vector2):
	update_direction(direction)
	if lock:
		return
	if direction.x != 0 or direction.y != 0:
		anim.play("walk")
	else:
		anim.play("idle")

func _on_animated_sprite_2d_animation_finished():
	lock = false
