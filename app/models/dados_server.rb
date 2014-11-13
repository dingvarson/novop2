class DadosServer < ActiveRecord::Base
  attr_accessible :email, :senha
#pode ter várias descrições  
has_many :descr_servers
end
