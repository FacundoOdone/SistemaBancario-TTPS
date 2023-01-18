class UsersController < ApplicationController
  

  
  def index
    @users= User.all
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @users= User.find(params[:id])
    if (params[:encrypted_password] != "" && params[:rol] != "")
      if (@users.update(email: params[:email], password: params[:encrypted_password], rol: params[:rol]))
        redirect_to index_user_path, notice: "Usuario actualizado Correctamente"
      else
        redirect_to index_user_path, alert: "Ocurrio un error al actualizar al usuario"
      end
    else
      if (@users.update(email: params[:email], rol: params[:rol]))
        redirect_to index_user_path, notice: "Usuario actualizado Correctamente"
      else
        redirect_to index_user_path, alert: "Ocurrio un error al actualizar al usuario"
      end
    end
    
  end

  def new
    @user= User.new
  end

  def create
    @users = User.new(email: params[:email], password: params[:encrypted_password], rol: params[:rol])
    if(@users.save)
      redirect_to index_user_path, notice: "Usuario Creado Correctamente"
    else
      redirect_to new_user_path, alert: "Ocurrio un error al crear al usuario"
    end
  end

  def destroy
    @users = User.find(params[:id])
    if (@users.destroy)
      flash[:notice] = "Se elimino al usuario Correctamente"
      redirect_to index_user_path and return
    else
      flash[:alert] = "Ocurrio un error al intentar destruir al usuario"
      redirect_to index_user_path and return
    end
  end

 
end
