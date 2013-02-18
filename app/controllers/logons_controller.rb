class LogonsController < ApplicationController
  
  def index
    @cadclis = Cadcli.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
    end
  end
  
 end
