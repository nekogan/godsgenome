extends Control

var paused = false

func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = !get_tree().paused
		visible = !visible

func _on_resume_btn_pressed():
	paused = false
	hide()
	get_tree().paused = false

func _on_exit_pressed():
	get_tree().quit()

func _on_save_pressed():
	DataManager.save_data()

func _on_load_pressed():
	DataManager.load_data()
