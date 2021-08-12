class Match < ApplicationRecord
  validates :kickoff_at, presence: true

  belongs_to :away_team, class_name: "Team"
  belongs_to :home_team, class_name: "Team"
  belongs_to :stadium
  has_one :result
end
