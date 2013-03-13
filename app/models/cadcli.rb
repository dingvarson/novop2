class Cadcli < ActiveRecord::Base
  attr_accessible :id, :nomecli, :status, :valor, :datavencto, :emailcli
  
 validates_presence_of :nomecli, :status, :emailcli, :message => "Preenchimento Obrigatorio"
 
 #inserindo upcase ao salvar os dados no banco
 before_save :upcase_cadcli

private
def upcase_cadcli
   nomecli.upcase!
    end
   

#_____________________________________________

before_update :upcase_cadcli
private
def upcase_cadcli
  nomecli.upcase!
end
end