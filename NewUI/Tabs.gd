extends Tabs
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var mainControl = get_tree().get_root().get_node("Control")
# Called when the node enters the scene tree for the first time.

func _ready():
	self.connect("tab_changed", self, "_on_tab_changed")
	self.connect("tab_close", self, "_on_tab_close") 
	set_tab_close_display_policy(CLOSE_BUTTON_SHOW_ALWAYS)
	add_new_tab();

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func add_new_tab():
	add_tab("New Tab")
	
#	var toolButtonControl = mainControl.get_child(0).get_child(0).get_child(1)
#	var tb_old_x = toolButtonControl.get_begin().x
#	var tb_old_y = toolButtonControl.get_begin().y
#	toolButtonControl.set_begin(Vector2(tb_old_x+140, tb_old_y))
#
#	var tabPanel = mainControl.get_child(0).get_child(0).get_child(0)
#	tabPanel.set_end(Vector2(tb_old_x+90, tb_old_y))
	
	var index = get_tab_count() -1
	current_tab  = index
	return index;

func _on_tab_changed(idx):
	var tab_container = get_tree().get_root().get_node("Control/VBoxContainer/TabContainer")
	print("tab_id: " + str(idx))
	tab_container.current_tab = idx
	pass;
	
func _on_tab_close(idx):
	remove_tab(idx)
	var tabContainer = mainControl.tab_container
	tabContainer._on_tab_close(idx)
	
	if(get_tab_count()==0):
		mainControl.close_browser()
	

func close_curent_tab():
	_on_tab_close(current_tab)
