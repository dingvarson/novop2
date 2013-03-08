class CtaRecebersController < ApplicationController
 
  # GET /cta_recebers
  # GET /cta_recebers.json
  
  def index
    @cta_recebers = CtaReceber.order("nomecli").all
    
   @cta_recebers = CtaReceber.paginate :per_page => 5, :page => params[:page], :order => 'nomecli'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cta_recebers }
    end
  end
  
   # TESTANDO A PRIMEIRA CONSULTA COM BASE NUMA VIEW CRIADA NA MÃO
  def consulta
      @cta_recebers = CtaReceber.where("nomecli like ?", "%#{params['lala'].upcase}%")
           
      
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @cta_recebers }
      end
    end
  # -------------------------------------------------------------
  # CHAMANDO A VIEW CONSULTA DE CLIENTES
  
  
  
  def consul_cli
     
  end 
  #--------------------------------------------------------------  
 

 

  # GET /cta_recebers/1
  # GET /cta_recebers/1.json
  def show
    @cta_receber = CtaReceber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cta_receber }
    end
  end

  

  # GET /cta_recebers/new
  # GET /cta_recebers/new.json
  
  def new
    @cta_receber = CtaReceber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cta_receber }
    end
  end

  # GET /cta_recebers/1/edit
  def edit
    @cta_receber = CtaReceber.find(params[:id])
  end

  # POST /cta_recebers
  # POST /cta_recebers.json
  def create
    
       
    @cta_receber = CtaReceber.new(params[:cta_receber])
    
    

    respond_to do |format|
      if @cta_receber.save
        format.html { redirect_to @cta_receber, notice: 'Conta Criada com Exito.' }
        format.json { render json: @cta_receber, status: :created, location: @cta_receber }
      else
        format.html { render action: "new" }
        format.json { render json: @cta_receber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cta_recebers/1
  # PUT /cta_recebers/1.json
  def update
    @cta_receber = CtaReceber.find(params[:id])

    respond_to do |format|
      if @cta_receber.update_attributes(params[:cta_receber])
        format.html { redirect_to @cta_receber, notice: 'Conta atualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cta_receber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cta_recebers/1
  # DELETE /cta_recebers/1.json
  def destroy
    @cta_receber = CtaReceber.find(params[:id])
    @cta_receber.destroy

    respond_to do |format|
      format.html { redirect_to cta_recebers_url }
      format.json { head :no_content }
    end
  end
end
