extends Node

## How many seconds of inactivity before the attraction screen appears.
@export var idle_timeout: float = 60.0

## Drag your .ogv video file here in the Inspector.
@export var attraction_video: VideoStream

## Optional: path to the starting scene after attraction screen is dismissed (e.g. "res://main.tscn").
## Leave empty to reload whichever scene is currently running.
@export_file("*.tscn") var restart_scene: String = ""

@onready var idle_timer: Timer = $IdleTimer
@onready var overlay: CanvasLayer = $Overlay
@onready var video_player: VideoStreamPlayer = $Overlay/Video


func _ready() -> void:
	if attraction_video == null:
		push_error("AttractionScreen: No video assigned! Set 'Attraction Video' in the Inspector on attraction_screen.tscn.")
	else:
		video_player.stream = attraction_video
		
	idle_timer.wait_time = idle_timeout
	idle_timer.one_shot = true
	idle_timer.timeout.connect(_show_attraction_screen)

	overlay.hide()
	idle_timer.start()


func _input(_event: InputEvent) -> void:
	# Any input (mouse move, key press) resets the timer
	if overlay.visible:
		_dismiss_attraction_screen()
	else:
		idle_timer.start()


func _show_attraction_screen() -> void:
	overlay.show()
	video_player.play()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


func _dismiss_attraction_screen() -> void:
	video_player.stop()
	overlay.hide()
	
	# Unhide the cursor when the game resumes. Remove this line if not needed
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if restart_scene.is_empty():
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene_to_file(restart_scene)
	idle_timer.start()
