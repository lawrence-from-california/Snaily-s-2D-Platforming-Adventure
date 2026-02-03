extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $graphics
@onready var shape: ShapeCast2D = $ShapeCast2D
const SPEED:float = 200.0
const JUMP_VELOCITY:float = -333.0
@onready var JUMP_COUNT: int = 1
@onready var MAX_JUMP_COUNT: int = 1

#func _ready(string):
	#connect("jump", self, 0)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		JUMP_COUNT=MAX_JUMP_COUNT

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT=MAX_JUMP_COUNT
		JUMP_COUNT -=1
		
	if Input.is_action_just_pressed("jump") and JUMP_COUNT > 0:
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT -=1
		
	


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("move_left", "move_right")
			

	
	
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction < 0:
		animated_sprite_2d.flip_h = true
			
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	
	#_bouncecheck(delta:float)
	
	move_and_slide()
	
#func _process (_delta: float) -> void:
	#if shape.is_colliding():
		#print ("gold")
