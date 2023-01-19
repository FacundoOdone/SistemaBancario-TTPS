class ScheduleController < ApplicationController
  load_and_authorize_resource
  
  def edit
    @schedule = Schedule.find(params[:id])
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def update
    p params
    @schedule = Schedule.find(params[:id])
    if (@schedule.update(schedule_params))
      flash[:notice] = "Se actualizo correctamente el horario"
    else
      flash[:alert] = "Ocurrio un error al actualizar"
    end
    redirect_to index_branchoffice_path and return
  end

  def schedule_params
    params.require(:schedule).permit(
      :open_hour_monday, :close_hour_monday, 
      :open_hour_tuesday, :close_hour_tuesday, 
      :open_hour_wednesday, :close_hour_wednesday, 
      :open_hour_thursday, :close_hour_thursday, 
      :open_hour_friday, :close_hour_friday, 
      :open_hour_saturday, :close_hour_saturday, 
      :open_hour_sunday, :close_hour_sunday
    )

  end
end
