class CtaPagarsController < ApplicationController
  # GET /cta_pagars
  # GET /cta_pagars.json
  def index
    @cta_pagars = CtaPagar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cta_pagars }
    end
  end

  # GET /cta_pagars/1
  # GET /cta_pagars/1.json
  def show
    @cta_pagar = CtaPagar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cta_pagar }
    end
  end

  # GET /cta_pagars/new
  # GET /cta_pagars/new.json
  def new
    @cta_pagar = CtaPagar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cta_pagar }
    end
  end

  # GET /cta_pagars/1/edit
  def edit
    @cta_pagar = CtaPagar.find(params[:id])
  end

  # POST /cta_pagars
  # POST /cta_pagars.json
  def create
    @cta_pagar = CtaPagar.new(params[:cta_pagar])

    respond_to do |format|
      if @cta_pagar.save
        format.html { redirect_to @cta_pagar, notice: 'Cta pagar was successfully created.' }
        format.json { render json: @cta_pagar, status: :created, location: @cta_pagar }
      else
        format.html { render action: "new" }
        format.json { render json: @cta_pagar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cta_pagars/1
  # PUT /cta_pagars/1.json
  def update
    @cta_pagar = CtaPagar.find(params[:id])

    respond_to do |format|
      if @cta_pagar.update_attributes(params[:cta_pagar])
        format.html { redirect_to @cta_pagar, notice: 'Cta pagar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cta_pagar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cta_pagars/1
  # DELETE /cta_pagars/1.json
  def destroy
    @cta_pagar = CtaPagar.find(params[:id])
    @cta_pagar.destroy

    respond_to do |format|
      format.html { redirect_to cta_pagars_url }
      format.json { head :no_content }
    end
  end
end
