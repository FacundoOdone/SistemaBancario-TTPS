class BranchofficeController < ApplicationController
  #before_action :authenticate_user!
  $branch_offices_param
  def new
    @locations = Location.all
    @branch_offices=BranchOffice.new
  end

  def edit
  end

  def index
    @branch_offices = BranchOffice.all
  end

  def create
    @location = Location.find (params[:location])
    @branch_offices = BranchOffice.all

    if (@branch_offices.where(name: params[:name] ,location: @location.id))

      @schedule = Schedule.new(
        open_hour_monday: params[:open_hour_monday], close_hour_monday: params[:close_hour_monday],
        open_hour_tuesday: params[:open_hour_tuesday], close_hour_tuesday: params[:close_hour_tuesday],
        open_hour_wednesday: params[:open_hour_wednesday], close_hour_wednesday: params[:close_hour_wednesday],
        open_hour_thursday: params[:open_hour_thursday], close_hour_thursday: params[:close_hour_thursday],
        open_hour_friday: params[:open_hour_friday], close_hour_friday: params[:close_hour_friday],
        open_hour_saturday: params[:open_hour_saturday], close_hour_saturday: params[:close_hour_saturday]
      )
      @schedule.save
      @branch_offices = BranchOffice.new(name: params[:name], direc: params[:direc], tel: params[:tel])
      #@branch_offices = @schedule.build_branch_office(name: params[:name], direc: params[:direc], tel: params[:tel], location: @location)
      @branch_offices.location = @location
      @branch_offices.schedule = @schedule
      if (@branch_offices.save)
        redirect_to branchoffice_index_path, notice: "Se creo correctamente"
      else
        redirect_to branchoffice_new_path, alert: "Ocurrio un error al crear la sucursal"
      end
    else
      message= "La sucursal ya existe en esa localidad"
      redirect_to branchoffice_new_path, alert: message
    end
      
    #redirect_to schedule_new
  end

end
