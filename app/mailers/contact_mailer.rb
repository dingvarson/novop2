class ContactMailer < ActionMailer::Base
  default :from => 'ddsuportservice@gmail.com'
 
  def contact_message(contact)
    @contact = contact
    mail(:to => 'ademir_sapmm@yahoo.com.br', :subject => 'Mensagem de Contato')
  end
end