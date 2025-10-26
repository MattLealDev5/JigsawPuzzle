enum PieceSides {
	Up,
	Right,
	Down,
	Left,
}

function GetSideNormal(side) {
	var pos = [
		[0, -1], // Up
		[1, 0], // Right
		[0, 1], // Down
		[-1, 0]] // Left
	return pos[side]
}

function DragPiece(piece, dragX, dragY, passed = []) {
	// Move piece
	piece.x = dragX
	piece.y = dragY
	
	// Recursion shit to move every piece connected
	var pieceSize = 60
	
	var sides = ds_map_keys_to_array(piece.sides)
	var openings = ds_map_values_to_array(piece.sides)
	for(var i = 0; i < array_length(sides); i++) {
		var nextPiece = piece.sides[? sides[i]]
		if nextPiece != noone && !array_contains(passed, nextPiece) {
			var side = GetSideNormal(sides[i])
			array_push(passed, nextPiece)
			DragPiece(nextPiece, dragX+side[0]*pieceSize, 
								 dragY+side[1]*pieceSize, passed)
		}
	}
}

function PickupPiece(piece){
	piece.holding = true
	show_debug_message(ds_map_keys_to_array(piece.sides))
	show_debug_message(ds_map_values_to_array(piece.sides))
}

// I fucking hate this code it's so god damn long
function DropPiece(piece){
	piece.holding = false
	
	var piecesNear = ds_list_create()
	var pieceSize = 60
	
	var sides = ds_map_keys_to_array(piece.sides)
	var openings = ds_map_values_to_array(piece.sides)
	
	// Iterate through all sides of a piece
	for(var i = 0; i < array_length(sides); i++) {
		// Checks if the side is taken
		if openings[i] != noone { continue }
		
		// Getting side to check and all pieces there
		var side = GetSideNormal(sides[i])
		var sideX = piece.x+side[0]*pieceSize
		var sideY = piece.y+side[1]*pieceSize
		show_debug_message($"[{piece.x}, {piece.y}] -> [{sideX}, {sideY}]")
		var size = instance_position_list(sideX, sideY, Obj_PuzzlePiece, piecesNear, false)
		show_debug_message(size)
		
		// Iterate through each piece found and see if they fit
		var foundFit = false
		for (var j = 0; j < size; j++;) {
			var aX = piece.posID[0]+side[0]
			var bX = piecesNear[| j].posID[0]
			var aY = piece.posID[1]+side[1]
			var bY = piecesNear[| j].posID[1]
			show_debug_message($"[{aX}, {aY}]")
			show_debug_message($"[{bX}, {bY}]")
	        if aX == bX && aY == bY {
				   // If a conection is found there they connect
					show_debug_message(":D")
					foundFit = true
					ConnectPieces(piece, piecesNear[| j], sides[i])
					break
			}
	    }
		// End early if a connection is found so no wacky shit happens
		if foundFit { break }
		
	}
	
	ds_list_destroy(piecesNear)
	piecesNear = -1
}

function ConnectPieces(pieceA, pieceB, sideDir) {
	var opposite = (sideDir+2)%4
	
	// Snap pieceA to pieceB
	var pieceSize = 60
	var oppSide = GetSideNormal(opposite)
	
	var snapX = pieceB.x + oppSide[0]*pieceSize
	var snapY = pieceB.y + oppSide[1]*pieceSize
	DragPiece(pieceA, snapX, snapY)
	//pieceA.x = pieceB.x + oppSide[0]*pieceSize
	//pieceA.y = pieceB.y + oppSide[1]*pieceSize
	
	// Make connection internally
	pieceA.sides[? sideDir] = pieceB
	pieceB.sides[? (sideDir+2)%4] = pieceA
}

function DefineSides(posID){
	var sides = ds_map_create()
	// Corners get left out
	if posID[0] != 0 { sides[? PieceSides.Left] = noone }
	if posID[0] != 10 { sides[? PieceSides.Right] = noone }
	if posID[1] != 0 { sides[? PieceSides.Up] = noone }
	if posID[1] != 15 { sides[? PieceSides.Down] = noone }
	
	return sides
}