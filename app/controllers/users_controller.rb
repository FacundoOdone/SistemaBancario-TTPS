class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def edit
    @user=User.find(params[:id])
  end

  def new
    @users= User.new
  end

  def create
    @users = User.new(email: params[:email], password: params[:encrypted_password], rol: params[:rol])
    if(@users.save)
      redirect_to users_index_path, notice: "Usuario Creado Correctamente"
    else
      redirect_to users_new_path, alert: "Ocurrio un error al crear al usuario"
    end
  end
end
