class ScheduleController < ApplicationController
  before_action :authenticate_user!
  def edit
    @schedule = Schedule.find(params[:id])
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if (@schedule.update(
      open_hour_monday: params[:open_hour_monday], close_hour_monday: params[:close_hour_monday],
      open_hour_tuesday: params[:open_hour_tuesday], close_hour_tuesday: params[:close_hour_tuesday],
      open_hour_wednesday: params[:open_hour_wednesday], close_hour_wednesday: params[:close_hour_wednesday],
      open_hour_thursday: params[:open_hour_thursday], close_hour_thursday: params[:close_hour_thursday],
      open_hour_friday: params[:open_hour_friday], close_hour_friday: params[:close_hour_friday],
      open_hour_saturday: params[:open_hour_saturday], close_hour_saturday: params[:close_hour_saturday],
      open_hour_sunday: params[:open_hour_sunday], close_hour_sunday: params[:close_hour_sunday]
      ))
      flash[:notice] = "Se actualizo correctamente el horario"
      redirect_to index_branchoffice_path and return
    else
      flash[:alert] = "Ocurrio un error al actualizar"
      redirect_to index_branchoffice_path and return
    end
  end
end
