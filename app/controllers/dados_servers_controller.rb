class DadosServersController < ApplicationController
  # GET /dados_servers
  # GET /dados_servers.json
  def index
    @dados_servers = DadosServer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dados_servers }
    end
  end

  # GET /dados_servers/1
  # GET /dados_servers/1.json
  def show
    @dados_server = DadosServer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dados_server }
    end
  end


  # GET /dados_servers/new
  # GET /dados_servers/new.json
  def new
    @dados_server = DadosServer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dados_server }
    end
  end

  # GET /dados_servers/1/edit
  def edit
    @dados_server = DadosServer.find(params[:id])
  end

  # POST /dados_servers
  # POST /dados_servers.json
  
  
  
 
  
  def create
    
  @dados_server = DadosServer.new(params[:dados_server])
     respond_to do |format|
      if @dados_server.save
         
        format.html { redirect_to @dados_server, notice: 'Email e senha Cadastrados com Exito.' }
        format.json { render json: @dados_server, status: :created, location: @dados_server }
  
      else
        format.html { render action: "new" }
        format.json { render json: @dados_server.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
  # PUT /dados_servers/1
  # PUT /dados_servers/1.json
  def update
    @dados_server = DadosServer.find(params[:id])

    respond_to do |format|
      if @dados_server.update_attributes(params[:dados_server])
        format.html { redirect_to @dados_server, notice: 'Dados server was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dados_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dados_servers/1
  # DELETE /dados_servers/1.json
  def destroy
    @dados_server = DadosServer.find(params[:id])
    @dados_server.destroy

    respond_to do |format|
      format.html { redirect_to dados_servers_url }
      format.json { head :no_content }
    end
  end
end
