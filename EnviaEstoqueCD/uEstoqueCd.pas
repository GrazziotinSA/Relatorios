unit uEstoqueCd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param,  Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, ACBrBase, ACBrMail,System.DateUtils,System.IniFiles,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmEstoqueCD = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    dtsCadastrosNovos: TDataSource;
    qry: TFDQuery;
    btnImprimir: TBitBtn;
    FDQuery1: TFDQuery;
    dtsCadastros: TDataSource;
    ACBrMail1: TACBrMail;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);


    procedure CarregaParametros;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoqueCD: TfrmEstoqueCD;
  dDataIni, dDataFin       : TDateTime;
  iNumero : integer;
  sDataMax : string;
  iArqIni : tIniFile;
  sEmail,sAssunto,sEmailFrom,sUserName,sPassword,sNome,sCopia_oculta :STRING;

implementation

{$R *.dfm}

uses uFunc, ufuncoes;

procedure TfrmEstoqueCD.btnImprimirClick(Sender: TObject);
var
sCaminhoArquivo,sNomeArquivo,sCabecalho,sHtml,sPerUso,sNumSorteUsado,sNumSorteDisponivel : String;
sValor,sPecas,sCodigos, sCodigosVDA, sQtdVDA, sValorVDA :string;
codEstoque,codEstoqueRes, qtdEstoque, qtdEstoqueRes, valorEstoque, valorEstoqueRes, codVda, codVdaRes, qtdVda, qtdVdaRes, valorVda, valorVdaRes : integer;
begin
        sCaminhoArquivo := 'c:\EstoqueCD\';

    sCabecalho := '';
    sCabecalho := sCabecalho + '<tr>';
    sCabecalho := sCabecalho + '<th>Cod. Grupos</th>';
    sCabecalho := sCabecalho + '<th>Qtd. Codigos Estoque</th>';
    sCabecalho := sCabecalho + '<th>Qtd. Pe�as Estoque</th>';
    sCabecalho := sCabecalho + '<th>Valor Estoque</th>';
    sCabecalho := sCabecalho + '<th>Qtd. C�d. Barras Venda</th>';
    sCabecalho := sCabecalho + '<th>Qtd. Venda Semanal</th>';
    sCabecalho := sCabecalho + '<th>Valor Venda Semanal</th>';
    sCabecalho := sCabecalho + '</tr>';

    qry.Active := false;
    qry.SQL.Clear;
    qry.sql.Add('select est.cod_unidade                                                                               '+
                ',est.nro_skus nro_skus_est                                                                           '+
                ',est.qtde qtde_est                                                                                   '+
                ',est.valor valor_est                                                                                 '+
                ',ce_dia.nro_skus nro_skus_vda                                                                        '+
                ',ce_dia.qtde qtde_vda                                                                                '+
                ',ce_dia.valor valor_vda                                                                              '+
                'from                                                                                                 '+
                '(select a.cod_unidade                                                                                '+
                ',count(distinct a.cod_item) nro_skus                                                                 '+
                ',sum(nvl(a.qtd_estoque,0)) qtde                                                                    '+
                ',sum(nvl(a.vlr_medio_total,0)) valor                                                               '+
                'from ce_estoques a                                                                                   '+
                ',ie_itens b                                                                                          '+
                'where b.cod_item=a.cod_item                                                                          '+
                'and b.ind_avulso=0                                                                                   '+
                'and b.ind_inativo=0                                                                                  '+
                'and b.cod_tipo=''00''                                                                                  '+
                'and a.cod_emp=1                                                                                      '+
                'and nvl(a.qtd_estoque,0) > 0                                                                         '+
                'and a.cod_unidade in (818,838,848,858)                                                               '+
                'group by a.cod_unidade                                                                               '+
                ' ) est                                                                                               '+
                ',(select substr(to_char(ge.cod_nivel2),1,2)||''8'' cod_unidade                                         '+
                ' ,count(distinct ce.cod_item) nro_skus                                                               '+
                ',sum(decode(ce.tip_lancamento,2,nvl(ce.qtd_lancamento,0),(nvl(ce.qtd_lancamento,0) * -1))) qtde      '+
                ',sum(decode(ce.tip_lancamento,2,nvl(ce.vlr_total,0),(nvl(ce.vlr_total,0) * -1))) valor            '+
                'from ce_diarios ce                                                                                   '+
                ',ie_itens ie                                                                                         '+
                ',ge_unidades ge                                                                                      '+
                'where ge.cod_unidade=ce.cod_unidade                                                                  '+
                'and ie.cod_item=ce.cod_item                                                                          '+
                'and ie.ind_avulso=0                                                                                  '+
                'and ie.ind_inativo=0                                                                                 '+
                'and ie.cod_tipo=''00''                                                                                 '+
                'and ce.cod_emp=1                                                                                     '+
                'and ce.ind_estoque=1                                                                                 '+
                'and ce.tip_lancamento in (1,2)                                                                       '+
                'and ce.ind_venda=1                                                                                   '+
                'and ce.cod_oper in (106,107,300,302,305,2106,2107,3300,3302,3305)                                    '+
                'and ce.dta_lancamento >= trunc(sysdate - 7)                                                          '+
                'and ce.dta_lancamento <  trunc(sysdate)                                                              '+
                'group by ge.cod_nivel2                                                                               '+
                ' ) ce_dia                                                                                            '+
                'where est.cod_unidade = ce_dia.cod_unidade                                                           '+
                'order by est.cod_unidade                                                                             ');
    qry.Active := true;



       sHtml := '';
       sHtml := sHtml + '<html>';
       sHtml := sHtml + '<head>';
       sHtml := sHtml + '<title>Grupo Grazziotin</title>';
       sHtml := sHtml + '<h3>Grupo Grazziotin S/A.</h3>';
       sHtml := sHtml + '</head>';
       sHtml := sHtml + '<body>';
       sHtml := sHtml + 'Data: '+FormatDateTime('dd/mm/yyyy',Date) + '  Hora: '+FormatDateTime('hh:mm', Time)+'</b></p>';
       sHtml := sHtml + '<table border="1" cellpadding="3" cellspacing="1">';

       sHtml := sHtml + sCabecalho;

       if qry.RecordCount > 0 then
       Begin
           qry.First;
           while not qry.Eof do
            Begin
                codEstoque :=  qry.FieldByName('nro_skus_est').AsInteger;
                codEstoqueRes := codEstoqueRes + codEstoque;
                qtdEstoque := qry.FieldByName('qtde_est').AsInteger;
                qtdEstoqueRes := qtdEstoqueRes + qtdEstoque;
                valorEstoque := qry.FieldByName('valor_est').AsInteger;
                valorEstoqueRes := valorEstoqueRes + valorEstoque;
                codVda := qry.FieldByName('nro_skus_vda').AsInteger;
                codVdaRes := codVdaRes + codVda;
                qtdVda := qry.FieldByName('qtde_vda').AsInteger;
                qtdVdaRes := qtdVdaRes + qtdVda;
                valorVda := qry.FieldByName('valor_vda').AsInteger;
                valorVdaRes := valorVdaRes + valorVda;

                sHtml := sHtml + '<tr>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+qry.FieldByName('cod_unidade').AsString+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+FormatFloat('#,###',qry.FieldByName('nro_skus_est').AsInteger)+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+FormatFloat('#,###',qry.FieldByName('qtde_est').AsInteger)+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+FormatFloat('#,0.00;-#,0.00',qry.FieldByName('valor_est').AsFloat)+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+FormatFloat('#,###',qry.FieldByName('nro_skus_vda').AsInteger)+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+FormatFloat('#,###',qry.FieldByName('qtde_vda').AsInteger)+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+FormatFloat('#,0.00;-#,0.00',qry.FieldByName('valor_vda').AsFloat)+'</td>';
                sHtml := sHtml + '</tr>';
                qry.Next;

            end;



          //  sValor    := FormatFloat('#,0.00;-#,0.00',fDQuery1.FieldByName('valor_est').AsFloat);
           // sPecas    := FormatFloat('#,###',  fDQuery1.FieldByName('qtde_est').AsInteger);
            sCodigos  := FormatFloat('#,###', codEstoqueRes);
            sPecas  := FormatFloat('#,###', qtdEstoqueRes);
            sValor  := FormatFloat('#,0.00;-#,0.00', valorEstoqueRes);
            sCodigosVDA  := FormatFloat('#,###', codVdaRes);
            sQtdVDA  := FormatFloat('#,###', qtdVdaRes);
            sValorVDA  := FormatFloat('#,0.00;-#,0.00', valorVdaRes);



                sHtml := sHtml + '<tr>';
                sHtml := sHtml + '<td align="right" <th>TOTAL</th>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+sCodigos+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+sPecas+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+sValor+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+sCodigosVDA+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+sQtdVDA+'</td>';
                sHtml := sHtml + '<td align="right" WIDTH=100>'+sValorVDA+'</td>';
                sHtml := sHtml + '</tr>';
       end

       else

       sHtml := sHtml + '</table>';
       sHtml := sHtml + '</body>';
       sHtml := sHtml + '</html>';

          ACBrMail1.From := sEmailFrom;
          ACBrMail1.FromName := sNome;
          ACBrMail1.Host := 'smtp.office365.com';
          ACBrMail1.Username := sUserName;
          ACBrMail1.Password := sPassword;
          ACBrMail1.Port := '587';
          ACBrMail1.AddAddress(sEmail,'');
          ACBrMail1.AddBCC(sCopia_oculta);
          ACBrMail1.Subject := sAssunto;
          ACBrMail1.IsHTML := True;
          ACBrMail1.Body.Text :=  sHtml;
          AcbrMail1.SetTLS := True;
          ACBrMail1.Send;
