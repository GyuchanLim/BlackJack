extends Button

@onready var play = get_node("../../")
@onready var game_control = get_node("../")

func _on_player_deal_button_pressed() -> void:
	var dealt_card = Deck.draw_card()

	Score.add_card_to_player_hand(dealt_card)
	game_control.player_cards()

	if Score.player_total > 21:
		play.player_bust()
