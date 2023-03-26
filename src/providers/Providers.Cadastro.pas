unit Providers.Cadastro;

interface

uses
  System.SysUtils, System.Classes, Providers.Connection, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, System.Generics.Collections,
  FireDAC.VCLUI.Wait;

type
  TProviderCadastro = class(TProviderConnection)
    qryPesquisa: TFDQuery;
    qryRecordCount: TFDQuery;
    qryCadastro: TFDQuery;
    qryRecordCountCOUNT: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
    function Append(const AJson: TJSONObject): Boolean; virtual;
    function Update(const AJson: TJSONObject): Boolean; virtual;
    function Delete : Boolean ; virtual;
    function ListAll(const AParams: TDictionary<string, string>): TFDQuery; virtual;
    function GetById(const AId: string): TFDQuery; virtual;
    function GetRecordCount: Int64; virtual;
  end;

var
  ProviderCadastro: TProviderCadastro;

implementation

uses DataSet.Serialize;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TProviderCadastro }

function TProviderCadastro.Append(const AJson: TJSONObject): Boolean;
begin
     qryCadastro.SQL.Add('where 1<>1');
     qryCadastro.Open();
     qryCadastro.LoadFromJSON(AJson, False);
     Result := qryCadastro.ApplyUpdates(0) = 0;
end;

function TProviderCadastro.Delete: Boolean;
begin
      qryCadastro.Delete;
      Result :=  qryCadastro.ApplyUpdates(0) = 0;

end;

function TProviderCadastro.GetById(const AId: string): TFDQuery;
begin
    qryCadastro.SQL.Add('where id = id');
    qryCadastro.ParamByName('id').AsLargeInt := AId.ToInt64;
    qryCadastro.Open();
    Result := qryCadastro;
end;

function TProviderCadastro.GetRecordCount: Int64;
begin
  qryRecordCount.Open();
  Result := qryRecordCountCOUNT.AsLargeInt;

end;

function TProviderCadastro.ListAll(
  const AParams: TDictionary<string, string>): TFDQuery;
begin
       if AParams.ContainsKey('limit') then
       begin
       qryPesquisa.FetchOptions.RecsMax := StrToIntdef(AParams.Items['limit'],50);
       qryPesquisa.FetchOptions.RowsetSize := StrToIntdef(AParams.Items['limit'],50);
end;
  if AParams.ContainsKey('offset') then
  qryPesquisa.FetchOptions.RecsSkip := StrToIntDef(AParams.Items['offset'], 0);
  qryPesquisa.open();
  Result := qryPesquisa;
  end;
function TProviderCadastro.Update(const AJson: TJSONObject): Boolean;
begin

end;

end.
