extends Node

var port: int = 1909
var max_players: int = 20


func _ready() -> void:
	start_server()


func start_server() -> void:
	var network: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	get_tree().get_multiplayer()
	network.create_server(port, max_players)
	#get_tree().set_network_peer(network)
	multiplayer.multiplayer_peer = network
	print("Server Started")
	
	network.connect("peer_connected", _Peer_Connected)
	network.connect("peer_disconnected", _Peer_Disconnected)
	
	
	

func _Peer_Connected(player_id):
	print("User " + str(player_id) + " connected")

func _Peer_Disconnected(player_id):
	print("User " + str(player_id) + " disconnected")
