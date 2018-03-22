unit UDie;

interface

type

  TDie = class
  const
    MAX = 6;
  private
    faceValue: integer;
  public
    procedure Die;
    procedure roll;
    function getFaceValue: integer;
  end;

implementation

{ TDie }

procedure TDie.Die;
begin
  roll;
end;

function TDie.getFaceValue: integer;
begin
  result := faceValue;
end;

procedure TDie.roll;
begin
  faceValue := random(1) * MAX + 1;
end;

end.
