class Goal < ApplicationRecord
  belongs_to :player
  belongs_to :scorable, polymorphic: true
end
