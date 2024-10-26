extends Node

var dealer_hand: Array
var player_hand: Array
var player_total: int
var dealer_total: int
var displayed_dealer_hand: String
var displayed_player_hand: String

func add_to_dealer_hand(card) -> void:
	dealer_hand.append(card)
	dealer_total += Deck.get_card_value(card)
	if displayed_dealer_hand == "":
		displayed_dealer_hand += Deck.get_card_rank(card)
	else:
		displayed_dealer_hand += ', ' + Deck.get_card_rank(card)

func add_to_player_hand(card) -> void:
	player_hand.append(card)
	player_total += Deck.get_card_value(card)
	if displayed_player_hand == "":
		displayed_player_hand += Deck.get_card_rank(card)
	else:
		displayed_player_hand += ', ' + Deck.get_card_rank(card)

func check_score() -> String:
	if player_total < dealer_total:
		return "Dealer Win"
	elif player_total > dealer_total: 
		return "Player Win"
	else:
		return "Push"

func reset() -> void:
	dealer_hand.clear()
	player_hand.clear()
	player_total = 0
	dealer_total = 0
	displayed_dealer_hand = ""
	displayed_player_hand = ""
