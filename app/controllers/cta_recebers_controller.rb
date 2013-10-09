 #encoding: utf-8
class CtaRecebersController < ApplicationController
 
  #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  
  
  

  # GET /cta_recebers/1
  # GET /cta_recebers/1.json
  def show
    @cta_receber = CtaReceber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cta_receber }
    end
  end

  
  
  # QUERY POR DATA
  def consuldata
    
    #tratamento de erro para o caso de nõo informar as datas
    if params['data1'].blank? or params['data2'].blank? then
    'Order was successfully updated.' 
    else
    
    
  @cta_recebers = CtaReceber.find(:all, :conditions =>["date(created_at) BETWEEN ? AND ? ", params['data1'],params['data2']], :order => "created_at")
  
  #somando tudo que tem no periodo informado pela consulta
  @somatoria = CtaReceber.sum(:valor, :conditions =>["date(created_at) BETWEEN ? AND ? ", params['data1'],params['data2']], :order => "created_at")
  
    respond_to do |format|
    format.html #show.html.erb
    format.json { render json: @cta_recebers }
  
               end
 
 end
 end
 #__________________________________________________________________________
  
   
   #efetuando a baixa de uma conta a receber, alterando o status e a data de recebimento
   def recebimento
    
   @cta_recebers = CtaReceber.find(params[:id])
   @dataatual = Time.now
   
   #SE O STATUS NÃO ESTIVER COMO 'NÃO PAGO' NÃO SERÁ POSSIVEL EFETUAR O PAGAMENTO
    if @cta_recebers.status == "Á RECEBER"
    CtaReceber.update(@cta_recebers.id, :status => 'RECEBIDA', :data_recebimento => @dataatual)
  
  
   #recarregando a view com a data e o status atualizado
   @cta_recebers = CtaReceber.find(params[:id])
    redirect_to cta_receber_path(@cta_recebers), :flash => { :alert => "BAIXA REALIZADA COM EXITO!" }

    else
    redirect_to cta_receber_path(@cta_recebers), :flash => { :alert => "***Ocorreu um erro*** O Status já está como RECEBIDA para o Pagamento: #{@cta_recebers.descr_serv} !" }
    end
    end
  
  
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
    @cta_recebers = CtaReceber.where("status ==", "Á RECEBER")
           
      
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @cta_recebers }
      end
     
  end 
  #--------------------------------------------------------------  
 

 
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
             @cta_receber.status = 'Á RECEBER'
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
