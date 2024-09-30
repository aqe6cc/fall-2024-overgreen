extends CharacterBody2D

@export var speed: float = 125.0
@export var jump_velocity: float = -150.0
@export var double_jump_velocity: float = -150.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var dash_handler: PlayerDash = PlayerDash.new(self)
@onready var basic_movement_handler: PlayerBasicMovement = PlayerBasicMovement.new(self)
@onready var animation_handler: SpriteAnimation = SpriteAnimation.new(animated_sprite)

var direction: Vector2 = Vector2.ZERO

func _physics_process(delta):
	basic_movement_handler.tick(delta)
	animation_handler.tick(direction)


func land():
	animation_handler.set_state("jump_end")
