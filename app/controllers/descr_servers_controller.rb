class DescrServersController < ApplicationController
  # GET /descr_servers
  # GET /descr_servers.json
  def index
    @descr_servers = DescrServer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @descr_servers }
    end
  end

 
  # GET /descr_servers/new
  # GET /descr_servers/new.json
  def new
    @descr_server = DescrServer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @descr_server }
    end
  end

  # GET /descr_servers/1/edit
  def edit
    @descr_server = DescrServer.find(params[:id])
  end

  # POST /descr_servers
  # POST /descr_servers.json
 

 def create
    @dados_server = DadosServer.find(params[:dados_server_id])
    @descr_server = @dados_server.descr_servers.create(params[:descr_server])
    redirect_to descr_server_path(@dados_server)
   end



  def update
    @descr_server = DescrServer.find(params[:id])

    respond_to do |format|
      
      if @descr_server.update_attributes(params[:descr_server])
        format.html { redirect_to dados_server_path(@descr_server.dados_server), notice: 'Item Atualizado com Exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadcli.errors, status: :unprocessable_entity }
      end
    end
  end
 
   
      
 def destroy
    @descr_server = DescrServer.find(params[:id])
    @descr_server.destroy
   
   redirect_to dados_server_path(@descr_server.dados_server) 
   end

end
