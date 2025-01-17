unit PraAbout;

interface

uses


{$IF DEFINED(FPC)}
  Windows,
  Classes,
  Controls,
  Forms,
  ExtCtrls,
  StdCtrls,
  Graphics
  //TPortableNetworkGraphic
{$ELSE} // DEFINE DELPHI
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage
{$ENDIF} ;


type
  TFPraViewAbout = class(TForm)
    Bevel1: TBevel;
    lbVersion: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Image1: TImage;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    procedure Label5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  FPraViewAbout: TFPraViewAbout;

implementation

uses

{$IF DEFINED(FPC)}
  ShellAPI,
  PraConsts
{$ELSE} // DEFINE DELPHI
  Winapi.ShellAPI,
  PraConsts
{$ENDIF} ;

{$R *.dfm}

procedure TFPraViewAbout.FormCreate(Sender: TObject);
begin
  lbVersion.Caption := 'Version ' + version;
end;

procedure TFPraViewAbout.Label5Click(Sender: TObject);
begin
   ShellExecute(0, 'open', PChar('https://github.com/pauloalvis/Delphi-PraButtonStyle'), nil, nil, SW_SHOWNORMAL);
end;

end.
