inherited ProviderCadastro: TProviderCadastro
  Width = 510
  inherited FDConnection: TFDConnection
    Left = 40
    Top = 24
  end
  inherited FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 40
    Top = 96
  end
  object qryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 384
    Top = 24
  end
  object qryRecordCount: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 288
    Top = 24
    object qryRecordCountCOUNT: TLargeintField
      FieldName = 'COUNT'
    end
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 168
    Top = 24
  end
end
