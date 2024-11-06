extends Node

var dealer: Dictionary = { "hand" : [], "hasAce" : false }
var player: Dictionary = { "hand" : [], "hasAce" : false }
var dealer_total: int
var player_total: int
var displayed_dealer_hand: String
var displayed_player_hand: String

func calculate_dealer_total(card) -> void:
	dealer_total += card["cardValue"]

	if dealer_total > 21 and dealer["hasAce"] == true:
		dealer_total -= 10
		dealer["hasAce"] = false 

func calculate_player_total(card) -> void:
	player_total += card["cardValue"]

	if player_total > 21 and player["hasAce"] == true:
		player_total -= 10
		player["hasAce"] = false 

func add_card_to_dealer_hand(card) -> void:
	dealer["hand"].append(card)
	if card["cardRank"] == "Ace":
		dealer["hasAce"] = true

	calculate_dealer_total(card)
	if displayed_dealer_hand == "":
		displayed_dealer_hand += card["cardRank"]
	else:
		displayed_dealer_hand += ', ' + card["cardRank"]

func add_card_to_player_hand(card) -> void:
	player["hand"].append(card)
	if card["cardRank"] == "Ace":
		player["hasAce"] = true

	calculate_player_total(card)
	if displayed_player_hand == "":
		displayed_player_hand += card["cardRank"]
	else:
		displayed_player_hand += ', ' + card["cardRank"]

func check_score() -> String:
	if player_total < dealer_total:
		return "Dealer Win"
	elif player_total > dealer_total: 
		return "Player Win"
	else:
		return "Push"

func reset() -> void:
	dealer = { "hand" : [], "hasAce" : false }
	player = { "hand" : [], "hasAce" : false }
	dealer_total = 0
	player_total = 0
	displayed_dealer_hand = ""
	displayed_player_hand = ""
