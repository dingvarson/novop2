class GerapdfsController < ApplicationController
  
  def show
   @cadcli = Cadcli.find(params[:id])
   @datanova = @cadcli.datavencto + 1.month
   Cadcli.update(@cadcli.id, :status => 'PAGO', :datavencto => @datanova)
   #recarregando a view com a data e o status atualizado
   @cadcli = Cadcli.find(params[:id])
   render 'cadclis/show'
  
   end
  
  def chama_rpt
    
   @cadcli = Cadcli.find(params[:id])
   @datanova = @cadcli.datavencto
   #Cadcli.update(@cadcli.id, :status => 'PAGO', :datavencto => @datanova)
   render :layout => 'rpt_cliente/rpt_comprovante_cli'
  
  end
end
  
  

