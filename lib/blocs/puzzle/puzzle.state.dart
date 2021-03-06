part of 'puzzle_bloc.dart';

enum PuzzleStatus { incomplete, complete }

enum TileMovementStatus { nothingTapped, cannotBeMoved, moved }

class PuzzleState extends Equatable {
  const PuzzleState({
    this.numberOfCorrectTiles = 0,
    this.puzzle = const Puzzle(tiles: []),
    this.tileMovementStatus = TileMovementStatus.nothingTapped,
    this.puzzleStatus = PuzzleStatus.incomplete,
    this.lastTappedTile,
    this.numberOfMoves = 0,
  });

  @override
  List<Object?> get props => [
        puzzle,
        numberOfCorrectTiles,
        numberOfMoves,
        tileMovementStatus,
        puzzleStatus,
        lastTappedTile,
      ];

  final Puzzle puzzle;
  final PuzzleStatus puzzleStatus;
  final TileMovementStatus tileMovementStatus;
  final Tile? lastTappedTile;
  final int numberOfCorrectTiles;

  int get numberOfTilesLeft => puzzle.tiles.length - numberOfCorrectTiles - 1;
  final int numberOfMoves;

  PuzzleState copyWith({
    Puzzle? puzzle,
    PuzzleStatus? puzzleStatus,
    TileMovementStatus? tileMovementStatus,
    int? numberOfCorrectTiles,
    int? numberOfMoves,
    Tile? lastTappedTile,
  }) {
    return PuzzleState(
        puzzle: puzzle ?? this.puzzle,
        puzzleStatus: puzzleStatus ?? this.puzzleStatus,
        tileMovementStatus: tileMovementStatus ?? this.tileMovementStatus,
        numberOfCorrectTiles: numberOfCorrectTiles ?? this.numberOfCorrectTiles,
        numberOfMoves: numberOfMoves ?? this.numberOfMoves,
        lastTappedTile: lastTappedTile ?? this.lastTappedTile,
    );
  }
}
