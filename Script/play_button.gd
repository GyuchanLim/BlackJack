extends Button

@onready var play = get_node("../")
@onready var game_control = get_node("../gameControl")

func _on_pressed() -> void:
	Deck.prepare_deck()
	play.player_ready()
	deal_game()

func deal_player() -> void:
	var dealt_card = Deck.draw_card()
	Score.add_to_player_hand(dealt_card)
	game_control.player_cards()

func deal_dealer() -> void:
	var dealt_card = Deck.draw_card()
	Score.add_to_dealer_hand(dealt_card)
	game_control.dealer_cards()

func deal_game() -> void:
	deal_player()
	deal_dealer()
	deal_player()
