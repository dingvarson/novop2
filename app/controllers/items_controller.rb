class ItemsController < ApplicationController
   #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  
   def create
     #linha inserida para trocar virgula por ponto
    params[:item][:val_unit].sub!(',','.')
    #---------------------------------------------
    @order = Order.find(params[:order_id])
    @item = @order.items.create(params[:item])
    redirect_to order_path(@order)
   end
   
      
   def destroy
    @item = Item.find(params[:id])
    @item.destroy
    
   redirect_to order_path(@item.order) 
   end

 # GET /cadclis/1/edit
  def edit
    @item = Item.find(params[:id])
   
  end
  
  
  
   # PUT /cadclis/1
  # PUT /cadclis/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      #linha inserida para trocar virgula por ponto
      params[:item][:val_unit].sub!(',','.')
      #--------------------------------------------
      if @item.update_attributes(params[:item])
        format.html { redirect_to order_path(@item.order), notice: 'Item Atualizado com Exito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadcli.errors, status: :unprocessable_entity }
      end
    end
  end
 
   end
  