extends Control

@onready var open_create: Control = $OpenCreate
@onready var repo_view: RepoView = $RepoView

func _on_open_repo_open_repo(path: String) -> void:
	open_repo(path)


func _on_create_repo_created_repo(path: String) -> void:
	open_repo(path)
	
func open_repo(path: String):
	repo_view.set_repo_path(path)
	
	open_create.hide()
	repo_view.show()
