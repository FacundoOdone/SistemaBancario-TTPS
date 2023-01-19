class MainController < ApplicationController
 
  def home
    @userConected = current_user
  end
end
