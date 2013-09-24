 #encoding: utf-8
class GerapdfsController < ApplicationController
#filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  
  
   #GERANDO O PDF DO COMPROVANTE DA ORDEM DE SERVIÇO
  def rpt_order
    
   @order = Order.find(params[:id])
   
   #Fazendo a somatoria de todos os itens na ordem de serviço
   @items = Item.sum(:val_total, :conditions => {:order_id => [@order]})
   
   render :layout => 'rpt_cliente/rpt_order'
  
  end
  
  #''''''''''''DANDO BAIXA NA O.S. E ENVIANDO OS VALORES PARA O CTA RECEBER
  def baixa_os
    
   @order = Order.find(params[:id])
   
    # SE JÁ FOI RECEBIDA A O.S. não enviará para o contar á Receber
   if @order.status == "RECEBIDA" 
   redirect_to order_path(@order), :flash => { :alert => "ESTA O.S. JA FOI RECEBIDA!" }
   else
   
     
   #SE O STATUS NÃO ESTIVER COMO 'NÃO PAGO' NÃO SERÁ POSSIVEL EFETUAR O PAGAMENTO
   #if @cadcli.status == "NÃO PAGO" or @cadcli.status == "SEM CONTRATO"
   @novostatus = 'RECEBIDA'
   Order.update(@order.id, :status => @novostatus)
   #recarregando a view com o status atualizado
   @order = Order.find(params[:id])
   
   #FAZENDO A SOMA DE TODOS OS ITENS PARA JOGAR NO CONTAS Á RECEBER
   @items = Item.sum(:val_total, :conditions => {:order_id => [@order]})

    
   #ENVIANDO PARA O CONTAS Á RECEBER
  
             contas_a_receber = CtaReceber.new(params[:cta_receber])
             contas_a_receber.nomecli = @order.nome_cli
             contas_a_receber.status = "A RECEBER"
             contas_a_receber.descr_serv = "Referente a O.S: #{@order.id}"
             contas_a_receber.valor = @items
             contas_a_receber.save!
             
   #''''''''''''''''''''''''''''''''''''
   
    redirect_to order_path(@order), :flash => { :alert => "O.S BAIXADA COM EXITO!" }
  end

  end
  #''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  
  
  
  
 
  def show
    
   @cadcli = Cadcli.find(params[:id])
   
   #SE O STATUS NÃO ESTIVER COMO 'NÃO PAGO' NÃO SERÁ POSSIVEL EFETUAR O PAGAMENTO
   #if @cadcli.status == "NÃO PAGO" or @cadcli.status == "SEM CONTRATO"
   @datanova = @cadcli.datavencto + 1.month
   Cadcli.update(@cadcli.id, :status => 'PAGO', :datavencto => @datanova)
  
  #ENVIANDO PARA O CONTAS Á RECEBER
  
             contas_a_receber = CtaReceber.new(params[:cta_receber])
             contas_a_receber.nomecli = @cadcli.nomecli
             contas_a_receber.status = "A RECEBER"
             contas_a_receber.descr_serv = "Pagamento de Mensalidade"
             contas_a_receber.valor = @cadcli.valor
             contas_a_receber.save!
             
   #''''''''''''''''''''''''''''''''''''
    
   #recarregando a view com a data e o status atualizado
   @cadcli = Cadcli.find(params[:id])
    redirect_to cadcli_path(@cadcli), :flash => { :alert => "BAIXA REALIZADA COM EXITO!" }

    #else
    #redirect_to cadcli_path(@cadcli), :flash => { :alert => "***MENSAGEM*** O Status já está como PAGO para o Cliente: #{@cadcli.nomecli} !" }
    #end
    end
 
 #GERANDO O PDF DO COMPROVANTE 
  def chama_rpt
    
   @cadcli = Cadcli.find(params[:id])
   @datanova = @cadcli.datavencto
   render :layout => 'rpt_cliente/rpt_comprovante_cli'
  end
  
  
 
  
end
  
  

