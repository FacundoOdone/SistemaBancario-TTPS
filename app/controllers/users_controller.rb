class UsersController < ApplicationController
  load_and_authorize_resource

  
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

    @userAux.password = params[:user][:old_encrypted_password]
    p "----------------------------"
    p (@user.encrypted_password == @userAux.encrypted_password)
    p "----------------------------"
    p @user.encrypted_password
    p @userAux.encrypted_password

    if (@user.encrypted_password == @userAux.encrypted_password)
      @user.password = params[:user][:new_encrypted_password]
      @userAux.password=params[:user][:repeated_encrypted_password]

      if (@user.encrypted_password == @userAux.encrypted_password)
        if(@user.update(password: params[:user][:new_encrypted_password]))

         flash[:notice]= "Contraseña actualizada con exito"
         redirect_to root_path
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
    if(params[:user][:rol] == "operator")
      redirect_to sucursal_user_path
    end
      if (BranchOffice.find(params[:branch_office]))
          @branch_office = BranchOffice.find(params[:branch_office])
          @user.branch_office = @branch_office
      else
          flash[:alert] =  "No existe la Sucursal Seleccionada"
          redirect_to new_user_path and return
      end
    if(@users.save)
      redirect_to index_user_path, notice: "Usuario Creado Correctamente"
    else
      redirect_to new_user_path, alert: "Ocurrio un error al crear al usuario"
    end
  end

  def destroy
    @users = User.find(params[:id])
    @turns = Turn.where(state: 0, client_id: params[:id])
    if @turns.size == 0
      if (@users.destroy)
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
    params.fetch(:user ,  {}).permit(:username, :password, :rol)
  end
 
end
