class LogonsController < ApplicationController
  #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  def index
    @cadclis = Cadcli.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
    end
  end
  
 end
