/// Chess pieces are responsible for providing functionality of each chess piece
/// on the chess board for the user.
///
/// In the game of chess, pieces are distinct an based on those distinctions can
/// can have specific characteristics and functionality. For example, pawns move
/// forward on the board by 1 square per turn, their bonus functionality is being
/// promoted to a piece of greater value such as a knight, rook, queen or bishop.
/// The ChessPieces struct sets up the distinctions and functionalities per piece.
struct ChessPiece: PiecesProtocol {

    /// Types of pieces that exist in chess.
    enum ChessPieceType: String {
        /// King piece
        case king = "K"
        /// Queen piece
        case queen = "Q"
        /// Bishop piece
        case bishop = "B"
        /// Knight piece
        case knight = "k"
        /// Rook piece
        case rook = "r"
        /// Pawn piece
        case pawn = "p"
    }

    /// Name of the chess piece.
    let name: ChessPieceType

    /// The colour of the chess piece.
    let colour: PlayerColour

    /// Tag of the chess piece to be displayed on the board.
    let tag: String

    /// The available positions where the Chess piece can move on the board.
    var validMoves: [Position]

    /// The current position of the Chess piece on the board.
    var currentPosition: Position

    /// Creates a new chess piece. (designated initializer)
    ///
    /// - Parameter name: The name of the chess piece.
    /// - Paremeter colour: The player which this chess piece belongs to.
    private init(
        name: ChessPieceType,
        colour: PlayerColour,
        tag: String,
        validMoves: [Position] = [],
        currentPosition: Position
    ) {
        self.name = name
        self.colour = colour
        self.tag = tag
        self.validMoves = validMoves
        self.currentPosition = currentPosition
    }

    /// Function which creates a King Chess piece and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the king piece belongs to.
    /// - Returns: The King chess piece.
    public static func createKing(
        colour: PlayerColour
    ) -> ChessPiece {
        var startingPosition: Position = Position(0, 0)
        if colour == PlayerColour.black {
            startingPosition = Position(0, 4)

        } else if colour == PlayerColour.white {
            startingPosition = Position(7, 4)
        }
        return ChessPiece(
            name: .king,
            colour: colour,
            tag: ChessPieceType.king.rawValue,
            currentPosition: startingPosition
        )
    }

    /// Function which creates a Queen Chess piece and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the queen piece belongs to.
    /// - Returns: The Queen chess piece.
    public static func createQueen(
        colour: PlayerColour
    ) -> ChessPiece {
        var startingPosition: Position = Position(0, 0)
        if colour == PlayerColour.black {
            startingPosition = Position(0, 3)

        } else if colour == PlayerColour.white {
            startingPosition = Position(7, 3)
        }
        return ChessPiece(
            name: .queen,
            colour: colour,
            tag: ChessPieceType.queen.rawValue,
            currentPosition: startingPosition
        )
    }

    /// Function which creates the two bishop Chess pieces and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the bishop pieces belongs to.
    /// - Returns: An array of the two Bishops.
    public static func createBishops(
        colour: PlayerColour
    ) -> [ChessPiece] {
        var leftStartingPosition: Position = Position(0, 0)
        var rightStartingPosition: Position = Position(0, 0)
        if colour == PlayerColour.black {
            leftStartingPosition = Position(0, 2)
            rightStartingPosition = Position(0, 5)

        } else if colour == PlayerColour.white {
            leftStartingPosition = Position(7, 2)
            rightStartingPosition = Position(7, 5)
        }
        return [
            ChessPiece(
                name: .bishop,
                colour: colour,
                tag: ChessPieceType.bishop.rawValue,
                currentPosition: leftStartingPosition
            ),
            ChessPiece(
                name: .bishop,
                colour: colour,
                tag: ChessPieceType.bishop.rawValue,
                currentPosition: rightStartingPosition
            )
        ]
    }

    /// Function which creates the two knight Chess pieces and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the knight pieces belongs to.
    /// - Returns: An array of the two Knights.
    public static func createKnights(
        colour: PlayerColour
    ) -> [ChessPiece] {
        var leftStartingPosition: Position = Position(0, 0)
        var rightStartingPosition: Position = Position(0, 0)
        if colour == PlayerColour.black {
            leftStartingPosition = Position(0, 1)
            rightStartingPosition = Position(0, 6)

        } else if colour == PlayerColour.white {
            leftStartingPosition = Position(7, 1)
            rightStartingPosition = Position(7, 6)
        }
        return [
            ChessPiece(
                name: .knight,
                colour: colour,
                tag: ChessPieceType.knight.rawValue,
                currentPosition: leftStartingPosition
            ),
            ChessPiece(
                name: .knight,
                colour: colour,
                tag: ChessPieceType.knight.rawValue,
                currentPosition: rightStartingPosition
            )
        ]
    }

    /// Function which creates the two knight Chess pieces and where it should be on the
    /// board.
    ///
    /// - Parameter colour: The colour of which the knight pieces belongs to.
    /// - Returns: An array of the two Knights.
    public static func createRooks(
        colour: PlayerColour
    ) -> [ChessPiece] {
        var leftStartingPosition: Position = Position(0, 0)
        var rightStartingPosition: Position = Position(0, 0)
        if colour == PlayerColour.black {
            leftStartingPosition = Position(0, 0)
            rightStartingPosition = Position(0, 7)

        } else if colour == PlayerColour.white {
            leftStartingPosition = Position(7, 0)
            rightStartingPosition = Position(7, 7)
        }
        return [
            ChessPiece(
                name: .rook,
                colour: colour,
                tag: ChessPieceType.rook.rawValue,
                currentPosition: leftStartingPosition
            ),
            ChessPiece(
                name: .rook,
                colour: colour,
                tag: ChessPieceType.rook.rawValue,
                currentPosition: rightStartingPosition
            )
        ]
    }

    /// Function which creates the eight pawns Chess pieces and where it should
    /// be on the board.
    ///
    /// - Parameter colour: The colour of which the pawns pieces belongs to.
    /// - Returns: An array of the eight pawns Knights.
    public static func createPawns(
        colour: PlayerColour
    ) -> [ChessPiece] {
        var position1: Position = Position(0, 0)
        var position2: Position = Position(0, 0)
        var position3: Position = Position(0, 0)
        var position4: Position = Position(0, 0)
        var position5: Position = Position(0, 0)
        var position6: Position = Position(0, 0)
        var position7: Position = Position(0, 0)
        var position8: Position = Position(0, 0)
        if colour == PlayerColour.black {
            position1 = Position(1, 0)
            position2 = Position(1, 1)
            position3 = Position(1, 2)
            position4 = Position(1, 3)
            position5 = Position(1, 4)
            position6 = Position(1, 5)
            position7 = Position(1, 6)
            position8 = Position(1, 7)

        } else if colour == PlayerColour.white {
            position1 = Position(6, 0)
            position2 = Position(6, 1)
            position3 = Position(6, 2)
            position4 = Position(6, 3)
            position5 = Position(6, 4)
            position6 = Position(6, 5)
            position7 = Position(6, 6)
            position8 = Position(6, 7)
        }
        return [
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position1
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position2
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position3
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position4
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position5
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position6
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position7
            ),
            ChessPiece(
                name: .pawn,
                colour: colour,
                tag: ChessPieceType.pawn.rawValue,
                currentPosition: position8
            )
        ]
    }

}