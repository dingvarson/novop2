 #encoding: utf-8
class GerapdfsController < ApplicationController
#filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
 
  def show
    
   @cadcli = Cadcli.find(params[:id])
   
   #SE O STATUS NÃO ESTIVER COMO 'NÃO PAGO' NÃO SERÁ POSSIVEL EFETUAR O PAGAMENTO
    if @cadcli.status == "NÃO PAGO" or @cadcli.status == "SEM CONTRATO"
    @datanova = @cadcli.datavencto + 1.month
   Cadcli.update(@cadcli.id, :status => 'PAGO', :datavencto => @datanova)
   #recarregando a view com a data e o status atualizado
   @cadcli = Cadcli.find(params[:id])
    redirect_to cadcli_path(@cadcli), :flash => { :alert => "BAIXA REALIZADA COM EXITO!" }

    else
    redirect_to cadcli_path(@cadcli), :flash => { :alert => "***MENSAGEM*** O Status já está como PAGO para o Cliente: #{@cadcli.nomecli} !" }
    end
    end
 
 #GERANDO O PDF DO COMPROVANTE 
  def chama_rpt
    
   @cadcli = Cadcli.find(params[:id])
   @datanova = @cadcli.datavencto
   render :layout => 'rpt_cliente/rpt_comprovante_cli'
  
  end
end
  
  

