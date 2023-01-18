class LocationsController < ApplicationController
  
  before_action  :set_location, only: %i[ show edit update destroy ] 

  # GET /locations or /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1 or /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  def create
    @location=Location.all
    @var = @location.where(name: location_params["name"], province: location_params["province"])
    if (@var.size == 0)
      @location = Location.new(location_params)
      respond_to do |format|
        if @location.save
          format.html { redirect_to location_url(@location), notice: "Localidad creada con exito." }
          format.json { render :show, status: :created, location: @location }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    else 
      redirect_to location_url(@location), alert: "Ocurrio un error al crear la localidad"
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    @locations=Location.all
    @var = @locations.where(name: location_params["name"], province: location_params["province"])
    if (@var.size == 0)
      respond_to do |format|
        if @location.update(location_params)
          flash[:notice] = "Localidad actualizada con exito"
          redirect_to "/locations/index" and return
        else
          flash[:alert] = "Ocurrio un error al actualizar la localidad"
          redirect_to "/locations/index" and return
        end
      end
    else
      flash[:alert] = "Esa localidad ya existe en la provincia"
      redirect_to "/locations/index" and return
    end
    
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url, notice: "Se borro la localidad." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name, :province)
    end
end
