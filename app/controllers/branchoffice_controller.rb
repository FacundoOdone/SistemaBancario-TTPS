class BranchofficeController < ApplicationController
  before_action :authenticate_user!
  $branch_offices_param
  def new
    #@branch_offices=BranchOffices.new
  end

  def edit
  end

  def index
    @branch_offices = BranchOffice.all
  end

  def create
    $branch_offices_param=params[:branchOffice]
    redirect_to schedule_new
  end

  def create_new_schedule
    @schedule= schedule.new(schedule_params)
    if (schedule.save)
      params[:branchOffice]=$branch_offices_param
      @branch_offices=@schedule.build_branch_office(branchoffice_params)
    end
  end


end
