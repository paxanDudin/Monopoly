unit UPlayer;

interface

uses
  SysUtils, Classes, Generics.Collections, Generics.Defaults,
  UPiece, UBoard, UDie, USquare;

type
  TPlayer = class
  private
    name: string;
    piece: TPiece;
    board: TBoard;
    dice: TList<TDie>;
  published
    constructor create(name: string; dice: TDie; board: TBoard);
  public
    procedure takeTurn;
    function GetLocation: TSquare;
    function getName: string;
  end;

implementation

{ TPlayer }

constructor TPlayer.create(name: string; dice: TDie; board: TBoard);
begin
  self.name := name;
  //self.dice := dice;
  self.dice := TList<TDie>.create;
  self.dice.Add(dice);
  self.dice.Add(dice);
  self.board := board;
  piece := TPiece.create(board.getStartSquare);
end;

function TPlayer.GetLocation: TSquare;
begin
  result := piece.GetLocation;
end;

function TPlayer.getName: string;
begin
  result := name;
end;

procedure TPlayer.takeTurn;
var
  rollTotal, i: integer;
  newLoc: TSquare;
begin
  // бросание кубиков
  rollTotal := 0;
  for i := 0 to dice.Count-1 do
  begin // length = 2
    dice.Items[i].roll;
    rollTotal := rollTotal + self.dice.Items[i].getFaceValue;
  end;
  newLoc := board.getSquare(piece.GetLocation, rollTotal);
  piece.setLocation(newLoc);
end;

end.
