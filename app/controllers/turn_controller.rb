class TurnController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
  end

  def complete
  end

  def completed
  end


  def edit
  end

  def update
  end

  def destroy
  end

  def turn_params
    params.require(:turn).permit(:date,:hour,:state,:reason,:comment)
  end
end
