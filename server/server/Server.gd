extends Node

const DEFAULT_PORT: int = 1909
var max_players: int = 20


func _ready() -> void:
	start_server()


func start_server() -> void:
	var network: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	network.create_server(DEFAULT_PORT, max_players)
	multiplayer.multiplayer_peer = network
	print("Server Started")
	
	network.connect("peer_connected", _peer_connected)
	network.connect("peer_disconnected", _peer_disconnected)
	
	
	
	

func _peer_connected(player_id):
	print("User " + str(player_id) + " connected")

func _peer_disconnected(player_id):
	print("User " + str(player_id) + " disconnected")
