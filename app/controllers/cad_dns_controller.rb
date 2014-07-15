class CadDnsController < ApplicationController
  # GET /cad_dns
  # GET /cad_dns.json
  def index
    @cad_dns = CadDn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cad_dns }
    end
  end

  # GET /cad_dns/1
  # GET /cad_dns/1.json
  def show
    @cad_dn = CadDn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cad_dn }
    end
  end

  # GET /cad_dns/new
  # GET /cad_dns/new.json
  def new
    @cad_dn = CadDn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cad_dn }
    end
  end

  # GET /cad_dns/1/edit
  def edit
    @cad_dn = CadDn.find(params[:id])
  end

  # POST /cad_dns
  # POST /cad_dns.json
  def create
    @cad_dn = CadDn.new(params[:cad_dn])

    respond_to do |format|
      if @cad_dn.save
        format.html { redirect_to @cad_dn, notice: 'Cad dn was successfully created.' }
        format.json { render json: @cad_dn, status: :created, location: @cad_dn }
      else
        format.html { render action: "new" }
        format.json { render json: @cad_dn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cad_dns/1
  # PUT /cad_dns/1.json
  def update
    @cad_dn = CadDn.find(params[:id])

    respond_to do |format|
      if @cad_dn.update_attributes(params[:cad_dn])
        format.html { redirect_to @cad_dn, notice: 'Cad dn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cad_dn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cad_dns/1
  # DELETE /cad_dns/1.json
  def destroy
    @cad_dn = CadDn.find(params[:id])
    @cad_dn.destroy

    respond_to do |format|
      format.html { redirect_to cad_dns_url }
      format.json { head :no_content }
    end
  end
end
