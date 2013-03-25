class RptClisController < ApplicationController
 
   
 #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  #layout 'rpt_cliente/rpt_fichacli', :except => :index
  def show
   @cadcli = Cadcli.find(params[:id])
   
   render :layout => 'rpt_cliente/rpt_fichacli'   
     
  end
  
 #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  #layout 'rpt_cliente/rpt_clientes', :except => :show
  
  def index
   @cadclis = Cadcli.order("nomecli").all
  
   #somatoria em reais de clientes fixos mensal
   @cadcliss = Cadcli.sum(:valor)
   #quantidade de clientes fixos mensal
   @avulso = Cadcli.count(:conditions => "status = 'SEM CONTRATO'")
   #quantidade de clientes sem contrato
   @fixo_mensal = Cadcli.count(:conditions => "status <> 'SEM CONTRATO'")
   render :layout => 'rpt_cliente/rpt_clientes' 
   
    
   end


end