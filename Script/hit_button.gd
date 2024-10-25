extends Button

@onready var play = get_node("../../")

func _on_player_hit_pressed() -> void:
	var dealt_card = play.draw_card()

	Score.add_to_player_total(dealt_card)
	play.display_player_cards(Deck.rank_to_value[dealt_card[1]])
	if Score.player_total > 21:
		play.player_bust()
