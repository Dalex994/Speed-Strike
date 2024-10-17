extends Node

const DEFAULT_PORT: int = 1909
var max_players: int = 20
var network: ENetMultiplayerPeer

func _ready() -> void:
	start_server()


func start_server() -> void:
	network = ENetMultiplayerPeer.new()
	var err = network.create_server(DEFAULT_PORT, max_players)
	print_rich("Server Started")
	if err:
		push_error("error server: " + str(err))
		printerr("error server: " + str(err))
	# multiplayer.multiplayer_peer = network
	multiplayer.set_multiplayer_peer(network)
	network.peer_connected.connect(_peer_connected)
	network.peer_disconnected.connect(_peer_disconnected)
	print("Signals sent")
	
	
	

func _peer_connected(player_id):
	print("User " + str(player_id) + " connected")

func _peer_disconnected(player_id):
	print("User " + str(player_id) + " disconnected")
