extends Button

@onready var play = get_node("../")
@onready var play_button = get_node("../playButton")

func _on_retry_button_pressed() -> void:
	play.reset_game()
	play_button.deal_game()
