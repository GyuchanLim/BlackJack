extends Node

var cards: Array
var rank_to_value: Dictionary
var card_ranks = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
var suits = ["Spade","Clubs","Diamond","Heart"]

func _ready():
	var _root = get_tree().root

func prepare_deck() -> void:
	cards = create_deck(8)
	cards.shuffle()

func get_card_value(card) -> int:
	return rank_to_value[card[1]]

func get_card_rank(card) -> String:
	return card[1]

func get_card_suit(card) -> String:
	return card[0]

func add_card_reference(rank) -> void:
	if rank == "Ace":
		rank_to_value[rank] = 1
	elif rank == "Jack":
		rank_to_value[rank] = 10
	elif rank == "Queen":
		rank_to_value[rank] = 10
	elif rank == "King":
		rank_to_value[rank] = 10
	else:
		rank_to_value[rank] = int(rank)

func create_deck(number_of_decks) -> Array:
	var deck_of_cards: Array

	for rank in card_ranks:
		add_card_reference(rank)
		for suit in suits:
			deck_of_cards.append([suit, rank])

	for x in number_of_decks:
		cards += deck_of_cards

	return cards

func draw_card() -> Array:
	return cards.pop_back()
