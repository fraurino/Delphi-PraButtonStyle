// *************************************************************************** }
//
// Delphi PraButtonStyle
//
// Copyright (c) 2020-2020 Paulo Roberto Alves
//
// https://github.com/pauloalvis/Delphi-PraButtonStyle
//
// ***************************************************************************
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// ***************************************************************************

unit PraRegister;

interface

uses

{$IF DEFINED(FPC)}
  ShellApi,
  // ToolsAPI,
  // DesignIntf,
  // DesignEditors,
  //Graphics,
  Classes
{$ELSE} // DEFINE DELPHI
  ShellApi,
  ToolsAPI,
  DesignIntf,
  DesignEditors,
  Vcl.Graphics,
  System.Classes;

{$ENDIF}

type
  TPraComponentProperty = class(TStringProperty)
  public
    function GetValue: string; override;
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  PraConsts,
  PraButtonStyle,
  PraAbout;

procedure Register;
begin
  RegisterComponents('Pra Components', [TPraButtonStyle]);
  RegisterPropertyEditor(TypeInfo(String), TPraButtonStyle, 'AboutInfo', TPraComponentProperty);
end;

procedure AddSplash;
Var
  bmp: TBitmap;
Begin
  bmp := TBitmap.Create;
  try
    bmp.LoadFromResourceName(HInstance, 'TPraLogo');
    SplashScreenServices.AddPluginBitmap(PraTitleDialog, bmp.Handle, false, PraAboutlicenseStatus + ' ' + 'v' + Version, '');
  finally
    bmp.Free;
  end;
End;

procedure TPraComponentProperty.Edit;
begin
  with TFPraViewAbout.Create(nil) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

function TPraComponentProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paDialog];
end;

function TPraComponentProperty.GetValue: string;
begin
  Result := Version;
end;

initialization

AddSplash;

end.
