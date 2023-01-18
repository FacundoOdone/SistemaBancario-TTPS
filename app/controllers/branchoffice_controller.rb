class BranchofficeController < ApplicationController
  

  
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
    if @branch_offices.update(name: params[:name], direc: params[:direc], tel: params[:tel], location: @location, schedule: @schedule)
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
      @schedule = Schedule.new(
        open_hour_monday: params[:open_hour_monday], close_hour_monday: params[:close_hour_monday],
        open_hour_tuesday: params[:open_hour_tuesday], close_hour_tuesday: params[:close_hour_tuesday],
        open_hour_wednesday: params[:open_hour_wednesday], close_hour_wednesday: params[:close_hour_wednesday],
        open_hour_thursday: params[:open_hour_thursday], close_hour_thursday: params[:close_hour_thursday],
        open_hour_friday: params[:open_hour_friday], close_hour_friday: params[:close_hour_friday],
        open_hour_saturday: params[:open_hour_saturday], close_hour_saturday: params[:close_hour_saturday],
        open_hour_sunday: params[:open_hour_sunday], close_hour_sunday: params[:close_hour_sunday]
      )
      @schedule.save
      @branch_offices = BranchOffice.new(name: params[:name], direc: params[:direc], tel: params[:tel])
      @branch_offices.location = @location
      @branch_offices.schedule = @schedule
      if (@branch_offices.save)
        flash[:notice] = "Se creo correctamente la sucursal"
      else
        flash[:alert]= "Ocurrio un error al crear la sucursal"
        redirect_to new_branchoffice_path, alert: "Ocurrio un error al crear la sucursal"
      end
      
    else
      message= "La sucursal ya existe en esa localidad"
      redirect_to new_branchoffice_path, alert: message
    end

    redirect_to index_branchoffice_path and return
    
  end

  def destroy
    @branch_office = BranchOffice.find(params[:id])
    @schedule = @branch_office.schedule
      if (@branch_office.destroy)
        flash[:notice] = "Se elimino la sucursal Correctamente"
        redirect_to index_branchoffice_path and return
      else
        flash[:alert] = "Ocurrio un error al intentar destruir la sucursal"
        redirect_to index_branchoffice_path and return
      end
  end

end

