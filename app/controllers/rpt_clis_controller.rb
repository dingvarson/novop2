class RptClisController < ApplicationController
 
   
 #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  layout 'rpt_cliente/rpt_fichacli', :except => :index
  def show
   @cadcli = Cadcli.find(params[:id])
  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadcli }
      
    
   end
  end
  
 #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  layout 'rpt_cliente/rpt_clientes', :except => :show
  
  def index
   @cadclis = Cadcli.order("nomecli").all
  
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
   
    end
   end


end