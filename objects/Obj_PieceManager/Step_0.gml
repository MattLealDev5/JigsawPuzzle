var pressedInput = mouse_check_button_pressed(mb_left)
var releasedInput = mouse_check_button_released(mb_left)

if pressedInput {
	// Looking for the picked piece
	for(var i = 0; i < numOfPieces; i++) {
		if position_meeting(mouse_x, mouse_y, pieceList[i]) {
			// If found get heldPiece and adjust pieceList
			heldPiece = pieceList[i]
			array_delete(pieceList, i, 1)
			array_insert(pieceList, 0, heldPiece)
			
			// Stuff for when the player starts dragging it
			pickUpOrigin = [heldPiece.x, heldPiece.y]
			mouseOrigin = [mouse_x, mouse_y]
			PickupPiece(heldPiece)
			heldPiece.depth = -1000
			break
		}
	}
}

if releasedInput {
	// Release the piece and reset values among other things
	DropPiece(heldPiece)
	heldPiece = noone
	pickUpOrigin = [0, 0]
	mouseOrigin = [0, 0]
	setPieceDepths()
}

if heldPiece != noone {
	// While the piece is being dragged around
	var newX = pickUpOrigin[0] + (mouse_x-mouseOrigin[0])
	var newY = pickUpOrigin[1] + (mouse_y-mouseOrigin[1])
	heldPiece.x = newX
	heldPiece.y = newY
}