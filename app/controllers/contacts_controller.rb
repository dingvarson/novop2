class ContactsController < ApplicationController
  
  #filtro para não deixar o acessar a URL sem estar logado
  before_filter :require_login
  def new
    @contact = Contact.new
  end
 
  def create
    @contact = Contact.new(params[:contact])
 
    if @contact.valid?
      ContactMailer.contact_message(params[:contact]).deliver
      flash[:notice] = 'Mensagem enviada com sucesso'
      redirect_to :action => 'new'
      return  
    end
 
    render :action => 'new'
  end
end