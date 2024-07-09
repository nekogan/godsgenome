extends Node2D

var open: bool = false

func _process(_delta):
	if open:
		$AnimatedSprite2D.play("opening")

func _on_animated_finished():
	open = false
	$AnimatedSprite2D.play("open")
	$StaticBody2D/CollisionShape2D.disabled = true
