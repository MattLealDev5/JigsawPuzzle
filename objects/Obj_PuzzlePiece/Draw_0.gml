draw_self()
DrawText(x, y, posID, fa_center, fa_middle)

// debug stuff
if CheckDebug() {
	var dSides = ds_map_keys_to_array(sides)
	var dOpenings = ds_map_values_to_array(sides)
	var pieceSize = GetPieceSize()
	
	for(var i = 0; i < array_length(dSides); i++) {
		if dOpenings[i] == noone { continue }
		
		var side = GetSideNormal(dSides[i])
		draw_set_color(c_green)
		draw_line_width(x, y, x+side[0]*pieceSize, y+side[1]*pieceSize, 10)
	}
}
