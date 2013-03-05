class AnotacaosController < ApplicationController
  # GET /anotacaos
  # GET /anotacaos.json
  def index
    @anotacaos = Anotacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @anotacaos }
    end
  end

  # GET /anotacaos/1
  # GET /anotacaos/1.json
  def show
    @anotacao = Anotacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @anotacao }
    end
  end

  # GET /anotacaos/new
  # GET /anotacaos/new.json
  def new
    @anotacao = Anotacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @anotacao }
    end
  end

  # GET /anotacaos/1/edit
  def edit
    @anotacao = Anotacao.find(params[:id])
  end

  # POST /anotacaos
  # POST /anotacaos.json
  def create
    @anotacao = Anotacao.new(params[:anotacao])

    respond_to do |format|
      if @anotacao.save
        format.html { redirect_to @anotacao, notice: 'Anotacao was successfully created.' }
        format.json { render json: @anotacao, status: :created, location: @anotacao }
      else
        format.html { render action: "new" }
        format.json { render json: @anotacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anotacaos/1
  # PUT /anotacaos/1.json
  def update
    @anotacao = Anotacao.find(params[:id])

    respond_to do |format|
      if @anotacao.update_attributes(params[:anotacao])
        format.html { redirect_to @anotacao, notice: 'Anotacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @anotacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anotacaos/1
  # DELETE /anotacaos/1.json
  def destroy
    @anotacao = Anotacao.find(params[:id])
    @anotacao.destroy

    respond_to do |format|
      format.html { redirect_to anotacaos_url }
      format.json { head :no_content }
    end
  end
end
