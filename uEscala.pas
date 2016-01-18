unit uEscala;



interface
 uses SysUtils, System.Classes;

 type TParcelas = (Tom, MeioTom);
 Type TTiposEscalas = (Maior , Menor , Pentatonica);


 type TEscala = class(TObject)



  private
    FListaNotas : TStringList;
    FInicio : integer;

    function Somar( pIndiceNota : Integer;pValor : TParcelas):integer;
    function IdentificaIndice(pNota :  string): integer;



  public
    constructor Create;
    destructor Destroy;
    function EscalaMaior : TArray<TParcelas>;
    function RetornaEscala(pInicio : string ;pTipoEscala : TTiposEscalas) : TStringList;


 end;

implementation

{ TEscala }

constructor TEscala.Create;
begin
 FListaNotas := TStringList.Create;
 FListaNotas.Add('C');
 FListaNotas.Add('C#');
 FListaNotas.Add('D');
 FListaNotas.Add('D#');
 FListaNotas.Add('E');
 FListaNotas.Add('F');
 FListaNotas.Add('F#');
 FListaNotas.Add('G');
 FListaNotas.Add('G#');
 FListaNotas.Add('A');
 FListaNotas.Add('A#');
 FListaNotas.Add('B');
end;

destructor TEscala.Destroy;
begin
 FListaNotas.DisposeOf;
 inherited;
end;

function TEscala.EscalaMaior: TArray<TParcelas>;
var
 lVetor : TArray<TParcelas>;
begin
  SetLength(lVetor,7);
  lVetor[0] := (TParcelas.Tom);
  lVetor[1] := (TParcelas.Tom);
  lVetor[2] := (TParcelas.MeioTom);
  lVetor[3] := (TParcelas.Tom);
  lVetor[4] := (TParcelas.Tom);
  lVetor[5] := (TParcelas.Tom);
  lVetor[6] := (TParcelas.MeioTom);
  Result := lVetor;
end;

function TEscala.IdentificaIndice(pNota: string): integer;
begin
 Result := FListaNotas.IndexOf(pNota);
end;

function TEscala.RetornaEscala(pInicio: string;
  pTipoEscala: TTiposEscalas): TStringList;
var
 lListaEscala : TStringList;
 lVetor : TArray<TParcelas>;
 i : integer;
 lIndiceSomado : integer;
begin
 lListaEscala := TStringList.Create;
 FInicio := IdentificaIndice(pInicio);
 if FInicio > -1 then
 begin

   lListaEscala.Add(pInicio);
   lIndiceSomado := FInicio;

   case pTipoEscala of
     Maior: begin
             lVetor := EscalaMaior;
             for i :=0 to length(lVetor) -1   do
             begin
               lIndiceSomado := Somar(lIndiceSomado,lVetor[i]);
               lListaEscala.Add(FListaNotas[lIndiceSomado]) ;
             end;
            end;

     Menor: ;
     Pentatonica: ;
   end;
 end;

 Result :=  lListaEscala;
end;

function TEscala.Somar(pIndiceNota : Integer;pValor: TParcelas): integer;
var
 x : integer;
begin

 case pValor of
   MeioTom: begin
              if pIndiceNota = 11 then
              begin
                pIndiceNota := -1;
              end;

              Result := pIndiceNota +1;
            end;
   Tom:     begin
             if pIndiceNota = 10 then
             begin
               pIndiceNota := -2;
             end
             else
             begin
               if pIndiceNota = 11 then
               begin
                pIndiceNota := -2;
               end;
             end;

             Result := pIndiceNota + 2;

            end;

 end;
end;
end.
