
class OpponentTeamLineUpsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[ index show]
  before_action :set_opponent_team_line_up, only: [:show, :update, :destroy]
  before_action :set_tournament
  before_action :set_event

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @event = Event.find(params[:event_id])
    @opponent_team_line_up = OpponentTeamLineUp.new
    a = @event.opponent_team.opponent_roosters.pluck(:id)
    b = @event.opponent_team_line_ups.pluck(:opponent_rooster_id)
    final1 = a - b
    @final1 =  OpponentRooster.find(final1)

    all_positions = Position.all.pluck(:id)
    selected_positions = @event.opponent_team_line_ups.pluck(:position_id)
    available_positions = all_positions - selected_positions
    @available_positions = Position.find(available_positions)
  end
  
  def index

  end

  def show

  end

  def create
   
    @opponent_team_line_up = current_user.opponent_team_line_ups.build(opponent_team_line_up_params.merge(event_id: @event.id, tournament_id: @tournament.id, opponent_team_id: @opponent_team_id))
   
    if @opponent_team_line_up.save
      flash[:notice] = "OpponentTeamLineUp was successfully created."
      redirect_to new_tournament_event_opponent_team_line_up_path
    else
      flash[:alert] = @opponent_team_line_up.errors.full_messages[0]
      redirect_to new_tournament_event_opponent_team_line_up_path
    end
  end

  

  def update

  end

  def destroy
    @opponent_team_line_up = OpponentTeamLineUp.find(params[:id])
    @opponent_team_line_up.destroy
    flash[:notice] = "OpponentTeamLineUp was successfully deleted."
    redirect_to new_tournament_event_opponent_team_line_up_path(@tournament, @event)
  end
  

  private

  def set_opponent_team_line_up
    @opponent_team_line_up = OpponentTeamLineUp.find(params[:id])
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
    @opponent_team_id = @event.opponent_team_id
  end

  def opponent_team_line_up_params
    params.require(:opponent_team_line_up).permit(:batter_order, :opponent_rooster_id, :position_id)
  end
  
end

