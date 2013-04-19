#encoding: utf-8
class PrincipalsController < ApplicationController
  
  
  
  def index
   redirect_to show_principals_url
  end
  
  
  def show
    #esta query serve para trazer todos os clientes que não efetuaram
    # o pagamento da mensalidade e o status é diferente de SEM CONTRATO
   @cadclis = Cadcli.where("datavencto < ?", DateTime.now.utc).where("status=?", "NÃO PAGO")
  

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
end
end

def financeiro
end

def cadastro
  
end
end
