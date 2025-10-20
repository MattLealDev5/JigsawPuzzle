var pressedInput = mouse_check_button_pressed(mb_left)
var releasedInput = mouse_check_button_released(mb_left)

if pressedInput {
	heldPiece = instance_position(mouse_x, mouse_y, Obj_PuzzlePiece)
	pickUpOrigin = [heldPiece.x, heldPiece.y]
	mouseOrigin = [mouse_x, mouse_y]
	PickupPiece(heldPiece)
}

if releasedInput {
	heldPiece = noone
	pickUpOrigin = [0, 0]
	mouseOrigin = [0, 0]
	DropPiece(heldPiece)
}

if heldPiece != noone {
	var newX = pickUpOrigin[0] + (mouse_x-mouseOrigin[0])
	var newY = pickUpOrigin[1] + (mouse_y-mouseOrigin[1])
	heldPiece.x = newX
	heldPiece.y = newY
}