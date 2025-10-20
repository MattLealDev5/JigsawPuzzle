var numOfPieces = instance_number(Obj_PuzzlePiece)
if numOfPieces == 0 { exit }

for(var i = 0; i < numOfPieces; i++) {
	array_push(pieceList, instance_find(Obj_PuzzlePiece, i))
}
show_message(array_length(pieceList))