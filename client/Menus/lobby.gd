extends Node
@export var world_scene: PackedScene

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _on_join_button_pressed() -> void:
	Server.connect_to_server()
	get_tree().change_scene_to_packed(world_scene)
