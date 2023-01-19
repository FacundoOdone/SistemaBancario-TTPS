class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!

  def current_ability
    @current_ability ||= Ability.new(current_user)
end

rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "No tenes permisos para acceder a esa funcionalidad"
    redirect_to root_path
end

  

end
