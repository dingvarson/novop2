class CadprodsController < ApplicationController
 
  before_filter :require_login
 
 # query que localiza o produto pelo ID
  def consulta_prod
  @cadprod = Cadprod.find(params['lala'])         
                    
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @cadprods }
      end
    end
  
    def consul_cli
     
  end 
 
 
 
  # GET /cadprods
  # GET /cadprods.json
  def index
    @cadprods = Cadprod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadprods }
    end
  end

  # GET /cadprods/1
  # GET /cadprods/1.json
  def show
    @cadprod = Cadprod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadprod }
    end
  end

  # GET /cadprods/new
  # GET /cadprods/new.json
  def new
    @cadprod = Cadprod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cadprod }
    end
  end

  # GET /cadprods/1/edit
  def edit
    @cadprod = Cadprod.find(params[:id])
  end

  # POST /cadprods
  # POST /cadprods.json
  def create
    @cadprod = Cadprod.new(params[:cadprod])

    respond_to do |format|
      if @cadprod.save
        format.html { redirect_to @cadprod, notice: 'Cadprod was successfully created.' }
        format.json { render json: @cadprod, status: :created, location: @cadprod }
      else
        format.html { render action: "new" }
        format.json { render json: @cadprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cadprods/1
  # PUT /cadprods/1.json
  def update
    @cadprod = Cadprod.find(params[:id])

    respond_to do |format|
      if @cadprod.update_attributes(params[:cadprod])
        format.html { redirect_to @cadprod, notice: 'Cadprod was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadprod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadprods/1
  # DELETE /cadprods/1.json
  def destroy
    @cadprod = Cadprod.find(params[:id])
    @cadprod.destroy

    respond_to do |format|
      format.html { redirect_to cadprods_url }
      format.json { head :no_content }
    end
  end
end
