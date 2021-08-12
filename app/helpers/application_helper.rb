module ApplicationHelper
  def match_previously_guessed?
    @match_previously_guessed ||= current_user_guesses.pluck(:match_id).include?(@match.id)
  end

  def current_user_guess
    @current_user_guess ||= current_user_guesses.find_by_match_id(@match.id)
  end
end
