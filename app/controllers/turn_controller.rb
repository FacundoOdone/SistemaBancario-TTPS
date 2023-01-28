class TurnController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    if (current_user.client?)
      @turns = Turn.where(
        'client_id = ?',
        current_user.id
      ).group(:id)
    elsif (current_user.operator?)
      @turns = Turn.where(
        'branch_office_id = ?',
        current_user.branch_office
        ).group(:id)
    end
    render "turn/index"
  end

def show
  @turn = Turn.find(params[:id])
end

def new
  @turn = Turn.new turn_params
  @branch_offices = BranchOffice.all
end

def create
  @turn = Turn.new(turn_params)
  if BranchOffice.find(params[:branch_office])
      @branch_office = BranchOffice.find(params[:branch_office])
      @turn.branch_office = @branch_office
      @turn.client = helpers.current_user
      if @turn.save
          flash[:notice] = "El turno se creo correctamente"
          redirect_to index_turn_path and return
      else
        @turn.errors.full_messages.each do |msg|
          flash[:alert] = msg.split(" ",2)[1]
        end
      end
  else
    flash[:alert] = "No existe la Sucursal Seleccionada" 
  end
    redirect_to new_turn_path and return
end

def edit
  @old_turn = Turn.find(params[:id])
  @branch_offices = BranchOffice.all
  render "turn/edit"
end

def update
  if (Turn.find(params[:id]))
      @turn = Turn.find(params[:id])
      if BranchOffice.find(params[:turn][:branch_office])
          @branch_office = BranchOffice.find(params[:turn][:branch_office])
              @turn.branch_office = @branch_office
              if @turn.update(turn_params)
                  flash[:notice] =  "El turno se modifico correctamente"
                  redirect_to index_turn_path and return
              else
                  @turn.errors.full_messages.each do |msg|
                      flash[:alert] = msg.split(" ",2)[1]
                    end
                  redirect_to edit_turn_path and return
              end
      else
          flash[:alert] = "No existe la Sucursal Seleccionada"
          redirect_to new_turn_path and return
      end
  else
      flash[:alert] = "No se econtro el turno"
      redirect_to edit_turn_path and return
  end
end

def destroy
  @turn = Turn.find(params[:id])
  if @turn.destroy
      flash[:notice] = "Se cancelo el Turno Correctamente"
      redirect_to index_turn_path and return
  else
      @turn.errors.full_messages.each do |msg|
          flash[:alert] = msg.split(" ",2)[1]
        end
      redirect_to index_turn_path and return
  end
end

def complete
  @turn = Turn.find(params[:id])
end

def completed
  if Turn.find(params[:id])
      @turn = Turn.find(params[:id])
      @turn.user = helpers.current_user
      if @turn.update(turn_params)
          flash[:notice] =  "El turno se atendio correctamente"
          redirect_to index_turn_path and return
      else
          @turn.errors.full_messages.each do |msg|
              flash[:alert] = msg.split(" ",2)[1]
            end
          redirect_to complete_turn_path and return
      end
  else
      flash[:alert] = "No se econtro el turno"
      redirect_to complete_turn_path and return
  end
end

private

  def turn_params
    params.fetch(:turn, {}).permit(:date, :hour,:state, :reason, :comment)
  end
  
  
end
