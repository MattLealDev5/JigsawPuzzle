numOfPieces = instance_number(Obj_PuzzlePiece)
if numOfPieces == 0 { exit }

for(var i = 0; i < numOfPieces; i++) {
	var currPiece = instance_find(Obj_PuzzlePiece, i)
	currPiece.depth = -(numOfPieces-i)
	array_push(pieceList, currPiece)
	
	
	// Temp assignment of positional IDs
	currPiece.posID = [i, 0]
	
}
setPieceDepths()