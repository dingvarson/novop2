class GerapdfsController < ApplicationController
  
  def show
   @cadcli = Cadcli.find(params[:id])
   @datanova = @cadcli.datavencto + 1.month
   Cadcli.update(@cadcli.id, :status => 'PAGO', :datavencto => @datanova)
   render :layout => 'rpt_cliente/rpt_comprovante_cli'
      
  end
  
end
  
  

