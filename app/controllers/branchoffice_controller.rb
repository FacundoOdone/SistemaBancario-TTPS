class BranchofficeController < ApplicationController
  
  def new
    @branch_offices=BranchOffices.new
  end

  def edit
  end

  def index
    @branch_offices = BranchOffices.all
  end

  def create
    @branch_offices = BranchOffices.new(branch_office_params)

  end
end
