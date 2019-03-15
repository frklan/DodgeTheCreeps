extends RigidBody2D

export var minSpeed = 150
export var maxSpeed = 250

var mobTypes = ["walk", "swim", "fly"]

func _ready():
  $AnimatedSprite.animation = mobTypes[randi() % mobTypes.size()]


func _on_VisibilityNotifier2D_screen_exited():
  queue_free()