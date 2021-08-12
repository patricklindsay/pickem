class MatchesController < ApplicationController
  def index
    @matches_to_guess = Match.includes(:away_team, :home_team).where.not(id: current_user_guesses.pluck(:match_id))
  end

  def show
    @match = Match.find(params[:id])
  end
end
