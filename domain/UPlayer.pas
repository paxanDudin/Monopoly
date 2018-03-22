unit UPlayer;

interface

uses
UPiece, UBoard, UDie, USquare;

type
  TPlayer = class
  private
    name: string;
    piece: TPiece;
    board: TBoard;
    dice: TDie;
  public
    procedure Player(name: string; dice: TDie; board: TBoard);
    procedure takeTurn;
  end;

implementation

{ TPlayer }

procedure TPlayer.Player(name: string; dice: TDie; board: TBoard);
begin
  self.name := name;
  self.dice := dice;
  self.board := board;
  piece:= TPiece.Create(board.getStartSquare);
end;

procedure TPlayer.takeTurn;
var
  rollTotal, i: integer;
  newLoc: TSquare;
begin
  // бросание кубиков
  rollTotal := 0;
  for i := 0 to dice.MAX do begin   // MAX -> length = 2
    dice.roll;  // for dice[i]
    rollTotal := rollTotal + dice.getFaceValue;
  end;
  newLoc := board.getSquare(piece.getLocation,rollTotal);
  piece.setLocation(newLoc);
end;

end.
