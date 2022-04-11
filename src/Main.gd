extends Node2D

const MAJOR_NAMES = [
	"devil",
	"sun", 
	"world", 
	"death", 
	"strenght", 
	"tower", 
	"moon", 
	"fool", 
	"magician", 
	"high_priestess", 
	"star", 
	"lovers",
	"temperence", 
	"hanged", 
	"judgment", 
	"hermit", 
	"chariot",
	"empress", 
	"emperor", 
	"justice",
	"wheel_of_fortune", 
	"hierophant" 
]

var prefix = "res://"
var MAJOR_FOLDER = prefix + "res/img/cards/major/"

onready var label_name = get_node("Name")
onready var label_desc = get_node("Description")
onready var card_sprite = get_node("Card")
var last_card = 0

const TEXTS = { 
	"devil": [	"You will be tempted, but you really don't need that new Wacom for putting 3 pixels together.", 
				"To do pixel porn, you will be tempted. Just do it, even squares need some fun in their lifes!"],
	"sun": [ 	"You shall no longer need some layers, the almighty power of pixels is in your hand, who needs them anyway?",
				"Post your next piece at 05:34, it will be the best time to remember you forgot this orphan pixel, but you'll do numbers!"],
	"world": [	"You shall add less color in your palette, chill for a bit, try some 1bit.",
				"Even if you felt in the path of classic digital art, know that the pixels will forever be there for you."],
	"death": [	"Even if you like those clusters, you know you'll have too redo the posture, just let this piece go <3",
				"You art will get ignored for some times, but don't give up, you're doing good!"],
	"strenght": ["You shall finish this last background for you commission! Those clouds are on point and this new technique works perfect!",
				"Even if you end up art blocking, take a break, listen to music, and press pause for a bit. You'll end up replenished and ready to take those pixels down!."],
	"tower": [	"lorem ipsum"],
	"moon": ["lorem ipsum"],
	"fool": ["lorem ipsum"],
	"magician": ["lorem ipsum"],
	"high_priestess": ["lorem ipsum"],
	"star": ["lorem ipsum"],
	"lovers": ["lorem ipsum"],
	"temperence": ["lorem ipsum"],
	"hanged": ["lorem ipsum"],
	"judgment": ["lorem ipsum"],
	"hermit": ["lorem ipsum"],
	"chariot": ["lorem ipsum"],
	"empress": ["lorem ipsum"],
	"emperor": ["lorem ipsum"],
	"justice": ["lorem ipsum"],
	"wheel_of_fortune": ["lorem ipsum"],
	"hierophant": ["lorem ipsum"],
	}

var exporting = true
func dir_size(path: String):
	var size = 0
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	var file = dir.get_next()
	
	while file != '':
		var import = file.find(".import")
		if exporting and import != -1:
			print(file)
			size += 1
		elif not exporting and file.ends_with(".png"):
			size += 1
			print(file)
		file = dir.get_next()
			
	return size

func _ready():
	randomize()
	

func _on_TextureButton_pressed():
	var major = randi() % MAJOR_NAMES.size()
	while major == last_card:
		major = randi() % MAJOR_NAMES.size()
		
	var id_sprite = randi()%(dir_size(MAJOR_FOLDER + MAJOR_NAMES[major]+ "/"))
	
	var path  = MAJOR_FOLDER + MAJOR_NAMES[major] + "/" + MAJOR_NAMES[major] + str(id_sprite) + ".png"
	card_sprite.texture = load(path)
	
	label_name.text = "THE " + MAJOR_NAMES[major].to_upper() + " " + str(id_sprite)
	
	var major_str = MAJOR_NAMES[major]
	var desc = TEXTS[major_str][randi()%TEXTS[major_str].size()-1]
	label_desc.text = desc
	
	last_card = major
