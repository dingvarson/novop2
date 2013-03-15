class RptClisController < ApplicationController
  
 
  
  #ACTION QUE TRAZ TODOS OS CLIENTES CADASTRADOS
  layout 'rpt_cliente/rpt_clientes'
  def index
   @cadclis = Cadcli.order("nomecli").all
  
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
   
    end
   end


end