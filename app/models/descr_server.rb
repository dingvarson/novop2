class DescrServer < ActiveRecord::Base
  #possui apenas um dado de cabeçalho
  belongs_to :dados_venda
  attr_accessible :cliente, :dns
  #tratamento para não salvar vazio o campo
  validates_presence_of :cliente, :dns
end
