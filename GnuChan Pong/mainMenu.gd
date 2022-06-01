extends Control

onready var userName = $login/userName
var user = false
func _ready():
	userName.grab_focus()


func _on_userName_text_entered(new_text):
	PlayerN.pNe = userName.text
	$menu.visible = not $menu.visible
	$login.visible = not $login.visible


func _on_Start_pressed():
	get_tree().change_scene("res://mainLevel.tscn")


func _on_Settings_pressed():
	$Settings.visible = not $Settings.visible 


func _on_My_Web_pressed():
	pass # Replace with function body.


func _on_Itchio_pressed():
	pass # Replace with function body.


func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)


func _on_music_finished():
	$music.play()


func _on_Button_pressed():
	$Settings.visible = not $Settings.visible
