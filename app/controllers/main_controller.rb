class MainController < ApplicationController
  before_action :authenticate_user!
  
 
  def home
    @userConected = current_user
  end
end
