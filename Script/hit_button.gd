extends Button

@onready var play = get_node("../../")
@onready var game_control = get_node("../")

func _on_player_hit_pressed() -> void:
	var dealt_card = play.draw_card()

	Score.add_to_player_total(dealt_card)
	game_control.player_cards(dealt_card)
	if Score.player_total > 21:
		play.player_bust()
