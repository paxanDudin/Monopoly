unit UBoard;

interface

Uses
  SysUtils, Classes, Generics.Collections, Generics.Defaults,
  USquare;

type
  TBoard = class
  const
    SIZE = 40;
  private
    squares: TList<TSquare>;
    procedure build(i: integer);
    procedure linkSquares;
    procedure link(i: integer);
  public
    // procedure Board;
    function getSquare(start: TSquare; distance: integer): TSquare;
    function getStartSquare: TSquare;
    procedure buildSquares;
  published
    constructor create;
  end;

implementation

procedure TBoard.build(i: integer);
var
  s: TSquare;
begin
  s := TSquare.create('Square ' + inttostr(i), i - 1);
  squares.Add(s);
end;

procedure TBoard.buildSquares;
var
  i: integer;
begin
  for i := 1 to SIZE do
    build(i);
end;

constructor TBoard.create;
begin
  squares := TList<TSquare>.create;
  buildSquares;
  linkSquares;
end;

function TBoard.getSquare(start: TSquare; distance: integer): TSquare;
var
  endIndex: integer;
begin
  endIndex := (start.getIndex + distance); // %SIZE ???
  result := squares.Items[endIndex];
end;

function TBoard.getStartSquare: TSquare;
begin
  result := squares.First;
end;

procedure TBoard.link(i: integer);
var
  next, current: TSquare;
begin
  current := squares.Items[i];
  next := squares.Items[i + 1];
  current.setNextSquare(next);
end;

procedure TBoard.linkSquares;
var
  i: integer;
begin
  for i := 0 to (SIZE - 1) do
  begin
    link(i);
  end;

end;

end.
