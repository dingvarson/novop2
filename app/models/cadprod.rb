class Cadprod < ActiveRecord::Base
  attr_accessible :nomeprod, :quantprod, :total, :valunit


 #inserindo upcase
  before_save :upcase_cadprod
  private
  def upcase_cadprod
    nomeprod.upcase!
  end
  
#inserindo upcase
  before_update :upcase_cadprod
  private
  def upcase_cadprod
    nomeprod.upcase!
  end
  end