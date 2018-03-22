unit UMGame;

interface

uses
  SysUtils, Classes, Generics.Collections, Generics.Defaults,
  UBoard, UDie, UPlayer;

type
  TMGame = class
  const
    ROUNDS_TOTAL = 20;
    PLAYERS_TOTAL = 2;
  private
    players: TList<TPlayer>;
    board: TBoard;
    dice: TDie;
  published
    constructor create;
  public
    procedure playGame;
    function getPlayers: TList<TPlayer>;
    procedure playRound;
  end;

implementation

{ TMGame }

constructor TMGame.create;
var
  p: TPlayer;
begin
  dice := TDie.create;
  players := TList<TPlayer>.create;
  board := TBoard.create;
  p := TPlayer.create('Лошадь', dice, board);
  players.Add(p);
  p := TPlayer.create('Автомобиль', dice, board);
  players.Add(p);
end;

function TMGame.getPlayers: TList<TPlayer>;
begin
  result := players;
end;

procedure TMGame.playGame;
var
  i: integer;
begin
  for i := 0 to ROUNDS_TOTAL do
    playRound;
end;

procedure TMGame.playRound;
var
  player: TPlayer;
begin
  for player in players do
    player.takeTurn;
end;

end.
