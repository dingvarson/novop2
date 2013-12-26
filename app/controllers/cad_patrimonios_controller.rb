class CadPatrimoniosController < ApplicationController
  # GET /cad_patrimonios
  # GET /cad_patrimonios.json
  def index
    @cad_patrimonios = CadPatrimonio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cad_patrimonios }
    end
  end

  # GET /cad_patrimonios/1
  # GET /cad_patrimonios/1.json
  def show
    @cad_patrimonio = CadPatrimonio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cad_patrimonio }
    end
  end

  # GET /cad_patrimonios/new
  # GET /cad_patrimonios/new.json
  def new
    @cad_patrimonio = CadPatrimonio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cad_patrimonio }
    end
  end

  # GET /cad_patrimonios/1/edit
  def edit
    @cad_patrimonio = CadPatrimonio.find(params[:id])
  end

  # POST /cad_patrimonios
  # POST /cad_patrimonios.json
  def create
    @cad_patrimonio = CadPatrimonio.new(params[:cad_patrimonio])

    respond_to do |format|
      if @cad_patrimonio.save
        format.html { redirect_to @cad_patrimonio, notice: 'Cad patrimonio was successfully created.' }
        format.json { render json: @cad_patrimonio, status: :created, location: @cad_patrimonio }
      else
        format.html { render action: "new" }
        format.json { render json: @cad_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cad_patrimonios/1
  # PUT /cad_patrimonios/1.json
  def update
    @cad_patrimonio = CadPatrimonio.find(params[:id])

    respond_to do |format|
      if @cad_patrimonio.update_attributes(params[:cad_patrimonio])
        format.html { redirect_to @cad_patrimonio, notice: 'Cad patrimonio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cad_patrimonio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cad_patrimonios/1
  # DELETE /cad_patrimonios/1.json
  def destroy
    @cad_patrimonio = CadPatrimonio.find(params[:id])
    @cad_patrimonio.destroy

    respond_to do |format|
      format.html { redirect_to cad_patrimonios_url }
      format.json { head :no_content }
    end
  end
end
