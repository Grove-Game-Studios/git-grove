extends Control

signal created_repo(path: String)

@onready var path: LineEdit = $VBoxContainer/HBoxContainer/Path
@onready var file_dialog: FileDialog = $VBoxContainer/HBoxContainer/FileDialog
@onready var project_name: LineEdit = $VBoxContainer/ProjectName
@onready var message: Label = $VBoxContainer/Message

func _ready() -> void:
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR

func _on_browse_button_button_down() -> void:
	file_dialog.popup_centered_ratio(0.8)


func _on_file_dialog_dir_selected(dir: String) -> void:
	path.text = dir

func _on_create_button_button_down() -> void:
	if project_name.text == "":
		message.text = "Project must have a name"
		return
		
	var dir = folder_is_empty()
	if dir != "":
		if create_repo(dir):
			message.text = "Created repo"
			created_repo.emit(dir)
		else:
			message.text = "Could not create repo"
		
func folder_is_empty() -> String:
	var parent_dir = DirAccess.open(path.text)
	
	if parent_dir == null:
		message.text = "Parent folder does not exist"
		return ""
	
	if parent_dir.dir_exists(project_name.text):
		message.text = "Project folder already exists"
		return ""
	
	parent_dir.make_dir(project_name.text)
	parent_dir.change_dir(project_name.text)
		
	return parent_dir.get_current_dir()
	
func create_repo(repo_path: String) -> bool:
	return GitService.execute_command(repo_path, "init", [])
