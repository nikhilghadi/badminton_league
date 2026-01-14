class MatchesController < ApplicationController

  def index
    @matches = Match.all.includes(:winner, :loser)
  end

  def new
    @match = Match.new
    @players = Player.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash.now[:notice] = "Match recorded successfully"
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to matches_path }
      end
    else
      @players = Player.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:name, :winner_id, :loser_id)
  end
  
end