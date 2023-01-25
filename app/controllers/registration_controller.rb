class RegistrationController < ApplicationController
  
    def register
        @users = User.new(user_params)
        if(@users.save)
          if(@users.operator?)
            redirect_to sucursal_user_url(id: @users.id)
          else
          redirect_to root_path, notice: "Usuario Creado Correctamente"
          end
        else
          redirect_to new_user_registration_path, alert: "Ocurrio un error al crear al usuario"
        end
      end

      private 

      def user_params
        params.fetch(:user ,  {}).permit(:email, :password, :rol,:branch_office)
      end
end