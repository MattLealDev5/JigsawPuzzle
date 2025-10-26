pieceList = []
numOfPieces = 6
if numOfPieces == 0 { exit }

for(var i = 0; i < numOfPieces; i++) {
	//var currPiece = instance_find(Obj_PuzzlePiece, i)
	var currPiece = instance_create_layer(random(room_width), random(room_height), "Instances", Obj_PuzzlePiece)
	currPiece.depth = -(numOfPieces-i)
	array_push(pieceList, currPiece)
	
	
	// Temp assignment of positional IDs
	var tempID = [i%3, floor(i/3)]
	currPiece.posID = tempID
	currPiece.sides = DefineSides(tempID)
	
}
setPieceDepths()