extends Node

const DEFAULT_IP: String = "192.168.56.1"
const DEFAULT_PORT: int = 1909
var network: ENetMultiplayerPeer 

func _ready() -> void:
	signals_bus()
	connect_to_server()
	
func connect_to_server() -> void:
	network = ENetMultiplayerPeer.new()
	get_tree().get_multiplayer()
	network.create_client(DEFAULT_IP, DEFAULT_PORT)
	multiplayer.multiplayer_peer = network
	get_tree().get_multiplayer()
	print("Client started")
	
	
	# print(multiplayer.is_connected_to_server())  # Check if already connected
	# print(network.get_signal_list())          # List available signals

	#network.connect("connected_to_server", _on_connection_succeeded)
	#network.connect("connection_failed", _on_connection_failed)
	#network.connect("server_disconnected",_server_disconnected)
	#multiplayer.connected_to_server.connect(_on_connection_succeeded)
	print("Signals sent")
	

func signals_bus():
	multiplayer.connected_to_server.connect(_on_connection_succeeded)
	multiplayer.connection_failed.connect(_on_connection_failed)
	multiplayer.server_disconnected.disconnect(_server_disconnected)
	
func _on_connection_succeeded():
	print("Client connected")
	

func _on_connection_failed():
	print("Client disconnected")


func _server_disconnected():
	print("Server disconnected")
