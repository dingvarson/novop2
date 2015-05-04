class ContatosController < ApplicationController
  
  #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  
    # TESTANDO A PRIMEIRA CONSULTA COM BASE NUMA VIEW CRIADA NA MÃO
  def consulta
      @contatos = Contato.where("nome_completo like ?", "%#{params['lala'].upcase}%")
           
                                
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @contatos }
      end
    end
  # -------------------------------------------------------------
  # CHAMANDO A VIEW CONSULTA DE CLIENTES
  
  def consul_cli
     
  end 
  #--------------------------------------------------------------  
  
  
  
  # GET /contatos
  # GET /contatos.json
  def index
    @contatos = Contato.all
    @contatos = Contato.paginate :per_page => 5, :page => params[:page], :order => 'nome_completo'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contatos }
    end
  end

  # GET /contatos/1
  # GET /contatos/1.json
  def show
    @contato = Contato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contato }
     
    end
  end

  # GET /contatos/new
  # GET /contatos/new.json
  def new
    @contato = Contato.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contato }
    end
  end

  # GET /contatos/1/edit
  def edit
    @contato = Contato.find(params[:id])
  end

  # POST /contatos
  # POST /contatos.json
  def create
    @contato = Contato.new(params[:contato])

    respond_to do |format|
      if @contato.save
        format.html { redirect_to @contato, notice: 'Contato Criado com Exito.' }
        format.json { render json: @contato, status: :created, location: @contato }
      else
        format.html { render action: "new" }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contatos/1
  # PUT /contatos/1.json
  def update
    @contato = Contato.find(params[:id])

    respond_to do |format|
      if @contato.update_attributes(params[:contato])
        format.html { redirect_to @contato, notice: 'Contato foi atualizado com Exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos/1
  # DELETE /contatos/1.json
  def destroy
    @contato = Contato.find(params[:id])
    @contato.destroy

    respond_to do |format|
      format.html { redirect_to contatos_url }
      format.json { head :no_content }
    end
  end
end
