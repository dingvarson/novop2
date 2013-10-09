 #encoding: utf-8
class CtaPagarsController < ApplicationController
 
  #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  
  
  
  # QUERY POR DATA
  def consuldata
    
    #tratamento de erro para o caso de nõo informar as datas
    if params['data1'].blank? or params['data2'].blank? then
    'Order was successfully updated.' 
    else
    
    
  @cta_pagars = CtaPagar.find(:all, :conditions =>["date(created_at) BETWEEN ? AND ? ", params['data1'],params['data2']], :order => "created_at")
  
  #somando tudo que tem no periodo informado pela consulta
  @somatoria = CtaPagar.sum(:valor, :conditions =>["date(created_at) BETWEEN ? AND ? ", params['data1'],params['data2']], :order => "created_at")
  
    respond_to do |format|
    format.html #show.html.erb
    format.json { render json: @cta_recebers }
  
               end
 
 end
 end
 #__________________________________________________________________________
  
  
  
  
  
  
  
  
  
  #efetuando a baixa de uma conta a pagar, alterando o status e a data de pagamento
   def pagamento
    
   @cta_pagars = CtaPagar.find(params[:id])
   @dataatual = Time.now
   
   #SE O STATUS NÃO ESTIVER COMO 'NÃO PAGO' NÃO SERÁ POSSIVEL EFETUAR O PAGAMENTO
    if @cta_pagars.status == "Á PAGAR"
    CtaPagar.update(@cta_pagars.id, :status => 'PAGA', :data_pagto => @dataatual)
  
  
   #recarregando a view com a data e o status atualizado
   @cta_pagars = CtaPagar.find(params[:id])
    redirect_to cta_pagar_path(@cta_pagars), :flash => { :alert => "BAIXA REALIZADA COM EXITO!" }

    else
    redirect_to cta_pagar_path(@cta_pagars), :flash => { :alert => "***Ocorreu um erro*** O Status já está como PAGO para o Pagamento: #{@cta_pagars.descricao} !" }
    end
    end
  
  
  
  
 
  # GET /cta_pagars
  # GET /cta_pagars.json
  def index
    @cta_pagars = CtaPagar.all
    
    @cta_pagars = CtaPagar.paginate :per_page => 5, :page => params[:page], :order => 'nomeforn'
     
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cta_pagars }
    end
  end

   # TESTANDO A PRIMEIRA CONSULTA COM BASE NUMA VIEW CRIADA NA MÃO
  def consulta
      @cta_pagars = CtaPagar.where("descricao like ?", "%#{params['lala'].upcase}%")
           
      
      respond_to do |format|
        format.html #show.html.erb
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
      @cta_pagar.status = 'Á PAGAR'
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
