class ApplicationController < ActionController::Base
  def current_user_guesses
    @current_user_guesses ||= Guess.where(session_id: session.id.to_s)
  end
  helper_method :current_user_guesses

  def current_user_score
    @current_user_score ||= session[:current_user_score] || 0
  end
  helper_method :current_user_score
end
