class PrincipalsController < ApplicationController
  def show
    #esta query serve para trazer todos os clientes que não efetuaram
    # o pagamento da mensalidade e o status é diferente de SEM CONTRATO
   @cadclis = Cadcli.where("datavencto < ?", DateTime.now.utc).where("status<>?", "SEM CONTRATO")
  

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
end
end
end
