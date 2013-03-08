class CtaPagar < ActiveRecord::Base
  attr_accessible :datavencto, :descricao, :nomeforn, :valor

 before_save :upcase_ctapagar

private
def upcase_ctapagar
   descricao.upcase!
   nomeforn.upcase!
    end
   

#_____________________________________________

before_update :upcase_ctapagar
private
def upcase_ctapagar
  descricao.upcase!
  nomeforn.upcase!
end

end
