class GuessesController < ApplicationController
  # Usually here we'd build the guess based on the player/goal selection the user choose however as this clientside behaviour isn't implemented we're going to generate the guess - sometimes it'll be correct, sometimes it'll be false
  def create
    @guess = Guess.new(guess_params)
    # @match = Match.find(params[:id])

    if generate_correct_guess?
      result = @guess.match.result
      @guess.home_team_score = result.home_team_score
      @guess.away_team_score = result.away_team_score
      @guess.correct = true
    else
      @guess.home_team_score = rand(1..8)
      @guess.away_team_score = rand(1..8)
      @guess.correct = false
    end
    @guess.save!

    increment_user_score(100) if @guess.correct?

    redirect_to match_url(@guess.match)
  end

  def guess_params
    params[:guess].permit(:match_id, :session_id)
  end

  # @return [Boolean] randomly returns whether to generate a correct or incorrect guess
  def generate_correct_guess?
    [true, false].sample
  end

  def increment_user_score(value)
    if session[:current_user_score]
      session[:current_user_score] += value
    else
      session[:current_user_score] = value
    end
  end
end
