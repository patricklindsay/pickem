class Team < ApplicationRecord
  SQUAD_SIZE = 23

  validates :name, :code, presence: true

  has_many :players
end
