object ProviderConnection: TProviderConnection
  Height = 169
  Width = 286
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=PG')
    LoginPrompt = False
    Left = 88
    Top = 48
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorHome = 'C:\delphi\projetos\bussines'
    Left = 192
    Top = 48
  end
end
