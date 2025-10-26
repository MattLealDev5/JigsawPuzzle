if keyboard_check_pressed(vk_left)
	debug = !debug

if debug {
	if keyboard_check_pressed(ord("R"))
		room_restart()
}