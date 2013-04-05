#encoding=utf-8
class ApplicationController < ActionController::Base
   
  private

  def require_login
    unless user_signed_in?
      flash[:error] = "Você precisa estar logado para acessar esta pagina" 
      redirect_to principals_url # Prevents the current action from running
    end
  end

  # The logged_in? method simply returns true if the user is logged in and
  # false otherwise. It does this by "booleanizing" the current_user method
  # we created previously using a double ! operator. Note that this is not
  # common in Ruby and is discouraged unless you really mean to convert something
  # into true or false.
  def user_signed_in?
    !!current_user
  end
  
    
end
