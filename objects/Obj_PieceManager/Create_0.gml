pieceList = []
heldPiece = noone
pickUpOrigin = [0, 0]
mouseOrigin = [0, 0]
numOfPieces = 0
pieceSize = 60

setPieceDepths = function() {
	for(var i = 0; i < numOfPieces; i++) {
		pieceList[i].depth = -(numOfPieces-i)
	}
}