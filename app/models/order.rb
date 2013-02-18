class Order < ActiveRecord::Base
    attr_accessible :end_cli, :fone_cli, :nome_cli

has_many :items

end
