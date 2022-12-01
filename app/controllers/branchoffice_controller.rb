class BranchofficeController < ApplicationController
  before_action :authenticate_user!
  $schedule
  def new
    @branch_offices=BranchOffices.new
  end

  def edit
  end

  def index
    @branch_offices = BranchOffice.all
  end

  def create
    params[:schedule] = $schedule
    @branch_offices = BranchOffice.new(branchoffice_params)

  end
end
