class OrdersController < ApplicationController
 
 #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
 
  # QUERY POR DATA
  def consuldata
    
    #tratamento de erro para o caso de nõo informar as datas
    if params['data1'].blank? or params['data2'].blank? then
    'Order was successfully updated.' 
    else
    
    
  @orders = Order.find(:all, :conditions =>["date(created_at) BETWEEN ? AND ? ", params['data1'],params['data2']], :order => "created_at")
  
  #somando tudo que tem no periodo informado pela consulta
  @items = Item.sum(:val_total, :conditions =>["date(created_at) BETWEEN ? AND ? ", params['data1'],params['data2']], :order => "created_at")
  
    respond_to do |format|
    format.html #show.html.erb
    format.json { render json: @order }
  
               end
 
 end
 end
 #__________________________________________________________________________
  
     # TESTANDO A PRIMEIRA CONSULTA COM BASE NUMA VIEW CRIADA NA MÃO
  def consulta
    
       @orders = Order.where("nome_cli like ?", "%#{params['lala'].upcase}%")
      # @orders = Order.paginate :per_page => 5, :page => params[:page], :order => 'nome_cli'
                                
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @order }
  end
     end
    
  # -------------------------------------------------------------
  # CHAMANDO A VIEW CONSULTA DE CLIENTES
  
  def consul_cli
     
  end 
  #--------------------------------------------------------------  
  
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order("nome_cli").all
    @orders = Order.paginate :per_page => 5, :page => params[:page], :order => 'nome_cli'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @items = Item.sum(:val_total, :conditions => {:order_id => [@order]})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
         
        
        format.html { redirect_to @order, notice: 'O.S. criada com Exito.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'O.S. atualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    Item.destroy_all(:order_id => @order)
    
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
