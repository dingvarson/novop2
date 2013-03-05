class PrincipalsController < ApplicationController
  def show
   
   @cadclis = Cadcli.where("datavencto < ?", DateTime.now.utc)

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
end
end
end
