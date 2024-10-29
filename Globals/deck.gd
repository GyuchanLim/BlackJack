extends Node

var cards: Array
var rank_to_value: Dictionary
var card_ranks = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
var suits = ["Spade","Clubs","Diamond","Heart"]

func prepare_deck() -> void:
	cards = create_deck(8)
	cards.shuffle()

func get_card_value(rank) -> int:
	if rank == "Ace":
		return 1
	elif rank == "Jack":
		return 10
	elif rank == "Queen":
		return 10
	elif rank == "King":
		return 10
	else:
		return int(rank)

func create_deck(number_of_decks) -> Array:
	var deck_of_cards: Array

	for rank in card_ranks:
		var value = get_card_value(rank)

		for suit in suits:
			deck_of_cards.append(card(suit,rank,value))

	for x in number_of_decks:
		cards += deck_of_cards

	return cards

func card(suit, rank, value):
	return { "cardSuit" : suit, "cardRank" : rank, "cardValue" : value }

func draw_card() -> Dictionary:
	return cards.pop_back()
