class CadclisController < ApplicationController
    before_filter :require_login
  # GET /cadclis
  # GET /cadclis.json
  
  
    def index
    
   @cadclis = Cadcli.order("nomecli").all
  # @cadclis = Cadcli.paginate :per_page => 5, :page => params[:page] 
  
   
  @cadclis = Cadcli.paginate :per_page => 5, :page => params[:page], :order => 'nomecli'
     
   @cadcliss = Cadcli.sum(:valor)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadclis }
    end
  end
  
    # TESTANDO A PRIMEIRA CONSULTA COM BASE NUMA VIEW CRIADA NA MÃO
  def consulta
      @cadclis = Cadcli.where("nomecli like ?", "%#{params['lala'].upcase}%")
           
                                
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @cadclis }
      end
    end
  # -------------------------------------------------------------
  # CHAMANDO A VIEW CONSULTA DE CLIENTES
  
  def consul_cli
     
  end 
  #--------------------------------------------------------------  

  # GET /cadclis/1
  # GET /cadclis/1.json
  def show
    @cadcli = Cadcli.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadcli }
    end
  end

  # GET /cadclis/new
  # GET /cadclis/new.json
  def new
    @cadcli = Cadcli.new

    respond_to do |format|
            
      format.html # new.html.erb
      format.json { render json: @cadcli }
    end
  end

  # GET /cadclis/1/edit
  def edit
    @cadcli = Cadcli.find(params[:id])
  end




  # POST /cadclis
  # POST /cadclis.json
  def create
     #linha inserida para trocar virgula por ponto
    params[:cadcli][:valor].sub!(',','.')
    
    @cadcli = Cadcli.new(params[:cadcli])

    respond_to do |format|
      if @cadcli.save
        format.html { redirect_to @cadcli, notice: 'Cliente Criado com Exito.' }
        format.json { render json: @cadcli, status: :created, location: @cadcli }
      else
        format.html { render action: "new" }
        format.json { render json: @cadcli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cadclis/1
  # PUT /cadclis/1.json
  def update
    @cadcli = Cadcli.find(params[:id])

    respond_to do |format|
       #linha inserida para trocar virgula por ponto
    params[:cadcli][:valor].sub!(',','.')
    
      if @cadcli.update_attributes(params[:cadcli])
        format.html { redirect_to @cadcli, notice: 'Cliente Atualizado com Exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadcli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadclis/1
  # DELETE /cadclis/1.json
  def destroy
    @cadcli = Cadcli.find(params[:id])
    @cadcli.destroy

    respond_to do |format|
      format.html { redirect_to cadclis_url }
      format.json { head :no_content }
    end
  end
end
