class_name ParryComponent
extends Node3D


@export var block_component: BlockComponent

var in_parry_window: bool = false

var _parry_timer: Timer
var _parry_index: int = 0
var _parry_interval: Array[float] = [
	0.2,
	0.1,
	0.05,
	0
]

var _parry_cooldown_timer: Timer
var _parry_cooldown: float = 0.4


func _ready() -> void:
	_parry_timer = Timer.new()
	_parry_timer.wait_time = _parry_interval[_parry_index]
	_parry_timer.autostart = false
	_parry_timer.one_shot = true
	_parry_timer.timeout.connect(
		func():
			in_parry_window = false
			print("parry window closed!")
	)
	add_child(_parry_timer)
	
	_parry_cooldown_timer = Timer.new()
	_parry_cooldown_timer.wait_time = _parry_cooldown
	_parry_cooldown_timer.autostart = false
	_parry_cooldown_timer.one_shot = true
	add_child(_parry_cooldown_timer)


func parry() -> void:
	prints('spamming?', not _parry_cooldown_timer.is_stopped())
	
	if _parry_cooldown_timer.is_stopped():
		_parry_index = 0
	else:
		_parry_index += 1
	
	if _parry_index > 3:
		_parry_index = 3
	
	prints("parry interval:", _parry_interval[_parry_index])
	
	_parry_cooldown_timer.start()
	if _parry_index == 3:
		return
	
	in_parry_window = true
	_parry_timer.start(_parry_interval[_parry_index])
	
	print("parry window open!")
