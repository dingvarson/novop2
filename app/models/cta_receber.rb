class CtaReceber < ActiveRecord::Base
  attr_accessible :descr_serv, :nomecli, :valor, :status, :data_recebimento
  
  
  validates_presence_of :descr_serv, :nomecli, :valor


#inserindo upcase antes de salvar os dados

before_save :upcase_cta_receber

private

def upcase_cta_receber
  descr_serv.upcase!
  nomecli.upcase!
end
end
