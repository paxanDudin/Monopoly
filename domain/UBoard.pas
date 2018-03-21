unit UBoard;

interface

Uses
  SysUtils, Classes,
  USquare;

type
  TBoard = class
  const
    SIZE = 40;
  private
    squares: TList;
  public
    procedure Board;
    function getSquare(start: TSquare; distance: integer): TSquare;
    function getStartSquare: TSquare;
    procedure buildSuares;
    procedure build(i: integer);
  end;

implementation

{ TBoard }

procedure TBoard.Board;
begin
  //buildSqueres;
  //linkSqueres;
end;

procedure TBoard.build(i: integer);
var
  s: TSquare;
begin
  s:= TSquare.Create('Square '+inttostr(i),i-1);
end;

procedure TBoard.buildSuares;
var
  i: integer;
begin
  for i := 1 to SIZE do
    build(i);
end;

function TBoard.getSquare(start: TSquare; distance: integer): TSquare;
var
  endIndex: integer;
begin
  endIndex := (start.getIndex + distance); //  %SIZE ???
  result := squares.Items[endIndex];
end;

function TBoard.getStartSquare: TSquare;
begin
  result := squares.First;
end;

end.
