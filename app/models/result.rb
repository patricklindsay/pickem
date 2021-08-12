class Result < ApplicationRecord
  validates :home_team_score, :away_team_score, presence: true

  has_many :goals, as: :scorable
  belongs_to :match
end
