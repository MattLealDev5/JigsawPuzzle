enum PieceSides {
	Up,
	Right,
	Down,
	Left,
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
	var pos = [
		[0, -1],
		[1, 0],
		[0, 1],
		[-1, 0]]
	
	var sides = ds_map_keys_to_array(piece.sides)
	var openings = ds_map_values_to_array(piece.sides)
	
	// Iterate through all sides of a piece
	for(var i = 0; i < array_length(sides); i++) {
		// Checks if the side is taken
		if openings[i] != noone { continue }
		
		// Getting position to check and all pieces there
		var sideX = piece.x+pos[sides[i]][0]*pieceSize
		var sideY = piece.y+pos[sides[i]][1]*pieceSize
		show_debug_message($"[{piece.x}, {piece.y}] -> [{sideX}, {sideY}]")
		var size = instance_position_list(sideX, sideY, Obj_PuzzlePiece, piecesNear, false)
		show_debug_message(size)
		
		// Iterate through each piece found and see if they fit
		for (var j = 0; j < size; j++;) {
			var aX = piece.posID[0]+pos[sides[i]][0]
			var bX = piecesNear[| j].posID[0]
			var aY = piece.posID[1]+pos[sides[i]][1]
			var bY = piecesNear[| j].posID[1]
			show_debug_message($"[{aX}, {aY}]")
			show_debug_message($"[{bX}, {bY}]")
	        if aX == bX && aY == bY {
				   // Check if code is right or something
					show_debug_message(":D")
			}
	    }
		
	}
	
	ds_list_destroy(piecesNear)
	piecesNear = -1
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