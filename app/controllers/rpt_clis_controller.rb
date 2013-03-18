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
  
   @cadcliss = Cadcli.sum(:valor)
   
   render :layout => 'rpt_cliente/rpt_clientes' 
   
    
   end


end