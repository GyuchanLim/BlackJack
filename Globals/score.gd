extends Node

var dealer_hand: Array
var player_hand: Array
var displayed_dealer_hand: String
var displayed_player_hand: String

func dealer_total() -> int:
	var total = 0
	for card in dealer_hand:
		total += card["cardValue"]
	return total

func player_total() -> int:
	var total = 0
	for card in player_hand:
		total += card["cardValue"]
	return total

func add_to_dealer_hand(card) -> void:
	dealer_hand.append(card)
	
	if card["cardRank"] == "Ace":
		print("This is a ace")
	if displayed_dealer_hand == "":
		displayed_dealer_hand += card["cardRank"]
	else:
		displayed_dealer_hand += ', ' + card["cardRank"]

func add_to_player_hand(card) -> void:
	player_hand.append(card)
	if displayed_player_hand == "":
		displayed_player_hand += card["cardRank"]
	else:
		displayed_player_hand += ', ' + card["cardRank"]

func check_score() -> String:
	if player_total() < dealer_total():
		return "Dealer Win"
	elif player_total() > dealer_total(): 
		return "Player Win"
	else:
		return "Push"

func reset() -> void:
	dealer_hand.clear()
	player_hand.clear()
	displayed_dealer_hand = ""
	displayed_player_hand = ""
