class GerapdfsController < ApplicationController
  
  #forçando á ser carregado um outro layout para os relatórios
  layout 'layout_rpt'
  
  
  # GET /gerapdfs
  # GET /gerapdfs.json
  def index
    @gerapdfs = Gerapdf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gerapdfs }
    end
  end

  # GET /gerapdfs/1
  # GET /gerapdfs/1.json
  def show
    @cadcli = Cadcli.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadcli }
    end
  end

  # GET /gerapdfs/new
  # GET /gerapdfs/new.json
  def new
    @gerapdf = Gerapdf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gerapdf }
    end
  end

  # GET /gerapdfs/1/edit
  def edit
    @gerapdf = Gerapdf.find(params[:id])
  end

  # POST /gerapdfs
  # POST /gerapdfs.json
  def create
    @gerapdf = Gerapdf.new(params[:gerapdf])

    respond_to do |format|
      if @gerapdf.save
        format.html { redirect_to @gerapdf, notice: 'Gerapdf was successfully created.' }
        format.json { render json: @gerapdf, status: :created, location: @gerapdf }
      else
        format.html { render action: "new" }
        format.json { render json: @gerapdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gerapdfs/1
  # PUT /gerapdfs/1.json
  def update
    @gerapdf = Gerapdf.find(params[:id])

    respond_to do |format|
      if @gerapdf.update_attributes(params[:gerapdf])
        format.html { redirect_to @gerapdf, notice: 'Gerapdf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gerapdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gerapdfs/1
  # DELETE /gerapdfs/1.json
  def destroy
    @gerapdf = Gerapdf.find(params[:id])
    @gerapdf.destroy

    respond_to do |format|
      format.html { redirect_to gerapdfs_url }
      format.json { head :no_content }
    end
  end
end
