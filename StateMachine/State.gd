extends Node
class_name State

signal Transitioned

func Enter():
	pass

func Update(_delta: float):
	pass

# Virtual function. Corresponds to the `_physics_process()` callback.
func Physics_update(_delta: float):
	pass

func Exit():
	pass
