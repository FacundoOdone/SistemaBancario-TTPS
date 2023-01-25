class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  
  def index
    if helpers.current_user.operator?
      @users = User.where("rol = 'client'")
    else
      @users = User.all
    end
  end

  def change_password
    @user = User.find(params[:id])
  end

  def changed_password
    @user = User.find(params[:id])
    @userAux = User.find(params[:id])
    if (@user.valid_password?(params[:user][:old_encrypted_password]))
      if (params[:user][:new_encrypted_password] == params[:user][:repeated_encrypted_password])
        if(@user.update(password: params[:user][:new_encrypted_password]))
         flash[:notice]= "Contraseña actualizada con exito"
         redirect_to root_path and return
        end
      else
        flash[:alert] = "Las contraseñas no son iguales"
      end
    else
      flash[:alert] = "La contraseña actual no coinside"
    end
    redirect_to change_user_pass_path and return
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
    @user= User.new user_params
    @branch_offices = BranchOffice.all
  end

  def create
    @users = User.new(user_params)
    if(@users.save)
      if(@users.operator?)
        redirect_to sucursal_user_url(id: @users.id)
      else
      redirect_to index_user_path, notice: "Usuario Creado Correctamente"
      end
    else
      redirect_to new_user_path, alert: "Ocurrio un error al crear al usuario"
    end
  end

  def sucursal
    @user_id = params[:id]
    @branch_office = BranchOffice.all
  end

  def sucursal_update
    @user = User.find(params[:id])
    @branch_office = BranchOffice.find(params[:branchoffice])
    if  @user.update_attribute(:branch_office, @branch_office)
      redirect_to index_user_path, notice: "Usuario Creado Correctamente"
    else
      redirect_to sucursal_user_url, alert: "Ocurrio un error al crear al usuario"
    end
  end


  def destroy
    @users = User.find(params[:id])
    @turns = Turn.where(state: 0, client_id: params[:id])
    if @turns.size == 0
      if @users.destroy
        flash[:notice] = "Se elimino al usuario Correctamente"
      else
        flash[:alert] = "Ocurrio un error al intentar destruir al usuario"
      end
    else
      flash[:alert] = "No puede eliminar un usuario con turnos pendientes"
    end
    redirect_to index_user_path and return
  end

  def user_params
    params.fetch(:user ,  {}).permit(:email, :password, :rol,:branch_office)
  end
 
end
