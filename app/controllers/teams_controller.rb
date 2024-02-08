class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[ index]

  before_action :set_team, only: %i[ show edit update destroy ]
  before_action :set_tournament


  def index

    # if current_user.nil?
    #   @team = Team.all
    # else
    #   @team = Team.where(user_id:current_user.id)
    # end
    if params[:search] 
      @teams = Team.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3)
    else
      if current_user.nil?
        @teams = Team.order(:name).page(params[:page]).per(3)
      else
        @teams = Team.where(user_id: current_user.id).order(:name).page(params[:page]).per(3)
      end
    end
  end
 

  def show
    @tournament = Tournament.find(params[:tournament_id]) 
    @team = @tournament.teams.find(params[:id]) 
  end

  def new
    @tournament = Tournament.find(params[:tournament_id])
    @team = Team.new
  end

  def edit
    @tournament = Tournament.find(params[:tournament_id])
    @team = @tournament.teams.find(params[:id])
  end

  def create
    @team = current_user.teams.build(team_params.merge(tournament_id:@tournament.id ))
    if @team.save
      redirect_to tournament_team_path(@tournament, @team)
    else
      render "new"
    end
  end

  def update
    if @team.update(team_params)
        redirect_to tournament_team_path(@tournament, @team)
    else
        render "edit"
    end
 
  end

  def destroy

    @team.destroy
    redirect_to tournament_teams_path
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end


    def team_params
      params.require(:team).permit(:name, :short_name,:user_id,:tournament_id , :image) 
    end


end
