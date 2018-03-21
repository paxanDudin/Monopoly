unit UPiece;

interface

uses
  USquare;

type
  TPiece = class
  private
    location: TSquare;
  public
    procedure Piece(location: TSquare);
    function getLocation: TSquare;
    procedure setLocation(location: TSquare);
  end;

implementation

{ TPiece }

function TPiece.getLocation: TSquare;
begin
  result := location;
end;

procedure TPiece.Piece(location: TSquare);
begin
  self.location := location;
end;

procedure TPiece.setLocation(location: TSquare);
begin
  self.location := location;
end;

end.
