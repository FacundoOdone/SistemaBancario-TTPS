class BranchofficeController < ApplicationController
  def new
  end

  def edit
  end

  def index
    @branch_offices = BranchOffices.all
  end
end
