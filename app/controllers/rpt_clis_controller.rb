class RptClisController < ApplicationController
 #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
 
   
 #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  #layout 'rpt_cliente/rpt_fichacli', :except => :index
  def show
   @cadcli = Cadcli.find(params[:id])
   
   render :layout => 'rpt_cliente/rpt_fichacli'   
     
  end
  
 #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  #layout 'rpt_cliente/rpt_clientes', :except => :show
  
  def index
   #@cadclis = Cadcli.order("status, datavencto").all
   @cadclis = Cadcli.where(["status != ?", "SEM CONTRATO"]).order(:status,:datavencto)

  
   #somatoria em reais de clientes fixos mensal
   @cadcliss = Cadcli.sum(:valor)
   #quantidade de clientes fixos mensal
   @avulso = Cadcli.count(:conditions => "status = 'SEM CONTRATO'")
   #quantidade de clientes sem contrato
   @fixo_mensal = Cadcli.count(:conditions => "status <> 'SEM CONTRATO'")
   @valfixo_mensal = Cadcli.sum(:valor,:conditions => "status <> 'SEM CONTRATO'")
   
   render :layout => 'rpt_cliente/rpt_clientes' 
   
    
   end


end