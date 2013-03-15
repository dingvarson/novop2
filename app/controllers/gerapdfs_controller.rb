class GerapdfsController < ApplicationController
  
  #forçando á ser carregado um outro layout para os relatórios
  layout 'rpt_cliente/rpt_comprovante_cli'

  def show
   @cadcli = Cadcli.find(params[:id])
  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadcli }
      
  
   end
  end
  
end
  
  

