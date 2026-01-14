class PlayersController < ApplicationController

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

  private
  def player_params
    params.require(:player).permit(:name)
  end
end