class PlayersController < ApplicationController

  before_action :set_player, only: [:destroy]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @players = Player.all

    if @player.save
      flash.now[:notice] = "Player successfully created"
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to players_path }
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    if @player.is_deletable?
      @player.destroy 
      flash.now[:notice] = "Player successfully deleted"
    else
      flash.now[:alert] = "Player cannot be deleted as they have associated matches"
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name)
  end
end