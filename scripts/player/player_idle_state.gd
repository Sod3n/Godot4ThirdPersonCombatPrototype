class_name PlayerIdleState
extends PlayerStateMachine


@export var walk_state: PlayerWalkState


func process_player() -> void:
	if player.input_direction.length() > 0:
		parent_state.change_state(walk_state)
