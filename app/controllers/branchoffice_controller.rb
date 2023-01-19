class BranchofficeController < ApplicationController
  load_and_authorize_resource "BranchOffice"

  def new
    @locations = Location.all
    @branch_offices=BranchOffice.new
  end

  def edit
    @locations = Location.all
    @branch_offices = BranchOffice.find(params[:id])
  end
  
  def update
    @branch_offices = BranchOffice.find(params[:id])
    @location = Location.find (params[:location])
    @schedule = Schedule.find(@branch_offices.schedule.id)
    @branch_offices.location = @location
    @branch_offices.schedule = @schedule
    if @branch_offices.update(branchoffice_params)
      flash[:notice] = "Se actualizo correctamente la sucursal"
    else
      flash[:alert] =  "Ocurrio un error al actualizar"
    end
    redirect_to index_branchoffice_path and return
  end

  def index
    @branch_offices = BranchOffice.all
  end

  def create
    @location = Location.find (params[:location])
    @branch_offices = BranchOffice.all
    @var=@branch_offices.where(name: params[:name] ,location: @location.id)
    if (@var.size == 0)
      @schedule = Schedule.new(schedule_params)
      @schedule.save
      @branch_offices = BranchOffice.new(branchoffice_params)
      @branch_offices.location = @location
      @branch_offices.schedule = @schedule
      if (@branch_offices.save)
        flash[:notice] = "Se creo correctamente la sucursal"
      else
        flash[:alert]= "Ocurrio un error al crear la sucursal"
      end
      
    else
      flash[:alert]="La sucursal ya existe en esa localidad"
    end

    redirect_to index_branchoffice_path and return
    
  end

  def destroy
    @branch_office = BranchOffice.find(params[:id])
    @schedule = @branch_office.schedule
    @turns = Turn.where(state: 0 , branch_office_id: params[:id])
    if @turns.size == 0
      if (@schedule.destroy)
        flash[:notice] = "Se elimino la sucursal Correctamente"
      else
        flash[:alert] = "Ocurrio un error al intentar destruir la sucursal"
      end
    else
      flash[:alert] = "No puede borrar sucursales con turnos pendientes"
    end
    redirect_to index_branchoffice_path and return
  end


  def branchoffice_params
    params.require(:branch_office).permit(:name,:direc,:tel)
  end

  def schedule_params
    params.require(:schedule).permit(
      :open_hour_monday,:close_hour_monday,
      :open_hour_tuesday,:close_hour_tuesday,
      :open_hour_wednesday,:close_hour_wednesday,
      :open_hour_thursday,:close_hour_thursday,
      :open_hour_friday,:close_hour_friday,
      :open_hour_saturday,:close_hour_saturday,
      :open_hour_sunday,:close_hour_sunday
    )

  end

end

