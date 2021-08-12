class Guess < ApplicationRecord
  validates :home_team_score, :away_team_score, presence: true

  belongs_to :match
  has_many :goals, as: :scorable
end
