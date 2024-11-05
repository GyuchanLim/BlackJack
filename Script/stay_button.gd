extends Button

@onready var play = get_node("../../")
@onready var game_control = get_node("../")

func _on_player_stay_button_pressed() -> void:
	play.disable_player_buttons()
	deal_dealer()

func deal_dealer() -> void:
	var dealt_card = Deck.draw_card()

	Score.add_to_dealer_hand(dealt_card)
	game_control.dealer_cards()

	if Score.dealer_total() > 21:
		play.dealer_bust()
	elif Score.dealer_total() >= 17:
		play.declare_winner(Score.check_score())
	else:
		deal_dealer()
