class Order < ActiveRecord::Base
    attr_accessible :end_cli, :fone_cli, :nome_cli, :status

has_many :items
has_many :cta_recebers

end
