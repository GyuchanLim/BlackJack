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

func player_cards() -> void:
	if Score.dealer["hasAce"] == true:
		player_total.text = "Total " + str(Score.player_total - 10) + " or " + str(str(Score.player_total))
	else:
		player_total.text = "Total " + str(Score.player_total)

	player_displayed.text = Score.displayed_player_hand

func dealer_cards() -> void:
	dealer_total.text = "Total " + str(Score.dealer_total)
	dealer_displayed.text = Score.displayed_dealer_hand
