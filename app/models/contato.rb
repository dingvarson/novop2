class Contato < ActiveRecord::Base
  attr_accessible :aniversario, :celular, :grupo, :nome_completo, :telefone, :avatar
   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   
   #inserindo upcase
  before_save :upcase_contatos
  private
  def upcase_contatos
    grupo.upcase!
    nome_completo.upcase!
  end
end
