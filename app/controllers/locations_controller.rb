class LocationsController < ApplicationController
  load_and_authorize_resource
  before_action  :set_location, only: %i[ show edit update destroy ] 
  before_action :authenticate_user!

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
    @var = Location.where(name: params[:location][:name], province: params[:location][:province])
    if (@var.size > 0)
      flash[:alert] = "La localidad ya existe dentro de la provincia"
      redirect_to new_location_path
    else
      @location = Location.new(location_params)
      respond_to do |format|
        if @location.save
          format.html { redirect_to index_location_path, notice: "Localidad creada con exito." }
          format.json { render status: :created, location: @location }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    @locations = Location.find(params[:id])
    @var = Location.where(name: params[:location][:name], province: params[:location][:province])
    if (@var.size > 0)
      flash[:alert] = "La localidad ya existe dentro de la provincia"
      redirect_to edit_location_path(@locations)
    else
      if @location.update(location_params)
        flash[:notice] = "Localidad actualizada con exito"
      else
        flash[:alert] = "Ocurrio un error al actualizar la localidad"
      end
      redirect_to index_location_path
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location = set_location()
    @branch_offices = BranchOffice.where(location_id: params[:id])
    if @branch_offices.size == 0
      @location.destroy
      respond_to do |format|
        format.html { redirect_to locations_url, notice: "Se borro la localidad." }
        format.json { head :no_content }
      end
    else
      flash[:alert] = "La localidad tiene sucursales asociadas"
      redirect_to locations_url and return
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
