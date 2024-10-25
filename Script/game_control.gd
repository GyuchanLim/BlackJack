extends Node

var player_displayed: Node
var player_total: Node
var dealer_displayed: Node
var dealer_total: Node

func _ready():
	player_displayed = get_node("playerCardsDisplayed")
	player_total = get_node("playerCardTotal")
	dealer_displayed = get_node("dealerCardsDisplayed")
	dealer_total = get_node("dealerCardTotal")

func player_cards(card) -> void:
	player_total.text = "Total " + str(Score.player_total)
	if player_displayed.text == "":
		player_displayed.text += Deck.get_card_rank(card)
	else:
		player_displayed.text += ", " + Deck.get_card_rank(card)

func dealer_cards(card) -> void:
	dealer_total.text = "Total " + str(Score.dealer_total)
	if dealer_displayed.text == "":
		dealer_displayed.text += Deck.get_card_rank(card)
	else:
		dealer_displayed.text += ", " + Deck.get_card_rank(card)
