class Item < ActiveRecord::Base
  belongs_to :order
  attr_accessible :descr, :quant, :val_total, :val_unit
  
  # tratamento nos campos
  validates_presence_of :descr, :quant, :val_unit, :message => 'existem campos em branco!'
  
  # --------------------------------------------------------------------
  
  before_update :upcase_item
  private
  def upcase_item
    descr.upcase!
  end
  
  #fazer uma multiplicação quando na adicão de itens na ordem de serviço
  
  before_save :save_item
  private
  
  def save_item
    # val_unit_number ainda nao existe pois eh criada na linha 25
    puts "#{val_unit} tipo #{val_unit.class}"
  
 #val_unit_number = val_unit.sub(',','.').to_f
 #quant_number = quant.sub(',','.').to_f
 self.val_total = val_unit * quant 
  
 # self.val_total = [self.quant,self.val_unit].compact.inject(:*)
  end
  
  #o mesmo procedimento para o Edit
   #fazer uma multiplicação quando na adicão de itens na ordem de serviço
  
  before_update :update_item
  private
  
  def update_item
  self.val_total = [self.quant,self.val_unit].compact.inject(:*)
 end 
  
end
#------------------------------------------------------------------------