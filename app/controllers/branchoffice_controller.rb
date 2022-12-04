class BranchofficeController < ApplicationController
  before_action :authenticate_user!
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
    if (Location.find_by name: params[:location]) #De esta forma verifico que exista en base la location
      p (true)
    else
      message="No existe esa localidad, verifique que esta bien escrita o escriba otra"
      redirect_to branchoffice_new_path, alert: message
    end
    #redirect_to schedule_new
  end

  def create_new_schedule
    @schedule= schedule.new(schedule_params)
    if (schedule.save)
      params[:branchOffice]=$branch_offices_param
      @branch_offices=@schedule.build_branch_office(branchoffice_params)
    end
  end


end
