extends Control
 


var result_label
# Called when the node enters the scene tree for the first time.
func _ready():
	result_label = $Label
	
	var button = Button.new()
	button.text = "Click me"
	button.rect_min_size = Vector2(100, 50)  # Set button siz
	button.connect("pressed", self, "_on_button_pressed")

	# Add the button to the scene
	add_child(button)
	pass # Replace with function body.

func _on_button_pressed():
	print("Button pressed!") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _get_api_data():
	$HTTPRequest.request("https://uts-ws.nlm.nih.gov/rest/search")
	pass # Replace with function body.
 

# Function 
	

func _on_http_request_request_completed(result, response_code, headers, body):
 
	print(body)
	if response_code == 200: # Check if the request was successful (HTTP 200 OK)
		# Convert the body byte array to a string
		var body_string = body.utf8_to_string()
		# Display the response body in the Label node
		result_label.text = body_string
	else:
		# If the request was not successful, display an error message
		result_label.text = "Error: HTTP " + str(response_code) 
	
	

	
	 
	

	
	pass # Replace with function body.
