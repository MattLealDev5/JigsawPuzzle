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

function DropPiece(piece){
	piece.holding = false
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