unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, dateutils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    EditHMS: TEdit;
    EditEpoc: TEdit;
    iDia: TEdit;
    iYear: TEdit;
    iMes: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);

  // convertimos de Epoch -> Human
  var
    iepoch   : Int64;  // tenia interger -> int64
    myString : String;
begin
     myString := edit1.Text;
     iepoch   := myString.ToInt64 ;
     myString := DateTimeToStr(UnixToDateTime(iepoch));
     // label1.Caption:= myString;
     EditHMS.Text  := myString;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  iepoch : integer;
  myDate : TDateTime;
  tmpStr : AnsiString;
begin
  // convertimos de Human -> Epoc
     tmpStr :=  iDia.text + DateSeparator + iMes.text + DateSeparator + iYear.text;
     myDate := StrToDateTime(tmpStr);
     iepoch := DateTimeToUnix( myDate );
     // label2.Caption:= iepoch.ToString;
     EditEpoc.Text := iepoch.ToString;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
    diadehoy : integer;
    Y,M : Word;
begin
  // cargamos los valores iniciales
     diadehoy   := DayOfTheMonth(now);
     M  := MonthOf(Today);
     Y  := YearOf(Today);
     iDia.Text  := diadehoy.ToString;
     iMes.Text  := M.ToString;
     iYear.Text := Y.ToString;
  // tambien ponemos el Epoch de hoy
     diadehoy   := DateTimeToUnix( now );
     edit1.Text := diadehoy.ToString;
end;
    // fin del programa ...
end.