end;

procedure TfrmEstoqueCD.FormCreate(Sender: TObject);
begin
   try

     FDConnection1.Params.UserName := 'nl';
     FDConnection1.Params.Password := 'nl';
     FDConnection1.Connected := True;
   except
       on E:EDatabaseError do
            begin
                 MessageDlg('Falha ao conectar o banco '+#13+
                            'a aplica��o vai fechar!'+#13+
                            E.Message,mtInformation,[mbOk], 0);
                Application.Terminate;
            end;
   end;

    CarregaParametros;
    btnImprimirClick(Sender);
end;

procedure TfrmEstoqueCD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case key of
          VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
     end;
end;



procedure TfrmEstoqueCD.CarregaParametros;
var
 sDiretorio: string;
begin
   try
  //sDiretorio := GetCurrentDir;
  sDiretorio :='c:\EnviaEstoqueCD\';
  iArqIni := TIniFile.Create(sDiretorio+'\config.ini');
  sEmail := iArqIni.ReadString('EMAIL','EMAIL','');
  sAssunto := iArqIni.ReadString('EMAIL FROM','Assunto','');
  sEmailFrom := iArqIni.ReadString('EMAIL FROM','Endereco','');
  sUserName := iArqIni.ReadString('EMAIL FROM','UserName','');
  sPassword := iArqIni.ReadString('EMAIL FROM','Password','');
  sNome := iArqIni.ReadString('EMAIL FROM','Nome','');
  sCopia_oculta :=  iArqIni.ReadString('EMAIL FROM','copia_oculta','');


  iArqINI.Free;

 except
  ShowMessage('Erro: N�o carregou arquivo de configura��o.'+chr(13)+
             'Verifique!!!!'+chr(13)+
             sDiretorio+'\config.ini');
  Application.Terminate;
  exit;
 end;



end;


end.
