class BranchofficeController < ApplicationController
  #before_action :authenticate_user!
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
    @schedule = Schedule.find(@branch_offices.schedule)
    if @branch_offices.update(name: params[:name], direc: params[:direc], tel: params[:tel], location: @location, schedule: @schedule)
      redirect_to branchoffice_index_path, notice: "Se actualizo correctamente la sucursal"
    else
      redirect_to branchoffice_index_path, alert: "Ocurrio un error al actualizar"
    end
  end

  def index
    @branch_offices = BranchOffice.all
  end

  def create
    #sanitizacion(params)
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
        redirect_to branchoffice_index_path, notice: "Se creo correctamente la sucursal"
      else
        redirect_to branchoffice_new_path, alert: "Ocurrio un error al crear la sucursal"
      end
      
    else
      message= "La sucursal ya existe en esa localidad"
      redirect_to branchoffice_new_path, alert: message
    end
  end

=begin
  private
  def sanitizacion(params)
    message = nil
    if (params[:name] == '' || params[:name] == nil)
      message= "El nombre no puede quedar vacio"
    end
    if (params[:name].class != 'String')
      message= "El nombre de la sucursal debe ser un String"
    end

    if (params[:direc] == '' || params[:direc] == nil)
      message= "La direccion no puede quedar vacio"
    end
    if (params[:direc].class !='String')
      message= "La direccion de la sucursal debe ser un String"
    end

    if (params[:tel] == '' || params[:tel] == nil )
      message= "El telefono no puede quedar vacio"
    end
    sanitizacion_horarios(params, message)
    redirect_to branchoffice_new_path, alert: message
  end

  private 
  def sanitizacion_horarios(params, message)
    if (params[:open_hour_monday] >= params[:close_hour_monday] ||
        params[:open_hour_tuesday] >= params[:close_hour_tuesday] ||
        params[:open_hour_wednesday] >= params[:close_hour_wednesday] ||
        params[:open_hour_thursday] >= params[:close_hour_thursday] ||
        params[:open_hour_friday] >= params[:close_hour_friday] ||
        params[:open_hour_saturday] >= params[:close_hour_saturday])

      return message= "El horario de cierre no puede ser anterior al de apertura"
    end

  end
=end
end

