program bussiness;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Providers.Connection in 'src\providers\Providers.Connection.pas' {ProviderConnection: TDataModule},
  Providers.Cadastro in 'src\providers\Providers.Cadastro.pas' {ProviderCadastro: TDataModule};

begin
  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000);
end.
