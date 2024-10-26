extends Node2D

var is_player_ready: bool = false

func _ready() -> void:
	get_node("gameControl").hide()
	get_node("retryButton").hide()

# _on_play_button_pressed functions
func player_ready() -> void:
	var player_control = get_node("gameControl")
	if player_control:
		player_control.show()
	get_node("playButton").hide()

# When player busts

func player_bust() -> void:
	$result.text = "you busted"
	disable_player_buttons()
	get_node("retryButton").show()
	
func declare_winner(text) -> void:
	$result.text = text
	disable_player_buttons()
	get_node("retryButton").show()
	
func dealer_bust() -> void:
	$result.text = "dealer busted"
	get_node("retryButton").show()

func reset_game() -> void:
	reset_total()
	get_node("gameControl/stayButton").disabled = false
	get_node("gameControl/dealButton").disabled = false
	get_node("gameControl/dealButton").show()

func reset_total() -> void:
	Score.reset()
	$gameControl/playerCardTotal.text = ""
	$gameControl/playerCardsDisplayed.text = ""
	$gameControl/dealerCardTotal.text = ""
	$gameControl/dealerCardsDisplayed.text = ""
	$result.text = ""

func disable_player_buttons() -> void:
	get_node("gameControl/dealButton").disabled = true
	get_node("gameControl/stayButton").disabled = true
