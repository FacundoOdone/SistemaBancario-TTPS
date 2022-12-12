class BranchofficeController < ApplicationController
  load_and_authorize_resource "BranchOffice"
  before_action :authenticate_user!

  
  def new
    @locations = Location.all
    @branch_offices=BranchOffice.new
  end

  def edit
    @locations = Location.all
    @branch_offices = BranchOffice.find(params[:id])
  end
  
  def update
    message = nil
    message = sanitizacion_datos(params)
    if (message == nil)
      @branch_offices = BranchOffice.find(params[:id])
      @location = Location.find (params[:location])
      @schedule = Schedule.find(@branch_offices.schedule)
      if @branch_offices.update(name: params[:name], direc: params[:direc], tel: params[:tel], location: @location, schedule: @schedule)
        flash[:notice] = "Se actualizo correctamente la sucursal"
        redirect_to branchoffice_index_path and return
      else
        flash[:alert] =  "Ocurrio un error al actualizar"
        redirect_to branchoffice_index_path and return
      end
    else
      flash[:alert] = message
      redirect_to branchoffice_index_path and return
    end
  end

  def index
    @branch_offices = BranchOffice.all
  end

  def create
    message = nil
    message = sanitizacion(params)
    if (message == nil)
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
          open_hour_saturday: params[:open_hour_saturday], close_hour_saturday: params[:close_hour_saturday]
        )
        @schedule.save
        @branch_offices = BranchOffice.new(name: params[:name], direc: params[:direc], tel: params[:tel])
        @branch_offices.location = @location
        @branch_offices.schedule = @schedule
      if (@branch_offices.save)
        flash[:notice] = "Se creo correctamente la sucursal"
      else
        flash[:alert]= "Ocurrio un error al crear la sucursal"
        redirect_to branchoffice_new_path, alert: "Ocurrio un error al crear la sucursal"
      end
      
      else
        message= "La sucursal ya existe en esa localidad"
        redirect_to branchoffice_new_path, alert: message
      end
    else
      flash[:alert] = message
      redirect_to branchoffice_new_path and return
    end

    redirect_to branchoffice_index_path and return
    
  end

  def destroy
    @branch_office = BranchOffice.find(params[:id])
    @schedule = @branch_office.schedule
    if (@schedule.destroy)
      if (@branch_office.destroy)
        flash[:notice] = "Se elimino la sucursal Correctamente"
        redirect_to branchoffice_index_path and return
      else
        flash[:alert] = "Ocurrio un error al intentar destruir la sucursal"
        redirect_to branchoffice_index_path and return
      end
    else
      flash[:alert] = "Ocurrio un error al intentar destruir la sucursal"
      redirect_to branchoffice_index_path and return
    end
    
  end

  private
  def sanitizacion(params)
    message = nil
    message = sanitizacion_datos(params)
    if (message == nil)
       message = sanitizacion_horarios(params)
    end
    return message
  end

  private
  def sanitizacion_datos(params)
    if (params[:name] == '' || params[:name] == nil)
      message= "El nombre no puede quedar vacio"
    end
    if (params[:direc] == '' || params[:direc] == nil)
      message= "La direccion no puede quedar vacio"
    end
    if (params[:tel] == '' || params[:tel] == nil )
      message= "El telefono no puede quedar vacio"
    end
    return message
  end

  private
  def sanitizacion_horarios(params)
    if (params[:open_hour_monday] >= params[:close_hour_monday] ||
        params[:open_hour_tuesday] >= params[:close_hour_tuesday] ||
        params[:open_hour_wednesday] >= params[:close_hour_wednesday] ||
        params[:open_hour_thursday] >= params[:close_hour_thursday] ||
        params[:open_hour_friday] >= params[:close_hour_friday] ||
        params[:open_hour_saturday] >= params[:close_hour_saturday])

      return "El horario de cierre no puede ser igual ni anterior al de apertura"
    end

  end
end

