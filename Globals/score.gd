extends Node

var dealer_total: int = 0
var player_total: int = 0

func _ready():
	var _root = get_tree().root

func add_to_dealer_total(card) -> void:
	dealer_total += Deck.get_card_value(card)

func add_to_player_total(card) -> void:
	player_total += Deck.get_card_value(card)

func check_score() -> String:
	if Score.player_total < Score.dealer_total:
		return "Dealer Win"
	elif Score.player_total > Score.dealer_total: 
		return "Player Win"
	else:
		return "Push"
